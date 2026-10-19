SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_saobento_comum_20260109', 'portalsigeduc_desenv_pb_saobento_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pb_saobento_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_saobento_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_saobento_comum_20260109" RENAME TO "portalsigeduc_desenv_pb_saobento_comum";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_saobento_20260109', 'portalsigeduc_desenv_pb_saobento')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pb_saobento" RENAME TO "portal sigeduc_sigeduc_cloud_pb_saobento_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_saobento_20260109" RENAME TO "portalsigeduc_desenv_pb_saobento";