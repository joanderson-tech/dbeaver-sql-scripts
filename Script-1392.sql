SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_campogrande_20251029', 'portalsigeduc_desenv_rn_campogrande')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_campogrande" RENAME TO "portal sigeduc_sigeduc_cloud_rn_campogrande_treinamento_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_campogrande_20251029" RENAME TO "portalsigeduc_desenv_rn_campogrande";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_campogrande_comum_20251029', 'portalsigeduc_desenv_rn_campogrande_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_campogrande_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_campogrande_comum_treinamento_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_campogrande_comum_20251029" RENAME TO "portalsigeduc_desenv_rn_campogrande_comum";