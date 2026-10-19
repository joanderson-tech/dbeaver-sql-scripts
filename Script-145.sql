select
	'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_', 'portalsigeduc_desenv_') || ''') AND pid <> pg_backend_pid();
ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_', 'portalsigeduc_desenv_') ||'"; '
from pg_database
where datname ilike '%'||:municipio || '%'||:ano||'%';


select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2024%';

begin;
rollback;

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_santoantonio_20240528', 'portalsigeduc_desenv_rn_santoantonio')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_rn_santoantonio" RENAME TO "portal sigeduc_sigeduc_cloud_rn_santoantonio_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_santoantonio_20240528" RENAME TO "portalsigeduc_desenv_rn_santoantonio"; 
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_santoantonio_comum_20240528', 'portalsigeduc_desenv_rn_santoantonio_comum')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_rn_santoantonio_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_santoantonio_comum_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_santoantonio_comum_20240528" RENAME TO "portalsigeduc_desenv_rn_santoantonio_comum";
