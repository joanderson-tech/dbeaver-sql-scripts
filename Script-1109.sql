-- RN
select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2025%';


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_ipanguacu_20250908', 'portalsigeduc_desenv_rn_ipanguacu')AND pid <> pg_backend_pid(); 
--ALTER DATABASE "portalsigeduc_desenv_rn_ipanguacu" RENAME TO "portal sigeduc_sigeduc_cloud_rn_ipanguacu_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_ipanguacu_20250908" RENAME TO "portalsigeduc_desenv_rn_ipanguacu"; 
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_ipanguacu_comum_20250908', 'portalsigeduc_desenv_rn_ipanguacu_comum')AND pid <> pg_backend_pid(); 
--ALTER DATABASE "portalsigeduc_desenv_rn_ipanguacu_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_ipanguacu_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_ipanguacu_comum_20250908" RENAME TO "portalsigeduc_desenv_rn_ipanguacu_comum"; 

