SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_orobo_20260219', 'portalsigeduc_desenv_pe_orobo')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_pe_orobo" RENAME TO "portal sigeduc_sigeduc_cloud_pe_orobo_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_orobo_20260219" RENAME TO "portalsigeduc_desenv_pe_orobo";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_orobo_comum_20260219', 'portalsigeduc_desenv_pe_orobo_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_pe_orobo_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pe_orobo_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_orobo_comum_20260219" RENAME TO "portalsigeduc_desenv_pe_orobo_comum";