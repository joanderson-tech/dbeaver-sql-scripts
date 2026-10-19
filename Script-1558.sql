
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_20251228', 'portalsigeduc_desenv_rn_carnaubadosdantas')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_carnaubadosdantas" RENAME TO "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_20251228" RENAME TO "portalsigeduc_desenv_rn_carnaubadosdantas";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_comum_2025122', 'portalsigeduc_desenv_rn_carnaubadosdantas_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_carnaubadosdantas_comu" RENAME TO "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_comu_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_comum_2025122" RENAME TO "portalsigeduc_desenv_rn_carnaubadosdantas_comum";