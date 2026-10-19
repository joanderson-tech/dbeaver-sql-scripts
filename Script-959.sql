


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_al_murici_20250812', 'portalsigeduc_desenv_al_murici')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portalsigeduc_desenv_al_murici" RENAME TO "portalsigeduc_desenv_al_murici_murici_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_al_murici_20250812" RENAME TO "portalsigeduc_desenv_al_murici"; 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_al_murici_comum_20250812', 'portalsigeduc_desenv_al_murici_comum')AND pid <> pg_backend_pid();
ALTER DATABASE "portalsigeduc_desenv_al_murici_comum" RENAME TO "portalsigeduc_desenv_al_murici_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_al_murici_comum_20250812" RENAME TO "portalsigeduc_desenv_al_murici_comum"; 