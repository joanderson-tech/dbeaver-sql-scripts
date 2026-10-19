SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portalsigeduc_desenv_validacao_NAO_APAGAR', 'portalsigeduc_desenv_validacao_comum_NAO_APAGAR')
AND pid <> pg_backend_pid();

SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
FROM pg_database
WHERE datname ILIKE '%2025%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_portalsigeduc_validacao_pb_cabedelo_20251105', 'portal sigeduc_portalsigeduc_validacao_pb_cabedelo')
AND pid <> pg_backend_pid();

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pb_cabedelo" RENAME TO "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_OLD";

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_20251105" RENAME TO "portal sigeduc_portalsigeduc_validacao_pb_cabedelo";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_portalsigeduc_validacao_pb_cabedelo_comum_202511', 'portal sigeduc_portalsigeduc_validacao_pb_cabedelo_com')
AND pid <> pg_backend_pid();

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_com" RENAME TO "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_com_OLD";

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_comum_202511" RENAME TO "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_com";