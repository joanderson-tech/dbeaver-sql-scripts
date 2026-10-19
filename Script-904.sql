SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_lagarto_comum_20250801', 'portalsigeduc_desenv_se_lagarto_comum')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portalsigeduc_desenv_se_lagarto" RENAME TO "portal sigeduc_sigeduc_cloud_se_lagarto_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_lagarto_comum_20250801" RENAME TO "portalsigeduc_desenv_se_lagarto_comum"; 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_lagarto_20250801', 'portalsigeduc_desenv_se_lagarto')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portalsigeduc_desenv_se_lagarto" RENAME TO "portal sigeduc_sigeduc_cloud_se_lagarto_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_lagarto_20250801" RENAME TO "portalsigeduc_desenv_se_lagarto"; 