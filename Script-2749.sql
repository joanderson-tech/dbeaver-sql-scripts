ALTER DATABASE portalsigeduc_desenv_rn_portodomangue_comum RENAME TO portalsigeduc_desenv_rn_portalegre_comum;


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid IN(23634, 23636);

begin;

commit;

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portal portalsigeduc_desenv_rn_portodomangue_comum', 'portalsigeduc_desenv_rn_portodomangue_comum')AND pid <> pg_backend_pid(); 
