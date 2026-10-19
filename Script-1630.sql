SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portalsigeduc_desenv_pb_saobento', 'portalsigeduc_desenv_pb_saobento_comumm')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pb_saobento" RENAME TO "portalsigeduc_desenv_pb_saobento_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_saobento_20260113" RENAME TO "portalsigeduc_desenv_pb_saobento";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_saobento_comum_20260113', 'portalsigeduc_desenv_pb_saobento_comumm')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pb_saobento_comumm" RENAME TO "portalsigeduc_desenv_pb_saobento_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_saobento_comum_20260113" RENAME TO "portalsigeduc_desenv_pb_saobento_comum";


ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_saobento_20260113" RENAME TO portalsigeduc_desenv_pb_saobento;
ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_saobento_comum_20260113" RENAME TO portalsigeduc_desenv_pb_saobento_comumm;
