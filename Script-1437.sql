portalsigeduc_desenv_validacao_comum

portalsigeduc_desenv_validacao

SELECT 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '" RENAME TO "' || REPLACE(datname, RIGHT(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || REPLACE(REPLACE(datname, RIGHT(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '"; '
FROM pg_database
WHERE datname ILIKE '%2025%';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portalsigeduc_desenv_validacao', 'portalsigeduc_desenv_validacao_comum')
AND pid <> pg_backend_pid();

