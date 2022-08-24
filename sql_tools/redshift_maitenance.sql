select
  cast(use2.usename as varchar(50)) as owner,
  pgc.oid,
  trim(pgdb.datname) as Database,
  trim(pgn.nspname) as Schema,
  trim(a.name) as Table,
  b.gbytes,
  a.rows
from
 (select db_id, id, name, sum(rows) as rows
  from stv_tbl_perm a
  group by db_id, id, name
  ) as a
 join pg_class as pgc on pgc.oid = a.id
 left join pg_user use2 on (pgc.relowner = use2.usesysid)
 join pg_namespace as pgn on pgn.oid = pgc.relnamespace
    and pgn.nspowner > 1
 join pg_database as pgdb on pgdb.oid = a.db_id
 join
   (select tbl, count(*)/1000 as gbytes
    from stv_blocklist
    group by tbl
   ) b on a.id = b.tbl
 order by gbytes desc, a.db_id, a.name;


#Running queries
select pid, trim(user_name), starttime, substring(query,1,20)
from stv_recents
where status='Running';

#Cancel queries
cancel pid
