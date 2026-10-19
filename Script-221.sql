-- RN
select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2024%';


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portal sigeduc_sigeduc_cloud_rn_veracruz_20240809', 'portalsigeduc_desenv_rn_veracruz')AND pid <> pg_backend_pid(); 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portal sigeduc_sigeduc_cloud_rn_veracruz_comum_20240809', 'portalsigeduc_desenv_rn_veracruz_comum')AND pid <> pg_backend_pid(); 



SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_veracruz_20240809', 'portalsigeduc_desenv_rn_veracruz')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_rn_veracruz" RENAME TO "portal sigeduc_sigeduc_cloud_rn_veracruz_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_veracruz_20240809" RENAME TO "portalsigeduc_desenv_rn_veracruz"; 
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_veracruz_comum_20240809', 'portalsigeduc_desenv_rn_veracruz_comum')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_rn_veracruz_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_veracruz_comum_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_veracruz_comum_20240809" RENAME TO "portalsigeduc_desenv_rn_veracruz_comum";
