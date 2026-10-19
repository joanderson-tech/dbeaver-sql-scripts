SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_al', 'portalsigeduc_desenv_al') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_al', 'portalsigeduc_desenv_al') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_al', 'portalsigeduc_desenv_al') || '"; '
FROM pg_database
WHERE datname ILIKE '%2026%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_al_branquinha_20260121', 'portalsigeduc_desenv_al_branquinha')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_al_branquinha" RENAME TO "portal sigeduc_sigeduc_cloud_al_branquinha_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_al_branquinha_20260121" RENAME TO "portalsigeduc_desenv_al_branquinha";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_al_branquinha_comum_20260121', 'portalsigeduc_desenv_al_branquinha_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_al_branquinha_comum" RENAME TO "portal sigeduc_sigeduc_cloud_al_branquinha_comum_OLD";



ALTER DATABASE "portal sigeduc_sigeduc_cloud_al_branquinha_OLD" RENAME TO "portalsigeduc_desenv_al_branquinha";


ALTER DATABASE "portal sigeduc_sigeduc_cloud_al_branquinha_comum_OLD" RENAME TO "portalsigeduc_desenv_al_branquinha_comum";
