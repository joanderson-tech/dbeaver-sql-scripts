SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_caico_20260218', 'portalsigeduc_desenv_rn_caico')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_caico" RENAME TO "portal sigeduc_sigeduc_cloud_rn_caico_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_caico_20260218" RENAME TO "portalsigeduc_desenv_rn_caico";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_caico_comum_20260218', 'portalsigeduc_desenv_rn_caico_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_caico_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_caico_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_caico_comum_20260218" RENAME TO "portalsigeduc_desenv_rn_caico_comum";