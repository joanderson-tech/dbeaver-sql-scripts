SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portalsigeduc_desenv_pe_camaragibe_comum_OLD1', 'portalsigeduc_desenv_pe_camaragibe_comum')AND pid <> pg_backend_pid(); 


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portalsigeduc_desenv_pe_camaragibe_OLD1', 'portalsigeduc_desenv_pe_camaragibe')AND pid <> pg_backend_pid(); 




ALTER DATABASE portalsigeduc_desenv_pe_camaragibe RENAME TO "portalsigeduc_desenv_pe_camaragibe_OLD";

ALTER DATABASE portalsigeduc_desenv_pe_camaragibe RENAME TO "portalsigeduc_desenv_pe_camaragibe_OLD1";

ALTER DATABASE "portalsigeduc_desenv_pe_camaragibe_OLD1" RENAME TO portalsigeduc_desenv_pe_camaragibe;

--

ALTER DATABASE portalsigeduc_desenv_pe_camaragibe_comum RENAME TO "portalsigeduc_desenv_pe_camaragibe_comum_OLD";

ALTER DATABASE "portalsigeduc_desenv_pe_camaragibe_comum_OLD1" RENAME TO portalsigeduc_desenv_pe_camaragibe_comum;




