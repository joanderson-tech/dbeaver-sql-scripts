SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_20250731', 'portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui" RENAME TO "portalsigeduc_desenv_pi_saojoaodopiaui"; 
--ALTER DATABASE "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_20250731" RENAME TO "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui"; 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_comum_20250731', 'portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_comum')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_comum" RENAME TO "portalsigeduc_desenv_pi_saojoaodopiaui_comum"; 
--ALTER DATABASE "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_comum_20250731" RENAME TO "portal sigeduc_sigeduc_cloud_pi_saojoaodopiaui_comum"; 