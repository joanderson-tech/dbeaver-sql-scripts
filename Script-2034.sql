select pg_terminate_backend(pid)
from pg_stat_activity
where datname in ( 'portal sigeduc_sigeduc_cloud_rn_altodorodrigues_20260324', 'portalsigeduc_desenv_rn_altodorodrigues')
and pid <> pg_backend_pid();

alter database "portalsigeduc_desenv_rn_altodorodrigues" rename to "portal sigeduc_sigeduc_cloud_rn_altodorodrigues_OLD";

alter database "portal sigeduc_sigeduc_cloud_rn_altodorodrigues_20260324" rename to "portalsigeduc_desenv_rn_altodorodrigues";

select pg_terminate_backend(pid)
from pg_stat_activity
where datname in ( 'portal sigeduc_sigeduc_cloud_rn_altodorodrigues_comum_20260324', 'portalsigeduc_desenv_rn_altodorodrigues_comum')
and pid <> pg_backend_pid();

alter database "portalsigeduc_desenv_rn_altodorodrigues_comum" rename to "portal sigeduc_sigeduc_cloud_rn_altodorodrigues_comum_OLD";

alter database "portal sigeduc_sigeduc_cloud_rn_altodorodrigues_comum_20260324" rename to "portalsigeduc_desenv_rn_altodorodrigues_comum";