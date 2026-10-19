SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_pedrasdefogo_20260423', 'portalsigeduc_desenv_pb_pedrasdefogo')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pb_pedrasdefogo" RENAME TO "portal sigeduc_sigeduc_cloud_pb_pedrasdefogo_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_pedrasdefogo_20260423" RENAME TO "portalsigeduc_desenv_pb_pedrasdefogo";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_pedrasdefogo_comum_20260423', 'portalsigeduc_desenv_pb_pedrasdefogo_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pb_pedrasdefogo_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_pedrasdefogo_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_pedrasdefogo_comum_20260423" RENAME TO "portalsigeduc_desenv_pb_pedrasdefogo_comum";