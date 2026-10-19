select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2025%';


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rj_riodejaneiro_20250902', 'portalsigeduc_desenv_rj_riodejaneiro')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portalsigeduc_desenv_rj_riodejaneiro" RENAME TO "portalsigeduc_desenv_rj_riodejaneiro_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_rj_riodejaneiro_20250902" RENAME TO "portalsigeduc_desenv_rj_riodejaneiro"; 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rj_riodejaneiro_comum_20250902', 'portalsigeduc_desenv_rj_riodejaneiro_comum')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portalsigeduc_desenv_rj_riodejaneiro_comum" RENAME TO "portalsigeduc_desenv_rj_riodejaneiro_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_rj_riodejaneiro_comum_20250902" RENAME TO "portalsigeduc_desenv_rj_riodejaneiro_comum"; 

select
	'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_', 'portalsigeduc_desenv_') || ''') AND pid <> pg_backend_pid();
ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_', 'portalsigeduc_desenv_') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '";
ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_', 'portalsigeduc_desenv_') ||'"; '
from pg_database
where datname ilike '%'||:municipio || '%'||:ano||'%';