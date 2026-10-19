-- ==============================================================================
-- CONSULTA SIMPLIFICADA: AUDITORIA DE FREQUÊNCIA FORA DO HORÁRIO
-- Objetivo: Identificar turmas com frequência lançada em dias sem aula no horário.
-- ==============================================================================

SELECT 
    t.id_turma_serie,
    fa.id_turma,
    fa."data" AS data_frequencia_errada,
    COUNT(fa.id_frequencia) AS total_frequencias_afetadas
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON t.id_turma = fa.id_turma
-- Condição: O dia da semana da data da frequência NÃO existe no horário da turma
WHERE NOT EXISTS (
    SELECT 1 
    FROM ensino.horario_turma ht
    WHERE ht.id_turma = fa.id_turma
      AND ht.dia::integer = (EXTRACT(DOW FROM fa."data")::integer + 1)
)
-- Filtro opcional: Descomente a linha abaixo para testar apenas uma turma específica
 AND t.id_turma_serie = 52057124
GROUP BY 
    t.id_turma_serie,
    fa.id_turma,
    fa."data"
ORDER BY 
    t.id_turma_serie, 
    fa."data" ASC;