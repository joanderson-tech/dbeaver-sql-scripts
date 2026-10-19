-- SE
select
	'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || '"; '
from
	pg_database
where
	datname ilike '%2025%';



SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202', 
'portalsigeduc_desenv_se_nossasenhoradosocorro_comum')AND pid <> pg_backend_pid(); 

ALTER DATABASE "portalsigeduc_desenv_se_nossasenhoradosocorro_comum" RENAME TO "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_OLD"; 

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202" RENAME TO "portalsigeduc_desenv_se_nossasenhoradosocorro_comum"; 


ALTER DATABASE portalsigeduc_desenv_se_nossasenhoradosocorro_comum RENAME TO portalsigeduc_desenv_se_nossasenhoradosocorro_comum_old;
