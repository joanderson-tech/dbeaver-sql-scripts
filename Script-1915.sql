SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_camaragibe_20260305', 'portalsigeduc_desenv_pe_camaragibe')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pe_camaragibe" RENAME TO "portal sigeduc_sigeduc_cloud_pe_camaragibe_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_camaragibe_20260305" RENAME TO "portalsigeduc_desenv_pe_camaragibe";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pe_camaragibe_comum_20260305', 'portalsigeduc_desenv_pe_camaragibe_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_pe_camaragibe_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pe_camaragibe_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pe_camaragibe_comum_20260305" RENAME TO "portalsigeduc_desenv_pe_camaragibe_comum";