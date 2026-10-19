select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '"; '
from pg_database
where datname ilike '%2024%';

begin;

commit;

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portal sigeduc_sigeduc_cloud_pe_petrolina_20240605', 'portalsigeduc_desenv_rn_lajes')AND pid <> pg_backend_pid(); 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portal sigeduc_sigeduc_cloud_pe_petrolina_comum_20240605', 'portalsigeduc_desenv_rn_lajes_comum')AND pid <> pg_backend_pid(); 