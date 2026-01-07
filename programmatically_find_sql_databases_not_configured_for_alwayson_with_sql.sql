select
     'server_name'   = upper(@@servername)
,    'database_name' = upper(sd.name)
from
     master.sys.databases sd
     left join master.sys.dm_hadr_database_replica_cluster_states sdhdrcs on sd.name = sdhdrcs.database_name
where
     sd.name not in (select database_name from master.sys.dm_hadr_database_replica_cluster_states)
     and sd.database_id > 4
