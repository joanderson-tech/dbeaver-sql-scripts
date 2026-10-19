SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_guamare_20260505', 'portalsigeduc_desenv_rn_guamare')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_guamare" RENAME TO "portal sigeduc_sigeduc_cloud_rn_guamare_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_guamare_20260505" RENAME TO "portalsigeduc_desenv_rn_guamare";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_guamare_comum_20260505', 'portalsigeduc_desenv_rn_guamare_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_guamare_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_guamare_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_guamare_comum_20260505" RENAME TO "portalsigeduc_desenv_rn_guamare_comum";