using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

using Shared.Models;

using Dapper;
using Shared.Encryption;

namespace Shared.Repository
{
    /// <summary>
    /// Repository for the MessageModel class. Used to connect to the database and perform queries.
    /// Make sure SetConnectionString and SetEncryptor methods are called before using this class.
    /// </summary>
    public class MessageRepo_Repository : IMessageRepo_Repository
    {
        public MessageRepo_Repository()
        {           
        }
        public MessageRepo_Repository(string connectionString, Encryptor encryptor) 
        {
            this.ConnectionString = connectionString;
                this.Encryptor = encryptor;
               
        }
                public string ConnectionString { get; set; }
        public Encryptor Encryptor { get; private set; }

        public MessageRepo_Repository SetConnectionString(string connectionString){
            ConnectionString = connectionString;
            return this;
        }
        public void SetEncryptor(Encryptor encryptor)
        {
            Encryptor = encryptor;
        }
        public string GetConnectionString()
        {
            return ConnectionString;
        }
        public Task<bool> Add(MessageModel message)
        {
            throw new System.NotImplementedException();
        }

        public async Task<int> AddBatch(IEnumerable<MessageModel> messageBatch)
        {
            // TODO: Add Transaction
            var param = new {
                messages = GetMessagesAsDataTable(messageBatch).AsTableValuedParameter("MessageUDT")
            };
            using (var connection = new SqlConnection(ConnectionString)) {
                try
                {
                    connection.Open();
                    var affectedRows = await connection.ExecuteAsync("dbo.spMessage_InsertSet", param, commandType: CommandType.StoredProcedure);
                    return affectedRows;    
                }
                catch
                {
                    throw;
                }
            }
        }

        private DataTable GetMessagesAsDataTable(IEnumerable<MessageModel> messageBatch)
        {
            var dt = new DataTable();

            foreach (var prop in new MessageModel().GetType().GetProperties())
                if (prop.Name != "Id")
                    dt.Columns.Add(prop.Name, prop.PropertyType);

            foreach (var message in messageBatch)
            {   
                var row = dt.NewRow();
                
                var arr = message.GetType().GetProperties()
                    .Where(p => p.Name != "Id")
                    .Select(p => p.GetValue(message)).ToArray();
                row.ItemArray = arr;

                dt.Rows.Add(row);
            }

            return dt;
        }

        public Task<bool> Delete(int id)
        {
            throw new System.NotImplementedException();
        }

        public Task<MessageModel> Get(long id)
        {
            throw new System.NotImplementedException();
        }

        public async Task<IEnumerable<MessageModel>> GetAll()
        {
            var sql = @"SELECT  [Id],[SendingApplication],[SendingFacility],[ReceivingApplication],[ReceivingFacility],
                                [MessageDateTime],[InsertDateTime],[MessageCode],[TriggerEvent],[VersionId],[MessageControlId],
                                [ProcessingId],[Direction],[MRN],[MessageSizeBytes]
                                FROM Message";

            using (var connection = new SqlConnection(ConnectionString)) {
                connection.Open();
                var messages = await connection.QueryAsync<MessageModel>(sql);
                return messages;
            }
        }

        public async Task<IEnumerable<MessageModel>> GetMostRecent(int messageCount)
        {
            var param = new {
                count = messageCount
            };
            using (var connection = new SqlConnection(ConnectionString)) {
                try
                {
                    connection.Open();
                    var messages = await connection.QueryAsync<MessageModel>("dbo.spMessage_getMessagesByCount", param, commandType: CommandType.StoredProcedure);
                    return messages;
                }
                catch
                {
                    throw;
                }
            }
        }
        
        public Task<bool> Update(MessageModel message)
        {
            throw new System.NotImplementedException();
        }

        public async Task<IEnumerable<MessageModel>> GetByDateRange(System.DateTime From, System.DateTime To, int maxCount = 1000)
        {
            var param = new {
                from = From,
                to = To,
                maxCount = maxCount
            };
            using (var connection = new SqlConnection(ConnectionString)) {
                connection.Open();
                var messages = await connection.QueryAsync<MessageModel>("dbo.spMessage_getMessagesByDateRange", param, commandType: CommandType.StoredProcedure);
                return messages;    
            }
        }
        public async Task<IEnumerable<MessageModel>> GetByMRN(string mrn, int maxCount = 1000)
        {
            var param = new {
                mrn = mrn,
                maxCount = maxCount
            };
            using (var connection = new SqlConnection(ConnectionString)) {
                connection.Open();
                var messages = await connection.QueryAsync<MessageModel>("dbo.spMessage_getMessagesByMRN", param, commandType: CommandType.StoredProcedure);
                return messages;
            }
        }

        public async Task<IEnumerable<MessageModel>> GetByMrnDateEventTrigger(string mrn, string from, string to, string[] triggerEvents, int maxCount = 1000)
        {
            var param = new {
                mrn = mrn,
                from = from,
                to = to,
                triggerEvents = GetTriggerEventListAsDataTable(triggerEvents),
                maxCount = maxCount
            };
            using (var connection = new SqlConnection(ConnectionString)) {
                connection.Open();
                var messages = await connection.QueryAsync<MessageModel>("dbo.spMessage_MessageSearch", param, commandType: CommandType.StoredProcedure);
                return messages;
            }
        }

        public async Task<MessageModel> GetByMRNandId(string mrn, long id)
        {
            var param = new {
                mrn = mrn,
                id = id
            };
            using (var connection = new SqlConnection(ConnectionString)) {
                connection.Open();
                var message = await connection.QueryAsync<MessageModel>("dbo.spMessage_getMessageByMRNId", param, commandType: CommandType.StoredProcedure);
                return DecryptMessageContent(message.FirstOrDefault());
            }
        }

        private MessageModel DecryptMessageContent(MessageModel message)
        {
            if (message == null) return null;
            message.MessageContent = Encryptor.Decrypt(message.MessageContent);
            return message;
        }

        private DataTable GetMessageIdListAsDataTable(long[] ids)
        {
            var dt = new DataTable();
            dt.Columns.Add("MessageId", typeof(long));
            foreach (var id in ids)
            {
                var row = dt.NewRow();
                row.ItemArray = new object[] { (object)id };
                dt.Rows.Add(row);
            }
            return dt;
        }

        private DataTable GetTriggerEventListAsDataTable(string[] eventTriggers)
        {
            var dt = new DataTable();
            dt.Columns.Add("TriggerEvent", typeof(string));
            if (eventTriggers == null || eventTriggers.Length == 0) {dt.NewRow().ItemArray = new object[] {  };}
            else foreach (var eventTrigger in eventTriggers)
            {
                var row = dt.NewRow();
                row.ItemArray = new object[] { (object)eventTrigger };
                dt.Rows.Add(row);
            }
            return dt;
        }
    }
}