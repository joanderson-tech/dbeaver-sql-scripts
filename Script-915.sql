select
	pg_terminate_backend(pid)
from
	pg_stat_activity
where
	datname in ( 'portal sigeduc_sigeduc_cloud_rn_pureza_20250804', 'portalsigeduc_desenv_rn_pureza')
	and pid <> pg_backend_pid();

alter database "portalsigeduc_desenv_rn_pureza" rename to "portal sigeduc_sigeduc_cloud_rn_pureza_OLD";

alter database "portal sigeduc_sigeduc_cloud_rn_pureza_20250804" rename to "portalsigeduc_desenv_rn_pureza";

select
	pg_terminate_backend(pid)
from
	pg_stat_activity
where
	datname in ( 'portal sigeduc_sigeduc_cloud_rn_pureza_comum_20250804', 'portalsigeduc_desenv_rn_pureza_comum')
	and pid <> pg_backend_pid();

alter database "portalsigeduc_desenv_rn_pureza_comum" rename to "portal sigeduc_sigeduc_cloud_rn_pureza_comum_OLD";

alter database "portal sigeduc_sigeduc_cloud_rn_pureza_comum_20250804" rename to "portalsigeduc_desenv_rn_pureza_comum";