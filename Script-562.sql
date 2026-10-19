select
	pg_terminate_backend(pid)
from
	pg_stat_activity
where
	datname in ( 'portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_20250518', 'portalsigeduc_desenv_rn_carnaubadosdantas')
	and pid <> pg_backend_pid(); 
alter database "portalsigeduc_desenv_rn_carnaubadosdantas" rename to "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_20250518" RENAME TO "portalsigeduc_desenv_rn_carnaubadosdantas"; 


select
	pg_terminate_backend(pid)
from
	pg_stat_activity
where
	datname in ( 'portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_comum_2025051', 'portalsigeduc_desenv_rn_carnaubadosdantas_comum')
	and pid <> pg_backend_pid(); 
alter database "portalsigeduc_desenv_rn_carnaubadosdantas_comum" rename to "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_comum_OLD"; 
ALTER DATABASE "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_comum_2025051" RENAME TO "portalsigeduc_desenv_rn_carnaubadosdantas_comum"; 

