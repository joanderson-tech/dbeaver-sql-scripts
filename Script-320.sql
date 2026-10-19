select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2024%';


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_boasaude_20241127', 'portalsigeduc_desenv_rn_boasaude')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_rn_boasaude" RENAME TO "portal sigeduc_sigeduc_cloud_rn_boasaude_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_boasaude_20241127" RENAME TO "portalsigeduc_desenv_rn_boasaude"; 


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_boasaude_comum_20241127', 'portalsigeduc_desenv_rn_boasaude_comum')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_rn_boasaude_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_boasaude_comum_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_boasaude_comum_20241127" RENAME TO "portalsigeduc_desenv_rn_boasaude_comum"; 