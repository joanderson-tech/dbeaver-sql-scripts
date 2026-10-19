SELECT mes.*
FROM discente d
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
WHERE p.nome ILIKE '%MIGUEL ARTHUR OLIVEIRA RAMOS%'
AND mes.ano_calendario = 2025;


SELECT p.id_escola_origem , p
FROM matricula.estudante_inscrito p WHERE p.nome = 'MIGUEL ARTHUR OLIVEIRA RAMOS';

WITH matriculas AS ( SELECT mes.id_matricula_discente_serie, mes.id_estudante, cm.id_calendario_matricula, pne.id_pessoa_necessidade_especial IS NOT NULL AS nee
FROM basico.matricula_estudante_serie mes
JOIN matricula.calendario_matricula cm ON
cm.ano = mes.ano_calendario
JOIN public.discente d ON
d.id_discente = mes.id_estudante
LEFT JOIN comum.pessoa_necessidade_especial pne ON
pne.id_pessoa = d.id_pessoa
WHERE mes.id_matricula_discente_serie = 1587353 ), renovacoes AS ( SELECT rm.*, 2 AS id_tipo_ocupacao_vaga
FROM matriculas cm
JOIN matricula.renovacao_matricula rm
	USING (id_calendario_matricula)
WHERE rm.data_cancelamento IS NULL ), estudantes_inscritos AS ( SELECT ei.*
FROM matriculas cm
JOIN matricula.estudante_inscrito ei
	USING (id_calendario_matricula)
WHERE ei.id_status <> 5 ), transferencias AS ( SELECT sol.*, CASE WHEN id_tipo = 2 THEN 3
ELSE 4 END AS id_tipo_ocupacao_vaga
FROM matriculas cm
JOIN matricula.solicitacao_transferencia sol
	USING (id_calendario_matricula)
WHERE sol.id_status <> 6 ) SELECT COALESCE(ei.id_estudante_inscrito, sol.id_solicitacao_transferencia) AS id_solicitacao, mes.nee, tipo_ocupacao.id_tipo_ocupacao_vaga, COALESCE(ei.id_estudante_inscrito, rm.id_renovacao_matricula, sol.id_solicitacao_transferencia) IS NULL AS matricula_portal_escola, sol.id_tipo
FROM matriculas mes
LEFT JOIN renovacoes rm ON
rm.id_nova_serie = mes.id_matricula_discente_serie
LEFT JOIN estudantes_inscritos ei ON
ei.id_estudante = mes.id_estudante
LEFT JOIN transferencias sol ON
sol.id_matricula_discente_serie_gerado = mes.id_matricula_discente_serie
JOIN matricula.tipo_ocupacao_vaga tipo_ocupacao ON
tipo_ocupacao.id_tipo_ocupacao_vaga = ( CASE WHEN ei.id_estudante_inscrito IS NOT NULL THEN ( CASE WHEN ei.nee THEN 1
WHEN ei.id_escola_origem > 0 THEN 6
ELSE 5 END)
ELSE ( COALESCE( rm.id_tipo_ocupacao_vaga, sol.id_tipo_ocupacao_vaga, 5) ) END );

SELECT *
FROM matricula.renovacao_matricula
WHERE id_discente IN (1366253, 1442827) ;

SELECT cm.ano, cm.vigente, cm.ativo, * FROM matricula.calendario_matricula  cm;
WHERE id_calendario_matricula IN (71558970,60968982);


SELECT *
FROM ensino_infantil.relatorio_avaliativo_componente ;
WHERE id_matricula_componente   = 17110304;

SELECT *
FROM matricula.estudante_inscrito p;
WHERE p.nome ILIKE '%IANE GABRIELE CAMPOS DA SILVA%'

SELECT * FROM ensino_infantil.configuracao_relatorio_componente WHERE maximo_caracteres_relatorio IS NOT NULL; AND; id_componente_curricular = 293


UPDATE matricula.estudante_inscrito
SET
estudante_cadastro_reserva = TRUE
WHERE id_estudante_inscrito = 72210077;

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_componente_curricular = 293;


SELECT * FROM ensino.turma t WHERE t.id_disciplina = 293;
SELECT vs.id_vaga_serie, vs.vagas_validadas, vs.vagas_ocupadas, escola.id_escola, escola.nome, serie.id_serie, serie.descricao AS desc_serie, ee.id_etapa_ensino, ee.denominacao, turno.id_turno, turno.descricao, vs.periodo, vs.aceita_novas_matriculas_nee
FROM matricula.vaga_serie vs
INNER JOIN escola.escola escola ON
escola.id_escola = vs.id_escola
INNER JOIN basico.serie serie ON
serie.id_serie = vs.id_serie
INNER JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = serie.id_etapa_ensino
INNER JOIN ensino.turno turno ON
turno.id_turno = vs.id_turno
WHERE vs.id_escola = 52232993
AND vs.ano_letivo = 2025
AND vs.removida = FALSE
AND (vs.data_cadastro IS NULL
	OR vs.data_cadastro IN ( SELECT max(vs2.data_cadastro)
FROM matricula.vaga_serie vs2
INNER JOIN basico.serie serie2 ON
	serie2.id_serie = vs2.id_serie
INNER JOIN basico.etapa_ensino ee2 ON
	ee2.id_etapa_ensino = serie2.id_etapa_ensino
WHERE vs2.id_escola = vs.id_escola
	AND vs2.ano_letivo = vs.ano_letivo
	AND ee2.id_etapa_ensino = ee.id_etapa_ensino
	AND vs2.id_turno = vs.id_turno
	AND( COALESCE(vs2.vagas_validadas, 0) - COALESCE(vs2.vagas_ocupadas, 0) ) > 0 ))
AND ( COALESCE(vs.vagas_validadas, 0) - COALESCE((CASE WHEN vs.vagas_ocupadas > 0 THEN vs.vagas_ocupadas ELSE NULL END), 0) ) > 0

SELECT * FROM matricula.vaga_serie WHERE id_escola = 52232871 AND ano_letivo = 2025;

SELECT * FROM escola.escola e  WHERE e.nome ILIKE '%ESCOLA MUNICIPAL DE EDUCACAO EM TEMPO INTEGRAL JUAREZ CLEMENTE CANEJO%';
