-- PB
select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '"; '
from pg_database
where datname ilike '%2025%';



SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_duasestradas_20250729', 'portalsigeduc_desenv_pb_duasestradas')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_pb_duasestradas" RENAME TO "portal sigeduc_sigeduc_cloud_pb_duasestradas_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_duasestradas_20250729" RENAME TO "portalsigeduc_desenv_pb_duasestradas"; 
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_duasestradas_comum_20250729', 'portalsigeduc_desenv_pb_duasestradas_comum')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_pb_duasestradas_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_duasestradas_comum_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_duasestradas_comum_20250729" RENAME TO "portalsigeduc_desenv_pb_duasestradas_comum"; 

