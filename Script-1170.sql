SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_cuitegi_20250918', 'portalsigeduc_desenv_pb_cuitegi')AND pid <> pg_backend_pid(); 
--ALTER DATABASE "portalsigeduc_desenv_pb_cuitegi" RENAME TO "portal sigeduc_sigeduc_cloud_pb_cuitegi_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_cuitegi_20250918" RENAME TO "portalsigeduc_desenv_pb_cuitegi"; 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_cuitegi_comum_20250918', 'portalsigeduc_desenv_pb_cuitegi_comum')AND pid <> pg_backend_pid(); 
--ALTER DATABASE "portalsigeduc_desenv_pb_cuitegi_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_cuitegi_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_cuitegi_comum_20250918" RENAME TO "portalsigeduc_desenv_pb_cuitegi_comum"; 


