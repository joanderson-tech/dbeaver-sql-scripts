SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_escola = 973
AND vs.id_serie = 1005218
AND vs.ano_letivo = 2026;
AND (vs.vagas_validadas > vs.vagas_ocupadas
	OR vs.vagas_validadas > 0
	AND vs.vagas_ocupadas <> 0)
AND vs.aceita_novas_matriculas_nee = TRUE 

SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_escola = 973
AND (vs.id_serie = 1005218
	OR vs.id_serie IN (SELECT se.id_serie
FROM basico.serie_equivalencia se
WHERE se.id_serie = 1005218))
AND vs.ano_letivo = 2026
AND (vs.numero_vagas  > vs.vagas_ocupadas
	OR vs.vagas_validadas > 0
	AND (vs.vagas_ocupadas <> 0));
AND vs.aceita_novas_matriculas_nee = TRUE;

-- Auto-generated SQL script #202512081451
UPDATE matricula.vaga_serie
SET
vagas_validadas = 1
WHERE id_vaga_serie = 56697123;

SELECT vg
FROM VagaSerie vg
WHERE vg.escola.id = :idEscola
AND (vg.serie.id = :idSerie )
AND vg.anoLetivo = :ano
AND (vg.nume > vg.vagasOcupadas
	OR (vg.vagasValidadas > 0
		AND vg.vagasOcupadas <> 0) )
AND vg.aceitaNovasMatriculasNEE = :permiteNEE   


SELECT s.*
FROM basico.serie AS s
WHERE id_serie IN (51900268, 52726521, 1005218);

SELECT *
FROM basico.serie_equivalencia se
WHERE id_serie = 51900268;

SELECT * FROM matricula.vaga_serie vs WHERE vs.id_vaga_serie = 56673513;

SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_escola = 973
AND id_serie = 51900268
AND vs.ano_letivo = 2026;
AND vs.id_escola = 973;

SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_escola = 973
AND vs.id_serie = 1005218
AND vs.ano_letivo = 2026
AND (vs.vagas_validadas>vs.vagas_ocupadas
	OR vs.vagas_validadas>0
	AND vs.vagas_ocupadas <> 0);

SELECT u.id_unidade AS idUnidade, u.nome AS direc, m.id_municipio AS idMunicipio, m.nome AS municipio, e.id_escola AS idEscola, e.nome AS escola, ee.id_etapa_ensino AS idEtapaEnsino, ee.denominacao AS etapaEnsino, ee.periodicidade_etapa AS periodicidade, s.id_serie AS idSerie, s.descricao AS serie, tu.id_turno AS idTurno, tu.descricao AS turno, vs.id_vaga_serie AS idVagaSerie, vs.periodo, COALESCE(vs.vagas_solicitadas, 0) AS solicitadasVeterenos, COALESCE(vs.vagas_validadas, 0) AS validadasVeteranos, COALESCE(vs.vagas_ocupadas, 0) AS ocupadasVeteranos, COALESCE(vs.vagas_efetivadas, 0) AS efetivadasVeteranos, COALESCE(vs.vagas_validadas, 0) - COALESCE(vs.vagas_ocupadas, 0) AS livresVeteranos, vso.id_vaga_serie_ocupacao AS idVagaSerieOcupacao, vso.id_tipo_ocupacao AS idTipoOcupacao, tov.denominacao AS tipoOcupacao, COALESCE(vso.ocupadas, 0) AS ocupadas, COALESCE(vso.efetivadas, 0) AS efetivadas, COALESCE(vso.solicitadas, 0) AS solicitadas, COALESCE(vso.ocupadas_nee, 0) AS ocupadasNEE, COALESCE(vso.efetivadas_nee, 0) AS efetivadasNEE, COALESCE(vso.solicitadas_nee, 0) AS solicitadasNEE
FROM matricula.vaga_serie vs
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = vs.id_calendario_matricula
JOIN escola.escola e ON
e.id_escola = vs.id_escola
JOIN comum.municipio m ON
m.id_municipio = e.id_municipio
JOIN comum.unidade u ON
u.id_unidade = e.id_regional_ensino
JOIN ensino.turno tu ON
tu.id_turno = vs.id_turno
JOIN basico.serie s ON
s.id_serie = vs.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
LEFT JOIN matricula.vaga_serie_ocupacao vso ON
vso.id_vaga_serie = vs.id_vaga_serie
LEFT JOIN matricula.tipo_ocupacao_vaga tov ON
tov.id_tipo_ocupacao_vaga = vso.id_tipo_ocupacao
WHERE vs.ano_letivo = 2026
AND vs.removida = FALSE
AND e.id_situacao_funcionamento <> 3
AND ( vs.vagas_validadas > 0 )
AND s.ativo
AND e.id_escola = 973
ORDER BY u.id_unidade, m.nome, e.nome, ee.denominacao, s.descricao, tu.descricao, tov.denominacao;

SELECT vs.id_vaga_serie AS id1_954_, vs.aceita_novas_matriculas_nee AS aceita2_954_, vs.ano_letivo AS ano3_954_, vs.id_calendario_matricula AS id18_954_, vs.data_cadastro AS data4_954_, vs.data_validacao AS data5_954_, vs.desricao_remanescente_bloqueada AS desricao6_954_, vs.id_escola AS id19_954_, vs.exibir_remanescentes_bloqueadas AS exibir7_954_, vs.periodo AS periodo954_, vs.id_registro_entrada AS id23_954_, vs.id_registro_validacao AS id20_954_, vs.removida AS removida954_, vs.id_serie AS id22_954_, vs.numero_turmas AS numero10_954_, vs.id_turno AS id21_954_, vs.numero_vagas AS numero11_954_, vs.vagas_efetivadas AS vagas12_954_, vs.vagas_ocupadas AS vagas13_954_, vs.vagas_remanescentes_bloqueadas AS vagas14_954_, vs.vagas_reservadas_militares AS vagas15_954_, vs.vagas_solicitadas AS vagas16_954_, vs.vagas_validadas AS vagas17_954_
FROM matricula.vaga_serie vs
WHERE vs.id_escola =?
AND vs.id_serie =?
AND vs.ano_letivo =?
AND (vs.vagas_validadas>vs.vagas_ocupadas
	OR vs.vagas_validadas>0
	AND vs.vagas_ocupadas <> 0)
AND vs.aceita_novas_matriculas_nee = TRUE
