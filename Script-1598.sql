-- SE
SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || '"; '
FROM pg_database
WHERE datname ILIKE '%2026%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_lagarto_20260106', 'portalsigeduc_desenv_se_lagarto')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_se_lagarto" RENAME TO "portal sigeduc_sigeduc_cloud_se_lagarto_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_lagarto_20260106" RENAME TO "portalsigeduc_desenv_se_lagarto";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_lagarto_comum_20260106', 'portalsigeduc_desenv_se_lagarto_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_se_lagarto_comum" RENAME TO "portal sigeduc_sigeduc_cloud_se_lagarto_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_lagarto_comum_20260106" RENAME TO "portalsigeduc_desenv_se_lagarto_comum";