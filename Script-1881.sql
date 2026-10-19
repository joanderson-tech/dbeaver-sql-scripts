SELECT cc.nome , t.id_disciplina, t.id_situacao_turma 
FROM ensino.turma t
JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina 
WHERE t.id_turma_serie = 52285581;

SELECT *
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico = 52234512;

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico = 52234512;

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo  = 'multiss';


SELECT *
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio = 52234512;

