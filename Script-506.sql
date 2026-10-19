

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_barcelona_20250514', 'portalsigeduc_desenv_rn_barcelona')AND pid <> pg_backend_pid();  
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_barcelona_comum_20250514', 'portalsigeduc_desenv_rn_barcelona_comum')AND pid <> pg_backend_pid(); 


ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_barcelona_20250514" RENAME TO portalsigeduc_desenv_rn_barcelona;
ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_barcelona_comum_20250514" RENAME TO portalsigeduc_desenv_rn_barcelona_comum;
