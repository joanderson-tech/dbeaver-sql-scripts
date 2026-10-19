SELECT fa.*
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON t.id_turma = fa.id_turma
WHERE   t.id_turma_serie  IN (52054613)
AND fa.id_discente = 973704
ORDER BY fa."data" ,fa.id_discente


SELECT ht.*
FROM ensino.horario_turma ht
JOIN ensino.turma t ON
t.id_turma = ht.id_turma
WHERE t.id_turma_serie IN (52057125);

SELECT cc.nome, ta.* FROM ava.topico_aula ta 
JOIN ensino.turma t ON t.id_turma = ta.id_turma 
JOIN ensino.componente_curricular cc ON t.id_disciplina = cc.id_componente_curricular 
WHERE t.id_turma_serie = 52057058
ORDER BY cc.nome, ta."data" ;




SELECT  ta.* 
FROM ava.topico_aula ta 
JOIN ensino.turma t ON t.id_turma = ta.id_turma 
JOIN ensino.componente_curricular cc ON t.id_disciplina = cc.id_componente_curricular 
WHERE t.id_turma_serie = 52054613
ORDER BY cc.nome, ta."data" ;


SELECT 
    cc.nome AS disciplina,
    ta_antiga.*
INTO TEMP temp_topicos_para_migrar    
FROM ava.topico_aula ta_antiga
JOIN ensino.turma t_antiga ON t_antiga.id_turma = ta_antiga.id_turma
JOIN ensino.componente_curricular cc ON t_antiga.id_disciplina = cc.id_componente_curricular
WHERE t_antiga.id_turma_serie = 52054613  -- ID da turma antiga desativada
  AND ta_antiga.ativo = TRUE              -- Apenas aulas ativas na antiga
  -- Garantir que a aula NÃO existe na turma nova (comparando por data e descrição)
  AND NOT EXISTS (
      SELECT 1 
      FROM ava.topico_aula ta_nova
      JOIN ensino.turma t_nova ON t_nova.id_turma = ta_nova.id_turma
      WHERE t_nova.id_turma_serie = 52057058  -- ID da turma nova
        AND ta_nova.data = ta_antiga.data     -- Mesma data de aula
        AND (
            ta_nova.descricao = ta_antiga.descricao 
            OR ta_nova.conteudo = ta_antiga.conteudo
        )
  )
ORDER BY cc.nome, ta_antiga."data";


BEGIN;

INSERT INTO ava.topico_aula (
    id_topico_aula, -- Gerado via Sequence do PostgreSQL
    id_turma,       -- ID interno da turma NOVA
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
    nextval('ava.topico_aula_seq'),  -- Sequence que gera a chave primária única
    t_nova.id_turma,                -- Relaciona diretamente ao id_turma da turma nova
    ta_antiga.descricao, 
    ta_antiga."data", 
    ta_antiga.fim, 
    ta_antiga.id_topico_pai, 
    ta_antiga.conteudo, 
    ta_antiga.id_usuario, 
    NOW(),                          -- Data do cadastro da recuperação (ou ta_antiga.data_cadastro)
    ta_antiga.visivel, 
    TRUE,                           -- Define registro como ativo
    ta_antiga.id_docente_turma, 
    ta_antiga.aula_cancelada, 
    ta_antiga.id_aula_extra, 
    ta_antiga.bimestre, 
    ta_antiga.programado, 
    ta_antiga.bimestral, 
    ta_antiga.necessita_correcao, 
    ta_antiga.replica_conteudo, 
    ta_antiga.conteudo_ministrado, 
    ta_antiga.quantidade_aulas, 
    ta_antiga.metodologia, 
    ta_antiga.observacoes, 
    NOW(),                          -- Marca a data de atualização como a atual
    ta_antiga.outros, 
    ta_antiga.id_configuracao_conteudo_ministrado
FROM ava.topico_aula ta_antiga
JOIN ensino.turma t_antiga ON t_antiga.id_turma = ta_antiga.id_turma
-- Cruzamos com a turma nova para obter o id_turma correspondente
JOIN ensino.turma t_nova ON t_nova.id_turma_serie = 52057058
WHERE t_antiga.id_turma_serie = 52054613
  AND ta_antiga.ativo = TRUE
  -- Condição de exclusão: ignora o que já foi cadastrado na turma nova
  AND NOT EXISTS (
      SELECT 1 
      FROM ava.topico_aula ta_check
      JOIN ensino.turma t_check ON t_check.id_turma = ta_check.id_turma
      WHERE t_check.id_turma_serie = 52057058
        AND ta_check.data = ta_antiga.data
        AND (
            ta_check.descricao = ta_antiga.descricao 
            OR ta_check.conteudo = ta_antiga.conteudo
        )
  );





/*
 * 
52056838   EFAFV6A, 2026-08-26 11:59:02.815// 2026-08-27 04:20:37.000
52057058   EFAFV6B, 2026-08-27 04:53:49.649// 2026-08-27 05:05:49.000
52057124   EFAFV7A, 2026-08-27 05:22:45.366// 2026-08-27 05:55:56.000
52057125   EFAFV7B  2026-08-27 05:26:57.175// 2026-08-27 06:14:52.000
*/;
