SELECT * FROM pg_stat_activity;


SELECT pg_terminate_backend(24804) 


SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid IN(23634, 23636);

begin;

commit;

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portal sigeduc_sigeduc_cloud_pe_petrolina_20240605', 'portalsigeduc_desenv_rn_lajes')AND pid <> pg_backend_pid(); 

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN 
( 'portal sigeduc_sigeduc_cloud_pe_petrolina_comum_20240605', 'portalsigeduc_desenv_rn_lajes_comum')AND pid <> pg_backend_pid(); 


-- RN
select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_rn', 'portalsigeduc_desenv_rn') || '"; '
from pg_database
where datname ilike '%2024%';

-- PE
select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pe', 'portalsigeduc_desenv_pe') || '"; '
from pg_database
where datname ilike '%2024%';

-- PB
select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_pb', 'portalsigeduc_desenv_pb') || '"; '
from pg_database
where datname ilike '%2024%';

-- SE
select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_se', 'portalsigeduc_desenv_se') || '"; '
from pg_database
where datname ilike '%2024%';

-- AL
select 'SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ( ''' || datname || ''', ''' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_al', 'portalsigeduc_desenv_al') || ''')AND pid <> pg_backend_pid(); ' || 'ALTER DATABASE "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_al', 'portalsigeduc_desenv_al') || '" RENAME TO "' || replace(datname, right(datname, 9), '_OLD') || '"; ALTER DATABASE "' || datname || '" RENAME TO "' || replace(replace(datname, right(datname, 9), ''), 'portal sigeduc_sigeduc_cloud_al', 'portalsigeduc_desenv_al') || '"; '
from pg_database
where datname ilike '%2024%';


-- banco academico

UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET email = 'desenv@esig.com.br', ramal = 1234;

UPDATE escola.escola SET senhatransferencia = '123456' WHERE senhatransferencia IS NOT NULL;


-- banco comum
alter sequence entrada_seq restart with 9000000;


UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET senha = md5(substring(login,1,25)), email = 'desenv@esig.com.br', ramal = 1234;

UPDATE comum.parametro SET valor = 'desenv@esig.com.br' WHERE codigo IN ('2_1_1','3_1_1');
DELETE FROM comum.parametro p WHERE p.codigo IN ('infra.recaptchaSiteKey', 'infra.recaptchaSecretKey');
-- Inativando o envio de alerta por email.
UPDATE comum.parametro SET valor = 'false' WHERE codigo = '3_1_15'; 



---senhas
produção
P0rt@ls!g3duC