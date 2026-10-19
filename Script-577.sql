select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '"; '
from pg_database
where datname ilike '%2025%';


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_sousa_comum_20250525', 'portalsigeduc_desenv_pb_sousa_comum')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_pb_sousa_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_sousa_comum_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_sousa_comum_20250525" RENAME TO "portalsigeduc_desenv_pb_sousa_comum"; 
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_sousa_20250525', 'portalsigeduc_desenv_pb_sousa')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_pb_sousa" RENAME TO "portal sigeduc_sigeduc_cloud_pb_sousa_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_sousa_20250525" RENAME TO "portalsigeduc_desenv_pb_sousa";

