-- Solução

begin;


ROLLBACK;

UPDATE basico.curriculo_basico_componente SET id_categoria_componente = 1 WHERE id_curriculo_basico_componente IN (35500368, 35500372, 35500371, 35500369, 35500370, 35500366, 35500373, 35500367, 35501109, 35501107, 35501108, 35501105, 35501106, 35501111, 35501110, 35501104, 35499478, 35499479, 35499474, 35499477, 35499473, 35499476, 35499475, 35499480, 35498942, 35498938, 35498944, 35498945, 35498941, 35498943, 35498939, 35498940, 35497192, 35497190, 35497194, 35497189, 35497195, 35497188, 35497196, 35497191);

-- Novos Curriculos

 WITH novos_curriculos AS(
   SELECT id_curriculo_basico,
   id_serie,
   id_turno,
   tipo_diario
   FROM 
  basico.curriculo_basico cb 
  WHERE cb.id_curriculo_basico IN (35499472,52196506,35500365,35498937,51873398,35497185,51870328,52196516,51870312,52196542,52196530,51870329,51870309,35501103)
  AND cb.ativo
  )
select DISTINCT 
	ts.id_turma_serie,
	ts.id_serie,
	ts.id_curriculo_medio id_curriculo_antigo,
	ncb.tipo_diario,
	ts.id_turno,
	ts.id_escola,
	case
		when ts.id_turma_serie in (52619086, 52617224, 52617219, 52616988) then 4
		else 2
	end as id_turno_novo,
	case 
	 when ts.id_serie = ncb.id_serie then ncb.id_curriculo_basico 
	 ELSE  ts.id_curriculo_medio
	end as id_curriculo_correto
	INTO TEMP turmas_alteracao_matriz_curricular
 FROM basico.turma_serie ts 
 JOIN novos_curriculos ncb ON ncb.id_serie = ts.id_serie
 WHERE ts.id_turma_serie IN (52616635, 52616988, 52616991, 52617004, 52617008, 52617123, 52617127, 52617224, 52617535, 52618122, 52618703, 52618704, 52617219, 52619086)
 AND ts.id_turma_serie_agrupadora IS null
 and ts.ano = 2025
 AND ts.ativo;
 
 SELECT DISTINCT 
	 t.id_situacao_turma,
	 t.id_disciplina ,
	 t.id_turma ,
	 t.id_turma_serie ,
	 CASE 
	 	WHEN t.descricao_horario IS NOT NULL THEN t.descricao_horario
	 END descricao_horario 
	INTO TEMP tc_apagar
	FROM 
	turmas_alteracao_matriz_curricular turmas
	join ensino.turma t on t.id_turma_serie = turmas.id_turma_serie 
where t.id_situacao_turma <> 4
AND t.id_disciplina <> 220
AND NOT EXISTS (
		SELECT 1 
		FROM basico.curriculo_basico_componente cbc
		WHERE cbc.id_curriculo_basico = turmas.id_curriculo_correto
		  AND cbc.id_componente_curricular = t.id_disciplina -- A VERIFICAÇÃO CHAVE
	)
order by t.id_turma_serie;

 
-- #2 ATUALIZAR SITUAÇÃO DAS TURMA_COMPONENTE PARA EXCLUÍDA 4
update ensino.turma set id_situacao_turma = 4 from (
	select distinct id_turma from tc_apagar 
) as fo
where ensino.turma.id_turma = fo.id_turma;

SELECT DISTINCT 
	  mc.id_matricula_componente, mc.id_discente, mc.id_turma, mc.id_componente_curricular, id_situacao_matricula
INTO TEMP mc_apagar 
 from tc_apagar t
	join ensino.matricula_componente mc on mc.id_turma = t.id_turma
	WHERE mc.id_situacao_matricula <> 7
  order by mc.id_discente;

-- #1 ATUALIZAR SITUAÇÃO DAS MATR CULAS COMPONENTES PARA EXCLUÍDA 
update ensino.matricula_componente set id_situacao_matricula = 7 from (
	select 
		mc.id_matricula_componente
	from 
	mc_apagar mc
) as fo
where ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;

-- #3.0 - backup que retorna a matriz na turma_serie
SELECT distinct 
	'UPDATE basico.turma_serie set id_curriculo_medio = ' || ts.id_curriculo_medio  || ',tipo_diario = ' || ts.tipo_diario || ', id_turno = ' || ts.id_turno || ' WHERE id_turma_serie = ' || ts.id_turma_serie  || ';'
from 
turmas_alteracao_matriz_curricular turmas 
join basico.turma_serie ts on ts.id_turma_serie = turmas.id_turma_serie;

-- #3.1 atualizar o curriculo turma serie
UPDATE basico.turma_serie SET tipo_diario = fo.tipo_diario, id_curriculo_medio = fo.id_curriculo_correto, id_turno = fo.id_turno_novo FROM(
	select * from turmas_alteracao_matriz_curricular
) fo
WHERE basico.turma_serie.id_turma_serie = fo.id_turma_serie;

-- #4.0: Backup de MATRICULA_ESTUDANTE_SERIE
SELECT distinct 
	'UPDATE basico.matricula_estudante_serie set id_curriculo_medio = ' ||  mes.id_curriculo_medio || ', id_turno = ' || mes.id_turno || 
	' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie  || ';'
from 
	turmas_alteracao_matriz_curricular turmas 
	join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
		and mes.ano_calendario = 2025;

update matricula.vaga_serie set id_turno = 2 where id_vaga_serie in (52605473,52605471,52605405,52605409,52605407,52605959,52605524,52605507,52617409,52617407,52605595,52605567,52605569);

INSERT INTO matricula.vaga_serie
(id_vaga_serie, id_serie, numero_vagas, ano_letivo, id_escola, data_cadastro, id_turno, vagas_validadas, vagas_ocupadas, data_validacao, id_registro_validacao, vagas_solicitadas, vagas_efetivadas, vagas_ocupadas_1opc, vagas_ocupadas_2opc, vagas_ocupadas_mtl, vagas_ocupadas_antes_processamento, vagas_ocupadas_antes_listagem_2, ocupadas_interesse_op1, vagas_ocupadas_1opc_l1, vagas_ocupadas_2opc_l1, id_calendario_matricula, periodo, numero_turmas, aceita_novas_matriculas_nee, removida, exibir_remanescentes_bloqueadas, vagas_remanescentes_bloqueadas, desricao_remanescente_bloqueada, vagas_reservadas_militares, vagas_ocupadas_mtl_op2, vagas_ocupadas_mtl_2opc, id_registro_entrada)
VALUES(nextval('hibernate_sequence'), 51869737, 10, 2025, 2535, NULL, 2, 10, 0, '2025-01-07 11:30:58.000', 5818090, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, true, false, true, false, NULL, NULL, NULL, NULL, 5818000);

-- desabilitar trigger
ALTER TABLE basico.matricula_estudante_serie
DISABLE TRIGGER trigger_verifica_vagas_matricula_estudante_serie;

-- atualizar as MES ´s
UPDATE basico.matricula_estudante_serie set id_curriculo_medio = fo.id_curriculo_correto, id_turno = fo.id_turno_novo FROM(
    select distinct 
        mes.id_matricula_discente_serie, turmas.id_curriculo_correto, turmas.id_turno_novo
    from 
        turmas_alteracao_matriz_curricular turmas 
        join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
            and mes.ano_calendario = 2025
) fo
WHERE basico.matricula_estudante_serie.id_matricula_discente_serie = fo.id_matricula_discente_serie ;

-- habilitar trigger
ALTER TABLE basico.matricula_estudante_serie
ENABLE TRIGGER trigger_verifica_vagas_matricula_estudante_serie;

----- ============================================
----- CRIAÇÃO DE TURMA COMPONENTE
----- ============================================

-- #5.1 select das turmas para adicionar turma -
SELECT DISTINCT
	nextval('ensino.turma_seq') id_turma, 
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
into temp tc_para_adicionar
FROM
turmas_alteracao_matriz_curricular turmas 
join basico.turma_serie tsa on tsa.id_turma_serie = turmas.id_turma_serie -- tsa: Turma Serie Adicionar
join basico.curriculo_basico_componente cbc on cbc.id_curriculo_basico = tsa.id_curriculo_medio
where not exists (select 1 from ensino.turma t where t.id_disciplina = cbc.id_componente_curricular
and t.id_situacao_turma in (1,3)
and t.id_turma_serie = tsa.id_turma_serie
and cbc.id_curriculo_basico = turmas.id_curriculo_correto);

-- #5.1.0 backup para deletar as turmas componentes criadas
SELECT
	'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';'
FROM tc_para_adicionar;

-- #5.2 insert das turmas 
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
FROM tc_para_adicionar ca
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
        turmas_alteracao_matriz_curricular tamc ON t.id_turma_serie = tamc.id_turma_serie
    WHERE
        t.id_disciplina = 220
        AND t.agrupadora
        AND t.id_situacao_turma <> 4 
        AND t.ano = 2025 
)
UPDATE ensino.turma AS t_main
SET id_turma_agrupadora = tai.turma_agrupadora_id
FROM
    turma_agrupadora_existente tai
WHERE
    t_main.id_turma_serie = tai.id_turma_serie
    AND t_main.id_disciplina <> 220 
    AND t_main.id_categoria_componente <> 2
    AND t_main.id_turma IN (SELECT id_turma FROM tc_para_adicionar); 

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
    FROM tc_para_adicionar ts
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
    WHERE 1 = 1
    AND ts.id_situacao_turma <> 4)
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

-- backup matricula_componente

SELECT 
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = ' || mc.id_matricula_componente  || ';' 
  FROM novas_mc mc;

-- horarios

WITH ranked_horarios AS (
    SELECT
        ht.id_horario_turma,
        ht.dia,
        ht.id_horario AS id_horario_antigo,
        t.id_turma_serie,
        ht.id_turma,
        ht.ativo,
        CASE
            WHEN t.id_turma_serie IN (52616988, 52617224, 52619086) AND ht.id_horario = 52329676 THEN 127249
            WHEN t.id_turma_serie IN (52616988, 52617224, 52619086) AND ht.id_horario = 52329677 THEN 127250
            WHEN t.id_turma_serie IN (52616988, 52617224, 52619086) AND ht.id_horario = 52329679 THEN 127251
            WHEN t.id_turma_serie IN (52616988, 52617224, 52619086) AND ht.id_horario = 52329680 THEN 127252
            WHEN t.id_turma_serie IN (52616988, 52617224, 52619086) AND ht.id_horario = 52329681 THEN 127253
            WHEN t.id_turma_serie IN (52616988, 52617224, 52619086) AND ht.id_horario = 52298232 THEN 127249
            WHEN t.id_turma_serie IN (52616988, 52617224, 52619086) AND ht.id_horario = 52298641 THEN 127250
            WHEN t.id_turma_serie IN (52616988, 52617224, 52619086) AND ht.id_horario = 52298646 THEN 127251
            WHEN t.id_turma_serie IN (52616988, 52617224, 52619086) AND ht.id_horario = 52298647 THEN 127252
            WHEN t.id_turma_serie IN (52616988, 52617224, 52619086) AND ht.id_horario = 52329674 THEN 127253
            WHEN ht.id_horario = 52329676 THEN 127243
            WHEN ht.id_horario = 52329677 THEN 127244
            WHEN ht.id_horario = 52329679 THEN 127245
            WHEN ht.id_horario = 52329680 THEN 127246
            WHEN ht.id_horario = 52329681 THEN 127248
            WHEN ht.id_horario = 52329682 THEN 15529546
            WHEN ht.id_horario = 52298232 THEN 127249
            WHEN ht.id_horario = 52298641 THEN 127250
            WHEN ht.id_horario = 52298646 THEN 127251
            WHEN ht.id_horario = 52298647 THEN 127252
            WHEN ht.id_horario = 52329674 THEN 127253
            WHEN ht.id_horario = 52329675 THEN 127254
            ELSE ht.id_horario
        END AS id_horario_novo,
        ROW_NUMBER() OVER (
            PARTITION BY ht.id_turma, ht.dia, ht.id_horario, ht.ativo
            ORDER BY ht.id_horario_turma 
        ) as rn_origem 
    FROM ensino.turma t
    JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    WHERE t.id_turma_serie IN (52616635, 52616988, 52616991, 52617004, 52617008, 52617123, 52617127, 52617224, 52617535, 52618122, 52618703, 52618704, 52617219, 52619086)
),
deduplicated_novos_horarios AS (
    SELECT
        id_horario_turma,
        dia,
        id_horario_antigo,
        id_turma_serie,
        id_turma,
        ativo,
        id_horario_novo,
        ROW_NUMBER() OVER (
            PARTITION BY id_turma, dia, id_horario_novo, ativo
            ORDER BY id_horario_turma 
        ) as rn_destino 
    FROM ranked_horarios
    WHERE rn_origem = 1 
),
turma_novos_horarios AS (
    SELECT
        id_horario_turma,
        dia,
        id_horario_antigo,
        id_turma_serie,
        id_turma,
        ativo,
        id_horario_novo
    FROM deduplicated_novos_horarios
    WHERE rn_destino = 1
)
SELECT *
INTO TEMP novo_horario_int
FROM turma_novos_horarios tnh
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.horario_turma ht2
    WHERE ht2.id_turma = tnh.id_turma
      AND ht2.id_horario = tnh.id_horario_novo
      AND ht2.dia = tnh.dia
      AND ht2.ativo
);

UPDATE ensino.horario_turma ht
SET id_horario = nhi.id_horario_novo
FROM novo_horario_int nhi
WHERE ht.id_horario_turma = nhi.id_horario_turma;

-- Backup	
SELECT 
'UPDATE ensino.horario_turma SET id_horario = ' || nhi.id_horario_antigo || ' WHERE id_horario_turma =' || nhi.id_horario_turma || ';' 
FROM novo_horario_int nhi;

-- #5.1.0 backup para deletar as turmas componentes criadas
SELECT 
	'UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = ' ||id_turma  || ';' 
FROM tc_para_adicionar;

-- backup matricula_componente_antigas

SELECT 
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || mc.id_situacao_matricula || ' WHERE id_matricula_componente = ' || mc.id_matricula_componente  || '; -- id_discente' || mc.id_discente 
from  mc_apagar mc;

--- #0.0 - Identifica os Currículos Associados das Turmas Agrupadoras
  
WITH turmas_e_curriculos_associados AS (
    SELECT
        tamc.id_turma_serie AS id_turma_serie_agrupadora,
        tamc.id_curriculo_correto AS id_curriculo_agrupador,
        cb.id_curriculo_basico AS id_curriculo_medio_associado,
        cb.tipo_diario AS tipo_diario_associado,
        tamc.id_turno AS id_turno_turma_agrupadora,
        tamc.id_turno_novo AS id_turno_turma_agrupadora_novo, 
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
    JOIN turmas_alteracao_matriz_curricular tamc ON tamc.id_turma_serie = ts.id_turma_serie 
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
    'UPDATE basico.turma_serie SET ativo = ' || ts.ativo_antigo || ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';'
FROM ts_inativar_sub ts;

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
    'UPDATE ensino.turma SET id_situacao_turma = ' || t.situacao_antiga || ' ,descricao_horario = ' || COALESCE(t.descricao_horario, 'NULL') || ' WHERE id_turma = ' || t.id_turma || ';'
FROM tc_inativar_sub t;

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
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || mc.situacao_antiga || ' WHERE id_matricula_componente = ' || mc.id_matricula_componente || ';'
FROM mc_inativar_sub mc;

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
    'DELETE FROM basico.turma_serie WHERE id_turma_serie = ' || id_turma_serie || ';'
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
  AND ts.ano = (SELECT DISTINCT ano_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub LIMIT 1) 
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
    NOT EXISTS (
        SELECT 1 FROM ensino.turma t
        WHERE t.id_turma_serie = tss.id_turma_serie
          AND t.id_disciplina = 220
          AND t.id_situacao_turma <> 4 -- Já existe e não está inativa
    );


-- #5.1.0 backup para deletar as turmas componentes criadas (sub-turmas)
SELECT
    'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';'
FROM tc_para_adicionar_sub;


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
    'UPDATE basico.matricula_estudante_serie SET id_turma_serie_multisseriado = ' || COALESCE(mes.id_turma_serie_multisseriado_antigo::text, 'NULL') || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';'
FROM mes_atualizar_subturma_id mes;

-- #- Atualizar basico.matricula_estudante_serie
UPDATE basico.matricula_estudante_serie
SET id_turma_serie_multisseriado = fo.novo_id_turma_serie_multisseriado
FROM mes_atualizar_subturma_id fo
WHERE basico.matricula_estudante_serie.id_matricula_discente_serie = fo.id_matricula_discente_serie;

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
                                         
-- Geração de script SQL para backup dos DELETEs das novas matrículas componentes (sub-turmas)
SELECT 'DELETE from ensino.matricula_componente where id_matricula_componente = ' || id_matricula_componente || ';'
FROM novas_mc_sub;

WITH vagas_calculadas AS (
    SELECT
        vs.id_vaga_serie,
        (
            SELECT
                COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa )),
                    0
                )
            FROM
                matricula.renovacao_matricula r
            JOIN public.discente d ON
                d.id_discente = r.id_discente
            WHERE
                r.id_vaga_serie = vs.id_vaga_serie
                AND r.data_cancelamento IS NULL
                AND r.id_nova_serie IS NULL
        ) + (
            SELECT
                COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa )),
                    0
                )
            FROM
                matricula.solicitacao_transferencia st
            INNER JOIN matricula.solicitacao_transferencia_opcao_escola topcao ON
                topcao.id_solicitacao = st.id_solicitacao_transferencia
            JOIN basico.matricula_estudante_serie mes ON
                mes.id_matricula_discente_serie = st.id_matricula_discente_serie
            JOIN public.discente d ON
                d.id_discente = mes.id_estudante
            WHERE
                st.id_status IN (
                    2, 4, 8
                )
                    AND topcao.ordem = 1
                    AND st.id_calendario_matricula = vs.id_calendario_matricula
                    AND topcao.id_escola = vs.id_escola
                    AND topcao.id_serie = vs.id_serie
                    AND topcao.id_turno = vs.id_turno
                    AND st.id_matricula_discente_serie_gerado IS NULL
        ) + (
            SELECT
                COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM matricula.estudante_inscrito_necessidade_especial eine JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = eine.id_tipo_necessidade WHERE eine.id_estudante_inscrito = ei.id_estudante_inscrito )),
                    0
                )
            FROM
                matricula.estudante_inscrito ei
            INNER JOIN matricula.estudante_inscrito_opcao_escola iopcao ON
                iopcao.id_estudante_inscrito = ei.id_estudante_inscrito
            INNER JOIN matricula.estudante_inscrito_processamento eip ON
                eip.id_estudante_inscrito = ei.id_estudante_inscrito
                AND eip.id_opcao_escola = iopcao.id_estudante_inscrito_opcao_escola
            WHERE
                iopcao.id_vaga_serie = vs.id_vaga_serie
                AND iopcao.ordem = 1
                AND (
                    ei.id_estudante = 0
                        OR ei.id_estudante IS NULL
                )
                AND ei.id_status IN (
                    1, 4, 6, 7
                )
                    AND eip.id_status IN (
                        1, 4, 6, 7
                    )
        ) + (
            SELECT
                COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa)),
                    0
                )
            FROM
                basico.matricula_estudante_serie mes
            INNER JOIN escola.escola_etapa_ensino_serie eees ON
                eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
            JOIN public.discente d ON
                d.id_discente = mes.id_estudante
            WHERE
                mes.id_situacao_matricula_serie NOT IN (
                    4, 5, 6, 9, 10, 11, 12
                )
                    AND mes.id_turno = vs.id_turno
                    AND eees.id_escola = vs.id_escola
                    AND eees.id_serie = vs.id_serie
                    AND mes.ano_calendario = 2025 -- Observação: A variável cm.ano precisa ser definida
                    AND mes.periodo = vs.periodo
        ) AS vagas_atualizadas,
        vs.vagas_ocupadas,
        vs.vagas_validadas,
        vs.vagas_efetivadas 
    FROM
        matricula.vaga_serie AS vs
    WHERE
        vs.removida = FALSE 
        AND vs.id_registro_validacao IS NOT NULL 
        AND vs.ano_letivo = 2025
        AND vs.vagas_validadas > 0
)
SELECT *
INTO TEMP vaga_atualizacao
FROM vagas_calculadas
WHERE vagas_atualizadas <> vagas_ocupadas;

SELECT 
'UPDATE matricula.vaga_serie SET vagas_ocupadas = ' || vagas_atualizadas || ' WHERE id_vaga_serie = ' || id_vaga_serie || ';' solucao,
'UPDATE matricula.vaga_serie SET vagas_ocupadas = ' || vagas_ocupadas || ' WHERE id_vaga_serie = ' || id_vaga_serie || ';' backup 
FROM vaga_atualizacao
WHERE vagas_atualizadas <>  vagas_ocupadas;



UPDATE matricula.vaga_serie SET vagas_ocupadas = 26 WHERE id_vaga_serie = 52617919;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 34 WHERE id_vaga_serie = 52605319;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 20 WHERE id_vaga_serie = 52776269;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 42 WHERE id_vaga_serie = 52605355;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52606706;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 18 WHERE id_vaga_serie = 52649973;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 119 WHERE id_vaga_serie = 52605494;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 48 WHERE id_vaga_serie = 52605331;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 72 WHERE id_vaga_serie = 52605496;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 20 WHERE id_vaga_serie = 52760740;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 26 WHERE id_vaga_serie = 52605363;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52605585;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 55 WHERE id_vaga_serie = 52605329;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52605393;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 21 WHERE id_vaga_serie = 52608608;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 27 WHERE id_vaga_serie = 52617767;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 56 WHERE id_vaga_serie = 52605323;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 113 WHERE id_vaga_serie = 52605558;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 46 WHERE id_vaga_serie = 52605503;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 27 WHERE id_vaga_serie = 52605501;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 127 WHERE id_vaga_serie = 52605477;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 47 WHERE id_vaga_serie = 52605544;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 18 WHERE id_vaga_serie = 52649975;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52605457;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52605465;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52652419;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 7 WHERE id_vaga_serie = 52760738;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52605431;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 35 WHERE id_vaga_serie = 52605517;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 14 WHERE id_vaga_serie = 52760739;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 42 WHERE id_vaga_serie = 52605490;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 51 WHERE id_vaga_serie = 52605325;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 103 WHERE id_vaga_serie = 52605560;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52605595;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 96 WHERE id_vaga_serie = 52605479;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 58 WHERE id_vaga_serie = 52605411;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52605959;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 24 WHERE id_vaga_serie = 52605357;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 59 WHERE id_vaga_serie = 52605321;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52605463;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 38 WHERE id_vaga_serie = 52605375;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 31 WHERE id_vaga_serie = 52605377;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52637657;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 107 WHERE id_vaga_serie = 52605433;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52605507;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 50 WHERE id_vaga_serie = 52605413;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 48 WHERE id_vaga_serie = 52605333;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 48 WHERE id_vaga_serie = 52605546;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52605399;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 0 WHERE id_vaga_serie = 52605556;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 30 WHERE id_vaga_serie = 52605552;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 29 WHERE id_vaga_serie = 52605371;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 15 WHERE id_vaga_serie = 52605515;

commit;


ROLLBACK;
-----------------------------