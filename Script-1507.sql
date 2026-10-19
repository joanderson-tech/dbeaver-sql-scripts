SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
FROM pg_database
WHERE datname ILIKE '%2025%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_baiaformosa_20251127', 'portalsigeduc_desenv_rn_baiaformosa')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_baiaformosa" RENAME TO "portal sigeduc_sigeduc_cloud_rn_baiaformosa_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_baiaformosa_20251127" RENAME TO "portalsigeduc_desenv_rn_baiaformosa";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_baiaformosa_comum_20251127', 'portalsigeduc_desenv_rn_baiaformosa_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_baiaformosa_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_baiaformosa_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_baiaformosa_comum_20251127" RENAME TO "portalsigeduc_desenv_rn_baiaformosa_comum";