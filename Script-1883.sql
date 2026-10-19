-- SE
SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || '"; '
FROM pg_database
WHERE datname ILIKE '%202%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20260302', 'portalsigeduc_desenv_se_nossasenhoradosocorro')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_se_nossasenhoradosocorro" RENAME TO "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20260302" RENAME TO "portalsigeduc_desenv_se_nossasenhoradosocorro";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202', 'portalsigeduc_desenv_se_nossasenhoradosocorro_')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_se_nossasenhoradosocorro_" RENAME TO "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro__OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202" RENAME TO "portalsigeduc_desenv_se_nossasenhoradosocorro_";
