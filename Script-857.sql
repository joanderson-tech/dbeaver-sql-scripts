select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2025%';


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_educ21_treinamento_20250723', 'portalsigeduc_desenv_educ21_treinamento')AND pid <> pg_backend_pid();
ALTER DATABASE "portalsigeduc_desenv_educ21_treinamento" RENAME TO "portal sigeduc_sigeduc_cloud_educ21_treinamento_OLD"; 
ALTER DATABASE "sigeduc_sigeduc_cloud_educ21_treinamento_20250723" RENAME TO "portalsigeduc_desenv_educ21_treinamento"; 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_educ21_treinamento_comum_20250723', 'portalsigeduc_desenv_educ21_treinamento_comum')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portalsigeduc_desenv_educ21_treinamento_comum" RENAME TO "portal sigeduc_sigeduc_cloud_educ21_treinamento_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_educ21_treinamento_comum_20250723" RENAME TO "portal sigeduc_sigeduc_cloud_educ21_treinamento_comum"; 

ALTER DATABASE "portal sigeduc_sigeduc_cloud_educ21_treinamento_comum_20250723" RENAME TO portalsigeduc_desenv_educ21_treinamento_comum;


portalsigeduc_desenv_educ21_treinamento_comum