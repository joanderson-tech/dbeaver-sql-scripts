SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_20260301', 'portalsigeduc_desenv_rn_carnaubadosdantas')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_carnaubadosdantas" RENAME TO "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_20260301" RENAME TO "portalsigeduc_desenv_rn_carnaubadosdantas";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_comum_2026030', 'portalsigeduc_desenv_rn_carnaubadosdantas_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_carnaubadosdantas_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_comu_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_comum_2026030" RENAME TO "portalsigeduc_desenv_rn_carnaubadosdantas_comu";