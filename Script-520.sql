select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '"; '
from pg_database
where datname ilike '%2025%';


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_solanea_20250516', 'portalsigeduc_desenv_pb_solanea')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_pb_solanea" RENAME TO "portal sigeduc_sigeduc_cloud_pb_solanea_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_solanea_20250516" RENAME TO "portalsigeduc_desenv_pb_solanea"; 
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_solanea_comum_20250516', 'portalsigeduc_desenv_pb_solanea_comum')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_pb_solanea_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_solanea_comum_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_solanea_comum_20250516" RENAME TO "portalsigeduc_desenv_pb_solanea_comum"; 

