SELECT  schema as table_schema,
        "table" as table_name,
        size as used_mb
FROM svv_table_info d
where table_schema = 'production_warehouse'


#Running queries
select pid, trim(user_name), starttime, substring(query,1,20)
from stv_recents
where status='Running';

#Cancel queries
cancel pid
