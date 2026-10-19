-- PE
SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '"; '
FROM pg_database
WHERE datname ILIKE '%2026%'


SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_petrolina_20260105', 'portalsigeduc_desenv_pe_petrolina')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pe_petrolina" RENAME TO "portal sigeduc_sigeduc_cloud_pe_petrolina_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_petrolina_20260105" RENAME TO "portalsigeduc_desenv_pe_petrolina";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_petrolina_comum_20260105', 'portalsigeduc_desenv_pe_petrolina_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pe_petrolina_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pe_petrolina_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_petrolina_comum_20260105" RENAME TO "portalsigeduc_desenv_pe_petrolina_comum";

;