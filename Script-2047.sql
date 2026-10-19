select pg_terminate_backend(pid)
from pg_stat_activity
where datname in ( 'portal sigeduc_sigeduc_cloud_rn_santacruz_20260324', 'portalsigeduc_desenv_rn_santacruz')
and pid <> pg_backend_pid();

alter database "portalsigeduc_desenv_rn_santacruz" rename to "portal sigeduc_sigeduc_cloud_rn_santacruz_OLD";

alter database "portal sigeduc_sigeduc_cloud_rn_santacruz_20260324" rename to "portalsigeduc_desenv_rn_santacruz";

select pg_terminate_backend(pid)
from pg_stat_activity
where datname in ( 'portal sigeduc_sigeduc_cloud_rn_santacruz_comum_20260324', 'portalsigeduc_desenv_rn_santacruz_comum')
and pid <> pg_backend_pid();

alter database "portalsigeduc_desenv_rn_santacruz_comum" rename to "portal sigeduc_sigeduc_cloud_rn_santacruz_comum_OLD";

alter database "portal sigeduc_sigeduc_cloud_rn_santacruz_comum_20260324" rename to "portalsigeduc_desenv_rn_santacruz_comum";