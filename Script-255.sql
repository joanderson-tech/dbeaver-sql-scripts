SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portal sigeduc_sigeduc_cloud_rn_antoniomartins', 'portalsigeduc_desenv_rn_antoniomartins')AND pid <> pg_backend_pid(); 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portal sigeduc_sigeduc_cloud_rn_antoniomartins_comum', 'portalsigeduc_desenv_rn_antoniomartins_comum')AND pid <> pg_backend_pid(); 