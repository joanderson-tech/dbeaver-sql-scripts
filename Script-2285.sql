SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie   IN (67642073, 67928169, 70199566) ;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie IN (67642073, 67928169, 70199566); AND t.id_disciplina = 220;



SELECT * FROM basico.curriculo_basico cbc WHERE cbc.id_curriculo_basico = 67566418;

SELECT e.nome, * FROM escola.escola e WHERE e.id_escola IN (60758571, 62637226, 68962821)


SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 67566418;



SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_turma_serie IN (67642073, 67928169, 70199566)

