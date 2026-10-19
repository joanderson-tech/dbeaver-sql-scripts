-- PB
select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '"; '
from pg_database
where datname ilike '%2024%';


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_portalsigeduc_validacao_pb_cabedelo_20241002', 'portal sigeduc_portalsigeduc_validacao_pb_cabedelo')AND pid <> pg_backend_pid(); ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pb_cabedelo" RENAME TO "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_OLD"; 

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_20241002" RENAME TO "portal sigeduc_portalsigeduc_validacao_pb_cabedelo"; 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( 'portal sigeduc_portalsigeduc_validacao_pb_cabedelo_comum_202410', 'portal sigeduc_portalsigeduc_validacao_pb_cabedelo_com')AND pid <> pg_backend_pid(); ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_com" RENAME TO "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_com_OLD";

ALTER DATABASE "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_comum_202410" RENAME TO "portal sigeduc_portalsigeduc_validacao_pb_cabedelo_com";

