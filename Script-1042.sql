##Criação de Novas Matrículas Componentes
 
 begin;

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
           ts.id_turma, 
           ts.id_disciplina AS id_componente_curricular,
           mes.id_estudante AS id_discente,
           ts.ano,
           ts.periodo,
           ts.id_turma_serie,
           mes.id_matricula_discente_serie id_matricula_estudante_serie
    FROM ensino.turma ts
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
    WHERE 1 = 1
    AND ts.id_situacao_turma <> 4
    and ts.id_turma_serie in (54639829))
    SELECT DISTINCT *
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

--Backup
SELECT 
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente IN  ( ' || string_agg(id_matricula_componente::TEXT,',') || ');'
  FROM novas_mc mc;

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

--commit;


/*
--- ## Criação de Novas Matrículas Componentes para Sub-Turmas Ativas

-- #8.0 - Select para Novas Matrículas Componentes (sub-turmas)
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
       tss.ano,
       1 AS periodo, -- Assumindo período 1
       tss.id_curriculo_medio AS id_curriculo_basico, -- Currículo da sub-turma
       tss.id_turma_serie
INTO TEMP novas_mc_sub
FROM basico.turma_serie tss
JOIN ensino.turma t ON t.id_turma_serie = tss.id_turma_serie AND t.id_situacao_turma <> 4
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie_multisseriado = tss.id_turma_serie -- MES da turma agrupadora
                                            AND mes.ano_calendario = tss.ano AND mes.id_serie_multisseriado = tss.id_serie
where tss.id_turma_serie_agrupadora = 54639829;

select * from novas_mc_sub;

                                           
                                           
-- Geração de script SQL para backup dos DELETEs das novas matrículas componentes (sub-turmas)
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');'
FROM novas_mc_sub;

-- #8.1 - Insere Novas Matrículas Componentes (sub-turmas)
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo)
SELECT tm.id_matricula_componente, tm.id_situacao_matricula, tm.id_turma, tm.id_componente_curricular, tm.id_discente, tm.ano, tm.periodo
FROM novas_mc_sub tm
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.matricula_componente mc
    WHERE mc.id_turma = tm.id_turma
      AND mc.ano = tm.ano
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);
-- rollback;
*/
