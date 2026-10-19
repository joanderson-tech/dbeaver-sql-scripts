SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_altodorodrigues_20260326', 'portalsigeduc_desenv_rn_altodorodrigues')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_altodorodrigues" RENAME TO "portal sigeduc_sigeduc_cloud_rn_altodorodrigues_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_altodorodrigues_20260326" RENAME TO "portalsigeduc_desenv_rn_altodorodrigues";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_altodorodrigues_comum_20260326', 'portalsigeduc_desenv_rn_altodorodrigues_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_altodorodrigues_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_altodorodrigues_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_altodorodrigues_comum_20260326" RENAME TO "portalsigeduc_desenv_rn_altodorodrigues_comum";