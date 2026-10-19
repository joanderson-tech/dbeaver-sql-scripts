StringBuilder sql = new StringBuilder();

// 1. Definição das CTEs (Common Table Expressions) para otimização
sql.append(" WITH cte_faltas AS ( ");
sql.append("     SELECT fa.id_discente, t.id_turma_serie, ");
sql.append("            COALESCE(SUM(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0) AS total_faltas ");
sql.append("     FROM ensino.frequencia_aluno fa ");
sql.append("     JOIN ensino.turma t ON t.id_turma = fa.id_turma ");
sql.append("     WHERE t.ano = 2026 AND t.id_situacao_turma <> 4 ");
sql.append("       AND fa.ativo = true AND fa.frequencia > 0 ");
sql.append("     GROUP BY fa.id_discente, t.id_turma_serie ");
sql.append(" ), ");
sql.append(" cte_ne AS ( ");
sql.append("     SELECT id_pessoa, COUNT(*) > 0 AS tem_ne ");
sql.append("     FROM comum.pessoa_necessidade_especial ");
sql.append("     GROUP BY id_pessoa ");
sql.append(" ), ");
sql.append(" cte_qtd_salas AS ( ");
sql.append("     SELECT id_escola, COUNT(*) AS total_salas ");
sql.append("     FROM ambiente.ambiente_unidade_escolar ");
sql.append("     GROUP BY id_escola ");
sql.append(" ), ");
sql.append(" cte_periodo AS ( ");
sql.append("     SELECT MAX(periodo) AS max_periodo FROM basico.turma_serie ");
sql.append("     WHERE ano = 2026 AND ativo = true ");
sql.append(" ) ");

// 2. Seleção Principal
sql.append(" SELECT e.codigo_inep, ts.nome AS nome_turma, ");
sql.append("     CASE WHEN ee.periodicidade_etapa = 'ANUAL' THEN 0 ");
sql.append("          WHEN ee.periodicidade_etapa = 'SEMESTRAL' AND ts.periodo = 1 THEN 1 ");
sql.append("          WHEN ee.periodicidade_etapa = 'SEMESTRAL' AND ts.periodo = 2 THEN 2 ");
sql.append("     END AS periodo, ");
sql.append("     CASE WHEN trn.descricao ILIKE '%MATUTINO%' OR trn.descricao ILIKE '%INTERMEDIARIO%' THEN 1 ");
sql.append("          WHEN trn.descricao ILIKE '%VESPERTINO%' THEN 2 ");
sql.append("          WHEN trn.descricao ILIKE '%NOTURNO%' THEN 3 ");
sql.append("          WHEN trn.descricao ILIKE '%INTEGRAL%' THEN 4 ");
sql.append("     END AS turno, ");
sql.append("     sts.codigo AS idSerie, ");
sql.append("     CASE WHEN ee.id_modalidade <> 2 AND ee.id_nivel_etapa = 51918782 THEN 1 ");
sql.append("          WHEN ee.id_modalidade <> 2 AND ee.id_nivel_etapa IN (1, 2) THEN 2 ");
sql.append("          WHEN ee.id_modalidade <> 2 AND ee.id_nivel_etapa = 3 THEN 3 ");
sql.append("          WHEN ee.id_modalidade = 2 THEN 4 ");
sql.append("     END AS modalidade, ");
sql.append("     d.matricula, ");
sql.append("     TO_CHAR(COALESCE(mes.data_matricula_turma, mes.data_cadastro), 'YYYY-MM-DD') AS data_matricula, ");
sql.append("     COALESCE(f.total_faltas, 0) AS faltas, ");
sql.append("     (mes.id_situacao_matricula_serie = 2) AS aprovado, ");
sql.append("     p.cpf_cnpj, CAST(p.data_nascimento AS VARCHAR) AS data_nascimento, p.nome, ");
sql.append("     COALESCE(ne.tem_ne, false) AS pessoa_com_ne, ");
sql.append("     CASE WHEN p.sexo = 'M' THEN 1 WHEN p.sexo = 'F' THEN 2 ELSE 3 END AS sexo, ");
sql.append("     (CAST(ht.dia AS INT) - 1) AS dia_semana, ");
sql.append("     CAST(h.inicio AS VARCHAR) AS hora_inicio, cc.nome AS disciplina, ");
sql.append("     p_prof.cpf_cnpj AS cpf_cnpj_professor, (t.id_situacao_turma = 3) AS turma_finalizada, ");
sql.append("     FALSE AS multisseriada, COALESCE(qs.total_salas, 0) AS qtdSalas, aue.nome_numero ");

// 3. Joins e Relacionamentos
sql.append(" FROM escola.escola e ");
sql.append(" JOIN comum.unidade u ON u.id_unidade = e.id_unidade_escola ");
sql.append(" JOIN basico.turma_serie ts ON ts.id_escola = e.id_escola ");
sql.append(" JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie ");
sql.append(" JOIN basico.serie s ON s.id_serie = ts.id_serie ");
sql.append(" JOIN basico.mapeamento_series_tce_se mssts ON mssts.id_serie = ts.id_serie ");
sql.append(" JOIN basico.series_tce_se sts ON sts.id = mssts.id_serie_tce AND sts.ativo = true ");
sql.append(" JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino ");
sql.append(" CROSS JOIN cte_periodo cp ");
sql.append(" JOIN ensino.turno trn ON trn.id_turno = ts.id_turno ");
sql.append(" JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie ");
sql.append("      AND mes.id_situacao_matricula_serie IN (2, 3, 1, 7, 8, 10, -1) ");
sql.append(" JOIN basico.estudante est ON est.id_estudante = mes.id_estudante ");
sql.append(" JOIN discente d ON d.id_discente = est.id_estudante ");
sql.append(" JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa ");
sql.append(" JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma ");
sql.append(" JOIN ensino.horario h ON h.id_horario = ht.id_horario ");
sql.append(" JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina ");
sql.append(" JOIN ensino.docente_turma dt ON dt.id_turma = t.id_turma ");
sql.append(" JOIN rh.servidor serv ON serv.id_servidor = dt.id_docente ");
sql.append(" JOIN comum.pessoa p_prof ON p_prof.id_pessoa = serv.id_pessoa ");

// 4. Lógica de Joins com as CTEs
sql.append(" LEFT JOIN cte_faltas f ON f.id_discente = d.id_discente AND f.id_turma_serie = ts.id_turma_serie ");
sql.append(" LEFT JOIN cte_ne ne ON ne.id_pessoa = p.id_pessoa ");
sql.append(" LEFT JOIN cte_qtd_salas qs ON qs.id_escola = e.id_escola ");
sql.append(" LEFT JOIN ambiente.ambiente_unidade_escolar aue ON aue.id_escola = e.id_escola ");

// 5. Filtros Finais
sql.append(" WHERE u.ativo = true AND ts.ativo = true AND ht.ativo = true AND dt.ativo = true ");
sql.append("   AND p.data_nascimento <= '2024-08-30' AND t.id_situacao_turma <> 4 ");
sql.append("   AND mes.ano_calendario = 2026 ");
sql.append("   AND (ts.periodo = cp.max_periodo OR ee.periodicidade_etapa = 'ANUAL') ");

// 6. Agrupamento e Ordenação
sql.append(" GROUP BY e.id_escola, e.codigo_inep, ee.periodicidade_etapa, ts.periodo, ts.nome, trn.descricao, ");
sql.append("    sts.codigo, ee.id_modalidade, ee.id_nivel_etapa, d.matricula, mes.data_matricula_turma, ");
sql.append("    mes.id_situacao_matricula_serie, p.cpf_cnpj, p.data_nascimento, p.nome, p.id_pessoa, ht.dia, ");
sql.append("    cc.nome, p_prof.cpf_cnpj, mes.data_cadastro, t.id_turma, d.id_discente, h.inicio, ");
sql.append("    ts.id_turma_serie, aue.id_ambiente_unidade_escolar, aue.nome_numero, f.total_faltas, ne.tem_ne, qs.total_salas ");
sql.append(" ORDER BY e.codigo_inep, periodo, ts.nome, turno, d.matricula, dia_semana, hora_inicio; ");