
select pg_terminate_backend(pid) from pg_stat_activity where datname in ( 'portal sigeduc_sigeduc_cloud_rn_lagoadepedras_20250730', 'portalsigeduc_desenv_rn_lagoadepedras') and pid <> pg_backend_pid(); 

ALTER DATABASE "portalsigeduc_desenv_rn_lagoadepedras" RENAME TO "portal sigeduc_sigeduc_cloud_rn_lagoadepedras_OLD";  and pid <> pg_backend_pid();  ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_lagoadepedras_20250730" RENAME TO "portalsigeduc_desenv_rn_lagoadepedras"; 


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_rn_lagoadepedras_comum_20250730', 'portalsigeduc_desenv_rn_lagoadepedras_comum')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portalsigeduc_desenv_rn_lagoadepedras_comum" RENAME TO "portal sigeduc_sigeduc_cloud_rn_lagoadepedras_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_lagoadepedras_comum_20250730" RENAME TO "portalsigeduc_desenv_rn_lagoadepedras_comum"; 



