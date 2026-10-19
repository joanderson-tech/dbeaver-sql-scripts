SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_lagarto_20260327', 'portalsigeduc_desenv_se_lagarto')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_se_lagarto" RENAME TO "portal sigeduc_sigeduc_cloud_se_lagarto_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_lagarto_20260327" RENAME TO "portalsigeduc_desenv_se_lagarto";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_lagarto_comum_20260327', 'portalsigeduc_desenv_se_lagarto_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_se_lagarto_comum" RENAME TO "portal sigeduc_sigeduc_cloud_se_lagarto_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_lagarto_comum_20260327" RENAME TO "portalsigeduc_desenv_se_lagarto_comum";