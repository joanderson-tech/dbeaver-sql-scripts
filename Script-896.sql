select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '"; '
from pg_database
where datname ilike '%2025%';

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_20250731', 'portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui')AND pid <> pg_backend_pid(); 
--ALTER DATABASE "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui" RENAME TO "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_20250731" RENAME TO "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui"; 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_comum_20250731', 'portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_comum')AND pid <> pg_backend_pid(); 
--ALTER DATABASE "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_comum_20250731" RENAME TO "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_comum"; 