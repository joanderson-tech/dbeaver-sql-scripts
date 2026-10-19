-- gerar script de e fazer os alter
select 
	'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_', 'portalsigeduc_desenv_') || ''') AND pid <> pg_backend_pid(); ' 
	|| ' ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_', 'portalsigeduc_desenv_') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; '
	|| ' ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_', 'portalsigeduc_desenv_') ||'"; '
from pg_database
where datname ilike '%nossasenhoradosocorro%2023%';

-----------

SELECT pg_terminate_backend(pid) 
FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20230908', 'portalsigeduc_desenv_se_nossasenhoradosocorro') 
AND pid <> pg_backend_pid();  
ALTER DATABASE "portalsigeduc_desenv_se_nossasenhoradosocorro" RENAME TO "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_OLD";  
ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20230908" RENAME TO "portalsigeduc_desenv_se_nossasenhoradosocorro"; 

SELECT pg_terminate_backend(pid) 
FROM pg_stat_activity 
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202', 'portalsigeduc_desenv_se_nossasenhoradosocorro_comum') 
AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_se_nossasenhoradosocorro_comum" RENAME TO "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202" RENAME TO "portalsigeduc_desenv_se_nossasenhoradosocorro_comum";



begin;

commit;

rollback;