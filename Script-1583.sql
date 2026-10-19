SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_portalsigeduc_desenv_pe_petrolina_OLD', 'portal sigeduc_portalsigeduc_desenv_pe_petrolina_comum_OLD')
AND pid <> pg_backend_pid();








ALTER DATABASE "portal sigeduc_portalsigeduc_desenv_pe_petrolina_OLD" RENAME TO portalsigeduc_desenv_pe_petrolina;
ALTER DATABASE "portal sigeduc_portalsigeduc_desenv_pe_petrolina_comum_OLD" RENAME TO portalsigeduc_desenv_pe_petrolina_comum;
