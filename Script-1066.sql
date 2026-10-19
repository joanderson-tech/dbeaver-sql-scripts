select
	pg_terminate_backend(pid)
from	pg_stat_activity
where datname in ( 'portalsigeduc_desenv_rn_montedasgameleiras_com')
	and pid <> pg_backend_pid();