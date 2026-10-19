SELECT DISTINCT aue.* 
FROM ambiente.ambiente_unidade_escolar aue 
INNER JOIN escola.escola e ON aue.id_escola = e.id_escola
INNER JOIN basico.turma_serie ts ON ts.id_escola = e.id_escola
INNER JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.estudante est ON est.id_estudante = mes.id_estudante
INNER JOIN discente d ON d.id_discente = est.id_estudante
INNER JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
-- Aplica os mesmos filtros do teu relatório principal para 2026
WHERE ts.ativo = TRUE
  AND t.id_situacao_turma <> 4
  AND mes.ano_calendario = 2026
  AND mes.id_situacao_matricula_serie IN (2, 3, 1, 7, 8, 10, -1)
    AND d.matricula = '202430040020';
ORDER BY ema.total_ambientes DESC, e.codigo_inep, p.nome;


-- ============================================================================
-- EXEMPLO DE JUNÇÃO DA SALA CORRETA POR TURMA/ALUNO
-- ============================================================================

SELECT 
    e.codigo_inep,
    ts.nome AS nome_turma,
    d.matricula,
    p.nome AS nome_aluno,
    cc.nome AS disciplina,
    -- Nome/Número da Sala FÍSICA CORRETA onde a turma estuda
    aue.nome_numero AS sala_correta_do_aluno
FROM escola.escola e
INNER JOIN basico.turma_serie ts ON ts.id_escola = e.id_escola
INNER JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
-- ----------------------------------------------------------------------------
-- JUNÇÃO CORRETA: Liga a sala específica diretamente à Turma
-- (Substitua 'id_ambiente' pelo nome exato da coluna da sala na tabela turma)
-- ----------------------------------------------------------------------------
LEFT JOIN ambiente.ambiente_unidade_escolar aue 
       ON aue.id_ambiente_unidade_escolar = 132  -- <--- CHAVE DE LIGAÇÃO CORRETA
INNER JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.estudante est ON est.id_estudante = mes.id_estudante
INNER JOIN discente d ON d.id_discente = est.id_estudante
INNER JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
INNER JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma
INNER JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina
WHERE ts.ativo = TRUE
AND d.matricula = '202430040020';
  AND mes.ano_calendario = 2026;