select * from ensino.turma t 
where t.id_turma_serie  IN (51905721, 51905722, 51905720);

select distinct mc from basico.matricula_estudante_serie mes 
join ensino.matricula_componente mc on mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
join ensino.turma t on t.id_turma = mc.id_turma
where mes.id_turma_serie = 51905720
and mc.id_situacao_matricula <> 7;
and mc.id_turma = 683483;

select * from ensino.turma t WHERE t.id_turma = 683483;

select * from basico.matricula_estudante_serie mes where mes.id_turma_serie = 51905720;

select * from basico.turma_serie ts where ts.id_turma_serie = 52250892; 

select * from basico.curriculo_basico_serie_multisseriada cbsm where cbsm.id_curriculo_basico=  52250893;

select string_agg(id_turma :: varchar , ', ') from ensino.turma where id_turma_serie  = 51905720;

SELECT * FROM ensino.matricula_componente mc WHERE mc.id_turma  IN (683483, 683484, 683485, 683482, 683486, 683487, 683488, 683489, 683490, 683491);


select * from 

--52250893 -- EIMSMP4E5A-M0

--52250894 --EIMSMP4E5A-M1

DELETE FROM ensino.turma
WHERE id_turma IN (
    SELECT t.id_turma
    FROM ensino.turma t
    WHERE t.id_disciplina IN (229, 230, 238)
      AND t.id_turma_serie = 52250892
);

BEGIN ;

rollback;

--MULT 51905721, 51905722

WITH turmas_e_curriculos_associados AS (
    SELECT
        ts.id_turma_serie AS id_turma_serie_agrupadora,
        ts.id_curriculo_medio AS id_curriculo_agrupador,
        cb.id_curriculo_basico AS id_curriculo_medio_associado,
        cb.tipo_diario AS tipo_diario_associado,
        ts.id_turno AS id_turno_turma_agrupadora,
        ts.id_turno AS id_turno_turma_agrupadora_novo, 
        cb.id_serie AS id_serie_associada,
        ts.nome AS nome_turma_agrupadora,
        ts.ano AS ano_turma_agrupadora,
        ts.id_escola AS id_escola_turma_agrupadora,
        ts.capacidade_aluno AS capacidade_aluno_agrupadora,
        ts.data_cadastro AS data_cadastro_agrupadora,
        ts.descricao_horario AS descricao_horario_agrupadora,
        ts.numero_estudantes AS numero_estudantes_agrupadora,
        ts.regra_nao AS regra_nao_agrupadora
    FROM basico.turma_serie ts
    JOIN basico.curriculo_basico_serie_multisseriada cbsm ON cbsm.id_curriculo_basico = ts.id_curriculo_medio
    JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cbsm.id_curriculo_basico_serie_associada
    WHERE ts.id_turma_serie = 51905720
)
SELECT *
 INTO TEMP turmas_agrupadora_e_associadas_sub
FROM turmas_e_curriculos_associados;


SELECT * FROM turmas_agrupadora_e_associadas_sub;

---- ============================================
----- CRIAÇÃO/GERENCIAMENTO DE TURMA COMPONENTE PARA SUB-TURMAS
----- ============================================

--- ===========================================================================
--- #3.0 - Unifica todas as Turmas Serie de Sub-Turmas que estarão ativas
--- (existentes + novas) para as próximas etapas.
--- ===========================================================================
SELECT
    ts.id_turma_serie,
    ts.id_serie,
    ts.id_curriculo_medio,
    ts.tipo_diario,
    ts.id_turno,
    ts.id_escola,
    ts.id_turma_serie_agrupadora,
    ts.ano,
    ts.nome,
    ts.capacidade_aluno,
    ts.data_cadastro,
    ts.periodo
INTO TEMP turmas_serie_ativas_sub
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51905720) 
  AND ts.ativo IS true
  AND ts.ano = (SELECT DISTINCT ano_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub) 
  AND ts.id_escola IN (SELECT DISTINCT id_escola_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub);

select * from turmas_serie_ativas_sub;

SELECT  *
FROM basico.turma_serie ts 
WHERE TS.id_turma_serie   IN (51905721, 51905722, 51905720) ;
AND ts.id_turma_serie_agrupadora IN (51905721, 51905722) ;

-- drop table tc_para_adicionar_sub; -- Use com cautela!


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
                                            
-- Geração de script SQL para backup dos DELETEs das novas matrículas componentes (sub-turmas)
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');'
FROM novas_mc_sub sub ;

DELETE from ensino.matricula_componente where id_matricula_componente IN ( 17021856,17021857,17021858,17021859,17021860,17021861,17021862,17021863,17021864,17021865,17021866,17021867,17021868,17021869,17021870,17021871,17021872,17021873,17021874,17021875,17021876,17021877,17021878,17021879,17021880,17021881,17021882,17021883,17021884,17021885,17021886,17021887,17021888,17021889,17021890,17021891,17021892,17021893,17021894,17021895,17021896,17021897,17021898,17021899,17021900,17021901,17021902,17021903,17021904,17021905,17021906,17021907,17021908,17021909,17021910,17021911,17021912,17021913,17021914,17021915,17021916,17021917,17021918,17021919,17021920,17021921,17021922,17021923,17021924,17021925,17021926,17021927,17021928,17021929,17021930,17021931,17021932,17021933,17021934,17021935,17021936,17021937,17021938,17021939,17021940,17021941,17021942,17021943,17021944,17021945,17021946,17021947,17021948,17021949,17021950,17021951,17021952,17021953,17021954,17021955,17021956,17021957,17021958,17021959,17021960,17021961,17021962,17021963);

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

   COMMIT;
   
   
