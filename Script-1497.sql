select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2025%';



SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_saogoncalodoamarante_20251127', 'portalsigeduc_desenv_rn_saogoncalodoamarante')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_rn_saogoncalodoamarante" RENAME TO "portal sigeduc_sigeduc_cloud_rn_saogoncalodoamarante_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_saogoncalodoamarante_20251127" RENAME TO "portalsigeduc_desenv_rn_saogoncalodoamarante"; 
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_saogoncalodoamarante_comum_2025', 'portalsigeduc_desenv_rn_saogoncalodoamarante_c')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_rn_saogoncalodoamarante_c" RENAME TO "portal sigeduc_sigeduc_cloud_rn_saogoncalodoamarante_c_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_saogoncalodoamarante_comum_2025" RENAME TO "portalsigeduc_desenv_rn_saogoncalodoamarante_c"; 


