-- RN
SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
FROM pg_database
WHERE datname ILIKE '%2026%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_goianinha_20260921', 'portalsigeduc_desenv_rn_goianinha')
AND pid <> pg_backend_pid();

ALTER DATABASE RENAME TO ;

ALTER DATABASE RENAME TO ;

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'sigeduc_sigeduc_cloud_rn_goianinha_20260921', 'sigeduc_sigeduc_cloud_rn_goianinha')
AND pid <> pg_backend_pid();

ALTER DATABASE RENAME TO ;

ALTER DATABASE RENAME TO ;

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'sigeduc_sigeduc_cloud_rn_goianinha_comum_20260921', 'sigeduc_sigeduc_cloud_rn_goianinha_comum')
AND pid <> pg_backend_pid();



SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'sigeduc_sigeduc_cloud_rn_goianinha_20260921', 'sigeduc_sigeduc_cloud_rn_goianinha')
AND pid <> pg_backend_pid();

ALTER DATABASE RENAME TO ;

ALTER DATABASE RENAME TO ;




ALTER DATABASE sigeduc_sigeduc_cloud_rn_goianinha_20260921 RENAME TO portalsigeduc_desenv_rn_goianinha;
ALTER DATABASE sigeduc_sigeduc_cloud_rn_goianinha_comum_20260921 RENAME TO portalsigeduc_desenv_rn_goianinha_comum;

