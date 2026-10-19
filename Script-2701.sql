-- Turma Antiga (id_turma_serie): 52054613
-- Turma Nova   (id_turma_serie): 52057058
--DROP TABLE IF EXISTS temp_topicos_para_migrar;

BEGIN;

--Turma: EFAFV6B
-- PASSO 1: CRIAR E POPULAR A TABELA TEMPORÁRIA 

--DROP TABLE IF EXISTS temp_topicos_para_migrar;

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
JOIN ensino.turma t_nova ON t_nova.id_turma_serie = 52057058 -- Turma nova
                        AND t_nova.id_disciplina = t_antiga.id_disciplina
WHERE t_antiga.id_turma_serie = 52054613  -- Turma antiga
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