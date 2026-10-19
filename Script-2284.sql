SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie IN (51922413,51922414) ;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie IN (51892575) ; AND t.id_disciplina = 293;

SELECT * FROM basico.turma_serie ts WHERE ts.tipo_diario  IN (31) ;


SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie   IN (67642073, 67928169, 70199566) ;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie IN (67642073, 67928169, 70199566); AND t.id_disciplina = 220;



SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 51892575;



SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_turma_serie = 51892575;

