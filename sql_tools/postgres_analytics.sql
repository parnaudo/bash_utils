#indexes
SELECT
    tablename,
    indexname,
    indexdef,
       schemaname
FROM
    pg_indexes
where schemaname='api'
ORDER BY
    tablename,
    indexname;
    
    
#table size
select schemaname as table_schema,
       relname as table_name,
       pg_size_pretty(pg_relation_size(relid)) as data_size
from pg_catalog.pg_statio_user_tables
order by pg_relation_size(relid) desc;

#explain query
explain (analyze, buffers)
