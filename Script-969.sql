-- RN
select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2025%';

begin;

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname 
IN ( 'portal sigeduc_sigeduc_cloud_al_murici_20250813', 'portalsigeduc_desenv_al_murici')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portalsigeduc_desenv_al_murici" RENAME TO "portalsigeduc_desenv_al_murici_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_al_murici_20250813" RENAME TO "portalsigeduc_desenv_al_murici"; 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname 
IN ( 'portal sigeduc_sigeduc_cloud_al_murici_comum_20250813', 'portalsigeduc_desenv_al_murici_comum')AND pid <> pg_backend_pid();
ALTER DATABASE "portalsigeduc_desenv_al_murici_comum" RENAME TO "portalsigeduc_desenv_al_murici_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_al_murici_comum_20250813" RENAME TO "portalsigeduc_desenv_al_murici_comum"; 