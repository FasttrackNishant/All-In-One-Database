
select 
	COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
from
INFORMATION_SCHEMA.COLUMNS
where
TABLE_NAME='WorkTypes'




SELECT 
    OBJECT_NAME(object_id) AS TableName,
    name AS KeyName,
    type_desc AS KeyType
FROM sys.indexes
WHERE OBJECT_NAME(object_id) = 'JobAllocationID';


SELECT 
    fk.name AS FK_Constraint_Name,
    OBJECT_NAME(fk.parent_object_id) AS Source_Table,
    c1.name AS Source_Column,
    OBJECT_NAME(fk.referenced_object_id) AS Referenced_Table,
    c2.name AS Referenced_Column
FROM 
    sys.foreign_keys fk
    INNER JOIN sys.foreign_key_columns fkc ON fkc.constraint_object_id = fk.object_id
    INNER JOIN sys.columns c1 ON fkc.parent_column_id = c1.column_id AND fkc.parent_object_id = c1.object_id
    INNER JOIN sys.columns c2 ON fkc.referenced_column_id = c2.column_id AND fkc.referenced_object_id = c2.object_id
WHERE 
    fk.name = 'FK_BookingOnRecords_BookingOnRecords'


// check ealtions ship

SELECT 
    fk.name AS ForeignKeyName,
    OBJECT_NAME(fk.parent_object_id) AS SourceTable,
    OBJECT_NAME(fk.referenced_object_id) AS ReferencedTable,
    CASE 
        WHEN (
            SELECT COUNT(DISTINCT parent_column_id) 
            FROM sys.foreign_key_columns 
            WHERE constraint_object_id = fk.object_id
        ) > (
            SELECT COUNT(DISTINCT referenced_column_id) 
            FROM sys.foreign_key_columns 
            WHERE constraint_object_id = fk.object_id
        ) THEN 'One-to-Many'
        WHEN (
            SELECT COUNT(DISTINCT parent_column_id) 
            FROM sys.foreign_key_columns 
            WHERE constraint_object_id = fk.object_id
        ) = (
            SELECT COUNT(DISTINCT referenced_column_id) 
            FROM sys.foreign_key_columns 
            WHERE constraint_object_id = fk.object_id
        ) THEN 'One-to-One'
        ELSE 'Many-to-One'
    END AS RelationshipType
FROM 
    sys.foreign_keys fk
WHERE 
    fk.name = 'FK__FatigueRe__JobAl__62BCEF0F'