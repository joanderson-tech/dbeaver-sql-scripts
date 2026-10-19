WITH pessoas_nee AS ( 
    SELECT pne.id_pessoa, max(tne.quantidade_vaga) AS quantidade_vaga
    FROM comum.pessoa_necessidade_especial pne
    JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial
    WHERE tne.ativo
    GROUP BY pne.id_pessoa 
), 
estudantes_nee AS ( 
    SELECT eine.id_estudante_inscrito, max(tne.quantidade_vaga) AS quantidade_vaga
    FROM matricula.estudante_inscrito_necessidade_especial eine
    JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = eine.id_tipo_necessidade
    WHERE tne.ativo
    GROUP BY eine.id_estudante_inscrito 
),
uniao_dados AS (
    -- BLOCO 1: RENOVAÇÃO
    SELECT DISTINCT ON (num_solicitacao, estudante) 
        ee.denominacao AS etapa, s.descricao AS serie, t.descricao AS turno, rm.numero_renovacao AS num_solicitacao, 
        tov.denominacao AS tipo_ocupacao, p.nome AS estudante, nee,
        (SELECT COALESCE(max(p_nee.quantidade_vaga), 1) FROM pessoas_nee p_nee WHERE p_nee.id_pessoa = p.id_pessoa) AS qtd_vaga, 
        vs.vagas_validadas, cm.data_inicio_remanescentes, prazo_validade_vaga_concedida, 'NÃO' AS situacao_efetivacao, 
        vs.id_vaga_serie, tov.id_tipo_ocupacao_vaga, vs.periodo, p.data_nascimento, d.id_discente
    FROM matricula.renovacao_matricula_resultado rmr
    JOIN matricula.listagem_processamento_renovacao_matricula lpr ON lpr.id_listagem_processamento_renovacao_matricula = rmr.id_listagem_processamento_renovacao_matricula
    JOIN matricula.tipo_ocupacao_vaga tov ON tov.id_tipo_ocupacao_vaga = lpr.id_tipo_ocupacao_vaga
    JOIN matricula.renovacao_matricula rm ON rm.id_renovacao_matricula = rmr.id_renovacao_matricula
    JOIN discente d ON d.id_discente = rm.id_discente
    JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
    JOIN matricula.calendario_matricula cm ON cm.id_calendario_matricula = rmr.id_calendario_matricula
    JOIN matricula.vaga_serie vs ON vs.id_vaga_serie = rmr.id_vaga_serie_concedida AND vs.ano_letivo = cm.ano AND vs.vagas_validadas > 0
    JOIN basico.serie s ON s.id_serie = vs.id_serie
    JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
    JOIN ensino.turno t ON t.id_turno = vs.id_turno
    WHERE vs.id_escola = 52232851 AND cm.ano = 2026 AND vs.removida = FALSE AND id_nova_serie IS NULL
    UNION ALL 
    -- BLOCO 2: INSCRIÇÃO
    SELECT DISTINCT ON (num_solicitacao, estudante) 
        ee.denominacao AS etapa, s.descricao AS serie, t.descricao AS turno, ei.numero_inscricao AS num_solicitacao, 
        tov.denominacao AS tipo_ocupacao, ei.nome AS estudante, nee,
        (SELECT COALESCE(max(e_nee.quantidade_vaga), 1) FROM estudantes_nee e_nee WHERE e_nee.id_estudante_inscrito = ei.id_estudante_inscrito) AS qtd_vaga, 
        vs.vagas_validadas, cm.data_inicio_remanescentes, 
        CASE WHEN ei.id_status = 7 THEN prazo_validade_vaga_remanescente_concedida ELSE prazo_validade_vaga_concedida END, 
        'NÃO', vs.id_vaga_serie, tov.id_tipo_ocupacao_vaga, vs.periodo, ei.data_nascimento, d.id_discente
    FROM matricula.estudante_inscrito_processamento eip
    JOIN matricula.listagem_processamento_matricula lpm ON lpm.id_listagem_processamento_matricula = eip.id_listagem_processamento_matricula
    JOIN matricula.tipo_ocupacao_vaga tov ON tov.id_tipo_ocupacao_vaga = lpm.id_tipo_ocupacao_vaga
    JOIN matricula.calendario_matricula cm ON cm.id_calendario_matricula = lpm.id_calendario_matricula
    JOIN matricula.estudante_inscrito ei ON ei.id_estudante_inscrito = eip.id_estudante_inscrito
    LEFT JOIN discente d ON d.id_discente = ei.id_estudante
    JOIN matricula.estudante_inscrito_opcao_escola eioe ON eioe.id_estudante_inscrito_opcao_escola = eip.id_opcao_escola
    JOIN matricula.vaga_serie vs ON vs.id_vaga_serie = eioe.id_vaga_serie AND vs.ano_letivo = cm.ano AND vs.vagas_validadas > 0
    JOIN basico.serie s ON s.id_serie = vs.id_serie
    JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
    JOIN ensino.turno t ON t.id_turno = vs.id_turno
    WHERE vs.id_escola = 52232851 AND cm.ano = 2026 AND vs.removida = FALSE 
    AND ei.id_status NOT IN ( 5, 8, 9, 10, 11, 12, 13 )
    UNION ALL 
    -- BLOCO 3: TRANSFERÊNCIA
    SELECT DISTINCT ON (num_solicitacao, estudante) 
        ee.denominacao AS etapa, s.descricao AS serie, t.descricao AS turno, st.numero AS num_solicitacao, 
        tst.denominacao AS tipo_ocupacao, p.nome AS estudante, 
        CASE WHEN (SELECT id_pessoa FROM comum.pessoa_necessidade_especial pne WHERE pne.id_pessoa = p.id_pessoa LIMIT 1) IS NULL THEN FALSE ELSE TRUE END,
        (SELECT COALESCE(max(p_nee.quantidade_vaga), 1) FROM pessoas_nee p_nee WHERE p_nee.id_pessoa = p.id_pessoa) AS qtd_vaga, 
        vs.vagas_validadas, cm.data_inicio_remanescentes, prazo_validade_vaga_concedida, 'NÃO', 
        vs.id_vaga_serie, tst.id_tipo_solicitacao_transferencia, vs.periodo, p.data_nascimento, d.id_discente
    FROM matricula.solicitacao_transferencia st
    JOIN matricula.calendario_matricula cm ON cm.ano = st.ano_escolar
    JOIN matricula.tipo_solicitacao_transferencia tst ON tst.id_tipo_solicitacao_transferencia = st.id_tipo
    JOIN matricula.solicitacao_transferencia_opcao_escola tsoe ON tsoe.id_solicitacao = st.id_solicitacao_transferencia
    JOIN matricula.vaga_serie vs ON tsoe.id_escola = vs.id_escola AND tsoe.id_serie = vs.id_serie AND tsoe.id_turno = vs.id_turno AND vs.periodo = tsoe.periodo AND vs.ano_letivo = cm.ano AND vs.vagas_validadas > 0
    JOIN basico.serie s ON s.id_serie = vs.id_serie
    JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
    JOIN ensino.turno t ON t.id_turno = vs.id_turno
    JOIN basico.matricula_estudante_serie mes ON mes.id_matricula_discente_serie = st.id_matricula_discente_serie
    JOIN discente d ON d.id_discente = mes.id_estudante
    JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
    WHERE vs.id_escola = 52232851 AND cm.ano = 2026 AND vs.removida = FALSE
    UNION ALL 
    -- BLOCO 4: EFETIVADOS
    SELECT DISTINCT ON (num_solicitacao, estudante) 
        ee.denominacao AS etapa, s.descricao AS serie, t.descricao AS turno, 
        COALESCE(rm.numero_renovacao, st.numero, ei.numero_inscricao) AS num_solicitacao, 
        tov.denominacao AS tipo_ocupacao, p.nome AS estudante, 
        EXISTS (SELECT 1 FROM pessoas_nee p_nee WHERE p_nee.id_pessoa = p.id_pessoa) AS nee,
        (SELECT COALESCE(max(p_nee.quantidade_vaga), 1) FROM pessoas_nee p_nee WHERE p_nee.id_pessoa = p.id_pessoa) AS qtd_vaga, 
        vs.vagas_validadas, cm.data_inicio_remanescentes, cm.prazo_validade_vaga_concedida, 'EFETIVADO', 
        vs.id_vaga_serie, tov.id_tipo_ocupacao_vaga, vs.periodo, p.data_nascimento, d.id_discente
    FROM basico.matricula_estudante_serie mes
    JOIN matricula.calendario_matricula cm ON cm.ano = mes.ano_calendario
    JOIN discente d ON d.id_discente = mes.id_estudante
    JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
    JOIN escola.escola_etapa_ensino_serie eees ON eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
    JOIN matricula.vaga_serie vs ON vs.id_calendario_matricula = cm.id_calendario_matricula AND vs.ano_letivo = cm.ano AND vs.id_escola = eees.id_escola AND vs.id_serie = eees.id_serie AND vs.id_turno = mes.id_turno AND vs.periodo = mes.periodo
    JOIN basico.serie s ON s.id_serie = vs.id_serie
    JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
    JOIN ensino.turno t ON t.id_turno = vs.id_turno
    LEFT JOIN matricula.estudante_inscrito ei ON ei.id_estudante = mes.id_estudante AND ei.id_calendario_matricula = cm.id_calendario_matricula AND ei.id_status NOT IN (5, 8, 13)
    LEFT JOIN matricula.renovacao_matricula rm ON rm.id_nova_serie = mes.id_matricula_discente_serie AND rm.id_calendario_matricula = cm.id_calendario_matricula
    LEFT JOIN matricula.solicitacao_transferencia st ON st.id_matricula_discente_serie_gerado = mes.id_matricula_discente_serie AND st.id_calendario_matricula = cm.id_calendario_matricula
    LEFT JOIN matricula.tipo_ocupacao_vaga tov ON tov.id_tipo_ocupacao_vaga = 2 
    WHERE mes.id_situacao_matricula_serie NOT IN (4,5,6,9,12) AND vs.id_escola = 52232851 AND cm.ano = 2026 AND vs.removida = false
),
limpeza_duplicatas AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY id_discente -- Agrupa por aluno
               ORDER BY CASE WHEN situacao_efetivacao = 'EFETIVADO' THEN 1 ELSE 2 END, num_solicitacao DESC
           ) as rn
    FROM uniao_dados
)
-- RESULTADO FINAL COM A SUA ORDENAÇÃO
SELECT 
    etapa, serie, turno, num_solicitacao, tipo_ocupacao, estudante, nee, 
    qtd_vaga, vagas_validadas, data_inicio_remanescentes, 
    prazo_validade_vaga_concedida, situacao_efetivacao
FROM limpeza_duplicatas
WHERE rn = 1 -- Pega apenas o registro mais importante (EFETIVADO)
ORDER BY etapa, serie, turno, periodo, tipo_ocupacao, estudante, situacao_efetivacao;