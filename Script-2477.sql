--solução
begin;

UPDATE basico.turma_serie SET tipo_diario=0,id_curriculo_medio=51970478 WHERE id_turma_serie=51969684;


UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=51970478 WHERE id_matricula_discente_serie in (1320126,1320112,1320094,1320091,1320090,1320114,1320115,1320116,1320117,1320118,1320212,1320353,1320113,1320084,1320100,1320104,1320097,1320101,1320103,1320105,1320106,1320108,1320110,1320111);

select 'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=51970478 WHERE id_matricula_discente_serie in (' || string_agg(mes.id_matricula_discente_serie::TEXT,',') || ');' as solução,
	   'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=51969644 WHERE id_matricula_discente_serie in (' || string_agg(mes.id_matricula_discente_serie::TEXT,',') || ');' as backup
from basico.matricula_estudante_serie mes where mes.id_turma_serie = 51969684;

commit;


UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=51969644 WHERE id_matricula_discente_serie in (1320126,1320112,1320094,1320091,1320090,1320114,1320115,1320116,1320117,1320118,1320212,1320353,1320113,1320084,1320100,1320104,1320097,1320101,1320103,1320105,1320106,1320108,1320110,1320111);
