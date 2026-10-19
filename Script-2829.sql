SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%ESCOLA MUL LUIZA PEREIRA DO NASCIMENTO RODRIGUES%'


SELECT *
FROM basico.turma_serie ts
WHERE ts.id_escola = 51877471
AND ts.ativo
AND ts.ano = 2026
AND nome = 'EFAIINT3A';

51896869

SELECT distinct t.*
FROM ensino.horario_turma ht
JOIN ensino.turma t ON
t.id_turma = ht.id_turma
WHERE t.id_turma_serie = 52014990
and t.id_turma = 688270
--and ht.tipo_alteracao = 2;
ORDER by ht.id_horario_turma  ;





SELECT distinct t.id_disciplina ,dt.*
FROM   ensino.turma t 
join ensino.docente_turma dt on dt.id_turma = t.id_turma 
WHERE true
--and t.id_turma_serie = 52014990
--and dt.id_docente = 737
and t.id_turma = 688270;


SELECT distinct dt.*
FROM    ensino.docente_turma dt 
WHERE  dt.id_turma = 688270;

select * from ensino.turma t where t.id_turma_serie = 52014981;688272

select * from ensino.turma t where t.id_turma_serie =52014990;


SELECT DISTINCT dt.*
FROM ensino.docente_turma dt
WHERE dt.ativo IS TRUE
  AND dt.finalizada IS FALSE
  AND dt.id_turma IN (
      SELECT t.id_turma
      FROM ensino.turma t
      WHERE t.id_turma = 688264
         OR t.id_turma_agrupadora = 688264
  );

selec


-- Auto-generated SQL script #202610091004
UPDATE ensino.docente_turma
	SET ativo=false
	WHERE id_docente_turma=52046110;

