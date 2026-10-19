BEGIN ;
--ROLLBACK 
UPDATE basico.curriculo_basico SET id_serie=1005218 WHERE id_curriculo_basico=56008032;

 WITH novos_curriculos AS(
   SELECT id_curriculo_basico,
   id_serie,
   id_turno,
   tipo_diario
   FROM 
  basico.curriculo_basico cb 
  WHERE 1=1
  AND cb.id_curriculo_basico IN (56099852,56114784,57299047,56142236)
  AND cb.ativo
  )
select DISTINCT 
    ts.ano ,
    ts.nome ,
    ts.id_turma_serie,
    ts.id_serie,
    ts.id_curriculo_medio id_curriculo_antigo,
    ncb.tipo_diario,
    ts.id_turno,
    ts.id_escola,
    ncb.id_turno id_turno_novo,
    case 
     when ts.id_serie = ncb.id_serie then ncb.id_curriculo_basico 
     ELSE  ts.id_curriculo_medio
    end as id_curriculo_correto,
    vs.id_vaga_serie 
    INTO TEMP turmas_alteracao_matriz_curricular
 FROM basico.turma_serie ts 
 JOIN novos_curriculos ncb ON ncb.id_serie = ts.id_serie
 JOIN matricula.vaga_serie vs ON vs.id_escola = ts.id_escola 
 AND vs.ano_letivo = ts.ano 
 AND vs.id_serie = ts.id_serie 
 AND vs.id_turno = ncb.id_turno
 AND vs.removida = FALSE 
 WHERE 1=1
 AND ts.id_curriculo_medio <> ncb.id_curriculo_basico
 AND ts.ano = 2026
 AND ts.id_turma_serie_agrupadora IS NULL 
 AND ts.id_escola IN (973)
 AND ts.ativo;
 SELECT * FROM matricula.vaga_serie vs 
 JOIN turmas_alteracao_matriz_curricular turmas
   -- backup  bagas antigas
SELECT
'UPDATE matricula.vaga_serie SET vagas_ocupadas = ' || coalesce(vagas_ocupadas,0) || ', vagas_efetivadas = ' || COALESCE(vs.vagas_efetivadas,0) || ' WHERE id_vaga_serie = ' || vs.id_vaga_serie || ';' backup 
FROM matricula.vaga_serie vs 
JOIN (
    SELECT vs.id_vaga_serie, vs.vagas_ocupadas  AS qtd
    FROM  turmas_alteracao_matriz_curricular ts
     JOIN matricula.vaga_serie vs ON vs.id_escola = ts.id_escola 
    AND vs.ano_letivo = ts.ano 
   AND vs.id_serie = ts.id_serie 
   AND vs.id_turno = ts.id_turno
    GROUP by vs.id_vaga_serie
    ) AS vagas ON vagas.id_vaga_serie = vs.id_vaga_serie
    -- update vagas (antigas )ocupação/efetivadas
UPDATE matricula.vaga_serie vs 
SET vagas_ocupadas = COALESCE(vs.vagas_ocupadas, 0) - vagas.qtd, 
    vagas_efetivadas = COALESCE(vs.vagas_efetivadas, 0) - vagas.qtd
FROM (
    SELECT vs.id_vaga_serie, vs.vagas_ocupadas  AS qtd
    FROM  turmas_alteracao_matriz_curricular ts
     JOIN matricula.vaga_serie vs ON vs.id_escola = ts.id_escola 
    AND vs.ano_letivo = ts.ano 
   AND vs.id_serie = ts.id_serie 
   AND vs.id_turno = ts.id_turno
    GROUP by vs.id_vaga_serie
    ) AS vagas
WHERE vs.id_vaga_serie = vagas.id_vaga_serie;
 -- turma componente apagar
SELECT DISTINCT 
     t.id_situacao_turma,
     t.id_disciplina ,
     t.id_turma ,
     t.id_turma_serie 
    INTO TEMP tc_apagar_regular
    FROM 
    turmas_alteracao_matriz_curricular turmas
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
-- tabela temporaria 
SELECT DISTINCT 
      mc.id_matricula_componente, mc.id_discente, mc.id_turma, mc.id_componente_curricular, id_situacao_matricula
INTO TEMP mc_apagar_regular
 from tc_apagar_regular t
    join ensino.matricula_componente mc on mc.id_turma = t.id_turma
    WHERE mc.id_situacao_matricula <> 7
  order by mc.id_discente;
--# backup ensino turma
SELECT
    'UPDATE ensino.turma SET id_situacao_turma = ' || id_situacao_turma || ' WHERE id_turma IN ( ' || string_agg(id_turma::text,',') || ');' backup 
FROM tc_apagar_regular
GROUP BY id_situacao_turma;
-- backup matricula componente apargar 
SELECT 
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || mc.id_situacao_matricula || ' WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::text,',')  || ');' 
  FROM mc_apagar_regular mc
GROUP BY mc.id_situacao_matricula;
-- # ATUALIZAR SITUAÇÃO DAS MATRICULAS COMPONENTES PARA EXCLUÍDA 
update ensino.matricula_componente set id_situacao_matricula = 7 from (
    select 
        mc.id_matricula_componente
    from 
    mc_apagar_regular mc
) as fo
where ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;
-- # ATUALIZAR SITUAÇÃO DAS TURMA_COMPONENTE PARA EXCLUÍDA 4
update ensino.turma set id_situacao_turma = 4 from (
    select distinct id_turma from tc_apagar_regular 
) as fo
where ensino.turma.id_turma = fo.id_turma;
-- #3.0 - backup que retorna a matriz na turma_serie
SELECT distinct 
    'UPDATE basico.turma_serie set id_curriculo_medio = ' || ts.id_curriculo_medio  || ',tipo_diario = ' || ts.tipo_diario || ', id_ turno = '|| ts.id_turno || ' WHERE id_turma_serie IN ( ' || string_agg(ts.id_turma_serie::text,',')  || ');'
from 
turmas_alteracao_matriz_curricular turmas 
join basico.turma_serie ts on ts.id_turma_serie = turmas.id_turma_serie
GROUP BY ts.id_curriculo_medio , ts.tipo_diario, ts.id_turno;
-- #4.0: Backup de MATRICULA_ESTUDANTE_SERIE
SELECT distinct 
    'UPDATE basico.matricula_estudante_serie set id_curriculo_medio = ' ||  mes.id_curriculo_medio  || ', id_turno = ' || mes.id_turno ||', id_vaga_serie = ' || mes.id_vaga_serie || 
    ' WHERE id_matricula_discente_serie IN ( ' || string_agg(mes.id_matricula_discente_serie::text,',')  || ');'
from 
    turmas_alteracao_matriz_curricular turmas 
    join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
        and mes.ano_calendario = 2026
GROUP BY mes.id_curriculo_medio, mes.id_turno, mes.id_vaga_serie ;
-- # atualizar o curriculo turma serie
UPDATE basico.turma_serie SET tipo_diario = fo.tipo_diario, id_curriculo_medio = fo.id_curriculo_correto, id_turno = fo.id_turno_novo FROM(
    select * FROM turmas_alteracao_matriz_curricular
) fo
WHERE basico.turma_serie.id_turma_serie = fo.id_turma_serie;
-- # atualizar as MES´s
UPDATE basico.matricula_estudante_serie set id_curriculo_medio = fo.id_curriculo_correto, id_turno = fo.id_turno_novo, id_vaga_serie = fo.id_vaga_serie FROM (
    select distinct 
        mes.id_matricula_discente_serie, turmas.id_curriculo_correto, turmas.id_turno_novo, turmas.id_vaga_serie
    from 
       turmas_alteracao_matriz_curricular turmas 
        join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
            and mes.ano_calendario = 2026
) fo
WHERE basico.matricula_estudante_serie.id_matricula_discente_serie = fo.id_matricula_discente_serie ;
-- backup  vagas 
SELECT
'UPDATE matricula.vaga_serie SET vagas_ocupadas = ' || coalesce(vagas_ocupadas,0) || ',vagas_efetivadas = ' || COALESCE(vs.vagas_efetivadas,0) || ' WHERE id_vaga_serie = ' || vs.id_vaga_serie || ';' backup 
FROM matricula.vaga_serie vs 
JOIN (
    SELECT vm.id_vaga_serie, count(mes.id_estudante) AS qtd
    FROM  turmas_alteracao_matriz_curricular vm
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = vm.id_turma_serie
    GROUP by vm.id_vaga_serie
    ) AS vagas ON vagas.id_vaga_serie = vs.id_vaga_serie
    -- update vagas ocupação/efetivadas
UPDATE matricula.vaga_serie vs 
SET vagas_ocupadas = COALESCE(vs.vagas_ocupadas, 0) + vagas.qtd, 
    vagas_efetivadas = COALESCE(vs.vagas_efetivadas, 0) + vagas.qtd,
    vagas_validadas = GREATEST(COALESCE(vs.vagas_validadas, 0), COALESCE(vs.vagas_ocupadas, 0) + vagas.qtd)
FROM (
    SELECT vm.id_vaga_serie, count(mes.id_estudante) AS qtd
    FROM  turmas_alteracao_matriz_curricular vm
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = vm.id_turma_serie
    GROUP by vm.id_vaga_serie
    ) AS vagas
WHERE vs.id_vaga_serie = vagas.id_vaga_serie;
-- ================================================
-- TEMP: turmas do integral que precisam de ajuste dos horarios
-- ================================================
SELECT DISTINCT ON (ht.id_horario_turma,id_horario_novo)
    ht.id_horario_turma,
    ht.id_horario       AS id_horario_antigo,
    ht.hora_inicio,
    ht.hora_fim,
    ht.dia,
    h.inicio,
    h.fim,
    h.id_horario  AS id_horario_novo
INTO TEMP novo_horario_int
FROM ensino.turma t
JOIN  turmas_alteracao_matriz_curricular  ts ON ts.id_turma_serie = t.id_turma_serie
JOIN basico.serie s ON s.id_serie = ts.id_serie
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma
JOIN ensino.horario h ON
    h.inicio BETWEEN (ht.hora_inicio - INTERVAL '5 minutes')
                 AND (ht.hora_inicio + INTERVAL '5 minutes')
    AND
    h.fim    BETWEEN (ht.hora_fim - INTERVAL '5 minutes')
                 AND (ht.hora_fim + INTERVAL '5 minutes')
    AND h.tipo = 1
    AND h.ativo = true                -- só horários ativos
    AND h.id_etapa_ensino IS NULL     -- sem etapa específica
WHERE t.id_situacao_turma = 1
  AND ht.ativo
--AND ts.id_turma_serie IN (56869589,56869608,56869570,56894538);
-- ================================================
-- BACKUP (id_horario_antigo para reverter) ← corrigido
-- ================================================
SELECT
    'UPDATE ensino.horario_turma SET id_horario = ' || id_horario_antigo ||
    ' WHERE id_horario_turma IN (' || string_agg(id_horario_turma::text,',' ) || ');' AS backup_script
FROM novo_horario_int
WHERE id_horario_antigo <> id_horario_novo
GROUP BY id_horario_antigo;
-- ================================================
-- ATUALIZA
-- ================================================
UPDATE ensino.horario_turma ht
SET id_horario = nhi.id_horario_novo
FROM novo_horario_int nhi
WHERE ht.id_horario_turma = nhi.id_horario_turma
  AND ht.id_horario <> nhi.id_horario_novo;   -- só atualiza se mudou
 -- nomenclatura 
 -- ajusta o nome da turma serie
UPDATE basico.turma_serie SET  nome = 'EFAIINT3A' WHERE id_turma_serie = 56869589 ;
UPDATE basico.turma_serie SET  nome = 'MULTIINTMUL12A' WHERE id_turma_serie = 56894538 ;
UPDATE basico.turma_serie SET  nome = 'EFAIIBTMUL2A' WHERE id_turma_serie = 56869608 ;
UPDATE basico.turma_serie SET  nome = 'EIPINTPREMA' WHERE id_turma_serie = 56869570 ;
-- ensino turma
UPDATE ensino.turma SET codigo = 'EFAIINT3A' WHERE id_turma_serie = 56869589 ;
UPDATE ensino.turma SET codigo =  'MULTIINTMUL12A' WHERE id_turma_serie = 56894538 ;
UPDATE ensino.turma SET codigo =  'EFAIIBTMUL2A' WHERE id_turma_serie = 56869608 ;
UPDATE ensino.turma SET codigo =  'EIPINTPREMA' WHERE id_turma_serie = 56869570 ;
--
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
INTO TEMP tc_para_adicionar
FROM
turmas_alteracao_matriz_curricular tm
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
       tc_para_adicionar tamc ON t.id_turma_serie = tamc.id_turma_serie
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
    FROM ensino.turma ts
    JOIN
       turmas_alteracao_matriz_curricular tamc ON ts.id_turma_serie = tamc.id_turma_serie 
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
-- backup novas ensino. turma 
SELECT
    'UPDATE ensino.turma SET id_situacao_turma = 7 WHERE id_turma IN ( ' || string_agg(id_turma::text,',') || ');' backup 
FROM  tc_para_adicionar;
-- sub turmasserie multesseriada
 WITH novos_curriculos AS(
  SELECT id_curriculo_correto curriculo_mult,
cb.id_curriculo_basico curriculo_associado,
cb.id_serie ,
ta.id_turma_serie, 
cb.tipo_diario 
FROM turmas_alteracao_matriz_curricular ta
JOIN basico.curriculo_basico_serie_multisseriada cbsm ON cbsm.id_curriculo_basico =  ta.id_curriculo_correto
JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cbsm.id_curriculo_basico_serie_associada 
  )
select DISTINCT 
    ts.ano ,
    ts.nome ,
    ts.id_turma_serie,
    ts.id_curriculo_medio ,
    ncb.curriculo_associado ,
    1 id_turno_novo,
    ts.id_turno,
    ncb.tipo_diario
    INTO TEMP  turmas_alteracao_matriz_curricular_associado
 FROM basico.turma_serie ts 
 JOIN novos_curriculos ncb ON ncb.id_serie = ts.id_serie
 AND ts.id_turma_serie_agrupadora = ncb.id_turma_serie 
 WHERE 1=1
 AND ts.id_curriculo_medio <> ncb.curriculo_associado
 AND ts.ano = 2026
 AND ts.id_turma_serie_agrupadora IS NOT NULL 
 AND ts.id_escola IN (973)
 AND ts.ativo;
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
INTO TEMP tc_para_adicionar-sub-serie
FROM
turmas_alteracao_matriz_curricular_associado tm
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
FROM tc_para_adicionar-sub-serie ca
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
       tc_para_adicionar-sub-serie tamc ON t.id_turma_serie = tamc.id_turma_serie
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
    AND t_main.id_turma IN (SELECT id_turma FROM tc_para_adicionar-sub-serie); 
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
       turmas_alteracao_matriz_curricular tamc ON ts.id_turma_serie = tamc.id_turma_serie 
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
    WHERE 1 = 1
    AND ts.id_situacao_turma <> 4)
    SELECT DISTINCT ON (id_discente, id_turma, id_situacao_matricula) *
    INTO TEMP novas_mc_regular-sub-serie
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
FROM novas_mc_regular-sub-serie tm
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
  FROM novas_mc_regular-sub-serie mc;
-- backup novas ensino. turma 
SELECT
    'UPDATE ensino.turma SET id_situacao_turma = 7 WHERE id_turma IN ( ' || string_agg(id_turma::text,',') || ');' backup 
FROM  tc_para_adicionar-sub-serie;
COMMIT;