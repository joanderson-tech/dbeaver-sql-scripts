SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_itau_20260305', 'portalsigeduc_desenv_rn_itau')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_itau" RENAME TO "portal sigeduc_sigeduc_cloud_rn_itau_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_itau_20260305" RENAME TO "portalsigeduc_desenv_rn_itau";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_itau_comum_20260305', 'portalsigeduc_desenv_rn_itau_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_itau_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_itau_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_itau_comum_20260305" RENAME TO "portalsigeduc_desenv_rn_itau_comum";