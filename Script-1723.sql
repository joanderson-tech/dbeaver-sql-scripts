SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
FROM pg_database
WHERE datname ILIKE '%2026%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_veracruz_20260203', 'portalsigeduc_desenv_rn_veracruz')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_veracruz" RENAME TO "portal sigeduc_sigeduc_cloud_rn_veracruz_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_veracruz_20260203" RENAME TO "portalsigeduc_desenv_rn_veracruz";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_veracruz_comum_20260203', 'portalsigeduc_desenv_rn_veracruz_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_veracruz_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_veracruz_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_veracruz_comum_20260203" RENAME TO "portalsigeduc_desenv_rn_veracruz_comum";