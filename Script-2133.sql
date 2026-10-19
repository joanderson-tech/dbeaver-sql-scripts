WITH matriculas_estudante AS ( SELECT *
FROM basico.matricula_estudante_serie smes
JOIN escola.escola_etapa_ensino_serie eees3 ON
eees3.id_escola_etapa_ensino_serie = smes.id_serie_escola
JOIN basico.serie s ON
s.id_serie = eees3.id_serie
WHERE id_estudante IN (973695)
AND smes.id_situacao_matricula_serie IN ( 1, 2, 3, 4, 7, 8, 9, 10, 11, 12, 6 )
AND NOT (s.multisseriada
	AND smes.id_serie_multisseriado IS NULL
	AND smes.id_situacao_matricula_serie = 6)
AND (smes.ano_calendario < 2025
	OR ( (eees3.id_escola = 2067
		OR smes.id_situacao_matricula_serie = 12 )
	AND smes.ano_calendario = 2025)) ) SELECT DISTINCT mes.id_matricula_discente_serie, mc.id_matricula_componente AS id_matricula, d.id_discente AS id_discente, d.matricula AS matricula, mes.ano_calendario AS ano, turno.id_turno, turno.descricao AS turno_descricao, CASE mes.id_situacao_matricula_serie WHEN 12 THEN CAST(saec.resultado_avaliacao_nota AS NUMERIC(5, 2))
ELSE mc.media_final END AS media_final,(mc.media_final * 10)::INTEGER AS media_final_porcentagem, mc.numero_faltas AS numero_faltas, COALESCE(p.codigo_inep, 'Não informado') AS codigoInep, cc.nome AS disciplina, cc.id_componente_curricular AS id_disciplina, turma.id_turma, turma.periodo AS periodo, CASE WHEN EXISTS (SELECT *
FROM ensino.turma tt1
WHERE tt1.id_turma_serie = turma.id_turma_serie
AND tt1.id_situacao_turma <> 4
AND tt1.id_disciplina = turma.id_disciplina
AND tt1.periodo <> turma.periodo) THEN TRUE
ELSE FALSE END AS tem_turma_outro_bloco,(CASE WHEN cbc.id_curriculo_basico IS NOT NULL
	AND cb_ts.possui_parte_diversificada
	AND cbc.id_categoria_componente = 2 THEN cb_ts.tipo_diario_diversificado
	ELSE COALESCE(ts.tipo_diario, s.tipo_diario) END) AS tipo_diario, sm.descricao AS situacao, cb_ts.carga_horaria AS ch_anual, cb_ts.possui_parte_diversificada, cb_ts.tipo_diario_diversificado, nee.id_nivel_etapa_ensino , nee.denominacao AS nivel_etapa, ee.denominacao AS etapa_ensino, ee.id_etapa_ensino, ee.id_modalidade, ee.eja_especial, s.id_serie AS id_serie,(SELECT string_agg(ss.id_serie::text, '@')
FROM basico.serie_equivalencia se
JOIN basico.serie ss ON
ss.id_serie = se.id_serie_equivalente
WHERE se.id_serie = s.id_serie
AND ss.id_etapa_ensino IN ( 3, 4, 5, 9, 10, 51900263, 51900264, 52079587, 52095367 )
	AND ss.tipo_diario IS NOT NULL ) AS id_serie_equivalente, s.descricao AS serie_descricao, sms.descricao AS situacao_serie, sms.sigla AS situacao_serie_sigla, p.nome AS nome_discente, p.nome_social AS nome_social, p.data_nascimento AS data_nascimento, p.nome_mae AS nome_mae, p.nome_pai AS nome_pai, p.codigo_nis AS nis, p.id_pais_nacionalidade AS id_pais, p.pais_nacionalidade AS nacionalidade, p.numero_identidade AS rg , mn.nome || ' - ' || uf.sigla AS unidade_federativa, escola.nome AS nome_escola, escola.codigo_inep, escola.endereco AS escola_endereco, escola.numero AS escola_numero, escola.id_escola AS id_escola, escola.id_unidade_escola unidadeEsc, escola.telefone AS telefone_escola, escola.email AS email_escola, escola.codigo_cadastro_escolar AS codigo_cadastro_escolar, mun.nome AS escola_municipio, bairro.denominacao AS escola_bairro, ufEsc.sigla AS uf_escola, ce.id_calendario_escolar AS id_calendar, CASE WHEN ee.periodicidade_etapa = 'SEMESTRAL' THEN (SELECT CASE WHEN turma.periodo = 2 THEN calEsc.dias_sem_2
ELSE calEsc.dias_sem_1 END
FROM basico.calendario_escolar calEsc
WHERE calEsc.id_calendario_escolar = ce.id_calendario_escolar)
ELSE (SELECT sum(calEsc.dias_bim_1 + calEsc.dias_bim_2 + calEsc.dias_bim_3 + calEsc.dias_bim_4)
FROM basico.calendario_escolar calEsc
WHERE calEsc.id_calendario_escolar = ce.id_calendario_escolar) END AS dias_letivos, eees.id_escola_etapa_ensino_serie, NULL AS id_historico_implantado, CASE WHEN (CASE WHEN cbc.id_curriculo_basico IS NOT NULL
	AND cb_ts.possui_parte_diversificada
	AND cbc.id_categoria_componente = 2 THEN cb_ts.tipo_diario_diversificado
	ELSE COALESCE(ts.tipo_diario, s.tipo_diario) END) IN (20, 31, 24, 34, 54) THEN 'R'
WHEN (CASE WHEN cbc.id_curriculo_basico IS NOT NULL
	AND cb_ts.possui_parte_diversificada
	AND cbc.id_categoria_componente = 2 THEN cb_ts.tipo_diario_diversificado
	ELSE COALESCE(ts.tipo_diario, s.tipo_diario) END) IN (1, 35) THEN 'C'
ELSE 'N' END AS tipo_avaliacao, CASE WHEN turma.id_turma_agrupadora IS NOT NULL THEN (SELECT macs.frequencia
FROM ensino.matricula_componente macs
WHERE macs.id_discente = mc.id_discente
AND macs.id_turma = turma.id_turma_agrupadora
AND macs.id_situacao_matricula IN (5, 6, 2, 8))
ELSE mc.frequencia END AS frequencia, escola.nome AS nome_escola_serie, turma.agrupadora, turma.id_turma_agrupadora, turma.id_modulo, modulo.denominacao, mcPP.id_matricula_componente AS id_matricula_progressao, CASE WHEN mcPP.id_matricula_componente IS NULL THEN FALSE
ELSE TRUE END AS isProgressao, COALESCE(escola.ato_criacao_descricao, 'Não informado') AS ato_criacao_descricao, COALESCE(to_char(escola.ato_criacao_data, 'DD/MM/YYYY'), 'Não informado') AS ato_criacao_data, COALESCE(escola.ato_criacao_doe_numero, 'Não informado') AS ato_criacao_doe_numero, COALESCE(to_char(escola.ato_criacao_doe_data, 'DD/MM/YYYY'), 'Não informado') AS ato_criacao_doe_data, COALESCE(escola.ato_autorizacao_descricao, 'Não informado') AS ato_autorizacao_descricao, COALESCE(to_char(escola.ato_autorizacao_data, 'DD/MM/YYYY'), 'Não informado') AS ato_autorizacao_data, COALESCE(escola.ato_autorizacao_doe_numero, 'Não informado') AS ato_autorizacao_doe_numero, COALESCE(to_char(escola.ato_autorizacao_doe_data, 'DD/MM/YYYY'), 'Não informado') AS ato_autorizacao_doe_data, COALESCE(escola.ato_reconhecimento_descricao, 'Não informado') AS ato_reconhecimento_descricao, COALESCE(to_char(escola.ato_reconhecimento_data, 'DD/MM/YYYY'), 'Não informado') AS ato_reconhecimento_data, COALESCE(escola.ato_reconhecimento_doe_numero, 'Não informado') AS ato_reconhecimento_doe_numero, COALESCE(to_char(escola.ato_reconhecimento_doe_data, 'DD/MM/YYYY'), 'Não informado') AS ato_reconhecimento_doe_data, COALESCE(p.profissaoPai, 'Não informado') AS profissaoPai, COALESCE(p.profissaomae, 'Não informado') AS profissaomae, CASE WHEN pne.id_pessoa IS NOT NULL THEN TRUE
ELSE FALSE END AS nee, p.cpf_cnpj, dired.nome AS dired, mun.nome || ' - ' || ufEsc.sigla AS unidade_federativa_escola, CASE WHEN mc.id_situacao_matricula = 11 THEN TRUE END AS nao_matriculado, CASE WHEN mc.id_situacao_matricula = 11 THEN 'AVE' END AS sigla_nao_matriculado, mc.nao_optou, cbc.ch_ano AS ch_componente, rac.parecer_final_descritivo AS parecer_descritivo_componente, rac.parecer_final_fixo AS parecer_fixo_componente
FROM matriculas_estudante mes
JOIN discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
LEFT JOIN basico.turma_serie ts ON
ts.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
LEFT JOIN basico.curriculo_basico cb_ts ON
cb_ts.id_curriculo_basico = ts.id_curriculo_medio
JOIN escola.escola_etapa_ensino_serie eees2 ON
eees2.id_escola_etapa_ensino_serie = mes.id_serie_escola
LEFT JOIN ensino.matricula_componente mc ON
mc.id_discente = mes.id_estudante
AND (mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	OR mc.id_matricula_estudante_serie IS NULL)
AND mc.ano = mes.ano_calendario
AND mc.id_situacao_matricula NOT IN ( 3, 7 )
LEFT JOIN basico.serie shi ON
shi.id_serie = eees2.id_serie
LEFT JOIN basico.etapa_ensino eehi ON
eehi.id_etapa_ensino = shi.id_etapa_ensino
LEFT JOIN escola.escola ehi ON
ehi.id_escola = eees2.id_escola
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
LEFT JOIN diario.competencia_habilidades_aluno cha ON
cha.id_discente = d.id_discente
AND (cha.id_turma = turma.id_turma
	OR cha.id_turma = turma.id_turma_agrupadora)
LEFT JOIN ensino.turno turno ON
turno.id_turno = mes.id_turno
LEFT JOIN escola.escola escola ON
escola.id_escola = eees2.id_escola
LEFT JOIN comum.municipio mun ON
mun.id_municipio = escola.id_municipio
LEFT JOIN escola.bairro_escola bairro ON
bairro.id_bairro_escola = escola.id_bairro_escola
LEFT JOIN comum.unidade unidade ON
unidade.id_unidade = escola.id_unidade_escola
LEFT JOIN comum.unidade dired ON
dired.id_unidade = escola.id_regional_ensino
LEFT JOIN basico.calendario_escolar ce ON
ce.ano = ts.ano
AND ce.ativo
LEFT JOIN comum.unidade_federativa ufEsc ON
ufEsc.id_unidade_federativa = mun.id_unidade_federativa
LEFT JOIN basico.serie s ON
s.id_serie = COALESCE(mes.id_serie_multisseriado, ts.id_serie)
LEFT JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
LEFT JOIN basico.nivel_etapa_ensino nee ON
nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
LEFT JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = cb_ts.id_curriculo_basico
AND cbc.id_componente_curricular = mc.id_componente_curricular
LEFT JOIN escola.escola_etapa_ensino_serie eees ON
eees.id_escola = escola.id_escola
AND eees.id_serie = ts.id_serie
JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
LEFT JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = mc.id_componente_curricular
JOIN ensino.situacao_matricula sm ON
sm.id_situacao_matricula = mc.id_situacao_matricula
AND (sm.id_situacao_matricula IN ( 5, 6, 2, 8, 4, 11 )
	OR sm.id_situacao_matricula = 9)
LEFT JOIN basico.modulo modulo ON
modulo.id_modulo = turma.id_modulo
LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON
ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
LEFT JOIN ensino_infantil.configuracao_relatorio cr ON
cr.id_configuracao_relatorio = ra.id_configuracao_relatorio
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio = cr.id_configuracao_relatorio
AND crc.id_componente_curricular = mc.id_componente_curricular
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
AND rac.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente
AND rac.id_situacao_relatorio_avaliativo_componente <> 4
LEFT JOIN ensino.matricula_componente mcPP ON
mcPP.id_discente = mes.id_estudante
AND mcPP.ano = mes.ano_calendario
AND mcPP.id_turma IN  
					 (SELECT id_turma
FROM ensino.matricula_componente mcSub
JOIN ensino.turma tSub
	USING (id_turma)
WHERE tSub.tipo = 5
AND tSub.ano = mes.ano_calendario
AND mcSub.id_discente = mes.id_estudante
AND mcSub.id_situacao_matricula <> 7
AND turma.id_disciplina = tSub.id_disciplina)
LEFT JOIN diario.aproveitamento apr ON
apr.id_aproveitamento = mc.id_aproveitamento
LEFT JOIN ensino.solicitacao_avanco_estudo sae ON
sae.id_matricula_discente_serie_origem = mes.id_matricula_discente_serie
AND sae.id_status_solicitacao_avanco_estudo = 7
LEFT JOIN ensino.solicitacao_avanco_estudo_componente saec ON
saec.id_solicitacao_avanco_estudo = sae.id_solicitacao_avanco_estudo
AND saec.id_componente_curricular = mc.id_componente_curricular
WHERE mc.id_turma IN (SELECT id_turma
FROM ensino.turma t
WHERE id_situacao_turma <> 4
AND t.id_turma_serie = ts.id_turma_serie)
AND nee.id_nivel_etapa_ensino <> 51918782
ORDER BY mes.ano_calendario ASC, nee.id_nivel_etapa_ensino, s.id_serie, periodo DESC, sms.descricao, turma.id_modulo DESC, cc.nome 





{nacionalidade = BRASILEIRA, cpf_cnpj = 70933518404, profissaomae = AGRICULTOR, 
codigoinep = 151994777493, id_matricula_progressao = NULL, agrupadora = FALSE,
id_escola_etapa_ensino_serie = 51873043, id_matricula = 17092491, id_modulo = NULL,
media_final = 8.00, frequencia = 95.3, email_escola =, turno_descricao = INTEGRAL I,
nome_pai = ARTUR WANDERLEY FERNANDES, numero_faltas = 0, id_etapa_ensino = 3, profissaopai = AGRICULTORA,
unidade_federativa = LAJES - RN, ano = 2025, escola_numero = SN, situacao = APROVADO, parecer_descritivo_componente = NULL, 
periodo = 1, ato_autorizacao_data = Não informado, id_turma = 688122, nome_escola = EM PROFESSORA MARTA BEZERRA DE MEDEIROS,
codigo_cadastro_escolar =, data_nascimento = 2014-04-03, tipo_avaliacao = N, unidadeesc = 3065, nao_matriculado = NULL,
id_discente = 973695, ato_criacao_doe_numero =, id_pais = 31, id_turno = 523691930, ato_reconhecimento_doe_numero =, id_historico_implantado = NULL,
nome_mae = MARIA DA CONCEIÇÃO DOS SANTOS, id_turma_agrupadora = 688114, id_modalidade = 1, parecer_fixo_componente = NULL, media_final_porcentagem = 80,
ato_reconhecimento_descricao =, ato_autorizacao_doe_data = 05 / 01 / 1990, eja_especial = FALSE, sigla_nao_matriculado = NULL, dired = Regional Única de Ensino, 
ato_reconhecimento_data = Não informado, ato_criacao_descricao = N° 338, disciplina = Ensino Religioso, unidade_federativa_escola = LAJES - RN, id_serie = 1005222, 
possui_parte_diversificada = FALSE, escola_municipio = LAJES, rg = 003585325, nivel_etapa = ENSINO FUNDAMENTAL 1  ANOS INICIAIS, dias_letivos = 200, 
serie_descricao = 5 º Ano, denominacao = NULL, escola_endereco = RUA TABELIAO JOAO MOREIRA GOMES, nao_optou = FALSE, id_serie_equivalente = 15289982, 
ch_componente = 40, tipo_diario_diversificado = 31, id_nivel_etapa_ensino = 1, nee = FALSE, id_matricula_discente_serie = 1324812, 
id_disciplina = 230, nome_escola_serie = EM PROFESSORA MARTA BEZERRA DE MEDEIROS, ch_anual = 1450, tipo_diario = 2, isprogressao = FALSE,
telefone_escola = 35322544, codigo_inep = 24027480, escola_bairro = CENTRO, nome_discente = LUDMILA VITÓRIA SANTOS FERNANDES, situacao_serie_sigla = AP, 
uf_escola = RN, matricula = 202130002281, etapa_ensino = ENSINO FUNDAMENTAL - ANOS INICIAIS, id_calendar = 13, nis =, ato_criacao_data = 21 / 09 / 1990, 
tem_turma_outro_bloco = FALSE, ato_autorizacao_doe_numero =, nome_social = NULL, ato_reconhecimento_doe_data = Não informado, ato_criacao_doe_data = 05 / 01 / 1990, 
ato_autorizacao_descricao = N° 605 / 98, id_escola = 2067, situacao_serie = APROVADO}
