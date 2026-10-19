select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '"; '
from pg_database
where datname ilike '%2025%';


SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portalsigeduc_desenv_pe_petrolina_validacao', 'portalsigeduc_desenv_pe_petrolina_validacao_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pe_petrolina" RENAME TO "portal sigeduc_portalsigeduc_validacao_pe_petrolina_OLD";

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pe_petrolina_20251018" RENAME TO "portalsigeduc_desenv_pe_petrolina_validacao";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_portalsigeduc_validacao_pe_petrolina_comum_20251', 'portal sigeduc_portalsigeduc_validacao_pe_petrolina_co')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pe_petrolina_co" RENAME TO "portal sigeduc_portalsigeduc_validacao_pe_petrolina_co_OLD";

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pe_petrolina_comum_20251" RENAME TO "portalsigeduc_desenv_pe_petrolina_validacao_comum";

