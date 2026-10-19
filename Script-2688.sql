WITH cte_faltas AS ( SELECT fa.id_discente, t.id_turma_serie, COALESCE(SUM(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0) AS total_faltas
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
WHERE t.ano = 2026
AND t.id_situacao_turma <> 4
AND fa.ativo = TRUE
AND fa.frequencia > 0
GROUP BY fa.id_discente, t.id_turma_serie ), cte_ne AS ( SELECT id_pessoa, COUNT(*) > 0 AS tem_ne
FROM comum.pessoa_necessidade_especial
GROUP BY id_pessoa ), cte_qtd_salas AS ( SELECT id_escola, COUNT(*) AS total_salas
FROM ambiente.ambiente_unidade_escolar
GROUP BY id_escola ), cte_periodo AS ( SELECT MAX(periodo) AS max_periodo
FROM basico.turma_serie
WHERE ano = 2026
AND ativo = TRUE ) SELECT e.codigo_inep, ts.nome AS nome_turma, CASE WHEN ee.periodicidade_etapa = 'ANUAL' THEN 0
WHEN ee.periodicidade_etapa = 'SEMESTRAL'
AND ts.periodo = 1 THEN 1
WHEN ee.periodicidade_etapa = 'SEMESTRAL'
AND ts.periodo = 2 THEN 2 END AS periodo, CASE WHEN trn.descricao ILIKE '%MATUTINO%'
OR trn.descricao ILIKE '%INTERMEDIARIO%' THEN 1
WHEN trn.descricao ILIKE '%VESPERTINO%' THEN 2
WHEN trn.descricao ILIKE '%NOTURNO%' THEN 3
WHEN trn.descricao ILIKE '%INTEGRAL%' THEN 4 END AS turno, sts.codigo AS idSerie, CASE WHEN ee.id_modalidade <> 2
AND ee.id_nivel_etapa = 51918782 THEN 1
WHEN ee.id_modalidade <> 2
AND ee.id_nivel_etapa IN (1, 2) THEN 2
WHEN ee.id_modalidade <> 2
AND ee.id_nivel_etapa = 3 THEN 3
WHEN ee.id_modalidade = 2 THEN 4 END AS modalidade, d.matricula, TO_CHAR(COALESCE(mes.data_matricula_turma, mes.data_cadastro), 'YYYY-MM-DD') AS data_matricula, COALESCE(f.total_faltas, 0) AS faltas,(mes.id_situacao_matricula_serie = 2) AS aprovado, p.cpf_cnpj, CAST(p.data_nascimento AS VARCHAR) AS data_nascimento, p.nome, COALESCE(ne.tem_ne, FALSE) AS pessoa_com_ne, CASE WHEN p.sexo = 'M' THEN 1
WHEN p.sexo = 'F' THEN 2
ELSE 3 END AS sexo,(CAST(ht.dia AS INT) - 1) AS dia_semana, CAST(h.inicio AS VARCHAR) AS hora_inicio, cc.nome AS disciplina, p_prof.cpf_cnpj AS cpf_cnpj_professor,(t.id_situacao_turma = 3) AS turma_finalizada, FALSE AS multisseriada, COALESCE(qs.total_salas, 0) AS qtdSalas, aue.nome_numero
FROM escola.escola e
JOIN comum.unidade u ON
u.id_unidade = e.id_unidade_escola
JOIN basico.turma_serie ts ON
ts.id_escola = e.id_escola
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
JOIN basico.serie s ON
s.id_serie = ts.id_serie
JOIN basico.mapeamento_series_tce_se mssts ON
mssts.id_serie = ts.id_serie
JOIN basico.series_tce_se sts ON
sts.id = mssts.id_serie_tce
AND sts.ativo = TRUE
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
CROSS JOIN cte_periodo cp
JOIN ensino.turno trn ON
trn.id_turno = ts.id_turno
JOIN basico.matricula_estudante_serie mes ON
mes.id_turma_serie = ts.id_turma_serie
AND mes.id_situacao_matricula_serie IN (2, 3, 1, 7, 8, 10,-1)
JOIN basico.estudante est ON
est.id_estudante = mes.id_estudante
JOIN discente d ON
d.id_discente = est.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
JOIN ensino.horario_turma ht ON
ht.id_turma = t.id_turma
JOIN ensino.horario h ON
h.id_horario = ht.id_horario
JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = t.id_disciplina
JOIN ensino.docente_turma dt ON
dt.id_turma = t.id_turma
JOIN rh.servidor serv ON
serv.id_servidor = dt.id_docente
JOIN comum.pessoa p_prof ON
p_prof.id_pessoa = serv.id_pessoa
LEFT JOIN cte_faltas f ON
f.id_discente = d.id_discente
AND f.id_turma_serie = ts.id_turma_serie
LEFT JOIN cte_ne ne ON
ne.id_pessoa = p.id_pessoa
LEFT JOIN cte_qtd_salas qs ON
qs.id_escola = e.id_escola
LEFT JOIN ambiente.ambiente_unidade_escolar aue ON
aue.id_escola = e.id_escola
WHERE u.ativo
AND ts.ativo
AND ht.ativo
AND dt.ativo
AND p.data_nascimento <= '2024-08-30'
AND t.id_situacao_turma <> 4
AND mes.ano_calendario = 2026
AND (ts.periodo = cp.max_periodo
    OR ee.periodicidade_etapa = 'ANUAL')
      AND d.matricula = '202430040020'
GROUP BY e.id_escola, e.codigo_inep,  ee.periodicidade_etapa,p.sexo,t.id_situacao_turma, ts.periodo, ts.nome, trn.descricao, sts.codigo, ee.id_modalidade, ee.id_nivel_etapa, d.matricula, mes.data_matricula_turma, mes.id_situacao_matricula_serie, p.cpf_cnpj, p.data_nascimento, p.nome, p.id_pessoa, ht.dia, cc.nome, p_prof.cpf_cnpj, mes.data_cadastro, t.id_turma, d.id_discente, h.inicio, ts.id_turma_serie, aue.id_ambiente_unidade_escolar, aue.nome_numero, f.total_faltas, ne.tem_ne, qs.total_salas
ORDER BY e.codigo_inep, periodo, ts.nome, turno, d.matricula, dia_semana, hora_inicio;