
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_curraisnovos_comum_20260513', 'portalsigeduc_desenv_rn_curraisnovos_comum')
AND pid <> pg_backend_pid();


ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_curraisnovos_comum_20260513" RENAME TO "portalsigeduc_desenv_rn_curraisnovos_comum";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_curraisnovos_20260513', 'portalsigeduc_desenv_rn_curraisnovos')
AND pid <> pg_backend_pid();


ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_curraisnovos_20260513" RENAME TO "portalsigeduc_desenv_rn_curraisnovos";