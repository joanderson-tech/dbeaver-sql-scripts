-- RN
SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
FROM pg_database
WHERE datname ILIKE '%2025%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_portalsigeduc_validacao_rn_caico_20251030', 'portalsigeduc_desenv_rn_saopedro')
AND pid <> pg_backend_pid();

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_rn_caico" RENAME TO "portalsigeduc_desenv_rn_saopedro_OLD";

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_rn_caico_20251030" RENAME TO "portalsigeduc_desenv_rn_saopedro";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_portalsigeduc_validacao_rn_caico_comum_20251030', 'portalsigeduc_desenv_rn_saopedro_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_rn_caico_comum" RENAME TO "portalsigeduc_desenv_rn_saopedro_comum_OLD";

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_rn_caico_comum_20251030" RENAME TO "portalsigeduc_desenv_rn_saopedro_comum";