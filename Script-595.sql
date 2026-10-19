select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2025%';



ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_jardimdeangicos_20250527" RENAME TO "portalsigeduc_desenv_rn_jardimdeangicos"; 

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_jardimdeangicos_comum_20250527" RENAME TO "portalsigeduc_desenv_rn_jardimdeangicos_comum"; 


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_jardimdeangicos_comum_20250527')AND pid <> pg_backend_pid(); 



SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_jardimdeangicos_20250527')AND pid <> pg_backend_pid(); 





ALTER DATABASE "portalsigeduc_desenv_rn_jardimdeangicos" RENAME TO "portal sigeduc_sigeduc_cloud_rn_jardimdeangicos_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_jardimdeangicos_20250527" RENAME TO "portalsigeduc_desenv_rn_jardimdeangicos"; 

