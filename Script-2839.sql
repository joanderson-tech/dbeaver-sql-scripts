SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portalsigeduc_desenv_rn_novacruz', 'portalsigeduc_desenv_rn_novacruz_comum')AND pid <> pg_backend_pid(); 

ALTER DATABASE portalsigeduc_desenv_rn_novacruz RENAME TO portalsigeduc_desenv_rn_novacruz_old;

ALTER DATABASE portalsigeduc_desenv_rn_novacruz_comum RENAME TO portalsigeduc_desenv_rn_novacruz_comum_old;
