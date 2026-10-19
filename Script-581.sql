


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_mossoro_20250524', 'portalsigeduc_desenv_rn_mossoro')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_rn_mossoro" RENAME TO "portal sigeduc_sigeduc_cloud_rn_mossoro_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_mossoro_20250524" RENAME TO "portalsigeduc_desenv_rn_mossoro"; 
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_mossoro_comum_20250524', 'portalsigeduc_desenv_rn_mossoro_comum')AND pid <> pg_backend_pid(); ALTER DATABASE "portalsigeduc_desenv_rn_mossoro_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_mossoro_comum_OLD"; ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_mossoro_comum_20250524" RENAME TO "portalsigeduc_desenv_rn_mossoro_comum"; 

