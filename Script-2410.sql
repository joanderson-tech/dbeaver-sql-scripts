SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%EMEIF E EJA MANOEL FAUSTINO DE MENDONCA%';

51870354

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_escola = 51870354
AND ts.ano = 2026
AND ativo
AND ts.id_turma_serie IN (61115537, 61115538, 61115539);



SELECT *
FROM basico.turma_serie ts
WHERE ts.permite_disciplina_contraturno = TRUE AND 


SELECT ht.* FROM ensino.turma t
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE id_turma_serie = 51917191;
