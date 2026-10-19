SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_jardimdoserido_comum_20260223', 'portalsigeduc_desenv_rn_jardimdoserido_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_jardimdoserido_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_jardimdoserido_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_jardimdoserido_comum_20260223" RENAME TO "portalsigeduc_desenv_rn_jardimdoserido_comum";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_jardimdoserido_20260223', 'portalsigeduc_desenv_rn_jardimdoserido')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_jardimdoserido" RENAME TO "portal sigeduc_sigeduc_cloud_rn_jardimdoserido_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_jardimdoserido_20260223" RENAME TO "portalsigeduc_desenv_rn_jardimdoserido";