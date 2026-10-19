select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2025%';


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_montedasgameleiras_20250831', 'portalsigeduc_desenv_rn_montedasgameleiras')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_rn_montedasgameleiras" RENAME TO "portal sigeduc_sigeduc_cloud_rn_montedasgameleiras_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_montedasgameleiras_20250831" RENAME TO "portalsigeduc_desenv_rn_montedasgameleiras"; 

select
	pg_terminate_backend(pid)
from	pg_stat_activity
where datname in ( 'portalsigeduc_desenv_rn_montedasgameleiras_com');
	and pid <> pg_backend_pid();

alter database "portalsigeduc_desenv_rn_montedasgameleiras_comum" rename to "portal sigeduc_sigeduc_cloud_rn_montedasgameleiras_comum_OLD";

alter database "portalsigeduc_desenv_rn_montedasgameleiras_com" rename to "portalsigeduc_desenv_rn_montedasgameleiras_comum";

ALTER DATABASE "portalsigeduc_desenv_rn_montedasgameleiras_com" RENAME TO "portalsigeduc_desenv_rn_montedasgameleiras_comum";

