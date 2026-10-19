SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_esig_demonstracao_20260203', 'portal sigeduc_sigeduc_cloud_esig_demonstracao')
AND pid <> pg_backend_pid();

ALTER DATABASE "portal sigeduc_sigeduc_cloud_esig_demonstracao" RENAME TO "portal sigeduc_sigeduc_cloud_esig_demonstracao_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_esig_demonstracao_20260203" RENAME TO "portal sigeduc_sigeduc_cloud_esig_demonstracao";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_esig_demonstracao_comum_20260203', 'portal sigeduc_sigeduc_cloud_esig_demonstracao_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portal sigeduc_sigeduc_cloud_esig_demonstracao_comum" RENAME TO "portal sigeduc_sigeduc_cloud_esig_demonstracao_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_esig_demonstracao_comum_20260203" RENAME TO "portal sigeduc_sigeduc_cloud_esig_demonstracao_comum";

------#########################################
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portalsigeduc_desenv_rn_upanema', 'portalsigeduc_desenv_rn_upanema_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_veracruz_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_veracruz_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_veracruz_comum_20260203" RENAME TO "portalsigeduc_desenv_rn_veracruz_comum";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_veracruz_20260203', 'portalsigeduc_desenv_rn_veracruz')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_veracruz" RENAME TO "portal sigeduc_sigeduc_cloud_rn_veracruz_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_veracruz_20260203" RENAME TO "portalsigeduc_desenv_rn_veracruz";



------#########################################

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_educ21_treinamento_20260203', 'portal sigeduc_sigeduc_cloud_educ21_treinamento_comum_20260203')
AND pid <> pg_backend_pid();

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portalsigeduc_desenv_rn_upanema', 'portalsigeduc_desenv_rn_upanema_comum')
AND pid <> pg_backend_pid();


ALTER DATABASE portalsigeduc_desenv_rn_upanema_ RENAME TO portalsigeduc_desenv_rn_upanema;
ALTER DATABASE portalsigeduc_desenv_rn_upanema_comum_ RENAME TO portalsigeduc_desenv_rn_upanema_comum;



