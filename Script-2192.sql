SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_eloidesouza_20260414', 'portalsigeduc_desenv_rn_eloidesouza')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_eloidesouza" RENAME TO "portal sigeduc_sigeduc_cloud_rn_eloidesouza_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_eloidesouza_20260414" RENAME TO "portalsigeduc_desenv_rn_eloidesouza";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_eloidesouza_comum_20260414', 'portalsigeduc_desenv_rn_eloidesouza_comum')
AND pid <> pg_backend_pid();

--ALTER DATABASE "portalsigeduc_desenv_rn_eloidesouza_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_eloidesouza_comum_OLD";

ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_eloidesouza_comum_20260414" RENAME TO "portalsigeduc_desenv_rn_eloidesouza_comum";