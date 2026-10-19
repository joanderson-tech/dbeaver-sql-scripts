SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_aguanova_comum_20260414', 'portalsigeduc_desenv_rn_aguanova_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_aguanova_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_aguanova_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_aguanova_comum_20260414" RENAME TO "portalsigeduc_desenv_rn_aguanova_comum";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_aguanova_20260414', 'portalsigeduc_desenv_rn_aguanova')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_aguanova" RENAME TO "portal sigeduc_sigeduc_cloud_rn_aguanova_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_aguanova_20260414" RENAME TO "portalsigeduc_desenv_rn_aguanova";