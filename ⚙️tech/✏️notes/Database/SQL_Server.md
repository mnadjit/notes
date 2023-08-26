# Get the active running queries
`exec sp_whoisactive`

# Get the percentage of table fragmentation
```TSQL
SELECT [avg_fragmentation_in_percent]
FROM sys.dm_db_index_physical_stats (DB_ID('DB_Name'), OBJECT_ID('Table_Name'), 1, NULL, 'LIMITED');
```
