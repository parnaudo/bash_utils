SELECT  schema as table_schema,
        "table" as table_name,
        size as used_mb
FROM svv_table_info d
where table_schema = 'production_warehouse'
