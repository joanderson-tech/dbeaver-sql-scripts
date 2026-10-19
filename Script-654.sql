select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '"; '
from pg_database
where datname ilike '%2025%';






SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_casinhas_20250609', 'portalsigeduc_desenv_pe_casinhas')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portalsigeduc_desenv_pe_casinhas" RENAME TO "portal sigeduc_sigeduc_cloud_pe_casinhas_OLD";
ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_casinhas_20250609" RENAME TO "portalsigeduc_desenv_pe_casinhas"; 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_casinhas_comum_20250609', 'portalsigeduc_desenv_pe_casinhas_comum')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portalsigeduc_desenv_pe_casinhas_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pe_casinhas_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_casinhas_comum_20250609" RENAME TO "portalsigeduc_desenv_pe_casinhas_comum"; 