-- ==============================================================================
-- PASSO 1: Criar tabela temporária com o mapeamento das turmas por disciplina
-- ==============================================================================
CREATE TEMP TABLE tmp_map_frequencia_turma AS
SELECT fa.id_frequencia, fa.id_discente, t_antiga.id_turma AS id_turma_antiga, t_nova.id_turma AS id_turma_nova, t_antiga.id_disciplina
FROM ensino.frequencia_aluno fa 
JOIN ensino.turma t_antiga ON t_antiga.id_turma = fa.id_turma
JOIN ensino.turma t_nova ON t_nova.id_disciplina = t_antiga.id_disciplina
AND t_nova.id_turma_serie = 51958442
WHERE fa.id_discente = 997599
AND t_antiga.id_turma_serie = 52014417;

-- ==============================================================================
-- PASSO 2: Gerar String de Backup (para reverter para a turma antiga se necessário)
-- ==============================================================================
SELECT 
    COUNT(tmp.id_frequencia) AS quantidade_registros,
    'UPDATE ensino.frequencia_aluno SET id_turma = ' || tmp.id_turma_antiga || ' WHERE id_frequencia IN (' || string_agg(tmp.id_frequencia::TEXT, ', ') || ');' AS backup_sql_reverter
FROM tmp_map_frequencia_turma tmp
GROUP BY tmp.id_turma_antiga;

-- ==============================================================================
-- PASSO 3: Atualizar a frequência para a nova turma (UPDATE)
-- ==============================================================================
UPDATE ensino.frequencia_aluno fa
SET id_turma = tmp.id_turma_nova
FROM tmp_map_frequencia_turma tmp
WHERE fa.id_frequencia = tmp.id_frequencia;


-- ==============================================================================
-- PASSO 4: Validação do resultado e Limpeza
-- ==============================================================================
-- Documentação: Consulta para verificar se a frequência do aluno agora aponta 
-- para as turmas da turma_serie nova (51958442).

687399

SELECT SUM(fa.frequencia )
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON t.id_turma = fa.id_turma
WHERE fa.id_discente = 997599
  AND t.id_turma_serie = 51958442;

-- Apaga a tabela temporária da sessão
DROP TABLE tmp_map_frequencia_turma;

-- Se o resultado da consulta no PASSO 4 estiver correto, execute:
 COMMIT;

-- Se desejar cancelar a alteração, execute:
-- ROLLBACK;