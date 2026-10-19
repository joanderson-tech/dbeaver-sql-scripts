SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante = 973971
AND mes .ano_calendario = 2025;

SELECT mc.*
FROM ensino.matricula_componente mc
JOIN ensino.turma t ON t.id_turma = mc.id_turma 
WHERE mc.id_matricula_estudante_serie = 1321552;

SELECT *
FROM matricula.tipo_solicitacao_transferencia tst ;

SELECT *
FROM matricula.estudante_inscrito;

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie  = 52095088;

974837

WITH historicos_implantados AS( SELECT * FROM diario.historico_implantado WHERE id_estudante IN (973971) AND id_situacao_matricula IN ( 1, 2, 3, 4, 7, 8, 9, 10, 11, 12 ) ) SELECT DISTINCT 0 AS id_matricula_discente_serie, mc.id_matricula_componente AS id_matricula, d.id_discente AS id_discente, d.matricula AS matricula, mc.media_final AS media_final,(mc.media_final * 10)::INTEGER AS media_final_porcentagem, mc.numero_faltas AS numero_faltas, mc.avaliacao_por_conceito, mc.conceito_implantado,(SELECT qtd_faltas
FROM ensino.falta_unidade
WHERE id_matricula_componente = mc.id_matricula_componente
AND unidade = 1) AS faltas_1_unidade,(SELECT qtd_faltas
FROM ensino.falta_unidade
WHERE id_matricula_componente = mc.id_matricula_componente
AND unidade = 2) AS faltas_2_unidade, COALESCE(p.codigo_inep, 'Não informado') AS codigoInep, FALSE AS agrupadora, 0 AS id_turma_agrupadora, cc.nome AS disciplina, cc.id_componente_curricular AS id_disciplina, sm.descricao AS situacao, hi.carga_horaria AS ch_anual, FALSE AS possui_parte_diversificada, NULL AS tipo_diario_diversificado, nee.id_nivel_etapa_ensino , nee.denominacao AS nivel_etapa, eehi.denominacao AS etapa_ensino, eehi.id_etapa_ensino, eehi.eja_especial, hi.ano AS ano, hi.periodo, smsi.sigla AS situacao_serie_sigla, shi.id_serie AS id_serie, hi.id_serie_multisseriado AS id_serie_multisseriado,( SELECT string_agg(ss.id_serie::text, '@')
FROM basico.serie_equivalencia se
JOIN basico.serie ss ON
ss.id_serie = se.id_serie_equivalente
WHERE se.id_serie = shi.id_serie
AND ss.id_etapa_ensino IN ( 3, 4, 5 )
	AND ss.tipo_diario IS NOT NULL ) AS id_serie_equivalente, shi.descricao AS serie_descricao, turno.id_turno, turno.descricao AS turno_descricao, smsi.descricao AS situacao_serie, p.nome AS nome_discente , p.data_nascimento AS data_nascimento, p.nome_mae AS nome_mae, p.nome_pai AS nome_pai, p.codigo_nis AS nis, p.id_pais_nacionalidade AS id_pais, p.pais_nacionalidade AS nacionalidade, p.numero_identidade AS rg , mn.nome || ' - ' || uf.sigla AS unidade_federativa, ehi.nome AS nome_escola, ehi.endereco AS escola_endereco, ehi.numero AS escola_numero, ehi.id_escola AS id_escola, ehi.id_unidade_escola unidadeEsc, mun.nome AS escola_municipio, bairro.denominacao AS escola_bairro, ufEsc.sigla AS uf_escola, ce.id_calendario_escolar AS id_calendar, hi.dias_letivos AS dias_letivos, eees.id_escola_etapa_ensino_serie, hi.id_historico_implantado, hi.tipo_avaliacao, cha.descricao_parcial, cha.descricao_conclusiva, mc.frequencia AS frequencia, COALESCE(hi.nome_escola, ehi.nome) AS nome_escola_serie, turma.id_modulo, modulo.denominacao, 0, FALSE, COALESCE('Não informado', ehi.ato_criacao_descricao) AS ato_criacao_descricao, COALESCE('Não informado', to_char(ehi.ato_criacao_data, 'DD/MM/YYYY')) AS ato_criacao_data, COALESCE('Não informado', ehi.ato_criacao_doe_numero) AS ato_criacao_doe_numero, COALESCE('Não informado', to_char(ehi.ato_criacao_doe_data, 'DD/MM/YYYY')) AS ato_criacao_doe_data, COALESCE('Não informado', ehi.ato_autorizacao_descricao) AS ato_autorizacao_descricao, COALESCE('Não informado', to_char(ehi.ato_autorizacao_data, 'DD/MM/YYYY')) AS ato_autorizacao_data, COALESCE('Não informado', ehi.ato_autorizacao_doe_numero) AS ato_autorizacao_doe_numero, COALESCE('Não informado', to_char(ehi.ato_autorizacao_doe_data, 'DD/MM/YYYY')) AS ato_autorizacao_doe_data, COALESCE('Não informado', ehi.ato_reconhecimento_descricao) AS ato_reconhecimento_descricao, COALESCE('Não informado', to_char(ehi.ato_reconhecimento_data, 'DD/MM/YYYY')) AS ato_reconhecimento_data, COALESCE('Não informado', ehi.ato_reconhecimento_doe_numero) AS ato_reconhecimento_doe_numero, COALESCE('Não informado', to_char(ehi.ato_reconhecimento_doe_data, 'DD/MM/YYYY')) AS ato_reconhecimento_doe_data, COALESCE('Não informado', p.profissaoPai) AS profissaoPai, COALESCE('Não informado', p.profissaomae) AS profissaomae, CASE WHEN pne.id_pessoa IS NOT NULL THEN TRUE
ELSE FALSE END AS nee, shi.tipo_diario, mc.carga_horaria_implantada AS ch_componente, mc.parecer_descritivo_implantado AS parecer_descritivo_componente, CAST(NULL AS INTEGER) AS parecer_fixo_componente
FROM historicos_implantados hi
JOIN discente d ON
d.id_discente = hi.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
LEFT JOIN ensino.turno turno ON
turno.id_turno = hi.id_turno
LEFT JOIN basico.situacao_matricula_serie smsi ON
smsi.id_situacao_matricula_serie = hi.id_situacao_matricula
LEFT JOIN ensino.matricula_componente mc ON
mc.id_historico_implantado = hi.id_historico_implantado
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8, 4, 11 )
LEFT JOIN diario.competencia_habilidades_aluno cha ON
cha.id_historico_implantado = hi.id_historico_implantado
LEFT JOIN basico.serie shi ON
shi.id_serie = COALESCE(hi.id_serie_multisseriado, hi.id_serie)
LEFT JOIN basico.etapa_ensino eehi ON
eehi.id_etapa_ensino = shi.id_etapa_ensino
LEFT JOIN escola.escola ehi ON
ehi.id_escola = hi.id_escola
LEFT JOIN basico.estudante est ON
est.id_estudante = d.id_discente
LEFT JOIN comum.pessoa_necessidade_especial pne ON
pne.id_pessoa = d.id_pessoa
LEFT JOIN comum.unidade_federativa uf ON
uf.id_unidade_federativa = p.id_uf_naturalidade
LEFT JOIN comum.municipio mn ON
mn.id_municipio = p.id_municipio_naturalidade
LEFT JOIN ensino.turma turma ON
turma.id_turma = mc.id_turma
LEFT JOIN basico.turma_serie ts ON
ts.id_turma_serie = turma.id_turma_serie
LEFT JOIN comum.municipio mun ON
mun.id_municipio = ehi.id_municipio
LEFT JOIN escola.bairro_escola bairro ON
bairro.id_bairro_escola = ehi.id_bairro_escola
LEFT JOIN comum.unidade unidade ON
unidade.id_unidade = ehi.id_unidade_escola
LEFT JOIN basico.calendario_escolar ce ON
ce.ano = ts.ano
LEFT JOIN comum.unidade_federativa ufEsc ON
ufEsc.id_unidade_federativa = mun.id_unidade_federativa
LEFT JOIN basico.nivel_etapa_ensino nee ON
nee.id_nivel_etapa_ensino = eehi.id_nivel_etapa
LEFT JOIN basico.curriculo_basico cb ON
cb.id_curriculo_basico = ( SELECT scb.id_curriculo_basico
FROM basico.curriculo_basico scb
WHERE scb.id_serie = ts.id_serie
AND scb.ano_entrada_vigor <= ts.ano
AND (scb.id_turno = ts.id_turno
	OR scb.id_turno IS NULL)
ORDER BY scb.ano_entrada_vigor DESC, scb.ativo, scb.id_turno
LIMIT 1 )
LEFT JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = cb.id_curriculo_basico
AND CASE WHEN turma.id_modulo IS NOT NULL THEN cbc.id_modulo IS NULL
ELSE cbc.id_modulo = turma.id_modulo END
LEFT JOIN escola.escola_etapa_ensino_serie eees ON
eees.id_escola = ehi.id_escola
AND eees.id_serie = ts.id_serie
LEFT JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = mc.id_componente_curricular
LEFT JOIN ensino.situacao_matricula sm ON
sm.id_situacao_matricula = mc.id_situacao_matricula
AND sm.id_situacao_matricula IN ( 5, 6, 2, 8, 4, 11 )
LEFT JOIN basico.modulo modulo ON
modulo.id_modulo = turma.id_modulo
ORDER BY hi.ano DESC, nee.id_nivel_etapa_ensino, shi.id_serie, hi.periodo, turma.id_modulo, cc.nome;

SELECT 0, mc.id_matricula_componente AS id_matricula, d.id_discente AS id_discente, d.matricula AS matricula, COALESCE(hi.ano, ts.ano) AS ano, mc.media_final AS media_final, mc.numero_faltas AS numero_faltas, COALESCE(est.codigo_inep, 'Não informado') AS codigoInep, cc.nome AS disciplina, cc.id_componente_curricular AS id_disciplina, sm.descricao AS situacao, cb.carga_horaria AS ch_anual, cb.possui_parte_diversificada, COALESCE(neehi.id_nivel_etapa_ensino, nee.id_nivel_etapa_ensino) AS id_nivel_etapa_ensino , nee.denominacao AS nivel_etapa, CASE WHEN eehi.denominacao IS NULL THEN ee.denominacao
ELSE eehi.denominacao END AS etapa_ensino, CASE WHEN eehi.eja_especial IS NULL THEN ee.eja_especial
ELSE eehi.eja_especial END AS eja_especial, CASE WHEN shi.id_serie IS NULL THEN s.id_serie
ELSE shi.id_serie END AS id_serie,( SELECT string_agg(ss.id_serie::varchar, ',')
FROM basico.serie_equivalencia se
JOIN basico.serie ss ON
ss.id_serie = se.id_serie_equivalente
WHERE se.id_serie = COALESCE(hi.id_serie, s.id_serie)
	AND ss.id_etapa_ensino IN ( 3, 4, 5 )
		AND ss.tipo_diario IS NOT NULL) AS id_serie_equivalente, CASE WHEN shi.descricao IS NULL THEN s.descricao
ELSE shi.descricao END AS serie_descricao, 'Não informado' , p.nome AS nome_discente , p.data_nascimento AS data_nascimento, p.nome_mae AS nome_mae, p.nome_pai AS nome_pai, p.codigo_nis AS nis, p.pais_nacionalidade AS nacionalidade, p.numero_identidade AS rg , mn.nome || ' - ' || uf.sigla AS unidade_federativa, escola.nome AS nome_escola, escola.endereco AS escola_endereco, escola.numero AS escola_numero, escola.id_escola AS id_escola, escola.id_unidade_escola unidadeEsc, mun.nome AS escola_municipio, bairro.denominacao AS escola_bairro, ufEsc.sigla AS uf_escola, ce.id_calendario_escolar AS id_calendar,(SELECT sum(calEsc.dias_bim_1 + calEsc.dias_bim_2 + calEsc.dias_bim_3 + calEsc.dias_bim_4)
FROM basico.calendario_escolar calEsc
WHERE calEsc.id_calendario_escolar = ce.id_calendario_escolar ) AS dias_letivos, eees.id_escola_etapa_ensino_serie, 0, mc.frequencia AS frequencia, escola.nome AS nome_escola_serie, turno.id_turno, turno.descricao AS turno_descricao, turma.id_modulo, modulo.denominacao , 0, FALSE, COALESCE('Não informado', escola.ato_criacao_descricao) AS ato_criacao_descricao, COALESCE('Não informado', to_char(escola.ato_criacao_data, 'DD/MM/YYYY')) AS ato_criacao_data, COALESCE('Não informado', escola.ato_criacao_doe_numero) AS ato_criacao_doe_numero, COALESCE('Não informado', to_char(escola.ato_criacao_doe_data, 'DD/MM/YYYY')) AS ato_criacao_doe_data, COALESCE('Não informado', escola.ato_autorizacao_descricao) AS ato_autorizacao_descricao, COALESCE('Não informado', to_char(escola.ato_autorizacao_data, 'DD/MM/YYYY')) AS ato_autorizacao_data, COALESCE('Não informado', escola.ato_autorizacao_doe_numero) AS ato_autorizacao_doe_numero, COALESCE('Não informado', to_char(escola.ato_autorizacao_doe_data, 'DD/MM/YYYY')) AS ato_autorizacao_doe_data, COALESCE('Não informado', escola.ato_reconhecimento_descricao) AS ato_reconhecimento_descricao, COALESCE('Não informado', to_char(escola.ato_reconhecimento_data, 'DD/MM/YYYY')) AS ato_reconhecimento_data, COALESCE('Não informado', escola.ato_reconhecimento_doe_numero) AS ato_reconhecimento_doe_numero, COALESCE('Não informado', to_char(escola.ato_reconhecimento_doe_data, 'DD/MM/YYYY')) AS ato_reconhecimento_doe_data, COALESCE('Não informado', p.profissaoPai) AS profissaoPai, COALESCE('Não informado', p.profissaomae) AS profissaomae, CASE WHEN pne.id_pessoa IS NOT NULL THEN TRUE
ELSE FALSE END AS nee
FROM ensino.matricula_componente mc
LEFT JOIN discente d ON
d.id_discente = mc.id_discente
LEFT JOIN basico.estudante est ON
est.id_estudante = d.id_discente
LEFT JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
LEFT JOIN comum.pessoa_necessidade_especial pne ON
pne.id_pessoa = d.id_pessoa
LEFT JOIN comum.unidade_federativa uf ON
uf.id_unidade_federativa = p.id_uf_naturalidade
LEFT JOIN comum.municipio mn ON
mn.id_municipio = p.id_municipio_naturalidade
LEFT JOIN ensino.turma turma ON
turma.id_turma = mc.id_turma
LEFT JOIN basico.turma_serie ts ON
ts.id_turma_serie = turma.id_turma_serie
LEFT JOIN ensino.turno turno ON
turno.id_turno = ts.id_turno
LEFT JOIN escola.escola escola ON
escola.id_escola = ts.id_escola
LEFT JOIN diario.historico_implantado hi ON
hi.id_historico_implantado = mc.id_historico_implantado
LEFT JOIN basico.serie shi ON
shi.id_serie = hi.id_serie
LEFT JOIN basico.etapa_ensino eehi ON
eehi.id_etapa_ensino = shi.id_etapa_ensino
LEFT JOIN basico.nivel_etapa_ensino neehi ON
neehi.id_nivel_etapa_ensino = eehi.id_nivel_etapa
LEFT JOIN escola.escola ehi ON
ehi.id_escola = ts.id_escola
LEFT JOIN comum.municipio mun ON
mun.id_municipio = escola.id_municipio
LEFT JOIN escola.bairro_escola bairro ON
bairro.id_bairro_escola = escola.id_bairro_escola
LEFT JOIN comum.unidade unidade ON
unidade.id_unidade = escola.id_unidade_escola
LEFT JOIN basico.calendario_escolar ce ON
ce.ano = ts.ano
LEFT JOIN comum.unidade_federativa ufEsc ON
ufEsc.id_unidade_federativa = mun.id_unidade_federativa
LEFT JOIN basico.serie s ON
s.id_serie = ts.id_serie
LEFT JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
LEFT JOIN basico.nivel_etapa_ensino nee ON
nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
LEFT JOIN basico.curriculo_basico cb ON
cb.id_serie = ts.id_serie
AND cb.ativo = TRUE
AND CASE WHEN ts.id_turno = 5 THEN cb.id_turno = ts.id_turno
ELSE cb.id_turno IS NULL END
LEFT JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = cb.id_curriculo_basico
AND CASE WHEN turma.id_modulo IS NOT NULL THEN cbc.id_modulo IS NULL
ELSE cbc.id_modulo = turma.id_modulo END
LEFT JOIN escola.escola_etapa_ensino_serie eees ON
eees.id_escola = escola.id_escola
AND eees.id_serie = ts.id_serie
LEFT JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = mc.id_componente_curricular
LEFT JOIN ensino.situacao_matricula sm ON
sm.id_situacao_matricula = mc.id_situacao_matricula
LEFT JOIN basico.modulo modulo ON
modulo.id_modulo = turma.id_modulo
WHERE mc.id_discente = 973971
AND ts.progressao_parcial = TRUE
AND mc.id_situacao_matricula IN ( 5, 2, 6 )
ORDER BY 13, 17, 5 DESC, 40;

973971



 WITH ultimaMatriculaEscola AS ( SELECT mes.*
FROM basico.matricula_estudante_serie mes
JOIN escola.escola_etapa_ensino_serie ee ON
ee.id_escola_etapa_ensino_serie = mes.id_serie_escola
WHERE mes.id_estudante IN (973971)
	AND ee.id_escola = 2054
	AND mes.id_situacao_matricula_serie NOT IN ( 5, 9 )
ORDER BY mes.ano_calendario DESC, mes.data_cadastro DESC, mes.id_situacao_matricula_serie DESC
LIMIT 1 ) SELECT *
FROM( SELECT et.denominacao AS etapa, et.id_nivel_etapa, s.id_serie, s.descricao AS serie, mes.ano_calendario AS ano, escola.id_escola, escola.nome AS escola, mun.nome AS municipio, uf.sigla AS uf, mee.id_tipo_sol_transferencia, sms.id_situacao_matricula_serie, sms.descricao AS situacao, p.nome AS estudante, s.final_etapa, CASE WHEN s.final_etapa
	AND sms.id_situacao_matricula_serie IN ( 2, 7 ) THEN TRUE
	ELSE FALSE END AS aprovado, mes.id_serie_multisseriado, sm.descricao AS serie_multisseriado, TO_CHAR(mee.data, 'DD/MM/YYYY') AS data_transferencia, t.descricao AS turno, mes.data_cadastro
FROM basico.matricula_estudante_serie mes
JOIN escola.escola_etapa_ensino_serie eees ON
	eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
JOIN basico.situacao_matricula_serie sms ON
	sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
LEFT JOIN escola.escola escola ON
	escola.id_escola = eees.id_escola
LEFT JOIN comum.municipio mun ON
	mun.id_municipio = escola.id_municipio
LEFT JOIN comum.unidade_federativa uf ON
	uf.id_unidade_federativa = mun.id_unidade_federativa
LEFT JOIN basico.serie s ON
	s.id_serie = eees.id_serie
LEFT JOIN basico.etapa_ensino et
		USING (id_etapa_ensino)
LEFT JOIN discente d ON
	d.id_discente = mes.id_estudante
LEFT JOIN comum.pessoa p ON
	p.id_pessoa = d.id_pessoa
LEFT JOIN basico.serie sm ON
	sm.id_serie = mes.id_serie_multisseriado
LEFT JOIN ensino.turno t ON
	t.id_turno = mes.id_turno
LEFT JOIN (SELECT mee.id_matricula_estudante_serie, mee.id_tipo_sol_transferencia, MAX(mee.data) AS DATA
FROM matricula.movimentacao_estudante_escola mee
JOIN basico.matricula_estudante_serie mes ON
	mes.id_matricula_discente_serie = mee.id_matricula_estudante_serie
WHERE mes.id_situacao_matricula_serie = 6
GROUP BY mee.id_matricula_estudante_serie, mee.id_tipo_sol_transferencia ) mee ON
	mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
WHERE mes.id_estudante IN (973971)
		AND sms.id_situacao_matricula_serie NOT IN ( 5, 9 )
			AND mes.ano_calendario <= 2025
			AND (SELECT CASE WHEN COALESCE(mes.data_matricula_turma, mes.data_cadastro) IS NULL
				OR COALESCE(ume.data_matricula_turma, ume.data_cadastro) IS NULL THEN mes.ano_calendario <= ume.ano_calendario
				ELSE COALESCE(mes.data_matricula_turma, mes.data_cadastro) <= COALESCE(ume.data_matricula_turma, ume.data_cadastro) END
			FROM ultimaMatriculaEscola ume)
			AND NOT EXISTS ( SELECT 1
		FROM diario.historico_implantado hi2
		WHERE hi2.id_estudante = mes.id_estudante
			AND hi2.ano = mes.ano_calendario
			AND hi2.id_situacao_matricula <> 5
			AND hi2.id_serie = eees.id_serie )
	UNION SELECT et.denominacao, et.id_nivel_etapa, s.id_serie, s.descricao AS serie, hi.ano, CASE WHEN escola.id_escola IS NULL THEN hi.id_escola
		ELSE escola.id_escola END, CASE WHEN escola.nome IS NULL THEN hi.nome_escola
		ELSE escola.nome END, CASE WHEN mun.nome IS NULL THEN hi.nome_municipio
		ELSE mun.nome END, CASE WHEN uf.sigla IS NULL THEN hi.nome_uf
		ELSE uf.sigla END, NULL, sms.id_situacao_matricula_serie, sms.descricao, p.nome AS estudante , s.final_etapa, CASE WHEN s.final_etapa
		AND sms.id_situacao_matricula_serie IN ( 2, 7 ) THEN TRUE
		ELSE FALSE END AS aprovado, hi.id_serie_multisseriado, sm.descricao AS serie_multisseriado, NULL AS data_transferencia, tn.descricao AS turno, NULL AS data_cadastro
	FROM diario.historico_implantado hi
	JOIN basico.situacao_matricula_serie sms ON
		sms.id_situacao_matricula_serie = hi.id_situacao_matricula
	LEFT JOIN escola.escola escola ON
		escola.id_escola = hi.id_escola
	LEFT JOIN comum.municipio mun ON
		mun.id_municipio = escola.id_municipio
	LEFT JOIN comum.unidade_federativa uf ON
		uf.id_unidade_federativa = mun.id_unidade_federativa
	LEFT JOIN basico.serie s ON
		s.id_serie = hi.id_serie
	LEFT JOIN basico.etapa_ensino et
			USING (id_etapa_ensino)
	LEFT JOIN discente d ON
		d.id_discente = hi.id_estudante
	LEFT JOIN comum.pessoa p ON
		p.id_pessoa = d.id_pessoa
	LEFT JOIN basico.serie sm ON
		sm.id_serie = hi.id_serie_multisseriado
	LEFT JOIN ensino.turno tn ON
		tn.id_turno = hi.id_turno
	WHERE hi.id_estudante IN (973971)
			AND hi.id_situacao_matricula IN ( 2, 3, 1, 7, 8, 10,-1, 12 ) ) AS registros
ORDER BY registros.ano, registros.serie, data_transferencia::date, data_cadastro