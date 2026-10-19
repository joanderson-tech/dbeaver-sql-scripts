SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_petrolina_20260315', 'portalsigeduc_desenv_pe_petrolina')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pe_petrolina" RENAME TO "portal sigeduc_sigeduc_cloud_pe_petrolina_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_petrolina_20260315" RENAME TO "portalsigeduc_desenv_pe_petrolina";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_petrolina_comum_20260315', 'portalsigeduc_desenv_pe_petrolina_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pe_petrolina_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pe_petrolina_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_petrolina_comum_20260315" RENAME TO "portalsigeduc_desenv_pe_petrolina_comum";