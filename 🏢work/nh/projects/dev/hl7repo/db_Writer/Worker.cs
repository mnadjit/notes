using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Serilog;
using StackExchange.Redis;
using Redis.Net;
using System.Linq;
using System.Collections.Generic;
using Shared.Repository;
using Shared.Models;
using System.Text.Json;
using System.Data.SqlClient;
using db_Writer.Services;
using Shared.Encryption;

namespace db_Writer
{
    public class Worker : BackgroundService
    {
        private ConnectionMultiplexer _redis;
        private readonly int _runningInterval;
        private readonly int _maxMessageBatchSize;
        private readonly int _maxKeysToReadFromCache;
        private readonly string _messageDirection;
        private readonly string _redisConnectionString;
        private readonly string _instanceName;
        private readonly IMessageRepo_Repository _repo;
        private readonly IConfiguration _cfg;

        private readonly FileProcessor _fileProcessor;
        private readonly Encryptor _encryptor;

        public Worker(  IConfiguration cfg, IMessageRepo_Repository repo, 
                        FileProcessor fileProcessor, Encryptor encryptor)
        {
            var redisHost = cfg.GetValue<string>("redis:host");
            var redisPort = cfg.GetValue<string>("redis:port");
            var redisPassword = cfg.GetValue<string>("redis:password");
            _redisConnectionString = $"{redisHost}:{redisPort},password={redisPassword}";
            
            _instanceName = cfg.GetValue<string>("redis:instanceName");
            _runningInterval = cfg.GetValue<int>("worker:runningIntervalSeconds") * 1000;
            _maxMessageBatchSize = cfg.GetValue<int>("worker:maxMessageBatchSize");
            _maxKeysToReadFromCache = cfg.GetValue<int>("worker:maxKeysToReadFromCache");
            _messageDirection = cfg.GetValue<string>("worker:messageDirection");
            
            _repo = repo.SetConnectionString(cfg.GetValue<string>("database:ConnectionString"));
            _cfg = cfg;
            _fileProcessor = fileProcessor;
            _encryptor = encryptor;
            _encryptor.SetEncryptionKey(cfg.GetValue<string>("encryption:key"));
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                Log.Information("DB_Writer worker running at: {time}", DateTimeOffset.Now);

                try
                {
                    if (!_fileProcessor.IsProcessing) 
                    await _fileProcessor.ProcessFiles(_cfg, _repo);
                }
                catch (System.Exception ex)
                {
                    Log.Error("Error while processing files");
                    Log.Error(ex.Message);
                    Log.Debug(ex.StackTrace);
                }

                try
                {
                    _redis = ConnectionMultiplexer.Connect(_redisConnectionString);
                    await ReadFromCacheAndWriteToDatabase();
                }
                catch (System.Exception ex)
                {
                    Log.Error("Error while reading from cache and writing messages to the database");
                    Log.Error(ex.Message);
                    Log.Debug(ex.StackTrace);
                }

                await Task.Delay(_runningInterval, stoppingToken);
            }
        }

        private async Task ReadFromCacheAndWriteToDatabase()
        {
            Log.Information("Reading from cache and writing to database...");
            var db = _redis.GetDatabase();
            if (db == null) throw new System.Exception("Could not connect to redis. Failed to get IDatabase object.");
            var keys = db.GetKeys(_instanceName)
                            .OrderBy(x => x.ToString())
                            .Take(_maxKeysToReadFromCache)
                            .ToArray();

            Log.Information($"Found {keys.Count()} records in the cache.");
            while (keys.Length > 0) {
                var batchKeys = keys.Take(_maxMessageBatchSize);
                
                if (batchKeys.Count() == 0) break;

                var keysString = batchKeys.Select(k => k.ToString());
                var batch = GetMessageBatchFromRedis(keysString);

                try
                {
                    Log.Information($"Inserting {keys.Count()} records into the database.");
                    var dbWriteRowCount = await WriteBatchToDatabase(batch);

                    if (dbWriteRowCount != batchKeys.Count()) return;
                    else await ExpireRedisRecords(batchKeys);
                }
                catch (SqlException ex)
                {
                    Log.Error($"Failed to write batch to database. Connection String: {_repo.GetConnectionString()}");
                    Log.Error(ex.Message);
                    return;
                }
                keys = keys.Skip(batchKeys.Count()).ToArray();
            }
        }

        private async Task ExpireRedisRecords(IEnumerable<RedisKey> batchKeys)
        {
            foreach (var key in batchKeys){
                await _redis.GetDatabase().KeyExpireAsync(key, new TimeSpan(-1));
            }
        }

        public string testing(string t){
            return t[0].ToString();
        }

        private async Task<int> WriteBatchToDatabase(IEnumerable<MessageModel> messageBatch)
        {
            return await _repo.AddBatch(messageBatch);
        }

        /// <summary>
        /// Get all messages for a given set of keys from the cache
        /// Decrypt message content to populate the HL7 message model
        /// Overwrite the message content with the encrypted content
        /// </summary>
        /// <param name="batchKeys"></param>
        /// <returns>Messages from cache with encrypted content</returns>
        private IEnumerable<MessageModel> GetMessageBatchFromRedis(IEnumerable<string> batchKeys)
        {
            var messages = new List<MessageModel>();

            foreach (var key in batchKeys)
            {
                try {
                var messageContentJson = _redis.GetDatabase().HashGet(key, "data").ToString();

                var messageContentEncrytpted = JsonSerializer.Deserialize<string>(messageContentJson);
                var messageContent = _encryptor.Decrypt(messageContentEncrytpted);

                // Use decrypted message content to populate HL7 message, 
                var hl7message = new HL7Message(messageContent);

                // then put the encryted HL7 message back into the message before writing to database
                hl7message.message = messageContentEncrytpted;

                var message = new MessageModel(hl7message);
                message.Direction = _messageDirection;
                messages.Add(message);
                } catch (Exception ex){
                    Log.Error(ex.Message);
                }
            }
            
            return messages;
        }
    }
}
