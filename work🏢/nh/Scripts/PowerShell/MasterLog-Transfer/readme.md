# Rhapsody Master Log Transfer

## Summary
A Windows Scheduled Task residing on Rhapsody production server moves Rhapsody Master Logs of previous day written locally on L:\Rhapsody Logs\Master to \\nhbackup01\Rhapsody Logs\Master every night at 1:10 AM.

## Background
Due to slowness of Rhapsody master logs getting stored directly into the backup server i.e. `NHBackup01`, after discussing the issue with the vendor Lyniate it was suggested that logs get stored locally on rhapsody production server and logs for each day be moved that night past mid-night to the back up server. Various solutions were tried including writing logs into a different server, and investigations by the support and network teams did not lead to any solutions. Potential bottlenecks were investigated:

1. **Destination server/disk** - Performance monitor disk queue size did not show any unusual values. Other destinations were tried e.g. NHMail05 but did not show any significant difference
2. **Network routes** - No unusual long routes were identified when examining the packets travelling between Rhapsody prod server and the backup server
3. **Increase Number of connections in Rhapsody** - This was suggested by Lyniate which slightly improved the performance but not much. Five and twenty connections were tried. Lyniate tested internally with 100 connections which consumed all CPU resources. As a result the workaround of writing logs locally and moving them overnight across to the backup server was suggested by Lyniate: Support Case# 00034277

This process is now in place via a Scheduled Task on Rhapsody production server i.e. `NHRhapsodyProd`

