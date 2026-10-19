SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_passagem_20260209', 'portalsigeduc_desenv_rn_passagem')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_passagem" RENAME TO "portal sigeduc_sigeduc_cloud_rn_passagem_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_passagem_20260209" RENAME TO "portalsigeduc_desenv_rn_passagem";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_passagem_comum_20260209', 'portalsigeduc_desenv_rn_passagem_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_passagem_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_passagem_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_passagem_comum_20260209" RENAME TO "portalsigeduc_desenv_rn_passagem_comum";