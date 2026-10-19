SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
FROM pg_database
WHERE datname ILIKE '%2026%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_saomigueldogostoso_20260515', 'portalsigeduc_desenv_rn_saomigueldogostoso')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_saomigueldogostoso" RENAME TO "portal sigeduc_sigeduc_cloud_rn_saomigueldogostoso_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_saomigueldogostoso_20260515" RENAME TO "portalsigeduc_desenv_rn_saomigueldogostoso";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_saomigueldogostoso_comum_202605', 'portalsigeduc_desenv_rn_saomigueldogostoso_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_saomigueldogostoso_com" RENAME TO "portal sigeduc_sigeduc_cloud_rn_saomigueldogostoso_com_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_saomigueldogostoso_comum_202605" RENAME TO "portalsigeduc_desenv_rn_saomigueldogostoso_comum";