SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portalsigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20250920', 'portalsigeduc_sigeduc_cloud_se_nossasenhoradosocorro')AND pid <> pg_backend_pid(); 

ALTER DATABASE "portalsigeduc_sigeduc_cloud_se_nossasenhoradosocorro" RENAME TO "portalsigeduc_sigeduc_cloud_se_nossasenhoradosocorro_OLD"; 
ALTER DATABASE "portalsigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20250920" RENAME TO "portalsigeduc_sigeduc_cloud_se_nossasenhoradosocorro"; 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202', 'portalsigeduc_desenv_se_nossasenhoradosocorro_comum')AND pid <> pg_backend_pid(); 

ALTER DATABASE "portalsigeduc_sigeduc_cloud_se_nossasenhoradosocorro_c" RENAME TO "portalsigeduc_sigeduc_cloud_se_nossasenhoradosocorro_c_OLD"; 
ALTER DATABASE "portalsigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_2025" RENAME TO "portalsigeduc_sigeduc_cloud_se_nossasenhoradosocorro_c"; 


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20250920', 'portalsigeduc_desenv_se_nossasenhoradosocorro')AND pid <> pg_backend_pid(); 


ALTER DATABASE "portalsigeduc_desenv_se_nossasenhoradosocorro" RENAME TO "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20250920" RENAME TO "portalsigeduc_desenv_se_nossasenhoradosocorro"; 


ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20250920" RENAME TO portalsigeduc_desenv_se_nossasenhoradosocorro;

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202" RENAME TO portalsigeduc_desenv_se_nossasenhoradosocorro_comum;
