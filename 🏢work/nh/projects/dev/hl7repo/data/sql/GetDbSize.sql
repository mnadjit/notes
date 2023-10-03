USE [Message_Repository]
GO

SELECT * FROM sys.dm_db_log_space_usage

/******* Calculate size of the database *********/
SELECT 
      database_name = DB_NAME(database_id)
    , log_size_mb = CAST(SUM(CASE WHEN type_desc = 'LOG' THEN size END) * 8. / 1024 AS DECIMAL(8,2))
    , row_size_mb = CAST(SUM(CASE WHEN type_desc = 'ROWS' THEN size END) * 8. / 1024 AS DECIMAL(8,2))
    , total_size_mb = CAST(SUM(size) * 8. / 1024 AS DECIMAL(8,2))
FROM sys.master_files WITH(NOWAIT)
WHERE database_id = DB_ID() -- for current db 
GROUP BY database_id;
GO

/******* Calculate size of all tables *********/
SELECT 
    s.Name AS SchemaName,
    t.NAME AS TableName,
    p.rows AS RowCounts,
	CAST(ROUND(((SUM(a.total_pages) * 8) / (p.rows + 1.00)), 2) AS NUMERIC(36, 2)) AS AvgRowSizeKB, 
    CAST(ROUND(((SUM(a.total_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS TotalSpaceMB,
    CAST(ROUND(((SUM(a.used_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS UsedSpaceMB, 
    CAST(ROUND(((SUM(a.total_pages) - SUM(a.used_pages)) * 8) / 1024.00, 2) AS NUMERIC(36, 2)) AS UnusedSpaceMB,
    SUM(a.total_pages) * 8 AS TotalSpaceKB, 
    SUM(a.used_pages) * 8 AS UsedSpaceKB, 
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.NAME NOT LIKE 'dt%' 
    AND t.is_ms_shipped = 0
    AND i.OBJECT_ID > 255 
GROUP BY 
    t.Name, s.Name, p.Rows
ORDER BY 
      TotalSpaceMB desc;
GO

/******* Calculate size of indices *********/
SELECT
      OBJECT_NAME(i.OBJECT_ID)     AS TableName
    , i.name                       AS IndexName
    , SUM(a.used_pages) * 8 / 1024 AS SizeMB
FROM
	  sys.indexes          AS i
	, sys.partitions       AS p
	, sys.allocation_units AS a
WHERE
	  i.OBJECT_ID     = p.OBJECT_ID
  AND i.index_id      = p.index_id
  AND p.partition_id  = a.container_id
  AND i.is_primary_key = 0 -- excloure PK's
GROUP BY
      i.OBJECT_ID
    , i.index_id
    , i.name
ORDER BY
	SizeMB DESC,
    TableName,
    i.index_id;
GO