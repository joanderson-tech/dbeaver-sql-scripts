-- RN
SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
FROM pg_database
WHERE datname ILIKE '%2025%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_alexandria_20251226', 'portalsigeduc_desenv_rn_alexandria')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_alexandria" RENAME TO "portal sigeduc_sigeduc_cloud_rn_alexandria_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_alexandria_20251226" RENAME TO "portalsigeduc_desenv_rn_alexandria";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_alexandria_comum_20251226', 'portalsigeduc_desenv_rn_alexandria_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_alexandria_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_alexandria_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_alexandria_comum_20251226" RENAME TO "portalsigeduc_desenv_rn_alexandria_comum";