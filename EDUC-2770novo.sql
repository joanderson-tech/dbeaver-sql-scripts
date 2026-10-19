BEGIN;

ROLLBACK;

INSERT INTO ensino.matricula_componente (id_situacao_matricula, id_discente, id_matricula_componente, id_turma, id_registro_cadastro, data_cadastro, ano, id_componente_curricular, id_matricula_estudante_serie, periodo) SELECT 2, mat.id_estudante, nextval('ensino.matricula_componente_seq'), t.id_turma, NULL, now(), ano, t.id_disciplina, mat.id_matricula_discente_serie, t.periodo
FROM basico.matricula_estudante_serie mat, ensino.turma t
INNER JOIN ensino.componente_curricular c ON
c.id_componente_curricular = t.id_disciplina
WHERE t.id_turma_serie = 52357098
AND id_matricula_discente_serie IN ( 1325807, 1325917, 1325700, 1325789, 1325784, 1325785, 1325716, 1325689, 1325693, 1325701, 1325803, 1325791, 1325797, 1325718, 1325707, 1325715, 1325714, 1325786 )
AND c.id_tipo_componente != 6
AND t.id_situacao_turma <> 4
AND (t.id_disciplina = 220
	OR t.id_disciplina IN ( SELECT cbc.id_componente_curricular
FROM basico.curriculo_basico cb
JOIN basico.curriculo_basico_componente cbc ON
	cbc.id_curriculo_basico = cb.id_curriculo_basico
JOIN basico.turma_serie ts ON
	ts.id_turma_serie = 52357098
WHERE cb.ativo
	AND cbc.permite_alocacao_adjunto
	AND ts.id_curriculo_medio = cb.id_curriculo_basico ))
AND NOT EXISTS( SELECT * FROM ensino.matricula_componente WHERE mat.id_estudante = id_discente AND id_situacao_matricula IN ( 5, 6, 2, 8 ) AND id_turma = t.id_turma );

UPDATE basico.matricula_estudante_serie
SET
id_turma_serie = 52357098, id_situacao_matricula_serie = 1, id_curriculo_medio = 52357089, id_serie_escola = ( SELECT eees.id_escola_etapa_ensino_serie
FROM escola.escola_etapa_ensino_serie eees
WHERE eees.id_serie = 1005339
AND eees.id_escola = 3124
AND eees.ativo
LIMIT 1 )
WHERE id_matricula_discente_serie IN ( 1325807, 1325917, 1325700, 1325789, 1325784, 1325785, 1325716, 1325689, 1325693, 1325701, 1325803, 1325791, 1325797, 1325718, 1325707, 1325715, 1325714, 1325786 )


ROLLBACK;

SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_serie = 1005339
AND vs.id_escola = 3124
AND vs.ano_letivo = 2026
AND vs.id_turno = 2;

matricula.verifica_vaga_by_matricula_estudante_serie


SELECT max(vs.id_vaga_serie), vs.*
FROM escola.escola_etapa_ensino_serie eees
JOIN matricula.vaga_serie vs ON
eees.id_escola = vs.id_escola
AND eees.id_serie = vs.id_serie
WHERE eees.id_escola_etapa_ensino_serie = 52349934
AND vs.ano_letivo = 2026
AND vs.id_turno = 2
AND vs.periodo = 1
AND NOT vs.removida
GROUP BY vs.id_vaga_serie;
-- Auto-generated SQL script #202602120837
UPDATE matricula.vaga_serie
SET
vagas_ocupadas = 18, vagas_solicitadas = 18, vagas_efetivadas = 18, vagas_validadas = 18
WHERE id_vaga_serie = 52346689;

SELECT *
FROM escola.escola_etapa_ensino_serie eees
WHERE eees.id_escola = 3124
AND eees.id_serie = 1005339;
----------------------------------=========================-----------------------

SELECT COALESCE( sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa )), 0 )
FROM matricula.renovacao_matricula r
JOIN public.discente d ON
			d.id_discente = r.id_discente
WHERE r.id_vaga_serie = 52346689
AND r.data_cancelamento IS NULL
AND r.id_nova_serie IS NULL;

SELECT COALESCE( sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa )), 0 )
FROM matricula.solicitacao_transferencia st
INNER JOIN matricula.solicitacao_transferencia_opcao_escola topcao ON
			topcao.id_solicitacao = st.id_solicitacao_transferencia
JOIN basico.matricula_estudante_serie mes ON
			mes.id_matricula_discente_serie = st.id_matricula_discente_serie
JOIN public.discente d ON
			d.id_discente = mes.id_estudante
WHERE st.id_status IN ( 2, 4, 8 )
AND topcao.ordem = 1
AND st.id_calendario_matricula = 52346198
AND topcao.id_escola = 3124
AND topcao.id_serie = 1005339
AND topcao.id_turno = 2
AND st.id_matricula_discente_serie_gerado IS NULL;

SELECT COALESCE( sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM matricula.estudante_inscrito_necessidade_especial eine JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = eine.id_tipo_necessidade WHERE eine.id_estudante_inscrito = ei.id_estudante_inscrito )), 0 )
FROM matricula.estudante_inscrito ei
INNER JOIN matricula.estudante_inscrito_opcao_escola iopcao ON
		iopcao.id_estudante_inscrito = ei.id_estudante_inscrito
INNER JOIN matricula.estudante_inscrito_processamento eip ON
		eip.id_estudante_inscrito = ei.id_estudante_inscrito
AND eip.id_opcao_escola = iopcao.id_estudante_inscrito_opcao_escola
WHERE iopcao.id_vaga_serie = 52346689
AND iopcao.ordem = 1
AND ( ei.id_estudante = 0
	OR ei.id_estudante IS NULL )
AND ei.id_status IN ( 1, 4, 6, 7 )
AND eip.id_status IN ( 1, 4, 6, 7 );

SELECT COALESCE( sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa)), 0 )
FROM basico.matricula_estudante_serie mes
INNER JOIN escola.escola_etapa_ensino_serie eees ON
eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
JOIN public.discente d ON
d.id_discente = mes.id_estudante
WHERE mes.id_situacao_matricula_serie NOT IN ( 4, 5, 6, 9, 10, 11, 12 )
AND mes.id_turno = 2
AND eees.id_escola = 3124
AND eees.id_serie = 1005339
AND mes.ano_calendario = 2026
AND mes.periodo = 1;

SELECT tne.*
FROM comum.pessoa_necessidade_especial pne
JOIN comum.tipo_necessidade_especial tne ON
tne.id_tipo_necessidade_especial = pne.id_necessidade_especial