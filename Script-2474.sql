select *
from basico.curriculo_basico cb
where cb.codigo = 'INT6ANO26'; --51970478


--solução
UPDATE basico.turma_serie SET tipo_diario=0,id_curriculo_medio=51970478 WHERE id_turma_serie=51969684;
select 'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=51970478 WHERE id_matricula_discente_serie in (' || string_agg(mes.id_matricula_discente_serie::TEXT,',') || ');' as solução,
	   'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=51969644 WHERE id_matricula_discente_serie in (' || string_agg(mes.id_matricula_discente_serie::TEXT,',') || ');' as backup
from basico.matricula_estudante_serie mes where mes.id_turma_serie = 51969684;


--backup
UPDATE basico.turma_serie SET tipo_diario=10,id_curriculo_medio=51969644 WHERE id_turma_serie=51969684;


UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=51969644 WHERE id_matricula_discente_serie in (1320084, 1320100, 1320097, 1320104, 1320101, 1320103, 1320105, 1320106, 1320108, 1320110, 1320111, 1320112, 1320113, 1320094, 1320091, 1320090, 1320114, 1320115, 1320116, 1320117, 1320118, 1320126);


select * from ensino.turma t where t.id_turma_serie = 51969684;

select 'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=51970478 WHERE id_matricula_discente_serie in (' || string_agg(mes.id_matricula_discente_serie::TEXT,',') || ');' as solução,
	   'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=51969644 WHERE id_matricula_discente_serie in (' || string_agg(mes.id_matricula_discente_serie::TEXT,',') || ');' as backup
from basico.matricula_estudante_serie mes where mes.id_turma_serie = 51969684;


select *
from escola.escola e
where e.nome ilike '%ESC MUL IZABEL MOURA DE ANDRAD%'

select *
from basico.turma_serie ts
where ts.id_escola = 1615
and ano = 2026
and ts.id_turma_serie  = 51969684;