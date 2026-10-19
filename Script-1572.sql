SELECT *
FROM( SELECT DISTINCT ON
(ei.id_estudante_inscrito, ei.numero_inscricao, e.nome, serie.descricao, turno.descricao) ei.numero_inscricao AS numero_solicitacao, ei.nome AS estudante, ei.data_nascimento, CASE WHEN ei.nee THEN 'SIM'
ELSE 'NÃO' END AS nee, CASE WHEN ei.participa_bolsa_familia THEN 'SIM'
ELSE 'NÃO' END AS participa_bolsa_familia, CASE WHEN ei.tem_irmao THEN 'SIM'
ELSE 'NÃO' END AS possui_irmao_escola, e.nome AS escola, 'MATRÍCULA' AS tipo, tov.denominacao AS tipo_ocupacao_vaga, s.denominacao AS descricao_solicitacao, ei.id_estudante_inscrito AS id_solicitacao, ei.nome_mae AS nome_mae_solicitante, ei.cpf AS cpf_solicitante, CAST(ei.cpf_responsavel AS TEXT) AS cpf_responsavel, ei.motivo_cancelamento AS motivo_cancelamento, serie.descricao AS serie, etapa.denominacao AS etapa, turno.descricao AS turno, l.id_tipo_ocupacao_vaga AS id_tipo_ocupacao_vaga, CASE WHEN (eip.id_opcao_escola = eio.id_estudante_inscrito_opcao_escola
	AND eip.id_status NOT IN (5, 8)) THEN 'SELECIONADO'
WHEN eip.id_estudante_inscrito_processamento IS NULL THEN CASE WHEN s.id_status_estudante_inscrito NOT IN (2, 5, 8) THEN 'AGUARDANDO PROCESSAMENTO'
ELSE 'NÃO SELECIONADO' END
ELSE 'NÃO SELECIONADO' END AS descricao_situacao_opcao,(eip.id_opcao_escola = eio.id_estudante_inscrito_opcao_escola
	AND eip.id_status NOT IN (5, 8)) AS selecionada, eio.ordem
FROM matricula.estudante_inscrito ei
LEFT JOIN matricula.estudante_inscrito_processamento eip ON
eip.id_estudante_inscrito = ei.id_estudante_inscrito
AND (ei.id_status <> 7
	OR ei.id_status = 7
	AND eip.id_status = 4)
LEFT JOIN matricula.listagem_processamento_matricula l
	USING(id_listagem_processamento_matricula)
LEFT JOIN matricula.tipo_ocupacao_vaga tov
	USING(id_tipo_ocupacao_vaga)
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = ei.id_calendario_matricula
JOIN matricula.estudante_inscrito_opcao_escola eio ON
eio.id_estudante_inscrito = ei.id_estudante_inscrito
AND COALESCE(eio.prioridade_pre_matricula, eio.ordem) = 1
JOIN escola.escola e ON
e.id_escola = eio.id_escola
JOIN matricula.vaga_serie vg
	USING(id_vaga_serie)
JOIN basico.serie serie
	USING(id_serie)
JOIN basico.etapa_ensino etapa
	USING(id_etapa_ensino)
JOIN ensino.turno turno
	USING(id_turno)
JOIN matricula.status_estudante_inscrito s ON
s.id_status_estudante_inscrito = ei.id_status
JOIN comum.unidade u ON
u.id_unidade = e.id_regional_ensino
LEFT JOIN comum.municipio m ON
u.id_municipio = m.id_municipio
WHERE 1 = 1
AND cm.ano = 2026
AND upper(ei.nome) LIKE UPPER('%MARIA ALICE SANTOS%')
UNION SELECT DISTINCT ON
(st.id_solicitacao_transferencia, st.numero, e.nome, serie.descricao, turno.descricao) st.numero AS numero_solicitacao, p.nome AS estudante, p.data_nascimento, CASE WHEN (SELECT COUNT (*)
FROM comum.pessoa_necessidade_especial
WHERE id_pessoa = p.id_pessoa) > 0 THEN 'SIM'
ELSE 'NÃO' END AS nee, CASE WHEN estudante.participa_bolsa_familia THEN 'SIM'
ELSE 'NÃO' END AS participa_bolsa_familia, '-' AS possui_irmao_escola, e.nome AS escola, 'TRANSFERÊNCIA' AS tipo, tov.denominacao AS tipo_ocupacao_vaga, s.denominacao AS descricao_situacao, st.id_solicitacao_transferencia AS id_solicitacao, p.nome_mae AS nome_mae_solicitante, p.cpf_cnpj AS cpf_solicitante, p.numero_documento_responsavel_matricula AS cpf_responsavel, st.observacoes_analise AS motivo_cancelamento, serie.descricao AS serie, etapa.denominacao AS etapa, turno.descricao AS turno, l.id_tipo_ocupacao_vaga AS id_tipo_ocupacaoVaga, CASE WHEN stp.id_opcao_escola = sto.id_solicitacao_transferencia_opcao_escola THEN 'SELECIONADA'
WHEN stp.id_solicitacao_transferencia_processamento IS NULL THEN CASE WHEN s.id_status_solicitacao_transferencia NOT IN (3, 6, 7) THEN 'AGUARDANDO PROCESSAMENTO'
ELSE 'NÃO SELECIONADO' END
ELSE 'NÃO SELECIONADO' END AS descricao_situacao_opcao, stp.id_opcao_escola = sto.id_solicitacao_transferencia_opcao_escola AS selecionada, sto.ordem
FROM matricula.solicitacao_transferencia st
LEFT JOIN matricula.solicitacao_transferencia_processamento stp
USING(id_solicitacao_transferencia)
LEFT JOIN matricula.listagem_solicitacao_transferencia_processamento l
USING(id_listagem_solicitacao_transferencia_processamento)
LEFT JOIN matricula.tipo_ocupacao_vaga tov
USING(id_tipo_ocupacao_vaga)
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = st.id_calendario_matricula
JOIN matricula.solicitacao_transferencia_opcao_escola sto ON
sto.id_solicitacao = st.id_solicitacao_transferencia
JOIN escola.escola e ON
e.id_escola = sto.id_escola
JOIN basico.serie serie
USING(id_serie)
JOIN basico.etapa_ensino etapa
USING(id_etapa_ensino)
JOIN ensino.turno turno
USING(id_turno)
JOIN basico.matricula_estudante_serie mes
USING(id_matricula_discente_serie)
JOIN discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p
USING(id_pessoa)
JOIN matricula.status_solicitacao_transferencia s ON
s.id_status_solicitacao_transferencia = st.id_status
JOIN comum.unidade u ON
u.id_unidade = e.id_regional_ensino
LEFT JOIN comum.municipio m ON
u.id_municipio = m.id_municipio
JOIN basico.estudante estudante ON
estudante.id_estudante = d.id_discente
WHERE 1 = 1
AND cm.ano = 2026
AND UPPER(p.nome) LIKE UPPER('%MARIA ALICE SANTOS%')
UNION SELECT DISTINCT ON
(rm.id_renovacao_matricula, rm.numero_renovacao, e.nome, serie.descricao, turno.descricao) rm.numero_renovacao AS numero_solicitacao, p.nome AS estudante, p.data_nascimento, CASE WHEN rm.nee THEN 'SIM'
ELSE 'NÃO' END AS nee, CASE WHEN estudante.participa_bolsa_familia THEN 'SIM'
ELSE 'NÃO' END AS participa_bolsa_familia, '-' AS possui_irmao_escola, e.nome AS escola, 'RENOVAÇÃO' AS tipo, tov.denominacao AS tipo_ocupacao_vaga, CASE WHEN id_registro_cancelamento IS NOT NULL THEN 'CANCELADA'
WHEN rmr.id_vaga_serie_concedida IS NOT NULL THEN 'EFETIVADA'
WHEN rmr.id_renovacao_matricula_resultado IS NOT NULL THEN 'PROCESSADA'
ELSE 'AGUARDANDO PROCESSAMENTO' END AS descricao_situacao, rm.id_renovacao_matricula AS id_solicitacao, p.nome_mae AS nome_mae_solicitante, p.cpf_cnpj AS cpf_solicitante, p.numero_documento_responsavel_matricula AS cpf_responsavel, '' AS motivo_cancelamento, serie.descricao AS serie, etapa.denominacao AS etapa, turno.descricao AS turno, l.id_tipo_ocupacao_vaga AS id_tipo_ocupacao_vaga, CASE WHEN rmr.id_vaga_serie_concedida IS NOT NULL THEN 'SELECIONADO'
WHEN rmr.id_renovacao_matricula_resultado IS NULL THEN 'AGUARDANDO PROCESSAMENTO'
ELSE 'NÃO SELECIONADO' END AS descricao_situacao_opcao, rmr.id_vaga_serie_concedida IS NOT NULL AS selecionada, 1 AS ordem
FROM matricula.renovacao_matricula rm
LEFT JOIN matricula.renovacao_matricula_resultado rmr
USING (id_renovacao_matricula)
LEFT JOIN matricula.listagem_processamento_renovacao_matricula l
USING (id_listagem_processamento_renovacao_matricula)
LEFT JOIN matricula.tipo_ocupacao_vaga tov
USING (id_tipo_ocupacao_vaga)
JOIN escola.escola e ON
e.id_escola = rm.id_escola
JOIN basico.serie serie
USING (id_serie)
JOIN basico.etapa_ensino etapa
USING (id_etapa_ensino)
JOIN matricula.vaga_serie vg
USING (id_vaga_serie)
JOIN ensino.turno turno
USING (id_turno)
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = rm.id_calendario_matricula
JOIN discente d
USING (id_discente)
JOIN comum.pessoa p
USING (id_pessoa)
JOIN comum.unidade u ON
u.id_unidade = e.id_regional_ensino
LEFT JOIN comum.municipio m ON
u.id_municipio = m.id_municipio
JOIN basico.estudante estudante ON
estudante.id_estudante = d.id_discente
WHERE 1 = 1
AND cm.ano = 2026
AND UPPER(p.nome) LIKE UPPER('%MARIA ALICE SANTOS%') ) s
ORDER BY s.ordem