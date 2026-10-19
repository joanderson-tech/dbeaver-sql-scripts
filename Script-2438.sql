SELECT t.id_turma_serie,*
FROM ensino.turma t
WHERE t.id_turma = 84777072;

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie = 84777071 OR ts.id_turma_serie_agrupadora  = 84777071;



SELECT t.id_turma_serie, t.id_disciplina , t.id_turma, t.id_categoria_componente 
FROM ensino.turma t
JOIN ensino.matricula_componente mc ON
mc.id_turma = t.id_turma
WHERE t.id_turma_serie IN (84777068, 84777069, 84777070);


/*

COMMIT;

SELECT  t.id_turma_serie,t.id_disciplina, t.codigo  --DISTINCT t.id_turma_serie, t.id_disciplina, t.id_turma --mc.id_componente_curricular
FROM ensino.turma t
--JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma
WHERE t.id_turma_serie IN (84777071, 84777072, 84777073);
*/