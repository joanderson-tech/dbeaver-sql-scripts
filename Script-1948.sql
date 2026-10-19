SELECT *
FROM comum.pessoa p
WHERE p.nome = 'Alice Ramos Alves';

SELECT *
FROM matricula.estudante_inscrito p
WHERE p.nome ILIKE '%Alice Ramos Alves%';

SELECT *
FROM matricula.estudante_inscrito_processamento eip
WHERE eip.id_estudante_inscrito = 84304593;

SELECT *
FROM(( SELECT ROW_NUMBER() OVER (PARTITION BY trim(s.descricao), trim(t.descricao)
ORDER BY trim(s.descricao), eioe.possui_irmao DESC, ei.nee DESC,(ei.bairro = be.denominacao) DESC,(eba.id_escola IS NOT NULL
	AND ei.bairro = bea.denominacao) DESC, ei."data") AS n, ei.id_estudante_inscrito AS idEstudanteInscrito, ei."data" AS dataCadastro, ei.numero_inscricao AS numSolicitacao, ei.nome AS nomeEstudante, TO_CHAR(ei.cpf, 'FM00000000000') AS cpfEstudante, trim(ee.denominacao) AS etapaEnsino, trim(s.descricao) AS serie, trim(t.descricao) AS turno, eioe.id_estudante_inscrito_opcao_escola AS idOpcaoEscola, eioe.possui_irmao AS possuiIrmao, ei.nee AS nee, sei.id_status_estudante_inscrito AS idStatus, sei.denominacao AS status, EXISTS (SELECT 1
FROM matricula.historico_cadastro_reserva_pre_matricula hcrpm
WHERE hcrpm.id_estudante_inscrito = ei.id_estudante_inscrito
AND hcrpm.tipo_movimentacao = 2
AND hcrpm.id = (SELECT MAX(h2.id)
FROM matricula.historico_cadastro_reserva_pre_matricula h2
WHERE h2.id_estudante_inscrito = ei.id_estudante_inscrito)) AS desistenciaVaga, EXISTS (SELECT 1
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
WHERE mes.ano_calendario = cm.ano
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
	AND ((p.cpf_cnpj IS NOT NULL
		AND ei.cpf IS NOT NULL
		AND p.cpf_cnpj = ei.cpf)
	OR (trim(upper(retira_acentuacao(p.nome))) = trim(upper(retira_acentuacao(ei.nome)))
		AND trim(upper(retira_acentuacao(p.nome_mae))) = trim(upper(retira_acentuacao(ei.nome_mae)))
			AND p.data_nascimento = ei.data_nascimento))
	AND ei.estudante_pre_matricula = TRUE) AS matriculaRede, EXISTS (SELECT 1
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
JOIN escola.escola_etapa_ensino_serie eees ON
eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
WHERE mes.ano_calendario = cm.ano
AND eees.id_escola <> eioe.id_escola
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
	AND ((p.cpf_cnpj IS NOT NULL
		AND ei.cpf IS NOT NULL
		AND p.cpf_cnpj = ei.cpf)
	OR (trim(upper(retira_acentuacao(p.nome))) = trim(upper(retira_acentuacao(ei.nome)))
		AND trim(upper(retira_acentuacao(p.nome_mae))) = trim(upper(retira_acentuacao(ei.nome_mae)))
			AND p.data_nascimento = ei.data_nascimento))
	AND ei.estudante_pre_matricula = TRUE) AS matriculaRedeOutraUnidade, ei.id_status = 9 AS estudanteEfetivado, ei.id_status = 5 AS estudanteCancelado, ei.bairro AS bairroEstudante, ei.estudante_pre_matricula AS estudantePreMatricula, ei.estudante_cadastro_reserva AS estudanteCadastroReserva, eioe.id_escola AS idEscola, cm.ano AS anoCalendario, s.id_serie AS idSerie, t.id_turno AS idTurno
FROM matricula.estudante_inscrito ei
JOIN matricula.estudante_inscrito_processamento eip ON
eip.id_estudante_inscrito = ei.id_estudante_inscrito
JOIN matricula.listagem_processamento_matricula lpm ON
lpm.id_listagem_processamento_matricula = eip.id_listagem_processamento_matricula
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = lpm.id_calendario_matricula
JOIN matricula.estudante_inscrito_opcao_escola eioe ON
eioe.id_estudante_inscrito_opcao_escola = eip.id_opcao_escola
JOIN matricula.status_estudante_inscrito sei ON
sei.id_status_estudante_inscrito = ei.id_status
JOIN matricula.vaga_serie vs ON
vs.id_vaga_serie = eioe.id_vaga_serie
JOIN basico.serie s ON
s.id_serie = vs.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
JOIN ensino.turno t ON
t.id_turno = vs.id_turno
JOIN escola.escola e ON
e.id_escola = eioe.id_escola
LEFT JOIN escola.bairro_escola be ON
be.id_bairro_escola = e.id_bairro_escola
LEFT JOIN escola.bairro_escola bea ON
bea.denominacao = ei.bairro
AND bea.id_municipio = e.id_municipio
LEFT JOIN escola.escola_bairros_atendidos eba ON
eba.id_bairro_escola = bea.id_bairro_escola
AND eba.id_escola = e.id_escola
WHERE cm.ano = 2026
AND ei.estudante_cadastro_reserva = TRUE
AND eioe.id_escola = 61348202
AND ei.nome ILIKE '%Alice Ramos Alves%'
AND ei.estudante_pre_matricula = TRUE
AND eioe.prioridade_pre_matricula = 1 )
UNION ALL ( SELECT ROW_NUMBER() OVER (PARTITION BY trim(s.descricao), trim(t.descricao)
ORDER BY ei."data") AS n, ei.id_estudante_inscrito AS idEstudanteInscrito, ei."data" AS dataCadastro, ei.numero_inscricao AS numSolicitacao, ei.nome AS nomeEstudante, TO_CHAR(ei.cpf, 'FM00000000000') AS cpfEstudante, trim(ee.denominacao) AS etapaEnsino, trim(s.descricao) AS serie, trim(t.descricao) AS turno, eioe.id_estudante_inscrito_opcao_escola AS idOpcaoEscola, eioe.possui_irmao AS possuiIrmao, ei.nee AS nee, sei.id_status_estudante_inscrito AS idStatus, sei.denominacao AS status, EXISTS (SELECT 1
FROM matricula.historico_cadastro_reserva_pre_matricula hcrpm
WHERE hcrpm.id_estudante_inscrito = ei.id_estudante_inscrito
AND hcrpm.tipo_movimentacao = 2
AND hcrpm.id = (SELECT MAX(h2.id)
FROM matricula.historico_cadastro_reserva_pre_matricula h2
WHERE h2.id_estudante_inscrito = ei.id_estudante_inscrito)) AS desistenciaVaga, EXISTS (SELECT 1
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
WHERE mes.ano_calendario = cm.ano
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
AND ((p.cpf_cnpj IS NOT NULL
	AND ei.cpf IS NOT NULL
	AND p.cpf_cnpj = ei.cpf)
OR (trim(upper(retira_acentuacao(p.nome))) = trim(upper(retira_acentuacao(ei.nome)))
	AND trim(upper(retira_acentuacao(p.nome_mae))) = trim(upper(retira_acentuacao(ei.nome_mae)))
		AND p.data_nascimento = ei.data_nascimento))
AND ei.estudante_pre_matricula = FALSE) AS matriculaRede, EXISTS (SELECT 1
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
JOIN escola.escola_etapa_ensino_serie eees ON
eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
WHERE mes.ano_calendario = cm.ano
AND eees.id_escola <> eioe.id_escola
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
AND ((p.cpf_cnpj IS NOT NULL
	AND ei.cpf IS NOT NULL
	AND p.cpf_cnpj = ei.cpf)
OR (trim(upper(retira_acentuacao(p.nome))) = trim(upper(retira_acentuacao(ei.nome)))
	AND trim(upper(retira_acentuacao(p.nome_mae))) = trim(upper(retira_acentuacao(ei.nome_mae)))
		AND p.data_nascimento = ei.data_nascimento))
AND ei.estudante_pre_matricula = FALSE) AS matriculaRedeOutraUnidade, ei.id_status = 9 AS estudanteEfetivado, ei.id_status = 5 AS estudanteCancelado, ei.bairro AS bairroEstudante, ei.estudante_pre_matricula AS estudantePreMatricula, ei.estudante_cadastro_reserva AS estudanteCadastroReserva, eioe.id_escola AS idEscola, cm.ano AS anoCalendario, s.id_serie AS idSerie, t.id_turno AS idTurno
FROM matricula.estudante_inscrito ei
JOIN matricula.estudante_inscrito_processamento eip ON
eip.id_estudante_inscrito = ei.id_estudante_inscrito
JOIN matricula.listagem_processamento_matricula lpm ON
lpm.id_listagem_processamento_matricula = eip.id_listagem_processamento_matricula
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = lpm.id_calendario_matricula
JOIN matricula.estudante_inscrito_opcao_escola eioe ON
eioe.id_estudante_inscrito_opcao_escola = eip.id_opcao_escola
JOIN matricula.status_estudante_inscrito sei ON
sei.id_status_estudante_inscrito = ei.id_status
JOIN matricula.vaga_serie vs ON
vs.id_vaga_serie = eioe.id_vaga_serie
JOIN basico.serie s ON
s.id_serie = vs.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
JOIN ensino.turno t ON
t.id_turno = vs.id_turno
JOIN escola.escola e ON
e.id_escola = eioe.id_escola
LEFT JOIN escola.bairro_escola be ON
be.id_bairro_escola = e.id_bairro_escola
LEFT JOIN escola.bairro_escola bea ON
bea.denominacao = ei.bairro
AND bea.id_municipio = e.id_municipio
LEFT JOIN escola.escola_bairros_atendidos eba ON
eba.id_bairro_escola = bea.id_bairro_escola
AND eba.id_escola = e.id_escola
WHERE cm.ano = 2026
AND ei.estudante_cadastro_reserva = TRUE
AND eioe.id_escola = 61348202
AND ei.nome ILIKE '%Alice Ramos Alves%'
AND ei.estudante_pre_matricula = FALSE
ORDER BY ei.DATA ASC ) ) AS consulta
WHERE TRUE OFFSET 0
LIMIT 50;

SELECT sq.posicao
FROM( ( SELECT ei.id_estudante_inscrito, ROW_NUMBER() OVER (PARTITION BY vs.id_vaga_serie
ORDER BY nome_escola, data_cadastro_original ASC, possui_irmao ASC, ordem_bairro ASC, is_bairro_escola DESC, nee DESC, possui_matricula_rede DESC, nome_escola, s.descricao, turno ) AS posicao
FROM matricula.estudante_inscrito ei
JOIN matricula.estudante_inscrito_processamento eip ON
eip.id_estudante_inscrito = ei.id_estudante_inscrito
JOIN matricula.estudante_inscrito_opcao_escola eioe ON
eioe.id_estudante_inscrito_opcao_escola = eip.id_opcao_escola
JOIN matricula.vaga_serie vs ON
vs.id_vaga_serie = eioe.id_vaga_serie
JOIN basico.serie s ON
s.id_serie = vs.id_serie
JOIN ensino.turno t ON
t.id_turno = vs.id_turno
JOIN escola.escola e ON
e.id_escola = eioe.id_escola
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = ei.id_calendario_matricula , LATERAL (SELECT e.nome AS nome_escola, s.descricao AS descricao, t.descricao AS turno, ei.data AS data_cadastro_original, ei.bairro AS bairro,(CASE WHEN (ei.bairro IS NULL
	OR ei.bairro = '') THEN 1
ELSE 0 END) AS ordem_bairro, EXISTS (SELECT 1
FROM escola.bairro_escola be_check
WHERE be_check.id_bairro_escola = e.id_bairro_escola
AND lower(unaccent(REPLACE(be_check.denominacao, ' ', ''))) = lower(unaccent(REPLACE(ei.bairro, ' ', '')))) AS is_bairro_escola, EXISTS (SELECT 1
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
WHERE mes.ano_calendario = cm.ano
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
	AND ((p.cpf_cnpj IS NOT NULL
		AND ei.cpf IS NOT NULL
		AND p.cpf_cnpj = ei.cpf)
	OR (trim(upper(retira_acentuacao(p.nome))) = ei.nome
		AND p.data_nascimento = ei.data_nascimento))) AS possui_matricula_rede ) AS criterios
WHERE cm.ano = 2026
AND eioe.id_escola = 61348202
AND vs.id_serie = 1005219
AND vs.id_turno = 1
AND ei.id_status IN ( 11, 12 )
	AND NOT EXISTS (SELECT 1
FROM matricula.historico_convocacao_cadastro_reserva hccr
WHERE hccr.id_estudante_inscrito = ei.id_estudante_inscrito
	AND hccr.tipo_convocacao = 2
	AND hccr.ativo)
	AND ei.estudante_pre_matricula = TRUE
	AND eioe.prioridade_pre_matricula = 1 )
UNION ALL ( SELECT ei.id_estudante_inscrito, ROW_NUMBER() OVER (PARTITION BY vs.id_vaga_serie
ORDER BY nome_escola, data_cadastro_original ASC, possui_irmao ASC, ordem_bairro ASC, is_bairro_escola DESC, nee DESC, possui_matricula_rede DESC, nome_escola, s.descricao, turno ) AS posicao
FROM matricula.estudante_inscrito ei
JOIN matricula.estudante_inscrito_processamento eip ON
eip.id_estudante_inscrito = ei.id_estudante_inscrito
JOIN matricula.estudante_inscrito_opcao_escola eioe ON
eioe.id_estudante_inscrito_opcao_escola = eip.id_opcao_escola
JOIN matricula.vaga_serie vs ON
vs.id_vaga_serie = eioe.id_vaga_serie
JOIN basico.serie s ON
s.id_serie = vs.id_serie
JOIN ensino.turno t ON
t.id_turno = vs.id_turno
JOIN escola.escola e ON
e.id_escola = eioe.id_escola
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = ei.id_calendario_matricula , LATERAL (SELECT e.nome AS nome_escola, s.descricao AS descricao, t.descricao AS turno, ei.data AS data_cadastro_original, ei.bairro AS bairro,(CASE WHEN (ei.bairro IS NULL
OR ei.bairro = '') THEN 1
ELSE 0 END) AS ordem_bairro, EXISTS (SELECT 1
FROM escola.bairro_escola be_check
WHERE be_check.id_bairro_escola = e.id_bairro_escola
AND lower(unaccent(REPLACE(be_check.denominacao, ' ', ''))) = lower(unaccent(REPLACE(ei.bairro, ' ', '')))) AS is_bairro_escola, EXISTS (SELECT 1
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
WHERE mes.ano_calendario = cm.ano
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
AND ((p.cpf_cnpj IS NOT NULL
	AND ei.cpf IS NOT NULL
	AND p.cpf_cnpj = ei.cpf)
OR (trim(upper(retira_acentuacao(p.nome))) = ei.nome
	AND p.data_nascimento = ei.data_nascimento))) AS possui_matricula_rede ) AS criterios
WHERE cm.ano = 2026
AND eioe.id_escola = 61348202
AND vs.id_serie = 1005219
AND vs.id_turno = 1
AND ei.id_status IN ( 11, 12 )
AND NOT EXISTS (SELECT 1
FROM matricula.historico_convocacao_cadastro_reserva hccr
WHERE hccr.id_estudante_inscrito = ei.id_estudante_inscrito
AND hccr.tipo_convocacao = 2
AND hccr.ativo)
AND ei.estudante_pre_matricula = FALSE ) ) AS sq
WHERE sq.id_estudante_inscrito = 84304593