using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using RhapmonShared.Models;

namespace worker.Services
{
    public class NotificationManager : INotificationManager
    {
        private readonly IConfiguration _cfg;
        private readonly ICacheService _cacheService;
        private readonly INotificationService _notificationService;

        public NotificationManager(IConfiguration cfg, ICacheService cacheService, INotificationService notificationService)
        {
            _cfg = cfg;
            _cacheService = cacheService;
            _cacheService.Init(cfg);
            _notificationService = notificationService;
        }
        /// <summary>
        /// Entry point to this class
        /// </summary>
        public async Task Run()
        {
            // Currently only Dropped Throughput issue is being monitored - this is to hardcode the single type of issue to monitor
            const string issueType = "DroppedThroughput";

            var componentsToMonitor = 
                _cfg.GetSection("ComponentsToMonitor").Get<ComponentIssueModel[]>()
                    .Where(x => x.IssueType == issueType)
                    .ToList();
            
            await FindDroppedThroughputIssuesAndUpdateCache(componentsToMonitor);

            var droppedThroughputIssues = 
                await GetIssuesFromCacheForSubscribedComponents(componentsToMonitor);
            
            // Currently only Dropped Throughput issue is being monitored - in future other types of issues can be added here
            await HandleDroppedThroughputIssuesInCache(droppedThroughputIssues.ToList());
        }

        private async Task<IEnumerable<ComponentIssueModel>> GetIssuesFromCacheForSubscribedComponents(
            List<ComponentIssueModel> componentsToMonitor)
        {
            var issues = new List<ComponentIssueModel>();
            foreach (var componentIssue in componentsToMonitor)
            {
                issues.Add(await _cacheService.GetIssueFromCache(componentIssue));                
            }
            return issues;
        }

        public async Task FindDroppedThroughputIssuesAndUpdateCache(List<ComponentIssueModel> componentIssuesToMonitor)
        {
            foreach (var componentIssue in componentIssuesToMonitor)
            {
                var issueInCache = await _cacheService.GetIssueFromCache(componentIssue);
                // Update threshold in case it has changed since last time the app ran
                if (issueInCache is not null) issueInCache.Threshold = componentIssue.Threshold;
                // Get Data for CP ID / last three receivedCount
                var cpData =
                    (await _cacheService.GetRecentCommpointData(componentIssue.ComponentId, 3)).ToList();
                
                if (cpData.Count == 0);
                var issue = CheckLast3ReceivedCountsForDroppedThroughput(cpData, issueInCache ?? componentIssue);
                
                if (issue == null) await _cacheService.RemoveIssueFromCache(componentIssue);
                else await _cacheService.AddOrUpdateIssueInCache(issue);
            }
        }
        private ComponentIssueModel CheckLast3ReceivedCountsForDroppedThroughput(
            IEnumerable<RhapsodyCommpointDataModel> cpData, ComponentIssueModel componentIssueToMonitor)
        {
            const int itemsToCompare = 3;
            componentIssueToMonitor.DetectionDateTime = DateTime.Now;
            var last3CpData = cpData.Take(itemsToCompare).ToList();
            // ReSharper disable once PossibleMultipleEnumeration
            if (last3CpData.Count < 3) return null;
            
            var issuesFound = 0;
            componentIssueToMonitor.DetectedRates = new List<int>();
            
            for (var i = 1; i < itemsToCompare; i++)
            {
                var receivedCount1 = last3CpData[i].receivedCount;
                var time1 = last3CpData[i].Date;
                var receivedCount2 = last3CpData[i - 1].receivedCount;
                var time2 = last3CpData[i - 1].Date;
                var rate = decimal.Divide(receivedCount2 - receivedCount1, (decimal)(time2 - time1).TotalSeconds) * 60;
                
                if (rate <= componentIssueToMonitor.Threshold) issuesFound++;
                componentIssueToMonitor.DetectedRates.Add((int)rate);
            }
            
            return issuesFound == itemsToCompare - 1 ? componentIssueToMonitor : null;
        }

        public async Task HandleDroppedThroughputIssuesInCache(List<ComponentIssueModel> issues)
        {
            if (issues.Count == 0 || issues.Any(i => i is null)) return;
            
            var subscriptions = 
                _cfg.GetSection("Notifications:Subscriptions").Get<ComponentIssueModel[]>().ToList();

            foreach (var subscription in subscriptions)
            {
                var issueForSubscription = issues.FirstOrDefault( i => i.ComponentType == subscription.ComponentType &&
                                                                                        i.IssueType == subscription.IssueType &&
                                                                                        i.ComponentId == subscription.ComponentId);
                if (issueForSubscription is null or { NotificationSent: true }) continue;
                
                if (!NowIsWithinNotificationTimeframe(issueForSubscription.TimeFrame)) continue;
                
                issueForSubscription.RecipientEmails = subscription.RecipientEmails;
                
                await SendNotification(issueForSubscription);
            }
        }
        
        private bool NowIsWithinNotificationTimeframe(string subscriptionTimeFrame)
        {
            // If no time-frame is specified, it means at anytime issue is detected notification should be sent out 
            if (string.IsNullOrEmpty(subscriptionTimeFrame)) return true;
            
            var moment = DateTime.Now;
            
            var days = subscriptionTimeFrame.Split(',');
            var today = days.FirstOrDefault(d => d.StartsWith(moment.DayOfWeek.ToString()));
            
            // If there are time-frames specified, but today is not listed, do not send any notifications
            if (today == null) return false;
            
            // Check times for today
            var startTime = DateTime.Parse($"{today.Split('-')[1]}:00");
            var endTime = DateTime.Parse($"{today.Split('-')[2]}:00");

            return DateTime.Compare(moment, startTime) >= 0 && DateTime.Compare(endTime, moment) >= 0;
        }

        public async Task SendNotification(ComponentIssueModel issue)
        {
            var emailSubject = $"Dropped Throughput Detected - {issue.ComponentName}";
            var emailBody = $"Over the past three message counts, component below has shown lower than expected number of received messages.{Environment.NewLine}{Environment.NewLine}";
            emailBody += $"Component Name: \t\t{issue.ComponentFriendlyName}{Environment.NewLine}";
            emailBody += $"Component Folder Path: \t{issue.ComponentFolderPath} {Environment.NewLine}";
            emailBody += $"Detected Rates: \t\t{string.Join(", ", issue.DetectedRates)}{Environment.NewLine}";
            emailBody += $"Detection Time: \t\t{issue.DetectionDateTime:yyyy-MM-dd  HH:mm:ss}{Environment.NewLine}";
            emailBody += $"Threshold: \t\t\t{issue.Threshold.ToString()}{Environment.NewLine}";
            
            if (issue.ComponentName.Equals("CP.tcp_IPM_ADT_to_NH_IO")) 
                emailBody += $"{Environment.NewLine}Please contact HTS on 1300 551 690 to log an urgent job so that the message that is causing the blockage will be removed. Please mention 'Problem' number [877434].";
				emailBody += $"{Environment.NewLine}More information: https://ictwiki.nh.org.au/index.php/IPM_Issue_-_Dropped_Throughput";
            
            // Send notification for issue
            var success = await _notificationService.SendNotification(emailSubject, emailBody, issue.RecipientEmails);
            
            // Mark issue as Notified in cache
            if (success) await _cacheService.MarkIssueAsNotifiedInCache(issue);
            else
            {
                // TODO: Handle notification send failure  
            }
        }
    }
}