SELECT distinct t.id_disciplina , dt.*
FROM   ensino.turma t 
join ensino.docente_turma dt on dt.id_turma = t.id_turma 
WHERE true
--and t.id_turma_serie = 52014990
and dt.id_docente = 447;
and t.id_turma = 688270;


select p.nome, s.* from comum.pessoa p 
join rh.servidor s on s.id_pessoa = p.id_pessoa 
where TRUE 
and s.id_servidor in (183, 51872381)


select p.nome, s.* from comum.pessoa p 
join rh.servidor s on s.id_pessoa = p.id_pessoa 
where  s.id_servidor in (436, 737, 447)

SELECT distinct dt.*
FROM    ensino.docente_turma dt 
WHERE true
--and dt.id_docente = 447;
and dt.id_turma = 688272;