BEGIN;

--PASSO 01
SELECT DISTINCT nextval('hibernate_sequence') AS id_vaga_serie, ts.id_escola AS id_escola, ts.id_serie AS id_serie, ts.ano AS ano_letivo, 0 AS numero_vagas, 1 AS turno, 0 AS vagas_validadas, 0 vagas_ocupadas, '2025-05-12 00:00:00.000' ::timestamp AS data_validacao, 0 AS vagas_efetivadas, 54372450 AS id_calendario_matricula, 1 AS periodo, TRUE aceita_novas_matriculas_nee
INTO TEMP vagas_criadas
FROM basico.turma_serie ts
WHERE ts.id_escola IN (1037, 1040, 1041, 1042, 1043, 1048, 1052, 1054, 1055)
AND ts.ativo
AND ts.ano = 2025
AND ts.id_turno = 1
AND ts.ativo
AND NOT EXISTS (SELECT 1
FROM matricula.vaga_serie vs
WHERE vs.id_serie = ts.id_serie
AND vs.id_escola = ts.id_escola
AND vs.id_turno = ts.id_turno);

--BACKUP DO PASSO 01
SELECT 'DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  ' || id_vaga_serie || ';'
FROM vagas_criadas;

--INSERT DO DA VAGA SERIE 
INSERT INTO matricula.vaga_serie
(
    id_vaga_serie, id_serie, numero_vagas, ano_letivo, id_escola, data_cadastro, id_turno, vagas_validadas, vagas_ocupadas, data_validacao, id_registro_validacao, vagas_solicitadas, vagas_efetivadas, vagas_ocupadas_1opc, vagas_ocupadas_2opc, vagas_ocupadas_mtl, vagas_ocupadas_antes_processamento, vagas_ocupadas_antes_listagem_2, ocupadas_interesse_op1, vagas_ocupadas_1opc_l1, vagas_ocupadas_2opc_l1, id_calendario_matricula, periodo, numero_turmas, aceita_novas_matriculas_nee, removida, exibir_remanescentes_bloqueadas, vagas_remanescentes_bloqueadas, desricao_remanescente_bloqueada, vagas_reservadas_militares, vagas_ocupadas_mtl_op2, vagas_ocupadas_mtl_2opc, id_registro_entrada
)
SELECT vc.id_vaga_serie, vc.id_serie, vc.numero_vagas, vc.ano_letivo, vc.id_escola, now(), vc.turno, vc.vagas_validadas, vc.vagas_ocupadas, vc.data_validacao, 6244571, NULL, vc.vagas_efetivadas, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, vc.id_calendario_matricula, vc.periodo, NULL, TRUE, FALSE, TRUE, FALSE, NULL, NULL, NULL, NULL, NULL
FROM vagas_criadas vc;

--PASSO 02 RECALCULAR AS VAGAS 
WITH vagas_calculadas AS (
    SELECT vs.id_vaga_serie,(
            SELECT COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa )), 0
                )
FROM matricula.renovacao_matricula r
JOIN public.discente d ON
                d.id_discente = r.id_discente
WHERE r.id_vaga_serie = vs.id_vaga_serie
AND r.data_cancelamento IS NULL
AND r.id_nova_serie IS NULL
        ) + (
            SELECT COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa )), 0
                )
FROM matricula.solicitacao_transferencia st
INNER JOIN matricula.solicitacao_transferencia_opcao_escola topcao ON
                topcao.id_solicitacao = st.id_solicitacao_transferencia
JOIN basico.matricula_estudante_serie mes ON
                mes.id_matricula_discente_serie = st.id_matricula_discente_serie
JOIN public.discente d ON
                d.id_discente = mes.id_estudante
WHERE st.id_status IN (
                    2, 4, 8
                )
	AND topcao.ordem = 1
	AND st.id_calendario_matricula = vs.id_calendario_matricula
	AND topcao.id_escola = vs.id_escola
	AND topcao.id_serie = vs.id_serie
	AND topcao.id_turno = vs.id_turno
	AND st.id_matricula_discente_serie_gerado IS NULL
        ) + (
            SELECT COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM matricula.estudante_inscrito_necessidade_especial eine JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = eine.id_tipo_necessidade WHERE eine.id_estudante_inscrito = ei.id_estudante_inscrito )), 0
                )
FROM matricula.estudante_inscrito ei
INNER JOIN matricula.estudante_inscrito_opcao_escola iopcao ON
                iopcao.id_estudante_inscrito = ei.id_estudante_inscrito
INNER JOIN matricula.estudante_inscrito_processamento eip ON
                eip.id_estudante_inscrito = ei.id_estudante_inscrito
AND eip.id_opcao_escola = iopcao.id_estudante_inscrito_opcao_escola
WHERE iopcao.id_vaga_serie = vs.id_vaga_serie
AND iopcao.ordem = 1
AND (
                    ei.id_estudante = 0
	OR ei.id_estudante IS NULL
                )
AND ei.id_status IN (
                    1, 4, 6, 7
                )
	AND eip.id_status IN (
                        1, 4, 6, 7
                    )
        ) + (
            SELECT COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa)), 0
                )
FROM basico.matricula_estudante_serie mes
INNER JOIN escola.escola_etapa_ensino_serie eees ON
                eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
JOIN public.discente d ON
                d.id_discente = mes.id_estudante
WHERE mes.id_situacao_matricula_serie NOT IN (
                    4, 5, 6, 9, 10, 11, 12
                )
	AND mes.id_turno = vs.id_turno
	AND eees.id_escola = vs.id_escola
	AND eees.id_serie = vs.id_serie
	AND mes.ano_calendario = 2025
	-- Observação: A variável cm.ano precisa ser definida
	AND mes.periodo = vs.periodo
        ) AS vagas_atualizadas, vs.vagas_ocupadas, vs.vagas_validadas, vs.vagas_efetivadas
FROM matricula.vaga_serie AS vs
WHERE vs.removida = FALSE
AND vs.id_registro_validacao IS NOT NULL
AND vs.ano_letivo = 2025
AND vs.vagas_validadas >= 0
AND vs.id_turno = 1
)
SELECT *
INTO TEMP vaga_atualizacao
FROM vagas_calculadas
WHERE vagas_atualizadas <> vagas_ocupadas;

--PASSO 02 ATUALIZA  AS VAGAS SERIE BACKUP E SOLUÇÃO
SELECT 'UPDATE matricula.vaga_serie SET vagas_ocupadas = ' || vagas_atualizadas || ', vagas_efetivadas = ' || vagas_atualizadas || ', numero_vagas = ' || vagas_atualizadas || ', vagas_validadas = ' || vagas_atualizadas || ', vagas_solicitadas = ' || vagas_atualizadas || '  WHERE id_vaga_serie = ' || id_vaga_serie || ';' solucao, 'UPDATE matricula.vaga_serie SET vagas_ocupadas = ' || vagas_ocupadas || ',vagas_efetivadas = ' || vagas_efetivadas || ', vagas_validadas = ' || vagas_validadas || ' WHERE id_vaga_serie = ' || id_vaga_serie || ';' backup
FROM vaga_atualizacao
WHERE vagas_atualizadas <> vagas_ocupadas;

COMMIT;

