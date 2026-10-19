SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_riachodacruz_20260416', 'portalsigeduc_desenv_rn_riachodacruz')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_riachodacruz" RENAME TO "portal sigeduc_sigeduc_cloud_rn_riachodacruz_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_riachodacruz_20260416" RENAME TO "portalsigeduc_desenv_rn_riachodacruz";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_riachodacruz_comum_20260416', 'portalsigeduc_desenv_rn_riachodacruz_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_riachodacruz_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_riachodacruz_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_riachodacruz_comum_20260416" RENAME TO "portalsigeduc_desenv_rn_riachodacruz_comum";