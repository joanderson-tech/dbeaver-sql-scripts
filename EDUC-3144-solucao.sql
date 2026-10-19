 BEGIN; 

WITH novos_curriculos AS(
   SELECT id_curriculo_basico,
   id_serie,
   id_turno,
   tipo_diario
   FROM 
  basico.curriculo_basico cb 
  WHERE cb.id_curriculo_basico IN (52590848,52590859,52590868,52590915,52590906,52590924)
  AND cb.ativo
  )
select DISTINCT ON (ts.id_turma_serie)
	ts.id_turma_serie,
	ts.id_serie,
	ts.id_curriculo_medio id_curriculo_antigo,
	ncb.tipo_diario,
	ts.id_turno,
	ts.nome,
	case 
	 when ts.id_serie = ncb.id_serie then ncb.id_curriculo_basico 
	 ELSE  ts.id_curriculo_medio
	end as id_curriculo_correto
	INTO TEMP turmas_alteracao_matriz_curricular_regular
 FROM basico.turma_serie ts 
 JOIN novos_curriculos ncb ON ncb.id_serie = ts.id_serie
  AND ncb.id_curriculo_basico <> ts.id_curriculo_medio 
 WHERE ts.id_serie IN (1005218,1005219,1005220,1005339,52259173,52259187)
 AND ts.id_turma_serie_agrupadora IS null 
 and ts.ano = 2026
 AND ts.id_turno IN (2,4)
 AND ts.ativo;


SELECT DISTINCT 
	 t.id_situacao_turma,
	 t.id_disciplina ,
	 t.id_turma ,
	 t.id_turma_serie 
	INTO TEMP tc_apagar_regular
	FROM 
	turmas_alteracao_matriz_curricular_regular turmas
	join ensino.turma t on t.id_turma_serie = turmas.id_turma_serie 
where t.id_situacao_turma <> 4
AND t.id_disciplina NOT IN (220,437) -- 437 Professor de Educação Especial
AND NOT EXISTS (
		SELECT 1 
		FROM basico.curriculo_basico_componente cbc
		WHERE cbc.id_curriculo_basico = turmas.id_curriculo_correto
		  AND cbc.id_componente_curricular = t.id_disciplina -- A VERIFICAÇÃO CHAVE
	)
order by t.id_turma_serie;

 
-- #2 ATUALIZAR SITUAÇÃO DAS TURMA_COMPONENTE PARA EXCLUÍDA 4
update ensino.turma set id_situacao_turma = 4 from (
	select distinct id_turma from tc_apagar_regular 
) as fo
where ensino.turma.id_turma = fo.id_turma;

SELECT DISTINCT 
	  mc.id_matricula_componente, mc.id_discente, mc.id_turma, mc.id_componente_curricular, id_situacao_matricula
INTO TEMP mc_apagar_regular
 from tc_apagar_regular t
	join ensino.matricula_componente mc on mc.id_turma = t.id_turma
	WHERE mc.id_situacao_matricula <> 7
  order by mc.id_discente;

-- #1 ATUALIZAR SITUAÇÃO DAS MATR CULAS COMPONENTES PARA EXCLUÍDA 
update ensino.matricula_componente set id_situacao_matricula = 7 from (
	select 
		mc.id_matricula_componente
	from 
	mc_apagar_regular mc
) as fo
where ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;



-- #3.1 atualizar o curriculo turma serie
UPDATE basico.turma_serie SET tipo_diario = fo.tipo_diario, id_curriculo_medio = fo.id_curriculo_correto FROM(
	select * FROM turmas_alteracao_matriz_curricular_regular
) fo
WHERE basico.turma_serie.id_turma_serie = fo.id_turma_serie;

-- atualizar as MES ´s
UPDATE basico.matricula_estudante_serie set id_curriculo_medio = fo.id_curriculo_correto FROM(
    select distinct 
        mes.id_matricula_discente_serie, turmas.id_curriculo_correto
    from 
       turmas_alteracao_matriz_curricular_regular turmas 
        join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
            and mes.ano_calendario = 2026
) fo
WHERE basico.matricula_estudante_serie.id_matricula_discente_serie = fo.id_matricula_discente_serie ;

----- ============================================
----- CRIAÇÃO DE TURMA COMPONENTE
----- ============================================
SELECT DISTINCT
	nextval('ensino.turma_seq') 
	id_turma, 
	tsa.ano,
	tsa.periodo,
	1 id_situacao_turma, -- ABERTA
	tsa.capacidade_aluno,
	cbc.id_componente_curricular id_disciplina,
	tsa.nome codigo,
	1 observacao,
	1 tipo,
	tsa.data_cadastro,
	tsa.id_turma_serie,
	cbc.ordem,
	case
		when cbc.id_categoria_componente is not null then cbc.id_categoria_componente else 1
	end
	id_categoria_componente
INTO TEMP tc_para_adicionar_regular
FROM
turmas_alteracao_matriz_curricular_regular tm
JOIN basico.turma_serie tsa ON tsa.id_turma_serie = tm.id_turma_serie
join basico.curriculo_basico_componente cbc on cbc.id_curriculo_basico = tsa.id_curriculo_medio 
where 1=1
AND not EXISTS ( 
select 1 from ensino.turma t 
where t.id_disciplina = cbc.id_componente_curricular
and t.id_situacao_turma <> 4
and t.id_turma_serie = tsa.id_turma_serie
and cbc.id_curriculo_basico = tsa.id_curriculo_medio );



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
	id_categoria_componente 
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
	id_categoria_componente 
FROM tc_para_adicionar_regular ca
WHERE NOT EXISTS (
SELECT 1 FROM ensino.turma t
WHERE t.id_turma_serie = ca.id_turma_serie
AND t.id_disciplina = ca.id_disciplina
AND ca.id_situacao_turma = t.id_situacao_turma);
-- ## Atualização de `id_turma_agrupadora` para as Novas Turmas
-- #7.0 Atualizar id_turma_agrupadora
-- Encontra o id_turma da disciplina 220 existente para cada turma_serie afetada



WITH turma_agrupadora_existente AS (
    SELECT
        t.id_turma_serie,
        t.id_turma AS turma_agrupadora_id
    FROM
        ensino.turma t
    JOIN
       tc_para_adicionar_regular tamc ON t.id_turma_serie = tamc.id_turma_serie
    WHERE
        t.id_disciplina = 220
        AND t.agrupadora
        AND t.id_situacao_turma <> 4 
)
UPDATE ensino.turma AS t_main
SET id_turma_agrupadora = tai.turma_agrupadora_id
FROM
    turma_agrupadora_existente tai
WHERE
    t_main.id_turma_serie = tai.id_turma_serie
    AND t_main.id_disciplina <> 220 
    AND t_main.id_categoria_componente <> 2
    AND t_main.id_turma IN (SELECT id_turma FROM tc_para_adicionar_regular); 


-- Criação de Novas Matrículas Componentes
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
    JOIN
       turmas_alteracao_matriz_curricular_regular tamc ON ts.id_turma_serie = tamc.id_turma_serie 
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
    WHERE 1 = 1
    AND ts.id_situacao_turma <> 4)
    SELECT DISTINCT ON (id_discente, id_turma, id_situacao_matricula) *
    INTO TEMP novas_mc_regular
    FROM criar_MC tm 
    WHERE NOT EXISTS (
    SELECT 1 
    FROM ensino.matricula_componente mc 
    WHERE mc.id_turma = tm.id_turma 
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);
-- insert 
INSERT INTO ensino.matricula_componente (
    id_matricula_componente, 
    id_situacao_matricula, 
    id_turma, 
    id_componente_curricular, 
    id_discente, 
    ano, 
    periodo,
    id_matricula_estudante_serie
)
 SELECT DISTINCT ON (id_discente, id_turma, id_situacao_matricula)
    tm.id_matricula_componente, 
    tm.id_situacao_matricula, 
    tm.id_turma, 
    tm.id_componente_curricular, 
    tm.id_discente, 
    tm.ano, 
    tm.periodo, 
    tm.id_matricula_estudante_serie
FROM novas_mc_regular tm
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.matricula_componente mc
    WHERE mc.id_discente = tm.id_discente
      AND mc.id_turma = tm.id_turma
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_situacao_matricula NOT IN (3, 7, 9, 11)
);
-- backup matricula_componente novas
SELECT 
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::text,',')  || ');' 
  FROM novas_mc_regular mc;

-- #3.0 - backup que retorna a matriz na turma_serie
SELECT distinct 
	'UPDATE basico.turma_serie set id_curriculo_medio = ' || ts.id_curriculo_medio  || ',tipo_diario = ' || ts.tipo_diario || ' WHERE id_turma_serie IN ( ' || string_agg(ts.id_turma_serie::text,',')  || ');'
from 
turmas_alteracao_matriz_curricular_regular turmas 
join basico.turma_serie ts on ts.id_turma_serie = turmas.id_turma_serie
GROUP BY ts.id_curriculo_medio , ts.tipo_diario;


-- #4.0: Backup de MATRICULA_ESTUDANTE_SERIE
SELECT distinct 
	'UPDATE basico.matricula_estudante_serie set id_curriculo_medio = ' ||  mes.id_curriculo_medio  || 
	' WHERE id_matricula_discente_serie IN ( ' || string_agg(mes.id_matricula_discente_serie::text,',')  || ');'
from 
	turmas_alteracao_matriz_curricular_regular turmas 
	join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
		and mes.ano_calendario = 2026
GROUP BY mes.id_curriculo_medio ;


SELECT
	'UPDATE ensino.turma SET id_situacao_turma = 4 WHERE id_turma IN ( ' || string_agg(id_turma::text,',') || ');' backup 
FROM tc_apagar_regular;

SELECT 
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::text,',')  || ');' 
  FROM mc_apagar_regular mc;


--- SUB TURMAS


--- ===========================================================================
--- #0.0 - Identifica os Currículos Associados das Turmas Agrupadoras
  
  
WITH turmas_e_curriculos_associados AS (
    SELECT
        tamc.id_turma_serie AS id_turma_serie_agrupadora,
        tamc.id_curriculo_correto AS id_curriculo_agrupador,
        cb.id_curriculo_basico AS id_curriculo_medio_associado,
        cb.tipo_diario AS tipo_diario_associado,
        tamc.id_turno AS id_turno_turma_agrupadora,
        tamc.id_turno AS id_turno_turma_agrupadora_novo, 
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
    JOIN turmas_alteracao_matriz_curricular_regular tamc ON tamc.id_turma_serie = ts.id_turma_serie 
    JOIN basico.curriculo_basico_serie_multisseriada cbsm ON cbsm.id_curriculo_basico = tamc.id_curriculo_correto
    JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cbsm.id_curriculo_basico_serie_associada
)
SELECT *
 INTO TEMP turmas_agrupadora_e_associadas_sub
FROM turmas_e_curriculos_associados;





-- #1.0.1 - Seleciona as sub-turmas a serem inativadas (basico.turma_serie)
SELECT
    ts.id_turma_serie,
    ts.id_curriculo_medio AS id_curriculo_antigo,
    ts.ativo AS ativo_antigo
INTO TEMP ts_inativar_sub
FROM
    basico.turma_serie ts
JOIN
    turmas_agrupadora_e_associadas_sub taa ON ts.id_turma_serie_agrupadora = taa.id_turma_serie_agrupadora
WHERE
    ts.ativo IS TRUE
    AND ts.id_turma_serie_agrupadora IS NOT NULL
    AND ts.id_curriculo_medio <> taa.id_curriculo_medio_associado;

-- Geração de script SQL para backup dos UPDATEs de basico.turma_serie (inativação)
SELECT
    'UPDATE basico.turma_serie SET ativo = ' || ts.ativo_antigo || ' WHERE id_turma_serie IN ( ' || string_agg(ts.id_turma_serie::TEXT,',') || ');' backup
FROM ts_inativar_sub ts
GROUP BY ts.ativo_antigo;

-- #1.0.2 - Inativar basico.turma_serie
UPDATE basico.turma_serie SET ativo = FALSE
FROM ts_inativar_sub fo
WHERE basico.turma_serie.id_turma_serie = fo.id_turma_serie;


-- #1.0.3 - Seleciona as ensino.turma_componente associadas para inativar
SELECT
    t.id_turma,
    t.id_disciplina,
    t.id_turma_serie,
    t.id_situacao_turma AS situacao_antiga,
    t.descricao_horario
INTO TEMP tc_inativar_sub
FROM
    ensino.turma t
JOIN
    ts_inativar_sub ts ON t.id_turma_serie = ts.id_turma_serie
WHERE
    t.id_situacao_turma <> 4; 

-- Geração de script SQL para backup dos UPDATEs de ensino.turma (inativação)
SELECT
	'UPDATE ensino.turma SET id_situacao_turma = ' || t.situacao_antiga || ' WHERE id_turma IN ( ' || string_agg(t.id_turma::text,',') || ');' backup 
FROM tc_inativar_sub t
GROUP BY t.situacao_antiga;

-- #1.0.4 - Inativar ensino.turma_componente
UPDATE ensino.turma SET id_situacao_turma = 4
FROM tc_inativar_sub fo
WHERE ensino.turma.id_turma = fo.id_turma;


-- #1.0.5 - Seleciona as ensino.matricula_componente associadas para inativar
SELECT
    mc.id_matricula_componente,
    mc.id_situacao_matricula AS situacao_antiga
INTO TEMP mc_inativar_sub
FROM
    ensino.matricula_componente mc
JOIN
    tc_inativar_sub t ON mc.id_turma = t.id_turma
WHERE
    mc.id_situacao_matricula NOT IN (7, 5); 
   
-- Geração de script SQL para backup dos UPDATEs de ensino.matricula_componente (inativação)
SELECT
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || mc.situacao_antiga || ' WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' backup
FROM mc_inativar_sub mc
GROUP BY mc.situacao_antiga;

-- #1.0.6 - Inativar ensino.matricula_componente
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7
FROM mc_inativar_sub fo
WHERE ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;


-- Cria a sequência de nomes para as sub-turmas
WITH sub_turmas_a_criar AS (
    SELECT
        taa.id_turma_serie_agrupadora,
        taa.id_curriculo_medio_associado,
        taa.tipo_diario_associado,
        taa.id_turno_turma_agrupadora_novo AS id_turno_novo, 
        taa.id_escola_turma_agrupadora,
        taa.id_serie_associada,
        taa.ano_turma_agrupadora,
        taa.capacidade_aluno_agrupadora,
        taa.data_cadastro_agrupadora,
        taa.descricao_horario_agrupadora,
        taa.numero_estudantes_agrupadora,
        taa.regra_nao_agrupadora,
        taa.nome_turma_agrupadora, 
        ROW_NUMBER() OVER (PARTITION BY taa.id_turma_serie_agrupadora ORDER BY taa.id_curriculo_medio_associado) - 1 AS sequencial_nome
    FROM
        turmas_agrupadora_e_associadas_sub taa
    LEFT JOIN
        basico.turma_serie ts_existente ON ts_existente.id_turma_serie_agrupadora = taa.id_turma_serie_agrupadora
                                       AND ts_existente.id_curriculo_medio = taa.id_curriculo_medio_associado
                                       AND ts_existente.ativo IS TRUE
    WHERE
        ts_existente.id_turma_serie IS NULL 
)
SELECT
    nextval('hibernate_sequence') AS id_turma_serie, 
    stac.ano_turma_agrupadora AS ano,
    stac.id_serie_associada AS id_serie,
    stac.id_turno_novo AS id_turno, 
    stac.id_escola_turma_agrupadora AS id_escola,
    stac.id_curriculo_medio_associado AS id_curriculo_medio,
    stac.id_turma_serie_agrupadora,
    stac.tipo_diario_associado AS tipo_diario,
    stac.nome_turma_agrupadora || '-M' || stac.sequencial_nome AS nome, 
    TRUE AS ativo,
    stac.capacidade_aluno_agrupadora AS capacidade_aluno,
    stac.data_cadastro_agrupadora AS data_cadastro,
    stac.descricao_horario_agrupadora AS descricao_horario,
    stac.numero_estudantes_agrupadora AS numero_estudantes,
    stac.regra_nao_agrupadora AS regra_nao,
    2 AS id_tipo_turma_serie 
INTO TEMP novas_turmas_serie_sub
FROM sub_turmas_a_criar stac;

-- Geração de script SQL para backup dos DELETEs das novas turmas_serie
SELECT
    'UPDATE basico.turma_serie SET ativo = FALSE WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' backup
FROM novas_turmas_serie_sub;

-- #2.1 - Insert das novas basico.turma_serie
INSERT INTO basico.turma_serie (
    id_turma_serie, ano, id_serie, id_turno, id_escola, id_curriculo_medio,
    id_turma_serie_agrupadora, tipo_diario, nome, ativo, capacidade_aluno,
    data_cadastro, descricao_horario, numero_estudantes, regra_nao, id_tipo_turma_serie
)
SELECT
    id_turma_serie, ano, id_serie, id_turno, id_escola, id_curriculo_medio,
    id_turma_serie_agrupadora, tipo_diario, nome, ativo, capacidade_aluno,
    data_cadastro, descricao_horario, numero_estudantes, regra_nao, id_tipo_turma_serie
FROM novas_turmas_serie_sub;

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
WHERE ts.id_turma_serie_agrupadora IS NOT NULL
  AND ts.ativo IS TRUE
  AND ts.ano = (SELECT DISTINCT ano_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub) 
  AND ts.id_escola IN (SELECT DISTINCT id_escola_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub);


----- ============================================
----- CRIAÇÃO/GERENCIAMENTO DE TURMA COMPONENTE PARA SUB-TURMAS
----- ============================================

-- drop table tc_para_adicionar_sub; -- Use com cautela!

-- #5.1 select das turmas para adicionar turma (para as sub-turmas ativas)
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
WHERE
     EXISTS (SELECT 1 
    				FROM ensino.turma t3
    				WHERE t3.id_turma_serie = tss.id_turma_serie_agrupadora
    				AND t3.id_disciplina = 220
                    AND t3.id_situacao_turma <> 4
    				)
    AND NOT EXISTS (
        SELECT 1 FROM ensino.turma t
        WHERE t.id_turma_serie = tss.id_turma_serie
          AND t.id_disciplina = 220
          AND t.id_situacao_turma <> 4 -- Já existe e não está inativa
    );


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


-- #7.0 Atualizar id_turma_agrupadora para turmas componentes das sub-turmas
WITH turma_agrupadora_sub_existente AS (
    SELECT
        t.id_turma_serie,
        t.id_turma AS turma_agrupadora_id
    FROM
        ensino.turma t
    JOIN
        turmas_serie_ativas_sub tss ON t.id_turma_serie = tss.id_turma_serie
    WHERE
        t.id_disciplina = 220 -- A turma Polivalente da própria sub-turma
        AND t.agrupadora IS TRUE
        AND t.id_situacao_turma <> 4
        AND t.ano = (SELECT DISTINCT ano FROM tc_para_adicionar_sub LIMIT 1)
)
UPDATE ensino.turma AS t_main
SET id_turma_agrupadora = tais.turma_agrupadora_id
FROM
    turma_agrupadora_sub_existente tais
WHERE
    t_main.id_turma_serie = tais.id_turma_serie
    AND t_main.id_categoria_componente <> 2
    AND t_main.id_disciplina <> 220 -- Apenas para as turmas componentes, não a Polivalente
    AND t_main.id_turma IN (SELECT id_turma FROM tc_para_adicionar_sub WHERE is_polivalente IS FALSE);
   
   --- ===========================================================================
-- #7.1 - Seleciona as matrículas e seus novos id_turma_serie_multisseriado

   SELECT DISTINCT
    mes.id_matricula_discente_serie,
    tss.id_turma_serie AS novo_id_turma_serie_multisseriado,
    mes.id_turma_serie_multisseriado AS id_turma_serie_multisseriado_antigo -- Para backup
INTO TEMP mes_atualizar_subturma_id
FROM
    basico.matricula_estudante_serie mes
JOIN
    turmas_agrupadora_e_associadas_sub taa ON mes.id_turma_serie = taa.id_turma_serie_agrupadora -- Vincula pela turma agrupadora
JOIN
    turmas_serie_ativas_sub tss ON tss.id_turma_serie_agrupadora = mes.id_turma_serie -- Conecta a sub-turma ativa com a agrupadora da MES
                                AND tss.id_serie = mes.id_serie_multisseriado -- Confere a série da sub-turma com a multisseriada da MES
JOIN
    ts_inativar_sub tis ON mes.id_turma_serie_multisseriado = tis.id_turma_serie -- **APENAS SE A SUB-TURMA DA MES FOI INATIVADA**
WHERE
    mes.id_turma_serie_multisseriado IS DISTINCT FROM tss.id_turma_serie; -- Apenas se for diferente do valor atual

-- Geração de script SQL para backup dos UPDATEs de basico.matricula_estudante_serie
SELECT
    'UPDATE basico.matricula_estudante_serie SET id_turma_serie_multisseriado = ' || COALESCE(mes.id_turma_serie_multisseriado_antigo::TEXT, 'NULL') || ' WHERE id_matricula_discente_serie IN ( ' || string_agg(mes.id_matricula_discente_serie::text,',')  || ');'
FROM mes_atualizar_subturma_id mes
GROUP BY mes.id_turma_serie_multisseriado_antigo;


-- #- Atualizar basico.matricula_estudante_serie
UPDATE basico.matricula_estudante_serie
SET id_turma_serie_multisseriado = fo.novo_id_turma_serie_multisseriado
FROM mes_atualizar_subturma_id fo
WHERE basico.matricula_estudante_serie.id_matricula_discente_serie = fo.id_matricula_discente_serie;
 

--- ## Criação de Novas Matrículas Componentes para Sub-Turmas Ativas
--ROLLBACK 

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
    FROM turmas_alteracao_matriz_curricular_regular ts1
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts1.id_turma_serie 
    JOIN ensino.turma ts ON ts.id_turma_serie = mes.id_turma_serie_multisseriado  
    WHERE 1 = 1
    AND ts.id_situacao_turma <> 4)
    SELECT DISTINCT ON (id_discente, id_turma, id_situacao_matricula) *
    INTO TEMP novas_mc_regular_sub
    FROM criar_MC tm 
    WHERE NOT EXISTS (
    SELECT 1 
    FROM ensino.matricula_componente mc 
    WHERE mc.id_turma = tm.id_turma 
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);
---


INSERT INTO ensino.matricula_componente (
    id_matricula_componente, 
    id_situacao_matricula, 
    id_turma, 
    id_componente_curricular, 
    id_discente, 
    ano, 
    periodo,
    id_matricula_estudante_serie
)
 SELECT DISTINCT ON (id_discente, id_turma, id_situacao_matricula)
    tm.id_matricula_componente, 
    tm.id_situacao_matricula, 
    tm.id_turma, 
    tm.id_componente_curricular, 
    tm.id_discente, 
    tm.ano, 
    tm.periodo, 
    tm.id_matricula_estudante_serie
FROM novas_mc_regular_sub tm
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.matricula_componente mc
    WHERE mc.id_discente = tm.id_discente
      AND mc.id_turma = tm.id_turma
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_situacao_matricula NOT IN (3, 7, 9, 11)
);


-- Tabela de mapeamento de turmas antigas (inativadas) para novas (criadas/mantidas)
-- Isso ajuda a migrar dados de frequência, notas, etc.
SELECT
    t_antiga.id_turma AS id_turma_antiga,
    t_nova.id_turma AS id_turma_nova,
    t_antiga.descricao_horario -- Pode ser útil para restaurar horários
INTO TEMP turmas_ajuste_sub
FROM
    tc_inativar_sub t_antiga -- Turmas componentes antigas (inativadas)
JOIN
    turmas_agrupadora_e_associadas_sub taa ON taa.id_turma_serie_agrupadora = (SELECT id_turma_serie_agrupadora FROM basico.turma_serie WHERE id_turma_serie = t_antiga.id_turma_serie)
JOIN
    ensino.turma t_nova ON t_nova.id_turma_serie = taa.id_turma_serie_agrupadora -- Buscar a turma_serie agrupadora
                        AND t_nova.id_disciplina = t_antiga.id_disciplina -- Mesma disciplina
                        AND t_nova.id_situacao_turma <> 4 -- Turma nova ativa
WHERE t_nova.id_turma_serie IN (SELECT id_turma_serie FROM turmas_serie_ativas_sub);


-- #14.0 - ATUALIZAR MC (Matricula Componente) para Notas (ensino.nota_unidade)

SELECT DISTINCT
    mc_antiga.id_matricula_componente AS id_matricula_antigo,
    mc_nova.id_matricula_componente AS id_matricula_novo,
    nu.id_nota_unidade
INTO TEMP notas_atualizar_sub
FROM
    tc_inativar_sub t_antiga -- Turmas componentes que foram inativadas
JOIN
    ensino.matricula_componente mc_antiga ON mc_antiga.id_turma = t_antiga.id_turma
JOIN
    ensino.nota_unidade nu ON nu.id_matricula_componente = mc_antiga.id_matricula_componente
JOIN
    tc_para_adicionar_sub t_nova_criada ON t_nova_criada.id_turma_serie = (SELECT id_turma_serie FROM ensino.turma WHERE id_turma = mc_antiga.id_turma)
                                     AND t_nova_criada.id_disciplina = mc_antiga.id_componente_curricular
JOIN
    ensino.matricula_componente mc_nova ON mc_nova.id_turma = t_nova_criada.id_turma
                                      AND mc_nova.id_discente = mc_antiga.id_discente
                                      AND mc_nova.id_componente_curricular = mc_antiga.id_componente_curricular
                                      AND mc_nova.ano = mc_antiga.ano
WHERE mc_nova.id_situacao_matricula <> 7; -- Garante que a nova MC não esteja inativada


-- Backup
SELECT 'UPDATE ensino.nota_unidade SET id_matricula_componente = ' || id_matricula_antigo || ' WHERE id_nota_unidade = '|| id_nota_unidade || ';'
FROM notas_atualizar_sub;

UPDATE ensino.nota_unidade nu_main
SET id_matricula_componente = na.id_matricula_novo
FROM notas_atualizar_sub na
WHERE nu_main.id_nota_unidade = na.id_nota_unidade
  AND na.id_matricula_novo IS NOT NULL;

---

SELECT * FROM diario.competencia_habilidades_aluno cha  


DROP TABLE IF EXISTS tmp_atualizar_turma_habilidade;

SELECT DISTINCT
    cha.id AS id_habilidade,
    t_antiga.id_turma AS id_turma_antiga,
    t_nova.id_turma AS id_turma_nova
    INTO TEMP  tmp_atualizar_turma_habilidade
FROM tc_inativar_sub t_inativa
JOIN diario.competencia_habilidades_aluno cha ON cha.id_turma = t_inativa.id_turma
JOIN ensino.turma t_antiga ON t_antiga.id_turma = cha.id_turma
JOIN ensino.turma t_nova
    ON t_nova.id_turma_serie = t_antiga.id_turma_serie
   AND t_nova.id_disciplina = t_antiga.id_disciplina
   AND t_nova.id_turma <> t_antiga.id_turma;

SELECT 
    'UPDATE diario.competencia_habilidades_aluno 
     SET id_turma = ' || id_turma_antiga ||
    ' WHERE id = ' || id_habilidade || ';'
FROM tmp_atualizar_turma_habilidade;

UPDATE diario.competencia_habilidades_aluno cha
SET id_turma = tmp.id_turma_nova
FROM tmp_atualizar_turma_habilidade tmp
WHERE cha.id = tmp.id_habilidade
  AND tmp.id_turma_nova IS NOT NULL;

COMMIT;

