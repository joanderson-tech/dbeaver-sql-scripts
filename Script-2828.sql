SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%EMEF ELÇA CARVALHO DA FONSECA%'


SELECT *
FROM basico.turma_serie ts
WHERE ts.id_escola = 51877802
AND ts.ativo
AND ts.ano = 2026
AND nome = 'EFAFM6B';

51896869

SELECT distinct ht.*
FROM ensino.horario_turma ht
JOIN ensino.turma t ON
t.id_turma = ht.id_turma
WHERE t.id_turma_serie = 51896869
and t.id_turma = 683426
--and ht.tipo_alteracao = 2;
ORDER by ht.id_horario_turma  ;