
-- RN
select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2026%';


SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portalsigeduc_desenv_rn_portalegre_20260203', 'portalsigeduc_desenv_rn_portalegre')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_portalegre" RENAME TO "portalsigeduc_desenv_rn_portalegre_OLD";

ALTER DATABASE "portalsigeduc_desenv_rn_portalegre_20260203" RENAME TO "portalsigeduc_desenv_rn_portalegre";

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname IN ( 'portalsigeduc_desenv_rn_portalegre_comum_20260203', 'portalsigeduc_desenv_rn_portalegre_comum')
AND pid <> pg_backend_pid();

ALTER DATABASE "portalsigeduc_desenv_rn_portalegre_comum" RENAME TO "portalsigeduc_desenv_rn_portalegre_comum_OLD";

ALTER DATABASE "portalsigeduc_desenv_rn_portalegre_comum_20260203" RENAME TO "portalsigeduc_desenv_rn_portalegre_comum";


