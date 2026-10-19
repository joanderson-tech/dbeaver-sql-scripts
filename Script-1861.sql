--solucao (EFAI3 e EFAI5)
begin;

select 
'update basico.curriculo_basico set tipo_diario = 1 where id_curriculo_basico in (' || string_agg(cb.id_curriculo_basico::text, ', ') || ');' as solucao,
'update basico.curriculo_basico set tipo_diario = 34 where id_curriculo_basico in (' || string_agg(cb.id_curriculo_basico::text, ', ') || ');' as backup
from basico.curriculo_basico cb 
where id_curriculo_basico in (51880515, 51880497);

update basico.curriculo_basico set tipo_diario = 1 where id_curriculo_basico in (51880515, 51880497);
update basico.turma_serie set tipo_diario = 1 where id_turma_serie in (51884858, 51885113, 51886649, 51886876, 51888965, 51889292, 51889068, 51888969, 51889112, 51889307, 51889417, 51889522, 51890619, 51894831, 51884856, 51884944, 51884946, 51885119, 51885121, 51885561, 51885380, 51885398, 51885115, 51885777, 51886442, 51886643, 51886654, 51886666, 51886711, 51886719, 51886724, 51887111, 51886458, 51888441, 51888443, 51887113, 51896833, 51896846, 51896858, 51896825, 51896863, 51896868, 51896888, 51896896, 51896900, 51896983);


select 
'update basico.turma_serie set tipo_diario = 1 where id_turma_serie in (' || string_agg(ts.id_turma_serie::text, ', ') || ');' as solucao,
'update basico.turma_serie set tipo_diario = 34 where id_turma_serie in (' || string_agg(ts.id_turma_serie::text, ', ') || ');' as backup
from basico.turma_serie ts 
where id_curriculo_medio in (51880515, 51880497);

--solucao (EFAI3INT, EFAI5INT)
select 
'update basico.curriculo_basico set tipo_diario = 1, tipo_diario_diversificado = 31 where id_curriculo_basico in (' || string_agg(cb.id_curriculo_basico::text, ', ') || ');' as solucao,
'update basico.curriculo_basico set tipo_diario = 34, tipo_diario_diversificado = 1 where id_curriculo_basico in (' || string_agg(cb.id_curriculo_basico::text, ', ') || ');' as backup
from basico.curriculo_basico cb 
where id_curriculo_basico in (51880778, 51880804);

update basico.curriculo_basico set tipo_diario = 1, tipo_diario_diversificado = 31 where id_curriculo_basico in (51880778, 51880804);
update basico.turma_serie set tipo_diario = 1 where id_turma_serie in (51889193, 51894913, 51894916, 51894850, 51894890, 51894892, 51887432, 51887448, 51887541, 51887632, 51887645);

select 
'update basico.turma_serie set tipo_diario = 1 where id_turma_serie in (' || string_agg(ts.id_turma_serie::text, ', ') || ');' as solucao,
'update basico.turma_serie set tipo_diario = 34 where id_turma_serie in (' || string_agg(ts.id_turma_serie::text, ', ') || ');' as backup
from basico.turma_serie ts 
where id_curriculo_medio in (51880778, 51880804);
commit;
rollback;