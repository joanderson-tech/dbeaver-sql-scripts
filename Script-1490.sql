-- PB
SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '"; '
FROM pg_database
WHERE datname ILIKE '%2025%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_juazeirinho_20251205', 'portalsigeduc_desenv_pb_juazeirinho')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_pb_juazeirinho" RENAME TO "portal sigeduc_sigeduc_cloud_pb_juazeirinho_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_juazeirinho_20251205" RENAME TO "portalsigeduc_desenv_pb_juazeirinho";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_juazeirinho_comum_20251205', 'portalsigeduc_desenv_pb_juazeirinho_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_pb_juazeirinho_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_juazeirinho_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_juazeirinho_comum_20251205" RENAME TO "portalsigeduc_desenv_pb_juazeirinho_comum";