SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_caapora_20260504', 'portalsigeduc_desenv_pb_caapora')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_pb_caapora" RENAME TO "portal sigeduc_sigeduc_cloud_pb_caapora_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_caapora_20260504" RENAME TO "portalsigeduc_desenv_pb_caapora";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_caapora_comum_20260504', 'portalsigeduc_desenv_pb_caapora_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_pb_caapora_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_caapora_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_caapora_comum_20260504" RENAME TO "portalsigeduc_desenv_pb_caapora_comum";