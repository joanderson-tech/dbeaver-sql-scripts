SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%ESCOLA MUNICIPAL RONALD PINHEIRO NEO JUNIOR%'


SELECT *
FROM basico.turma_serie ts
WHERE ts.id_escola = 2663
AND ts.ativo
AND ts.ano = 2026
AND nome = 'EFAIIEF5A';


SELECT distinct t.id_disciplina ,dt.*
FROM   ensino.turma t 
join ensino.docente_turma dt on dt.id_turma = t.id_turma 
WHERE true
and t.id_turma_serie = 56620245
--and dt.id_docente = 737;
and t.id_disciplina = 229;

select p.nome, s.* from comum.pessoa p 
join rh.servidor s on s.id_pessoa = p.id_pessoa 
where TRUE 
and s.id_servidor in (183, 51872381)

select * from rh.servidor s 
where TRUE 
and s.id_servidor in (183, 51872381);



--==================================


SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%ESCOLA MUNICIPAL PROF ALEXANDRE LINHARES%'


SELECT *
FROM basico.turma_serie ts
WHERE ts.id_escola = 2625
AND ts.ativo
AND ts.ano = 2026
AND nome = 'EFAIIEF5A';


SELECT distinct t.id_disciplina ,dt.*
FROM   ensino.turma t 
join ensino.docente_turma dt on dt.id_turma = t.id_turma 
WHERE true
and t.id_turma_serie = 56620245
--and dt.id_docente = 737;
and t.id_disciplina = 229;

select p.nome, s.* from comum.pessoa p 
join rh.servidor s on s.id_pessoa = p.id_pessoa 
where TRUE 
and s.id_servidor in (183, 51872381)

select * from rh.servidor s 
where TRUE 
and s.id_servidor in (183, 51872381);