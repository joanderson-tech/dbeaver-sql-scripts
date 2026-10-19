SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_montanhas_20260401', 'portalsigeduc_desenv_rn_montanhas')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_montanhas" RENAME TO "portal sigeduc_sigeduc_cloud_rn_montanhas_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_montanhas_20260401" RENAME TO "portalsigeduc_desenv_rn_montanhas";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_montanhas_comum_20260401', 'portalsigeduc_desenv_rn_montanhas_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_montanhas_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_montanhas_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_montanhas_comum_20260401" RENAME TO "portalsigeduc_desenv_rn_montanhas_comum";