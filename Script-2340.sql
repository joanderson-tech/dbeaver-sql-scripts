SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_saojosedoegito_20260514', 'portalsigeduc_desenv_pe_saojosedoegito')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_pe_saojosedoegito" RENAME TO "portal sigeduc_sigeduc_cloud_pe_saojosedoegito_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_saojosedoegito_20260514" RENAME TO "portalsigeduc_desenv_pe_saojosedoegito";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_saojosedoegito_comum_20260514', 'portalsigeduc_desenv_pe_saojosedoegito_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_pe_saojosedoegito_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pe_saojosedoegito_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_saojosedoegito_comum_20260514" RENAME TO "portalsigeduc_desenv_pe_saojosedoegito_comum";