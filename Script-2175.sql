-- gerar script de e fazer os alter
with nomes as (
select
    datname as nome_restore,
    replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_', 'portalsigeduc_desenv_') as nome_novo,
    replace(datname, right(datname, 9), '_OLD') as nome_antigo
from pg_database where datname ilike '%' ||:municipio || '%' ||:ano || '%'
)
select
'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN (''' || nome_restore || ''', ''' || nome_novo || ''') AND pid <> pg_backend_pid();
ALTER DATABASE "' || nome_novo    || '" RENAME TO "' || nome_antigo  || '";
ALTER DATABASE "' || nome_restore || '" RENAME TO "' || nome_novo    || '";
COMMENT ON DATABASE "' || nome_novo || '" IS ''Restore realizado em ' || to_char(current_date, 'DD/MM/YYYY') || ''';'
from nomes;