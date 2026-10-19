-- SE
SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || '"; '
FROM pg_database
WHERE datname ILIKE 'portal_sigeduc_sigeduc_cloud_se_%'
AND datname ILIKE '%2025%'
AND datname NOT ILIKE '%petrolina%'
AND datname NOT ILIKE '%_old%'
AND datname NOT ILIKE '%portalsigeduc_desenv_se%'
AND datname NOT IN ('postgres', 'template0', 'template1');


SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20250920', 'portalsigeduc_desenv_se_nossasenhoradosocorro')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_se_nossasenhoradosocorro" RENAME TO "portalsigeduc_desenv_se_nossasenhoradosocorro_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20250920" RENAME TO "portalsigeduc_desenv_se_nossasenhoradosocorro";


SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202', 'portalsigeduc_desenv_se_nossasenhoradosocorro_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_se_nossasenhoradosocorro_comum" RENAME TO "portalsigeduc_desenv_se_nossasenhoradosocorro_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202" RENAME TO "portalsigeduc_desenv_se_nossasenhoradosocorro_comum";