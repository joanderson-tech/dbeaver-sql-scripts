BEGIN ;

--rollback;

--## PASSO 01
WITH turmas_e_curriculos_associados AS (
    SELECT ts.id_turma_serie AS id_turma_serie_agrupadora, ts.id_curriculo_medio AS id_curriculo_agrupador, cb.id_curriculo_basico AS id_curriculo_medio_associado, cb.tipo_diario AS tipo_diario_associado, ts.id_turno AS id_turno_turma_agrupadora, ts.id_turno AS id_turno_turma_agrupadora_novo, cb.id_serie AS id_serie_associada, ts.nome AS nome_turma_agrupadora, ts.ano AS ano_turma_agrupadora, ts.id_escola AS id_escola_turma_agrupadora, ts.capacidade_aluno AS capacidade_aluno_agrupadora, ts.data_cadastro AS data_cadastro_agrupadora, ts.descricao_horario AS descricao_horario_agrupadora, ts.numero_estudantes AS numero_estudantes_agrupadora, ts.regra_nao AS regra_nao_agrupadora
FROM basico.turma_serie ts
JOIN basico.curriculo_basico_serie_multisseriada cbsm ON cbsm.id_curriculo_basico = ts.id_curriculo_medio
JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cbsm.id_curriculo_basico_serie_associada
WHERE ts.id_turma_serie = 51905720
)
SELECT *
 INTO TEMP turmas_agrupadora_e_associadas_sub
FROM turmas_e_curriculos_associados;

--- ## PASSO 02 - Unifica todas as Turmas Serie 
SELECT ts.id_turma_serie, ts.id_serie, ts.id_curriculo_medio, ts.tipo_diario, ts.id_turno, ts.id_escola, ts.id_turma_serie_agrupadora, ts.ano, ts.nome, ts.capacidade_aluno, ts.data_cadastro, ts.periodo
INTO TEMP turmas_serie_ativas_sub
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51905720)
AND ts.ativo IS TRUE
AND ts.ano = (
	SELECT DISTINCT ano_turma_agrupadora
	FROM turmas_agrupadora_e_associadas_sub)
AND ts.id_escola IN (
	SELECT DISTINCT id_escola_turma_agrupadora
	FROM turmas_agrupadora_e_associadas_sub);

--## PASSO 03 - Select para Novas Matrículas Componentes (TURMA SERIE PRINCIPAL QUE FALTAVA)
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
FROM turmas_serie_ativas_sub tss
JOIN ensino.turma t ON
t.id_turma_serie = 51905720
AND t.id_situacao_turma <> 4
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie_multisseriado = tss.id_turma_serie -- MES da turma agrupadora
AND mes.ano_calendario = tss.ano
AND mes.id_serie_multisseriado = tss.id_serie
AND NOT EXISTS (
    SELECT 1
FROM ensino.matricula_componente mc
WHERE mc.id_turma = t.id_turma
AND mc.ano = tss.ano
);
                                            
--## PASSO 04 Geração de script SQL para backup dos DELETEs das novas matrículas componentes (TURMA PRINCIPAL)
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');'
FROM novas_mc_sub sub ;


--## PASSO 05 - Insere Novas Matrículas Componentes (TURMA PRINCIPAL)
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

COMMIT;	