-- ==============================================================================
-- SCRIPT DE RECUPERAÇÃO COM RECALCULO E REAJUSTE AUTOMÁTICO DE DATAS
-- ==============================================================================
-- Objetivo: Pegar as aulas da turma antiga e atribui-las às próximas datas 
--           disponíveis/vagas da mesma disciplina na turma nova.
-- Turma Antiga (id_turma_serie): 52044268
-- Turma Nova   (id_turma_serie): 52057124
-- ==============================================================================

BEGIN;

ROLLBACK;

-- ------------------------------------------------------------------------------
-- ETAPA 1: Limpeza da tabela temporária de execuções anteriores
-- ------------------------------------------------------------------------------
DROP TABLE IF EXISTS temp_aulas_recalculadas;
DROP TABLE IF EXISTS aulas_antigas_ordenadas

-- ------------------------------------------------------------------------------
-- ETAPA 2: Mapear aulas antigas e atribuir a nova data sequencial livre
-- ------------------------------------------------------------------------------
WITH aulas_antigas_ordenadas AS (
    -- Seleciona e numera as aulas da turma antiga em ordem cronologica
    SELECT 
        cc.id_componente_curricular,
        cc.nome AS nome_disciplina,
        nextval('hibernate_sequence') AS novo_id_topico_aula,
        t_nova.id_turma AS id_turma_destino,
        ta_antiga.*,
        ROW_NUMBER() OVER (
            PARTITION BY cc.id_componente_curricular 
            ORDER BY ta_antiga."data" ASC
        ) AS posicao_aula
    FROM ava.topico_aula ta_antiga
    JOIN ensino.turma t_antiga ON t_antiga.id_turma = ta_antiga.id_turma
    JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t_antiga.id_disciplina
    JOIN ensino.turma t_nova ON t_nova.id_turma_serie = 52057124 
                            AND t_nova.id_disciplina = t_antiga.id_disciplina
    WHERE t_antiga.id_turma_serie = 52044268
      AND ta_antiga.ativo = TRUE
      -- Filtra apenas aulas que ainda NAO existem na turma nova
      AND NOT EXISTS (
          SELECT 1 
          FROM ava.topico_aula ta_check
          WHERE ta_check.id_turma = t_nova.id_turma
            AND ta_check.data = ta_antiga.data
            AND ta_check.ativo = TRUE
      )
)
-- Salva os dados na tabela temporaria mantendo a estrutura para insercao
SELECT 
    id_componente_curricular,
    novo_id_topico_aula,
    nome_disciplina,
    id_turma_destino,
    posicao_aula,
    "data" AS data_original_antiga,
    -- A data mantem-se ou pode ser redefinida conforme a regra de negocio
    "data" AS nova_data_atribuida, 
    descricao,
    fim,
    id_topico_pai,
    conteudo,
    id_usuario,
    visivel,
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
INTO TEMP temp_aulas_recalculadas
FROM aulas_antigas_ordenadas;

--  BACKUP
SELECT 
    'DELETE FROM ava.topico_aula WHERE id_topico_aula IN (' || 
    string_agg(novo_id_topico_aula::text, ', ') || ');' AS script_de_deletar_se_precisar
FROM temp_aulas_recalculadas;

DELETE FROM ava.topico_aula WHERE id_topico_aula IN (52059676, 52059677, 52059678, 52059679, 52059680, 52059681, 52059682, 52059683, 52059684, 52059685, 52059686, 52059687, 52059688, 52059689, 52059690, 52059691, 52059692, 52059693, 52059694, 52059695, 52059696, 52059697, 52059698, 52059699, 52059700, 52059701, 52059702, 52059703, 52059704, 52059705, 52059706, 52059707, 52059708, 52059709, 52059710, 52059711, 52059712, 52059713, 52059714, 52059715, 52059716, 52059717, 52059718, 52059719, 52059720, 52059721, 52059722, 52059723, 52059724, 52059725, 52059726, 52059727, 52059728, 52059729, 52059730, 52059731, 52059732, 52059733, 52059734, 52059735, 52059736, 52059737, 52059738, 52059739, 52059740, 52059741, 52059742, 52059743, 52059744, 52059745, 52059746, 52059747, 52059748, 52059749, 52059750, 52059751, 52059752, 52059753, 52059754, 52059755, 52059756, 52059757, 52059758, 52059759, 52059760, 52059761, 52059762, 52059763, 52059764, 52059765, 52059766, 52059767, 52059768, 52059769, 52059770, 52059771, 52059772, 52059773, 52059774, 52059775, 52059776, 52059777, 52059778, 52059779, 52059780, 52059781, 52059782, 52059783, 52059784, 52059785, 52059786, 52059787, 52059788, 52059789, 52059790, 52059791, 52059792, 52059793, 52059794, 52059795, 52059796, 52059797, 52059798, 52059799, 52059800, 52059801, 52059802, 52059803, 52059804, 52059805, 52059806, 52059807, 52059808, 52059809, 52059810, 52059811, 52059812, 52059813, 52059814, 52059815, 52059816, 52059817, 52059818, 52059819, 52059820, 52059821, 52059822, 52059823, 52059824, 52059825, 52059826, 52059827, 52059828, 52059829, 52059830, 52059831);

-- ------------------------------------------------------------------------------
-- ETAPA 3: Auditoria/Visualização das Aulas e das Novas Datas
-- Execute esta consulta para checar o de/para antes de inserir
-- ------------------------------------------------------------------------------
SELECT 
    nome_disciplina,
    posicao_aula,
    data_original_antiga,
    nova_data_atribuida,
    descricao
FROM temp_aulas_recalculadas
ORDER BY nome_disciplina, posicao_aula;

-- ------------------------------------------------------------------------------
-- ETAPA 4: Inserção Final na Tabela Oficial (ava.topico_aula)
-- ------------------------------------------------------------------------------
INSERT INTO ava.topico_aula (
    id_topico_aula,                       -- Gera novo ID via sequence do Hibernate
    id_turma,                             -- ID da turma de destino na turma nova
    descricao, 
    "data",                               -- Grava a nova data atribuida
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
    novo_id_topico_aula,        -- Gera chave primaria unica
    id_turma_destino,
    descricao, 
    nova_data_atribuida,                  -- Utiliza a data reajustada
    fim, 
    id_topico_pai, 
    conteudo, 
    id_usuario, 
    NOW(),                                -- Registra momento da insercao
    visivel, 
    TRUE,                                 -- Define como ativo
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
    NOW(), 
    outros, 
    id_configuracao_conteudo_ministrado
FROM temp_aulas_recalculadas;

-- ------------------------------------------------------------------------------
-- ETAPA 5: Finalização da Transação
-- Execute COMMIT para guardar as alterações ou ROLLBACK para cancelar
-- ------------------------------------------------------------------------------
COMMIT;
-- ROLLBACK;