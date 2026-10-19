
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid IN(9832);

begin;

commit;

SELECT pid FROM pg_stat_activity WHERE datname IN 
( 'portal sigeduc_sigeduc_cloud_pe_petrolina_20240605', 'portalsigeduc_desenv_pe_petrolina')AND pid <> pg_backend_pid(); 