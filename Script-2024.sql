

select pg_terminate_backend(pid)
from pg_stat_activity
where datname in ( 'portal sigeduc_sigeduc_cloud_rn_pedroavelino_20260323', 'portalsigeduc_desenv_rn_pedroavelino')
and pid <> pg_backend_pid();

alter database "portal sigeduc_sigeduc_cloud_rn_pedroavelino_20260323" rename to "portalsigeduc_desenv_rn_pedroavelino";

select pg_terminate_backend(pid)
from pg_stat_activity
where datname in ( 'portal sigeduc_sigeduc_cloud_rn_pedroavelino_comum_20260323', 'portalsigeduc_desenv_rn_pedroavelino_comum')
and pid <> pg_backend_pid();


alter database "portal sigeduc_sigeduc_cloud_rn_pedroavelino_comum_20260323" rename to "portalsigeduc_desenv_rn_pedroavelino_comum";


;