
--add column:
ALTER TABLE table_name ADD column_name datatype;
--modify column:
ALTER TABLE table_name MODIFY column_name new_datatype;
--drop a column:
ALTER TABLE table_name DROP column_name;
--modify an existing view:
ALTER VIEW view_name AS new_query;
--alter index
ALTER INDEX index_name ON table_name RENAME TO new_index_name;
--alter database
ALTER DATABASE database_name modification;
   -->example:
      -->set mode:
         alter database databaseName read only=1;


