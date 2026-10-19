SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_sousa_20260417', 'portalsigeduc_desenv_pb_sousa')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pb_sousa" RENAME TO "portal sigeduc_sigeduc_cloud_pb_sousa_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_sousa_20260417" RENAME TO "portalsigeduc_desenv_pb_sousa";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_sousa_comum_20260417', 'portalsigeduc_desenv_pb_sousa_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pb_sousa_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_sousa_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_sousa_comum_20260417" RENAME TO "portalsigeduc_desenv_pb_sousa_comum";