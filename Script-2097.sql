SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_telha_20260330', 'portalsigeduc_desenv_se_telha')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_se_telha" RENAME TO "portal sigeduc_sigeduc_cloud_se_telha_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_telha_20260330" RENAME TO "portalsigeduc_desenv_se_telha";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_telha_comum_20260330', 'portalsigeduc_desenv_se_telha_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_se_telha_comum" RENAME TO "portal sigeduc_sigeduc_cloud_se_telha_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_telha_comum_20260330" RENAME TO "portalsigeduc_desenv_se_telha_comum";