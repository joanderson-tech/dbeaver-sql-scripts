ALTER DATABASE portalsigeduc_desenv_se_lagarto RENAME TO "portalsigeduc_desenv_se_lagarto_OLD";

ALTER DATABASE portalsigeduc_desenv_se_lagarto_comum RENAME TO "portalsigeduc_desenv_se_lagarto_comum_OLD";


ALTER DATABASE portalsigeduc_desenv_educ21_treinamento RENAME TO portalsigeduc_desenv_se_lagarto;

ALTER DATABASE portalsigeduc_desenv_educ21_treinamento_comum RENAME TO portalsigeduc_desenv_se_lagarto_comum;



begin;
rollback;

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portalsigeduc_desenv_educ21_treinamento', 'portalsigeduc_desenv_educ21_treinamento_comum')AND pid <> pg_backend_pid(); 