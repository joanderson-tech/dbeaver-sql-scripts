select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2025%';

select
	pg_terminate_backend(pid)
from
	pg_stat_activity
where
	datname in ( 'portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_20250518', 'portalsigeduc_desenv_rn_carnaubadosdantas')
	and pid <> pg_backend_pid();


alter database "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_20250518" rename to "portalsigeduc_desenv_rn_carnaubadosdantas";

select
	pg_terminate_backend(pid)
from
	pg_stat_activity
where
	datname in ( 'portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_comum_2025051', 'portalsigeduc_desenv_rn_carnaubadosdantas_comu')
	and pid <> pg_backend_pid();


alter database "portal sigeduc_sigeduc_cloud_rn_carnaubadosdantas_comum_2025051" rename to "portalsigeduc_desenv_rn_carnaubadosdantas_comu"; 