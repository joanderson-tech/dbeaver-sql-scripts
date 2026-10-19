WITH faltas AS ( SELECT fa.id_discente, ts.id_turma_serie, COALESCE(sum(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0) AS faltas
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
AND t.ano = 2026
AND t.id_situacao_turma <> 4
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
AND ts.ativo
WHERE fa.frequencia > 0
AND fa.ativo
GROUP BY fa.id_discente, ts.id_turma_serie), periodo AS (SELECT max(periodo) AS periodo
FROM basico.turma_serie
WHERE ano = 2026
AND ativo) SELECT e.codigo_inep, ts.nome AS nome_turma,( CASE WHEN ee.periodicidade_etapa = 'ANUAL' THEN 0
WHEN ee.periodicidade_etapa = 'SEMESTRAL'
	AND ts.periodo = 1 THEN 1
	WHEN ee.periodicidade_etapa = 'SEMESTRAL'
	AND ts.periodo = 2 THEN 2 END ) AS periodo,( CASE WHEN trn.descricao ILIKE '%MATUTINO%'
	OR trn.descricao ILIKE '%INTERMEDIARIO%' THEN 1
	WHEN trn.descricao ILIKE '%VESPERTINO%' THEN 2
	WHEN trn.descricao ILIKE '%NOTURNO%' THEN 3
	WHEN trn.descricao ILIKE '%INTEGRAL%' THEN 4 END ) AS turno, sts.codigo AS idSerie,( CASE WHEN ee.id_modalidade <> 2
	AND ee.id_nivel_etapa = 51918782 THEN 1
	WHEN ee.id_modalidade <> 2
	AND ee.id_nivel_etapa IN (1, 2) THEN 2
	WHEN ee.id_modalidade <> 2
		AND ee.id_nivel_etapa = 3 THEN 3
		WHEN ee.id_modalidade = 2 THEN 4 END ) AS modalidade, d.matricula, to_char(COALESCE(mes.data_matricula_turma, mes.data_cadastro), 'YYYY-MM-DD') AS data_matricula,(SELECT f.faltas
FROM faltas f
WHERE f.id_discente = d.id_discente
AND f.id_turma_serie = ts.id_turma_serie) AS faltas,(mes.id_situacao_matricula_serie = 2) AS aprovado, p.cpf_cnpj, CAST(p.data_nascimento AS varchar) AS data_nascimento, p.nome,((SELECT count(*)
FROM comum.pessoa_necessidade_especial pne
WHERE pne.id_pessoa = p.id_pessoa) > 0) AS pessoa_com_ne,( CASE WHEN p.sexo = 'M' THEN 1
WHEN p.sexo = 'F' THEN 2
ELSE 3 END ) AS sexo,(CAST(ht.dia AS int)-1) AS dia_semana, CAST(h.inicio AS varchar) AS hora_inicio, cc.nome AS disciplina, p_prof.cpf_cnpj AS cpf_cnpj_professor,(t.id_situacao_turma = 3) AS turma_finalizada, FALSE AS multisseriada,(SELECT COUNT(*)
FROM ambiente.ambiente_unidade_escolar aue2
WHERE aue2.id_escola = e.id_escola) AS qtdSalas, aue.nome_numero
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
AND sts.ativo
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
JOIN periodo pe ON
(ts.periodo = pe.periodo
	OR ee.periodicidade_etapa = 'ANUAL')
JOIN ensino.turno trn ON
trn.id_turno = ts.id_turno
JOIN basico.matricula_estudante_serie mes ON
mes.id_turma_serie = ts.id_turma_serie
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
JOIN basico.estudante est ON
est.id_estudante = mes.id_estudante
JOIN discente d ON
d.id_discente = est.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
JOIN ensino.horario_turma ht ON
ht.id_turma = t.id_turma
AND ht.ativo
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
LEFT JOIN ambiente.ambiente_unidade_escolar aue ON
aue.id_escola = e.id_escola
WHERE u.ativo
AND ts.ativo
AND ht.ativo
AND dt.ativo
AND p.data_nascimento <= '2024-08-30'
AND t.id_situacao_turma <> 4
AND mes.ano_calendario = 2026
GROUP BY e.id_escola, e.codigo_inep, ee.periodicidade_etapa, ts.periodo, ts.nome, trn.descricao, sts.codigo, ee.id_modalidade, ee.id_nivel_etapa, d.matricula, mes.data_matricula_turma, mes.id_situacao_matricula_serie, p.cpf_cnpj, p.data_nascimento, p.nome, p.id_pessoa, ht.dia, cc.nome, p_prof.cpf_cnpj, mes.data_cadastro, t.id_turma, d.id_discente, h.inicio, ts.id_turma_serie, aue.id_ambiente_unidade_escolar, aue.nome_numero
ORDER BY e.codigo_inep, periodo, ts.nome, turno, d.matricula, dia_semana, hora_inicio