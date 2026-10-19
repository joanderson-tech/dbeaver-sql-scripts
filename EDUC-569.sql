begin;

UPDATE basico.curriculo_basico SET tipo_diario = 1 WHERE id_curriculo_basico in (52224881,52224887);
UPDATE basico.turma_serie SET tipo_diario = 1 WHERE id_turma_serie  in ( 52229792, 52229794, 52229795, 52229834, 52229835, 52230764, 52230765, 52229902, 52230935, 52230936, 52231390, 52231388, 52231238, 52231239, 52240040, 52240041, 52231366);

--## Criação de Novas Polivalente
SELECT 
  'INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES 
	( 2025, 1, 1, ' || ts.capacidade_aluno || ', 220, ''' || ts.nome || ''', 1, false, false, true, ' || ts.id_turma_serie || ', false, false, 0  );', ts.id_turma_serie as backup
FROM (
  SELECT DISTINCT ON (t.id_turma_serie)  t.capacidade_aluno,  ts.nome,  ts.id_turma_serie
  FROM ensino.turma t
  JOIN basico.turma_serie ts  ON ts.id_turma_serie = t.id_turma_serie
  WHERE t.id_turma_serie IN (52229792, 52229794, 52229795, 52229902, 52231366, 52231388, 52231390)
  AND NOT EXISTS (
    SELECT 1 
    FROM ensino.turma t2 
    WHERE t2.id_turma_serie = t.id_turma_serie 
      AND t2.id_disciplina = 220
  )
) t
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie;

id_turma_serie  in ( 52229834, 52229835, 52230764, 52230765, 52230935, 52230936, 52231238, 52231239, 52240040, 52240041, 52231366);

---
WITH turma_agrupadora_existente AS (
    SELECT
        t.id_turma_serie,
        t.id_turma AS turma_agrupadora_id
    FROM
        ensino.turma t
    WHERE
        t.id_disciplina = 220
        AND t.agrupadora
        AND t.id_situacao_turma <> 4 
        AND t.ano = 2025 
        and t.id_turma_serie IN (52229792, 52229794, 52229795, 52229834, 52229835, 52230764, 52230765, 52229902, 52230935, 52230936, 52231390, 52231388, 52231238, 52231239, 52240040, 52240041, 52231366)
)
UPDATE ensino.turma AS t_main
SET id_turma_agrupadora = tai.turma_agrupadora_id
FROM
    turma_agrupadora_existente tai
WHERE
    t_main.id_turma_serie = tai.id_turma_serie
    AND t_main.id_disciplina <> 220 
    AND t_main.id_categoria_componente <> 2
    AND t_main.id_turma IN (SELECT tt.id_turma FROM ensino.turma tt where tt.id_turma_serie IN (52229792, 52229794, 52229795, 52229834, 52229835, 52230764, 52230765, 52229902, 52230935, 52230936, 52231390, 52231388, 52231238, 52231239, 52240040, 52240041, 52231366)
 ); 

-- ## Criação de Novas Matrículas Componentes

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
           ts.id_turma_serie
           INTO TEMP novas_mc
    FROM basico.turma_serie ts 
    JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie AND t.id_situacao_turma <> 4
   	where ts.id_turma_serie IN (52229792, 52229794, 52229795, 52229834, 52229835, 52230764, 52230765, 52229902, 52230935, 52230936, 52231390, 52231388, 52231238, 52231239, 52240040, 52240041, 52231366);

INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo)
SELECT tm.id_matricula_componente, tm.id_situacao_matricula, tm.id_turma, tm.id_componente_curricular, tm.id_discente, tm.ano, tm.periodo
FROM novas_mc tm
WHERE NOT EXISTS (
    SELECT 1 
    FROM ensino.matricula_componente mc 
    WHERE mc.id_turma = tm.id_turma 
      AND mc.ano = tm.ano 
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);



---backup
UPDATE basico.curriculo_basico SET tipo_diario = 0 WHERE id_curriculo_basico in (52224881,52224887);
UPDATE basico.turma_serie SET tipo_diario = 0 WHERE id_turma_serie  in ( 52229792, 52229794, 52229795, 52229834, 52229835, 52230764, 52230765, 52229902, 52230935, 52230936, 52231390, 52231388, 52231238, 52231239, 52240040, 52240041, 52231366,);

--backup das Novas Polivalentes
select 'DELETE FROM ensino.turma WHERE id_turma = ' || CAST(t.id_turma AS TEXT) || ';' AS comando_delete_sql
FROM ensino.turma t
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
WHERE t.id_turma_serie in (52229792, 52229794, 52229795, 52229902, 52231366, 52231388, 52231390)
and t.id_disciplina = 220;

--backup
 SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente = ' || id_matricula_componente || '; ' backup
 FROM novas_mc;


