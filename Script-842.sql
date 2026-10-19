BEGIN 
	
-- ## Criação de Novas Matrículas Componentes

 WITH criar_MC AS (
 SELECT nextval('ensino.matricula_componente_seq') AS id_matricula_componente,
           CASE 
               WHEN mes.id_situacao_matricula_serie = 1 THEN 2 
               WHEN mes.id_situacao_matricula_serie = 2 THEN 5
               WHEN mes.id_situacao_matricula_serie = 3 THEN 6
               WHEN mes.id_situacao_matricula_serie = 4 OR mes.id_situacao_matricula_serie = 9 THEN 4
               WHEN mes.id_situacao_matricula_serie = 5 THEN 3
               WHEN mes.id_situacao_matricula_serie = 6 THEN 9
               ELSE 2
           END AS id_situacao_matricula,
           t.id_turma, 
           t.id_disciplina AS id_componente_curricular,
           mes.id_estudante AS id_discente,
           ts.ano,
           ts.periodo,
           ts.id_curriculo_medio AS id_curriculo_basico,
           ts.id_turma_serie,
           mes.id_matricula_discente_serie id_matricula_estudante_serie
    FROM  basico.turma_serie ts
    JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
    WHERE ts.id_curriculo_medio IN (51876220, 51876233)
    AND ts.ativo
    AND ts.ano = 2025
    AND t.id_situacao_turma <> 4)
    SELECT *
    INTO TEMP novas_mc
    FROM criar_MC tm 
    WHERE NOT EXISTS (
    SELECT 1 
    FROM ensino.matricula_componente mc 
    WHERE mc.id_turma = tm.id_turma 
      AND mc.ano = tm.ano 
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);
   
	    
 SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' ||string_agg(id_matricula_componente::TEXT,',') || '); ' backup
 FROM novas_mc


INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo,id_matricula_estudante_serie)
SELECT tm.id_matricula_componente, tm.id_situacao_matricula, tm.id_turma, tm.id_componente_curricular, tm.id_discente, tm.ano, tm.periodo, id_matricula_estudante_serie
FROM novas_mc tm
WHERE NOT EXISTS (
    SELECT 1 
    FROM ensino.matricula_componente mc 
    WHERE mc.id_turma = tm.id_turma 
      AND mc.ano = tm.ano 
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);

COMMIT 
 --rollback;