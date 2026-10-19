-- ==============================================================================
-- SCRIPT DE MIGRAÇÃO COM REAJUSTE DE DATAS E VERIFICAÇÃO DE LANÇAMENTO
-- Turma Antiga (id_turma_serie): 52044268
-- Turma Nova   (id_turma_serie): 52057124
-- ==============================================================================


SELECT ht.*
FROM ensino.horario_turma ht
JOIN ensino.turma t ON
t.id_turma = ht.id_turma
WHERE t.id_turma_serie IN (52057124);



BEGIN;

-- PASSO 1: CRIAR E POPULAR A TABELA TEMPORÁRIA COM REORDENAÇÃO DE DATAS
DROP TABLE IF EXISTS temp_topicos_para_migrar;

WITH aulas_ordenadas AS (
    SELECT 
        cc.id_componente_curricular,
        cc.nome AS nome_disciplina,
        t_nova.id_turma AS id_turma_destino,
        ta_antiga.*,
        -- Atribui um número sequencial a cada aula da disciplina (1ª aula, 2ª aula...)
        ROW_NUMBER() OVER (
            PARTITION BY cc.id_componente_curricular 
            ORDER BY ta_antiga."data" ASC
        ) AS ordem_aula
    FROM ava.topico_aula ta_antiga
    JOIN ensino.turma t_antiga ON t_antiga.id_turma = ta_antiga.id_turma
    JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t_antiga.id_disciplina
    JOIN ensino.turma t_nova ON t_nova.id_turma_serie = 52057124 -- Turma nova
                            AND t_nova.id_disciplina = t_antiga.id_disciplina
    WHERE t_antiga.id_turma_serie = 52044268  -- Turma antiga
      AND ta_antiga.ativo = TRUE              -- Apenas aulas ativas
)
SELECT 
    id_componente_curricular,
    nextval('hibernate_sequence') AS novo_id_topico_aula,
    nome_disciplina,
    id_turma_destino,
    ordem_aula,
    -- Mantém a data original ou permite ajuste sem choque de lançamentos
    "data" AS nova_data_calculada,
    descricao,
    fim,
    id_topico_pai,
    conteudo,
    id_usuario,
    visivel,
    ativo,
    id_docente_turma,
    aula_cancelada,
    id_aula_extra,
    bimestre,
    programado,
    bimestral,
    necessita_correcao,
    replica_conteudo,
    conteudo_ministrado,
    quantidade_aulas,
    metodologia,
    observacoes,
    outros,
    id_configuracao_conteudo_ministrado
INTO TEMP temp_topicos_para_migrar
FROM aulas_ordenadas tmp
WHERE NOT EXISTS (
    -- Garante que na data calculada não exista nenhum lançamento na turma nova
    SELECT 1 
    FROM ava.topico_aula ta_check
    WHERE ta_check.id_turma = tmp.id_turma_destino
      AND ta_check.data = tmp."data"
      AND ta_check.ativo = TRUE
      AND ta_check.programado = tmp.programado
);

-- Visualizar registros selecionados
SELECT nome_disciplina, ordem_aula, nova_data_calculada, descricao 
FROM temp_topicos_para_migrar 
ORDER BY nome_disciplina, ordem_aula;

-- PASSO 2: GERAR SCRIPT DE BACKUP / DELEÇÃO MANUAL
SELECT 
    'DELETE FROM ava.topico_aula WHERE id_topico_aula IN (' || 
    string_agg(novo_id_topico_aula::text, ', ') || ');' AS script_de_deletar_se_precisar
FROM temp_topicos_para_migrar;

DELETE FROM ava.topico_aula WHERE id_topico_aula IN (52059832, 52059833, 52059834, 52059835, 52059836, 52059837, 52059838, 52059839, 52059840, 52059841, 52059842, 52059843, 52059844, 52059845, 52059846, 52059847, 52059848, 52059849, 52059850, 52059851, 52059852, 52059853, 52059854, 52059855, 52059856, 52059857, 52059858, 52059859, 52059860, 52059861, 52059862, 52059863, 52059864, 52059865, 52059866, 52059867, 52059868, 52059869, 52059870, 52059871, 52059872, 52059873, 52059874, 52059875, 52059876, 52059877, 52059878, 52059879, 52059880, 52059881, 52059882, 52059883, 52059884, 52059885, 52059886, 52059887, 52059888, 52059889, 52059890, 52059891, 52059892, 52059893, 52059894, 52059895, 52059896, 52059897, 52059898, 52059899, 52059900, 52059901, 52059902, 52059903, 52059904, 52059905, 52059906, 52059907, 52059908, 52059909, 52059910, 52059911, 52059912, 52059913, 52059914, 52059915, 52059916, 52059917, 52059918, 52059919, 52059920, 52059921, 52059922, 52059923, 52059924, 52059925, 52059926, 52059927, 52059928, 52059929, 52059930, 52059931, 52059932, 52059933, 52059934, 52059935, 52059936, 52059937, 52059938, 52059939, 52059940, 52059941, 52059942, 52059943, 52059944, 52059945, 52059946, 52059947, 52059948, 52059949, 52059950, 52059951, 52059952, 52059953, 52059954, 52059955, 52059956, 52059957, 52059958, 52059959, 52059960, 52059961, 52059962, 52059963, 52059964, 52059965, 52059966, 52059967, 52059968, 52059969, 52059970, 52059971, 52059972, 52059973, 52059974, 52059975, 52059976, 52059977, 52059978, 52059979, 52059980, 52059981, 52059982, 52059983, 52059984, 52059985, 52059986, 52059987);

-- PASSO 3: EXECUTAR A INSERÇÃO COM AS NOVAS DATAS AJUSTADAS
INSERT INTO ava.topico_aula (
    id_topico_aula,
    id_turma,
    descricao, 
    "data", 
    fim, 
    id_topico_pai, 
    conteudo, 
    id_usuario, 
    data_cadastro, 
    visivel, 
    ativo, 
    id_docente_turma, 
    aula_cancelada, 
    id_aula_extra, 
    bimestre, 
    programado, 
    bimestral, 
    necessita_correcao, 
    replica_conteudo, 
    conteudo_ministrado, 
    quantidade_aulas, 
    metodologia, 
    observacoes, 
    data_atualizacao, 
    outros, 
    id_configuracao_conteudo_ministrado
)
SELECT 
    tmp.novo_id_topico_aula,
    tmp.id_turma_destino,
    tmp.descricao, 
    tmp.nova_data_calculada,             -- Grava a data validada e sem lançamentos
    tmp.fim, 
    tmp.id_topico_pai, 
    tmp.conteudo, 
    tmp.id_usuario, 
    NOW(),
    tmp.visivel, 
    TRUE,
    tmp.id_docente_turma, 
    tmp.aula_cancelada, 
    tmp.id_aula_extra, 
    tmp.bimestre, 
    tmp.programado, 
    tmp.bimestral, 
    tmp.necessita_correcao, 
    tmp.replica_conteudo, 
    tmp.conteudo_ministrado, 
    tmp.quantidade_aulas, 
    tmp.metodologia, 
    tmp.observacoes, 
    NOW(),
    tmp.outros, 
    tmp.id_configuracao_conteudo_ministrado
FROM temp_topicos_para_migrar tmp;

COMMIT;
-- ROLLBACK;