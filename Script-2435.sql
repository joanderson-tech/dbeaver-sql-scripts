

BEGIN ;

rollback;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 84777071;


--solução 
UPDATE basico.turma_serie 	SET id_curriculo_medio=61639524	WHERE id_turma_serie=84777072;
UPDATE basico.turma_serie 	SET id_curriculo_medio=61639553	WHERE id_turma_serie=84777073;


--backup;
UPDATE basico.turma_serie 	SET id_curriculo_medio=51876318	WHERE id_turma_serie=84777072;
UPDATE basico.turma_serie 	SET id_curriculo_medio=51876684	WHERE id_turma_serie=84777073;



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
    WHERE ts.id_turma_serie = 84777071
 ;
SELECT *
 INTO TEMP turmas_agrupadora_e_associadas_sub
FROM turmas_e_curriculos_associados;

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
WHERE ts.id_turma_serie_agrupadora = 84777071
  AND ts.ativo IS true
  AND ts.ano = (SELECT DISTINCT ano_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub) 
  AND ts.id_escola IN (SELECT DISTINCT id_escola_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub);

select * from turmas_serie_ativas_sub;

-- drop table tc_para_adicionar_sub; -- Use com cautela!

-- # select das turmas para adicionar turma (para as sub-turmas ativas)
-- Inclui também a turma polivalente (disciplina 220)
SELECT DISTINCT
    nextval('ensino.turma_seq') id_turma,
    tss.ano,
     tss.periodo, 
    1 AS id_situacao_turma, -- ABERTA
    tss.capacidade_aluno,
    cbc.id_componente_curricular AS id_disciplina,
    tss.nome AS codigo, -- Nome da turma_serie como código
    1 AS observacao,
    1 AS tipo,
    tss.data_cadastro,
    tss.id_turma_serie,
    cbc.ordem,
    cbc.id_categoria_componente,
    FALSE AS is_polivalente -- Marcador para a turma polivalente
INTO TEMP tc_para_adicionar_sub
FROM
    turmas_serie_ativas_sub tss
JOIN
    basico.curriculo_basico_componente cbc ON cbc.id_curriculo_basico = tss.id_curriculo_medio
WHERE
    NOT EXISTS (
        SELECT 1 FROM ensino.turma t
        WHERE t.id_turma_serie = tss.id_turma_serie
          AND t.id_disciplina = cbc.id_componente_curricular
          AND t.id_situacao_turma <> 4 -- Já existe e não está inativa
    )
UNION ALL
-- Adiciona a turma Polivalente (id_disciplina = 220) para cada sub-turma com tipo_diario específico
SELECT DISTINCT
    nextval('ensino.turma_seq') id_turma,
    tss.ano,
    tss.periodo,
    1 AS id_situacao_turma,
    tss.capacidade_aluno,
    220 AS id_disciplina, -- Disciplina Polivalente
    tss.nome AS codigo, -- Apenas o nome da turma_serie como código, sem '-POLIVALENTE'
    1 AS observacao,
    1 AS tipo,
    tss.data_cadastro,
    tss.id_turma_serie,
    0 AS ordem, -- Ordem 0 para polivalente
    1 AS id_categoria_componente,
    TRUE AS is_polivalente
FROM
    turmas_serie_ativas_sub tss
WHERE 1=1 
    AND NOT EXISTS (
        SELECT 1 FROM ensino.turma t
        WHERE t.id_turma_serie = tss.id_turma_serie
          AND t.id_disciplina = 220
          AND t.id_situacao_turma <> 4 -- Já existe e não está inativa
    );


-- #5.1.0 backup para deletar as turmas componentes criadas (sub-turmas)
SELECT
    'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';'
FROM tc_para_adicionar_sub;


DELETE FROM ensino.turma WHERE id_turma = 829826;
DELETE FROM ensino.turma WHERE id_turma = 829827;
DELETE FROM ensino.turma WHERE id_turma = 829828;
DELETE FROM ensino.turma WHERE id_turma = 829829;
DELETE FROM ensino.turma WHERE id_turma = 829830;
DELETE FROM ensino.turma WHERE id_turma = 829831;
DELETE FROM ensino.turma WHERE id_turma = 829832;
DELETE FROM ensino.turma WHERE id_turma = 829833;


-- #5.2 insert das turmas componentes (sub-turmas)
INSERT INTO ensino.turma (
    id_turma,
    ano,
    periodo,
    id_situacao_turma,
    capacidade_aluno,
    id_disciplina,
    codigo,
    observacao,
    tipo,
    data_cadastro,
    id_turma_serie,
    ordem,
    id_categoria_componente,
    agrupadora -- Polivalente geralmente é agrupadora
)
SELECT
    id_turma,
    ano,
    periodo,
    id_situacao_turma,
    capacidade_aluno,
    id_disciplina,
    codigo,
    observacao,
    tipo,
    data_cadastro::timestamp,
    id_turma_serie,
    ordem,
    id_categoria_componente,
    is_polivalente -- Define como agrupadora se for polivalente
FROM tc_para_adicionar_sub;

SELECT * FROM tc_para_adicionar_sub;


---##03 Atualizar id_turma_agrupadora para turmas componentes 
WITH turma_agrupadora_sub_existente AS (
    SELECT
        t.id_turma_serie,
        t.id_turma AS turma_agrupadora_id
    FROM ensino.turma t
    JOIN turmas_serie_ativas_sub tss ON t.id_turma_serie = tss.id_turma_serie
    WHERE
        t.id_disciplina = 220 
        AND t.agrupadora IS TRUE
        AND t.id_situacao_turma <> 4
        AND t.ano = (SELECT DISTINCT ano FROM tc_para_adicionar_sub)
)
SELECT 
    -- SOLUCAO:
    'UPDATE ensino.turma SET id_turma_agrupadora = ' || tais.turma_agrupadora_id || ' WHERE id_turma = ' || t_main.id_turma || ';' AS SOLUCAO,
    --  BACKUP: 
    'UPDATE ensino.turma SET id_turma_agrupadora = ' || COALESCE(t_main.id_turma_agrupadora::text, 'NULL') || ' WHERE id_turma = ' || t_main.id_turma || ';' AS BACKUP
FROM 
    ensino.turma AS t_main
JOIN turma_agrupadora_sub_existente tais ON t_main.id_turma_serie = tais.id_turma_serie
WHERE t_main.id_categoria_componente <> 2
AND t_main.id_disciplina <> 220;

/*UPDATE ensino.turma SET id_turma_agrupadora = 826320 WHERE id_turma = 829828;
UPDATE ensino.turma SET id_turma_agrupadora = 826320 WHERE id_turma = 829829;
UPDATE ensino.turma SET id_turma_agrupadora = 826320 WHERE id_turma = 829832;
UPDATE ensino.turma SET id_turma_agrupadora = 826320 WHERE id_turma = 829833;
UPDATE ensino.turma SET id_turma_agrupadora = 826326 WHERE id_turma = 829826;
UPDATE ensino.turma SET id_turma_agrupadora = 826326 WHERE id_turma = 829827;
UPDATE ensino.turma SET id_turma_agrupadora = 826326 WHERE id_turma = 829830;
UPDATE ensino.turma SET id_turma_agrupadora = 826326 WHERE id_turma = 829831;*/


UPDATE ensino.turma SET id_turma_agrupadora = NULL WHERE id_turma = 829828;
UPDATE ensino.turma SET id_turma_agrupadora = NULL WHERE id_turma = 829829;
UPDATE ensino.turma SET id_turma_agrupadora = NULL WHERE id_turma = 829832;
UPDATE ensino.turma SET id_turma_agrupadora = NULL WHERE id_turma = 829833;
UPDATE ensino.turma SET id_turma_agrupadora = NULL WHERE id_turma = 829826;
UPDATE ensino.turma SET id_turma_agrupadora = NULL WHERE id_turma = 829827;
UPDATE ensino.turma SET id_turma_agrupadora = NULL WHERE id_turma = 829830;
UPDATE ensino.turma SET id_turma_agrupadora = NULL WHERE id_turma = 829831;


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
FROM turmas_serie_ativas_sub tss
JOIN ensino.turma t ON t.id_turma_serie = tss.id_turma_serie AND t.id_situacao_turma <> 4
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie_multisseriado = tss.id_turma_serie -- MES da turma agrupadora
                                            AND mes.ano_calendario = tss.ano AND mes.id_serie_multisseriado = tss.id_serie;

-- Geração de script SQL para backup dos DELETEs das novas matrículas componentes (sub-turmas)
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');'
FROM novas_mc_sub sub; -- where sub.id_componente_curricular IN (229, 230, 238);

SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente =  ' || tm.id_matricula_componente || ');'
FROM novas_mc_sub tm
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.matricula_componente mc
    WHERE mc.id_turma = tm.id_turma
      AND mc.ano = tm.ano
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);

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

rollback;

   COMMIT;
   
   
  BEGIN; 
  
  
  relatorio_avaliativo_componente
  
  DELETE from ensino.matricula_componente where id_matricula_componente =  20966936 ;
  DELETE from ensino.matricula_componente where id_matricula_componente =  20966937 ;
  DELETE from ensino.matricula_componente where id_matricula_componente =  20966938 ;
  DELETE from ensino.matricula_componente where id_matricula_componente =  20966939 ;
  DELETE from ensino.matricula_componente where id_matricula_componente =  20967026 ;
  DELETE from ensino.matricula_componente where id_matricula_componente =  20967027 ;
  DELETE from ensino.matricula_componente where id_matricula_componente =  20967028 ;
  DELETE from ensino.matricula_componente where id_matricula_componente =  20967029 ;
  DELETE from ensino.matricula_componente where id_matricula_componente =  20967056 ;
	DELETE from ensino.matricula_componente where id_matricula_componente =  20967057 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967058 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967059 ;


 DELETE from ensino.matricula_componente where id_matricula_componente =  20966906 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966907 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966908 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966909 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966916 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966917 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966918 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966919 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966926 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966927 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966928 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966929 ;



DELETE from ensino.matricula_componente where id_matricula_componente =  20966946 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966947 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966948 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966949 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966956 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966957 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966958 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966959 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966966 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966967 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966968 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966969 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966976 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966977 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966978 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966979 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966986 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966987 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966988 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966989 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966996 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966997 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966998 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20966999 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967006 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967007 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967008 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967009 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967016 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967017 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967018 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967019 ;




DELETE from ensino.matricula_componente where id_matricula_componente =  20967036 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967037 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967038 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967039 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967046 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967047 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967048 ;
DELETE from ensino.matricula_componente where id_matricula_componente =  20967049 ;

SELECT  ra.id_relatorio_avaliativo as id_relatorio,  ra.id_configuracao_relatorio as id_configuracao,  cr.possui_parecer_descritivo as possui_parecer_descritivo,  ra.id_matricula_discente_serie as id_mes,  mes.id_turma_serie,  mes.id_turma_serie_multisseriado,  ra.id_situacao_relatorio_avaliativo as id_situacao_relatorio,  ra.ativo as ativo_relatorio,  ra.id_parecer_descritivo_individual as id_parecer,  pdi.ativo as ativo_parecer ,  ra.situacao as relatorio_situacao,  ra.justificativa_situacao as relatorio_justificativa_situacao,  cb.possui_parte_diversificada,  cb.tipo_diario,  cb.tipo_diario_diversificado,  rac.id_configuracao_relatorio_componente as id_configuracao_componente,  crc.possui_parecer_final_fixo,  crc.possui_parecer_final_descritivo,  rac.id_relatorio_avaliativo_componente as id_relatorio_componente,  rac.parecer_final_fixo,  rac.parecer_final_descritivo,  mc.id_matricula_componente as id_matricula_componente,  rac.avaliacao_descritiva as avaliacao_descritiva,  rac.id_situacao_relatorio_avaliativo_componente as situacao_componente,  rac.avaliacao_descritiva_2 as avaliacao_descritiva_2,  rac.avaliacao_descritiva_3 as avaliacao_descritiva_3,  rac.avaliacao_descritiva_4 as avaliacao_descritiva_4,  rah.id_relatorio_avaliativo_habilidade as id_relatorio_habilidade,  rah.id_configuracao_relatorio_componente_habilidade as id_configuracao_habilidade,  crch.ativo as configuracao_habilidade_ativo,  rahr.id_relatorio_avaliativo_habilidade_resposta as id_relatorio_resposta,  rahr.id_opcao_grupo_avaliacao_relatorio as id_opcao_resposta,  rahr.periodo as resposta_periodo,  pdi.descricao as parecer_descricao,  pdi.descricao_medial as parecer_descricao_medial,  pdi.descricao_final as parecer_descricao_final,  p.nome as pessoa_nome,  p.nome_social as nome_social,  p.nome_mae as nome_mae,  p.nome_pai as nome_pai,  d.matricula as matricula,  sms.descricao as situacao_descricao,  pr.id_periodicidade_relatorio AS periodicidade_relatorio,  pr.descricao AS periodicidade_descricao,  pr.quantidade_repeticoes as periodicidade_qtd_repeticoes,  pr.unidade_descricao as unidade_descricao,  tacr.id_tipo_avaliacao_componente_relatorio as id_tipo_avaliacao,  ogar.id_opcao_grupo_avaliacao_relatorio as opcao_id,  ogar.sigla as opcao_sigla,  ogar.descricao AS opcao_descricao,  cc.nome as componente_nome,  cc.id_componente_curricular as id_componente_curricular,  ac.descricao as area_conhecimento_descricao,  hc.id_habilidade_competencia as id_habilidade_competencia,  hc.descricao as habilidade_descricao,  crc.maximo_caracteres_relatorio,  t.id_categoria_componente  FROM basico.matricula_estudante_serie mes   JOIN public.discente d ON d.id_discente = mes.id_estudante  JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa  JOIN basico.situacao_matricula_serie sms ON sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie  JOIN ensino_infantil.relatorio_avaliativo ra  ON mes.id_matricula_discente_serie = ra.id_matricula_discente_serie  LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo  LEFT JOIN ensino_infantil.parecer_descritivo_individual pdi ON pdi.id_parecer_descritivo_individual = ra.id_parecer_descritivo_individual  LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente  LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade  LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente  LEFT JOIN ensino_infantil.configuracao_relatorio cr ON cr.id_configuracao_relatorio = ra.id_configuracao_relatorio  LEFT JOIN ensino_infantil.grupo_avaliacao_relatorio gar ON gar.id_grupo_avaliacao_relatorio = cr.id_grupo_avaliacao_relatorio  LEFT JOIN ensino_infantil.opcao_grupo_avaliacao_relatorio ogar ON ogar.id_grupo_avaliacao_relatorio  = gar.id_grupo_avaliacao_relatorio  LEFT JOIN ensino_infantil.periodicidade_relatorio pr ON pr.id_periodicidade_relatorio = cr.id_periodicidade_relatorio  LEFT JOIN ensino_infantil.tipo_avaliacao_componente_relatorio tacr ON tacr.id_tipo_avaliacao_componente_relatorio = crc.id_tipo_avaliacao_componente_relatorio  LEFT JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = crc.id_componente_curricular  LEFT JOIN ensino_infantil.area_conhecimento ac ON ac.id_area_conhecimento = cc.id_area_conhecimento  LEFT JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade  LEFT JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia  LEFT JOIN ensino.turma t ON t.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado, mes.id_turma_serie) AND t.id_disciplina = crc.id_componente_curricular AND t.id_situacao_turma <> 4 LEFT JOIN ensino.matricula_componente mc ON mc.id_discente = d.id_discente AND mc.id_componente_curricular = crc.id_componente_curricular AND mc.id_turma = t.id_turma   LEFT JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cr.id_curriculo_basico  WHERE ra.ativo  AND crc.ativo     AND ((cr.possui_parecer_descritivo AND pdi.ativo) OR NOT cr.possui_parecer_descritivo)     AND d.status <> 2    AND ((ra.id_situacao_relatorio_avaliativo <> 4        AND rac.id_situacao_relatorio_avaliativo_componente <> 4)        or (mes.id_situacao_matricula_serie =4 and (            select count(*)             from basico.movimentacao_estudante me             where me.id_discente = mc.id_discente             and me.ativo             and me.id_tipo_movimentacao_estudante = 3            and ano_escolar = mes.ano_calendario         ) > 0)     ) AND mes.id_matricula_discente_serie = 1650204 AND mc.id_situacao_matricula IN  ( 5,6,2,8,4,11 )





SELECT ra.id_relatorio_avaliativo AS id_relatorio, ra.id_configuracao_relatorio AS id_configuracao, cr.possui_parecer_descritivo AS possui_parecer_descritivo, ra.id_matricula_discente_serie AS id_mes, mes.id_turma_serie, mes.id_turma_serie_multisseriado, ra.id_situacao_relatorio_avaliativo AS id_situacao_relatorio, ra.ativo AS ativo_relatorio, ra.id_parecer_descritivo_individual AS id_parecer, pdi.ativo AS ativo_parecer , ra.situacao AS relatorio_situacao, ra.justificativa_situacao AS relatorio_justificativa_situacao, cb.possui_parte_diversificada, cb.tipo_diario, cb.tipo_diario_diversificado, rac.id_configuracao_relatorio_componente AS id_configuracao_componente, crc.possui_parecer_final_fixo, crc.possui_parecer_final_descritivo, rac.id_relatorio_avaliativo_componente AS id_relatorio_componente, rac.parecer_final_fixo, rac.parecer_final_descritivo, mc.id_matricula_componente AS id_matricula_componente, rac.avaliacao_descritiva AS avaliacao_descritiva, rac.id_situacao_relatorio_avaliativo_componente AS situacao_componente, rac.avaliacao_descritiva_2 AS avaliacao_descritiva_2, rac.avaliacao_descritiva_3 AS avaliacao_descritiva_3, rac.avaliacao_descritiva_4 AS avaliacao_descritiva_4, rah.id_relatorio_avaliativo_habilidade AS id_relatorio_habilidade, rah.id_configuracao_relatorio_componente_habilidade AS id_configuracao_habilidade, crch.ativo AS configuracao_habilidade_ativo, rahr.id_relatorio_avaliativo_habilidade_resposta AS id_relatorio_resposta, rahr.id_opcao_grupo_avaliacao_relatorio AS id_opcao_resposta, rahr.periodo AS resposta_periodo, pdi.descricao AS parecer_descricao, pdi.descricao_medial AS parecer_descricao_medial, pdi.descricao_final AS parecer_descricao_final, p.nome AS pessoa_nome, p.nome_social AS nome_social, p.nome_mae AS nome_mae, p.nome_pai AS nome_pai, d.matricula AS matricula, sms.descricao AS situacao_descricao, pr.id_periodicidade_relatorio AS periodicidade_relatorio, pr.descricao AS periodicidade_descricao, pr.quantidade_repeticoes AS periodicidade_qtd_repeticoes, pr.unidade_descricao AS unidade_descricao, tacr.id_tipo_avaliacao_componente_relatorio AS id_tipo_avaliacao, ogar.id_opcao_grupo_avaliacao_relatorio AS opcao_id, ogar.sigla AS opcao_sigla, ogar.descricao AS opcao_descricao, cc.nome AS componente_nome, cc.id_componente_curricular AS id_componente_curricular, ac.descricao AS area_conhecimento_descricao, hc.id_habilidade_competencia AS id_habilidade_competencia, hc.descricao AS habilidade_descricao, crc.maximo_caracteres_relatorio, t.id_categoria_componente
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
JOIN ensino_infantil.relatorio_avaliativo ra ON
mes.id_matricula_discente_serie = ra.id_matricula_discente_serie
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
LEFT JOIN ensino_infantil.parecer_descritivo_individual pdi ON
pdi.id_parecer_descritivo_individual = ra.id_parecer_descritivo_individual
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON
rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
LEFT JOIN ensino_infantil.configuracao_relatorio cr ON
cr.id_configuracao_relatorio = ra.id_configuracao_relatorio
LEFT JOIN ensino_infantil.grupo_avaliacao_relatorio gar ON
gar.id_grupo_avaliacao_relatorio = cr.id_grupo_avaliacao_relatorio
LEFT JOIN ensino_infantil.opcao_grupo_avaliacao_relatorio ogar ON
ogar.id_grupo_avaliacao_relatorio = gar.id_grupo_avaliacao_relatorio
LEFT JOIN ensino_infantil.periodicidade_relatorio pr ON
pr.id_periodicidade_relatorio = cr.id_periodicidade_relatorio
LEFT JOIN ensino_infantil.tipo_avaliacao_componente_relatorio tacr ON
tacr.id_tipo_avaliacao_componente_relatorio = crc.id_tipo_avaliacao_componente_relatorio
LEFT JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = crc.id_componente_curricular
LEFT JOIN ensino_infantil.area_conhecimento ac ON
ac.id_area_conhecimento = cc.id_area_conhecimento
LEFT JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON
crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
LEFT JOIN ensino_infantil.habilidade_competencia hc ON
hc.id_habilidade_competencia = crch.id_habilidade_competencia
LEFT JOIN ensino.turma t ON
t.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
AND t.id_disciplina = crc.id_componente_curricular
AND t.id_situacao_turma <> 4
LEFT JOIN ensino.matricula_componente mc ON
mc.id_discente = d.id_discente
AND mc.id_componente_curricular = crc.id_componente_curricular
AND mc.id_turma = t.id_turma
LEFT JOIN basico.curriculo_basico cb ON
cb.id_curriculo_basico = cr.id_curriculo_basico
WHERE ra.ativo
AND crc.ativo
AND ((cr.possui_parecer_descritivo
	AND pdi.ativo)
OR NOT cr.possui_parecer_descritivo)
AND d.status <> 2
AND ((ra.id_situacao_relatorio_avaliativo <> 4
	AND rac.id_situacao_relatorio_avaliativo_componente <> 4)
OR (mes.id_situacao_matricula_serie = 4
	AND ( SELECT count(*)
FROM basico.movimentacao_estudante me
WHERE me.id_discente = mc.id_discente
	AND me.ativo
	AND me.id_tipo_movimentacao_estudante = 3
	AND ano_escolar = mes.ano_calendario ) > 0) )
AND mes.id_matricula_discente_serie = 1650204
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8, 4, 11 )

;;



SELECT crc.* FROM ensino_infantil.configuracao_relatorio_componente AS crc
WHERE id_configuracao_relatorio = 43

