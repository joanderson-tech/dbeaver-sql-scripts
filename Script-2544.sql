-- PB
SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '"; '
FROM pg_database
WHERE datname ILIKE '%2026%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_pedrasdefogo_comum_20260713', 'portalsigeduc_desenv_pb_pedrasdefogo_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pb_pedrasdefogo_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_pedrasdefogo_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_pedrasdefogo_comum_20260713" RENAME TO "portalsigeduc_desenv_pb_pedrasdefogo_comum";

