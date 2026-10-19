SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_duasestradas_20250616', 'portalsigeduc_desenv_pb_duasestradas')AND pid <> pg_backend_pid(); 
ALTER DATABASE "portalsigeduc_desenv_pb_duasestradas" RENAME TO "portal sigeduc_sigeduc_cloud_pb_duasestradas_OLD"; 

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_duasestradas_20250616" RENAME TO "portalsigeduc_desenv_pb_duasestradas"; 


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_sigeduc_cloud_pb_duasestradas_comum_20250616', 'portalsigeduc_desenv_pb_duasestradas_comum')AND pid <> pg_backend_pid();
ALTER DATABASE "portalsigeduc_desenv_pb_duasestradas_comum" RENAME TO "portal sigeduc_sigeduc_cloud_pb_duasestradas_comum_OLD"; 

ALTER DATABASE "portal sigeduc_sigeduc_cloud_pb_duasestradas_comum_20250616" RENAME TO "portalsigeduc_desenv_pb_duasestradas_comum"; 


