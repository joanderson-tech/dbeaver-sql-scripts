BEGIN ;

ROLLBACK;
--## PASSO 01
WITH turmas_e_curriculos_associados AS (
    SELECT ts.id_turma_serie AS id_turma_serie_agrupadora, ts.id_curriculo_medio AS id_curriculo_agrupador, cb.id_curriculo_basico AS id_curriculo_medio_associado, cb.tipo_diario AS tipo_diario_associado, ts.id_turno AS id_turno_turma_agrupadora, ts.id_turno AS id_turno_turma_agrupadora_novo, cb.id_serie AS id_serie_associada, ts.nome AS nome_turma_agrupadora, ts.ano AS ano_turma_agrupadora, ts.id_escola AS id_escola_turma_agrupadora, ts.capacidade_aluno AS capacidade_aluno_agrupadora, ts.data_cadastro AS data_cadastro_agrupadora, ts.descricao_horario AS descricao_horario_agrupadora, ts.numero_estudantes AS numero_estudantes_agrupadora, ts.regra_nao AS regra_nao_agrupadora
FROM basico.turma_serie ts
JOIN basico.curriculo_basico_serie_multisseriada cbsm ON
cbsm.id_curriculo_basico = ts.id_curriculo_medio
JOIN basico.curriculo_basico cb ON
cb.id_curriculo_basico = cbsm.id_curriculo_basico_serie_associada
WHERE ts.id_turma_serie IN (84777072, 84777073, 84777071) 
)
SELECT *
 INTO TEMP turmas_agrupadora_e_associadas_sub
FROM turmas_e_curriculos_associados;

SELECT *
FROM turmas_serie_ativas_sub;
--- ## PASSO 02 - Unifica todas as Turmas Serie 
SELECT ts.id_turma_serie, ts.id_serie, ts.id_curriculo_medio, ts.tipo_diario, ts.id_turno, ts.id_escola, ts.id_turma_serie_agrupadora, ts.ano, ts.nome, ts.capacidade_aluno, ts.data_cadastro, ts.periodo
INTO TEMP turmas_serie_ativas_sub
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (84777072, 84777073, 84777071)
AND ts.ativo IS TRUE
AND ts.ano = (
	SELECT DISTINCT ano_turma_agrupadora
FROM turmas_agrupadora_e_associadas_sub)
AND ts.id_escola IN (
	SELECT DISTINCT id_escola_turma_agrupadora
FROM turmas_agrupadora_e_associadas_sub);
--## PASSO 03 - Select para Novas Matrículas Componentes (TURMA SERIE PRINCIPAL QUE FALTAVA)
SELECT nextval('ensino.matricula_componente_seq') AS id_matricula_componente, CASE
           WHEN mes.id_situacao_matricula_serie = 1 THEN 2
WHEN mes.id_situacao_matricula_serie = 2 THEN 5
WHEN mes.id_situacao_matricula_serie = 3 THEN 6
WHEN mes.id_situacao_matricula_serie = 4
OR mes.id_situacao_matricula_serie = 9 THEN 4
WHEN mes.id_situacao_matricula_serie = 5 THEN 3
WHEN mes.id_situacao_matricula_serie = 6 THEN 9
ELSE 2
       END AS id_situacao_matricula, t.id_turma, t.id_disciplina AS id_componente_curricular, mes.id_estudante AS id_discente, tss.ano, 1 AS periodo,
-- Assumindo período 1
tss.id_curriculo_medio AS id_curriculo_basico,
-- Currículo da sub-turma
tss.id_turma_serie
INTO TEMP novas_mc_sub
FROM turmas_serie_ativas_sub tss
JOIN ensino.turma t ON
t.id_turma_serie IN (84777072, 84777073, 84777071)
AND t.id_situacao_turma <> 4
JOIN basico.matricula_estudante_serie mes ON
mes.id_turma_serie_multisseriado = tss.id_turma_serie
-- MES da turma agrupadora
AND mes.ano_calendario = tss.ano
AND mes.id_serie_multisseriado = tss.id_serie
AND NOT EXISTS (
    SELECT 1
FROM ensino.matricula_componente mc
WHERE mc.id_turma = t.id_turma
AND mc.ano = tss.ano
);
--## PASSO 04 Geração de script SQL para backup dos DELETEs das novas matrículas componentes (TURMA PRINCIPAL)
SELECT 'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT, ',') || ');'
FROM novas_mc_sub sub ;


DELETE from ensino.matricula_componente where id_matricula_componente IN ( 20965092,20965093,20965094,20965095,20965096,20965097,20965098,20965099,20965100,20965101,20965102,20965103,20965104,20965105,20965106,20965107,20965108,20965109,20965110,20965111,20965112,20965113,20965114,20965115,20965116,20965117,20965118,20965119,20965120,20965121,20965122,20965123,20965124,20965125,20965126,20965127,20965128,20965129,20965130,20965131,20965132,20965133,20965134,20965135,20965136,20965137,20965138,20965139,20965140,20965141,20965142,20965143,20965144,20965145,20965146,20965147,20965148,20965149,20965150,20965151,20965152,20965153,20965154,20965155,20965156,20965157,20965158,20965159,20965160,20965161,20965162,20965163,20965164,20965165,20965166,20965167,20965168,20965169,20965170,20965171,20965172,20965173,20965174,20965175,20965176,20965177,20965178,20965179,20965180,20965181,20965182,20965183,20965184,20965185,20965186,20965187,20965188,20965189,20965190,20965191,20965192,20965193,20965194,20965195,20965196,20965197,20965198,20965199,20965200,20965201,20965202,20965203);

SELECT *
FROM novas_mc_sub sub ;

DELETE
FROM ensino.matricula_componente
WHERE id_matricula_componente IN ( 20965092, 20965093, 20965094, 20965095, 20965096, 20965097, 20965098, 20965099, 20965100, 20965101, 20965102, 20965103, 20965104, 20965105, 20965106, 20965107, 20965108, 20965109, 20965110, 20965111, 20965112, 20965113, 20965114, 20965115, 20965116, 20965117, 20965118, 20965119, 20965120, 20965121, 20965122, 20965123, 20965124, 20965125, 20965126, 20965127, 20965128, 20965129, 20965130, 20965131, 20965132, 20965133, 20965134, 20965135, 20965136, 20965137, 20965138, 20965139, 20965140, 20965141, 20965142, 20965143, 20965144, 20965145, 20965146, 20965147, 20965148, 20965149, 20965150, 20965151, 20965152, 20965153, 20965154, 20965155, 20965156, 20965157, 20965158, 20965159, 20965160, 20965161, 20965162, 20965163, 20965164, 20965165, 20965166, 20965167, 20965168, 20965169, 20965170, 20965171, 20965172, 20965173, 20965174, 20965175, 20965176, 20965177, 20965178, 20965179, 20965180, 20965181, 20965182, 20965183, 20965184, 20965185, 20965186, 20965187, 20965188, 20965189, 20965190, 20965191, 20965192, 20965193, 20965194, 20965195, 20965196, 20965197, 20965198, 20965199, 20965200, 20965201, 20965202, 20965203);
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

SELECT t.id_turma AS col_0_0_, t.agrupadora AS col_1_0_, t.ano AS col_2_0_, t.descricao_horario AS col_3_0_, t.periodo AS col_4_0_, st.id_situacao_turma AS col_5_0_, st.descricao AS col_6_0_, cc.id_componente_curricular AS col_7_0_, cc.nome AS col_8_0_, e.id_escola AS col_9_0_, e.nome AS col_10_0_, s.id_serie AS col_11_0_, ts.nome AS col_12_0_, CASE WHEN st.id_situacao_turma = 3 THEN TRUE
ELSE FALSE END AS col_13_0_, s.id_serie AS id1_904_, s.ativo AS ativo904_, s.bloquear_edicao AS bloquear3_904_, s.bloquear_oferta_vagas AS bloquear4_904_, s.capacidade_excesso AS capacidade5_904_, s.capacidade_maxima AS capacidade6_904_, s.capacidade_minima AS capacidade7_904_, s.cod_censo AS cod8_904_, s.codigo_rh AS codigo9_904_, s.correcao_fluxo AS correcao10_904_, s.data_atualizacao AS data11_904_, s.data_cadastro AS data12_904_, s.descricao AS descricao904_, s.emite_certificado AS emite14_904_, s.id_etapa_ensino AS id28_904_, s.exige_carga_horaria_por_componente AS exige15_904_, s.final_etapa AS final16_904_, s.multisseriada AS multiss17_904_, s. nao_contabiliza_turma AS column18_904_, s.numero AS numero904_, s.permite_avanco_estudo AS permite20_904_, s.permite_gerenciar_turma_sem_horario AS permite21_904_, s.permite_participar_atv_esportiva AS permite22_904_, s.permite_participar_sol_cadastro_reserva AS permite23_904_, s.id_proxima_serie AS id30_904_, s.id_registro_atualizacao AS id31_904_, s.id_registro_entrada AS id29_904_, s.sigla AS sigla904_, s.tipo_diario AS tipo25_904_, s.id_unidade AS id27_904_, s. verifica_frequencia_anos_anteriores AS column26_904_
FROM ensino.turma t
INNER JOIN ensino.situacao_turma st ON t.id_situacao_turma = st.id_situacao_turma
INNER JOIN ensino.componente_curricular cc ON t.id_disciplina = cc.id_componente_curricular
INNER JOIN basico.turma_serie ts ON t.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.serie s ON ts.id_serie = s.id_serie
INNER JOIN escola.escola e ON ts.id_escola = e.id_escola
LEFT OUTER JOIN basico.categoria_componente ccc ON t.id_categoria_componente = ccc.id_categoria_componente, basico.etapa_ensino etapaensin7_
WHERE s.id_etapa_ensino = etapaensin7_.id_etapa_ensino
AND t.id_turma_serie = 84777072
AND t.ano =2026
AND t.id_disciplina = 518
AND t.tipo <> 4
AND (st.id_situacao_turma IN (1 , 3 , 7))
ORDER BY e.nome, etapaensin7_.denominacao, s.descricao, t.periodo, cc.nome