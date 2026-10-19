-- Turma Antiga (id_turma_serie): 52044508
-- Turma Nova   (id_turma_serie): 52056838

BEGIN;
--Turma: EFAFV6A
-- PASSO 1: CRIAR E POPULAR A TABELA TEMPORÁRIA 

DROP TABLE IF EXISTS temp_topicos_para_migrar;

SELECT 
    cc.id_componente_curricular,
    nextval('hibernate_sequence') AS novo_id_topico_aula,
    cc.nome AS nome_disciplina,
    t_nova.id_turma AS id_turma_destino, -- ID da turma de destino na nova estrutura
    ta_antiga.*
INTO TEMP temp_topicos_para_migrar    
FROM ava.topico_aula ta_antiga
JOIN ensino.turma t_antiga ON t_antiga.id_turma = ta_antiga.id_turma
JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t_antiga.id_disciplina
JOIN ensino.turma t_nova ON t_nova.id_turma_serie = 52056838 -- Turma nova
                        AND t_nova.id_disciplina = t_antiga.id_disciplina
WHERE t_antiga.id_turma_serie = 52044508  -- Turma antiga
  AND ta_antiga.ativo = TRUE              -- Apenas aulas ativas da antiga
  AND NOT EXISTS (
      SELECT 1 
      FROM ava.topico_aula ta_check
      WHERE ta_check.id_turma = t_nova.id_turma  -- Mesma turma/disciplina de destino
        AND ta_check.data = ta_antiga.data       -- Mesma data da aula
        AND ta_check.ativo = TRUE                -- Registro ativo
        AND ta_check.programado = ta_antiga.programado -- Mesmo status de programado
  );


--  BACKUP
SELECT 
    'DELETE FROM ava.topico_aula WHERE id_topico_aula IN (' || 
    string_agg(novo_id_topico_aula::text, ', ') || ');' AS script_de_deletar_se_precisar
FROM temp_topicos_para_migrar;

DELETE FROM ava.topico_aula WHERE id_topico_aula IN (52058654, 52058655, 52058656, 52058657, 52058658, 52058659, 52058660, 52058661, 52058662, 52058663, 52058664, 52058665, 52058666, 52058667, 52058668, 52058669, 52058670, 52058671, 52058672, 52058673, 52058674, 52058675, 52058676, 52058677, 52058678, 52058679, 52058680, 52058681, 52058682, 52058683, 52058684, 52058685, 52058686, 52058687, 52058688, 52058689, 52058690, 52058691, 52058692, 52058693, 52058694, 52058695, 52058696, 52058697, 52058698, 52058699, 52058700, 52058701, 52058702, 52058703, 52058704, 52058705, 52058706, 52058707, 52058708, 52058709, 52058710, 52058711, 52058712, 52058713, 52058714, 52058715, 52058716, 52058717, 52058718, 52058719, 52058720, 52058721, 52058722, 52058723, 52058724, 52058725, 52058726, 52058727, 52058728, 52058729, 52058730, 52058731, 52058732, 52058733, 52058734, 52058735, 52058736, 52058737, 52058738);

-- PASSO 3: EXECUTAR A INSERÇÃO NA TABELA DEFINITIVA
INSERT INTO ava.topico_aula (
    id_topico_aula,                       -- Gera novo ID via hibernate_sequence
    id_turma,                             -- Grava o id_turma exato da disciplina nova
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
    novo_id_topico_aula,        -- Gera ID único no padrão do Hibernate/SIGEDUC
    tmp.id_turma_destino,                 -- Pertence à turma nova da respectiva disciplina
    tmp.descricao, 
    tmp."data", 
    tmp.fim, 
    tmp.id_topico_pai, 
    tmp.conteudo, 
    tmp.id_usuario, 
    NOW(),                                -- Marca a data/hora do lançamento de recuperação
    tmp.visivel, 
    TRUE,                                 -- Define como ativo
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