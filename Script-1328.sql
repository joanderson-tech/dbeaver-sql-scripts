select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '"; '
from pg_database
where datname ilike '%2025%';


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_petrolina_20251014', 'portalsigeduc_desenv_pe_petrolina')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_pe_petrolina" RENAME TO "portal sigeduc_sigeduc_cloud_pe_petrolina_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_petrolina_20251014" RENAME TO "portalsigeduc_desenv_pe_petrolina"; 
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_petrolina_comum_20251014', 'portalsigeduc_desenv_pe_petrolina_comum')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_pe_petrolina_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pe_petrolina_comum_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_petrolina_comum_20251014" RENAME TO "portalsigeduc_desenv_pe_petrolina_comum"; 

