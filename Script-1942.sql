SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_cuite_20260309', 'portalsigeduc_desenv_pb_cuite')
AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_pb_cuite" RENAME TO "portal sigeduc_sigeduc_cloud_pb_cuite_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_cuite_20260309" RENAME TO "portalsigeduc_desenv_pb_cuite"; 
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_cuite_comum_20260309', 'portalsigeduc_desenv_pb_cuite_comum')
AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_pb_cuite_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_cuite_comum_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_cuite_comum_20260309" RENAME TO "portalsigeduc_desenv_pb_cuite_comum";