SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_portalsigeduc_validacao_pe_petrolina_comum_20251', 'portalsigeduc_desenv_validacao_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_validacao_comum" RENAME TO "portal sigeduc_portalsigeduc_validacao_pe_petrolina_co_OLD";

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pe_petrolina_comum_20251" RENAME TO "portalsigeduc_desenv_validacao_comum";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_portalsigeduc_validacao_pe_petrolina_20251018', 'portalsigeduc_desenv_validacao')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_validacao" RENAME TO "portal sigeduc_portalsigeduc_validacao_pe_petrolina_OLD";

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pe_petrolina_20251018" RENAME TO "portalsigeduc_desenv_validacao";