SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_upanema_20260407', 'portalsigeduc_desenv_rn_upanema')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_upanema" RENAME TO "portal sigeduc_sigeduc_cloud_rn_upanema_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_upanema_20260407" RENAME TO "portalsigeduc_desenv_rn_upanema";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_upanema_comum_20260407', 'portalsigeduc_desenv_rn_upanema_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_upanema_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_upanema_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_upanema_comum_20260407" RENAME TO "portalsigeduc_desenv_rn_upanema_comum";