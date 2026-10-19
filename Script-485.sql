select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2025%';

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_carnaubais_comum_20250509', 'portalsigeduc_desenv_rn_carnaubais_comum')AND pid <> pg_backend_pid(); 
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_carnaubais_20250509', 'portalsigeduc_desenv_rn_carnaubais')AND pid <> pg_backend_pid();   


ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_carnaubais_20250509" RENAME TO portalsigeduc_desenv_rn_carnaubais;

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_carnaubais_comum_20250509" RENAME TO portalsigeduc_desenv_rn_carnaubais_comum;
