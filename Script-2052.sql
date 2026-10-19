select pg_terminate_backend(pid)
from pg_stat_activity
where datname in ( 'portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20260325', 'portalsigeduc_desenv_se_nossasenhoradosocorro')
and pid <> pg_backend_pid();

alter database "portalsigeduc_desenv_se_nossasenhoradosocorro" rename to "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_OLD";

alter database "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_20260325" rename to "portalsigeduc_desenv_se_nossasenhoradosocorro";


select pg_terminate_backend(pid)
from pg_stat_activity
where datname in ( 'portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202', 'portalsigeduc_desenv_se_nossasenhoradosocorro_comum')
and pid <> pg_backend_pid();

alter database "portalsigeduc_desenv_se_nossasenhoradosocorro_comum" rename to "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro__OLD";

alter database "portal sigeduc_sigeduc_cloud_se_nossasenhoradosocorro_comum_202" rename to "portalsigeduc_desenv_se_nossasenhoradosocorro_comum";
