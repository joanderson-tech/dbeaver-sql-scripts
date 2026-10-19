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
SELECT vc.id_vaga_serie, vc.id_serie, vc.numero_vagas, vc.ano_letivo, vc.id_escola, now(), vc.turno, vc.vagas_validadas, vc.vagas_ocupadas, vc.data_validacao, 6244571, NULL, vc.vagas_efetivadas, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, vc.id_calendario_matricula, vc.periodo, 2, TRUE, FALSE, TRUE, FALSE, NULL, NULL, NULL, NULL, NULL
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


--PASSO 03
SELECT nextval('hibernate_sequence') AS id_escola_turno, T1.id_escola AS id_escola, 1 AS id_turno, TRUE AS ativo, NULL AS censo_2012
INTO TEMP escolaTurno
FROM(
        SELECT 1037 AS id_escola
UNION ALL SELECT 1040
UNION ALL SELECT 1041
UNION ALL SELECT 1042
UNION ALL SELECT 1043
UNION ALL SELECT 1048
UNION ALL SELECT 1052
UNION ALL SELECT 1054
UNION ALL SELECT 1055
    ) AS T1
LEFT JOIN
    escola.escola_turno AS ET ON
T1.id_escola = ET.id_escola
AND ET.id_turno = 1
WHERE ET.id_escola IS NULL;

--BACKUP DO PASSO 03
SELECT 'DELETE FROM escola.escola_turno WHERE id_escola_turno = ' || id_escola_turno || ';'
FROM escolaTurno;


-- PASSO 03
INSERT INTO escola.escola_turno (
    id_escola_turno, id_escola, id_turno, ativo, censo_2012
)
SELECT id_escola_turno, id_escola, id_turno, ativo, censo_2012
FROM escolaTurno;

COMMIT;

ROLLBACK;


UPDATE matricula.vaga_serie SET vagas_ocupadas = 14, vagas_efetivadas = 14, numero_vagas = 14, vagas_validadas = 14, vagas_solicitadas = 14  WHERE id_vaga_serie = 54730691;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 48, vagas_efetivadas = 48, numero_vagas = 48, vagas_validadas = 48, vagas_solicitadas = 48  WHERE id_vaga_serie = 54730692;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 46, vagas_efetivadas = 46, numero_vagas = 46, vagas_validadas = 46, vagas_solicitadas = 46  WHERE id_vaga_serie = 54730693;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 64, vagas_efetivadas = 64, numero_vagas = 64, vagas_validadas = 64, vagas_solicitadas = 64  WHERE id_vaga_serie = 54730694;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 48, vagas_efetivadas = 48, numero_vagas = 48, vagas_validadas = 48, vagas_solicitadas = 48  WHERE id_vaga_serie = 54730695;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 55, vagas_efetivadas = 55, numero_vagas = 55, vagas_validadas = 55, vagas_solicitadas = 55  WHERE id_vaga_serie = 54730696;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 48, vagas_efetivadas = 48, numero_vagas = 48, vagas_validadas = 48, vagas_solicitadas = 48  WHERE id_vaga_serie = 54730697;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 46, vagas_efetivadas = 46, numero_vagas = 46, vagas_validadas = 46, vagas_solicitadas = 46  WHERE id_vaga_serie = 54730698;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 64, vagas_efetivadas = 64, numero_vagas = 64, vagas_validadas = 64, vagas_solicitadas = 64  WHERE id_vaga_serie = 54730699;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 64, vagas_efetivadas = 64, numero_vagas = 64, vagas_validadas = 64, vagas_solicitadas = 64  WHERE id_vaga_serie = 54730700;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 48, vagas_efetivadas = 48, numero_vagas = 48, vagas_validadas = 48, vagas_solicitadas = 48  WHERE id_vaga_serie = 54730701;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 55, vagas_efetivadas = 55, numero_vagas = 55, vagas_validadas = 55, vagas_solicitadas = 55  WHERE id_vaga_serie = 54730702;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 55, vagas_efetivadas = 55, numero_vagas = 55, vagas_validadas = 55, vagas_solicitadas = 55  WHERE id_vaga_serie = 54730703;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 44, vagas_efetivadas = 44, numero_vagas = 44, vagas_validadas = 44, vagas_solicitadas = 44  WHERE id_vaga_serie = 54730704;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 51, vagas_efetivadas = 51, numero_vagas = 51, vagas_validadas = 51, vagas_solicitadas = 51  WHERE id_vaga_serie = 54730705;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 52, vagas_efetivadas = 52, numero_vagas = 52, vagas_validadas = 52, vagas_solicitadas = 52  WHERE id_vaga_serie = 54730706;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 66, vagas_efetivadas = 66, numero_vagas = 66, vagas_validadas = 66, vagas_solicitadas = 66  WHERE id_vaga_serie = 54730707;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 53, vagas_efetivadas = 53, numero_vagas = 53, vagas_validadas = 53, vagas_solicitadas = 53  WHERE id_vaga_serie = 54730708;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 44, vagas_efetivadas = 44, numero_vagas = 44, vagas_validadas = 44, vagas_solicitadas = 44  WHERE id_vaga_serie = 54730709;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 51, vagas_efetivadas = 51, numero_vagas = 51, vagas_validadas = 51, vagas_solicitadas = 51  WHERE id_vaga_serie = 54730710;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 52, vagas_efetivadas = 52, numero_vagas = 52, vagas_validadas = 52, vagas_solicitadas = 52  WHERE id_vaga_serie = 54730711;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 66, vagas_efetivadas = 66, numero_vagas = 66, vagas_validadas = 66, vagas_solicitadas = 66  WHERE id_vaga_serie = 54730712;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 66, vagas_efetivadas = 66, numero_vagas = 66, vagas_validadas = 66, vagas_solicitadas = 66  WHERE id_vaga_serie = 54730713;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 53, vagas_efetivadas = 53, numero_vagas = 53, vagas_validadas = 53, vagas_solicitadas = 53  WHERE id_vaga_serie = 54730714;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 34, vagas_efetivadas = 34, numero_vagas = 34, vagas_validadas = 34, vagas_solicitadas = 34  WHERE id_vaga_serie = 54730715;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 34, vagas_efetivadas = 34, numero_vagas = 34, vagas_validadas = 34, vagas_solicitadas = 34  WHERE id_vaga_serie = 54730716;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 77, vagas_efetivadas = 77, numero_vagas = 77, vagas_validadas = 77, vagas_solicitadas = 77  WHERE id_vaga_serie = 54730717;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 77, vagas_efetivadas = 77, numero_vagas = 77, vagas_validadas = 77, vagas_solicitadas = 77  WHERE id_vaga_serie = 54730718;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 60, vagas_efetivadas = 60, numero_vagas = 60, vagas_validadas = 60, vagas_solicitadas = 60  WHERE id_vaga_serie = 54730719;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 71, vagas_efetivadas = 71, numero_vagas = 71, vagas_validadas = 71, vagas_solicitadas = 71  WHERE id_vaga_serie = 54730720;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 16, vagas_efetivadas = 16, numero_vagas = 16, vagas_validadas = 16, vagas_solicitadas = 16  WHERE id_vaga_serie = 54730721;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 10, vagas_efetivadas = 10, numero_vagas = 10, vagas_validadas = 10, vagas_solicitadas = 10  WHERE id_vaga_serie = 54730722;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 13, vagas_efetivadas = 13, numero_vagas = 13, vagas_validadas = 13, vagas_solicitadas = 13  WHERE id_vaga_serie = 54730723;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 10, vagas_efetivadas = 10, numero_vagas = 10, vagas_validadas = 10, vagas_solicitadas = 10  WHERE id_vaga_serie = 54730724;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 71, vagas_efetivadas = 71, numero_vagas = 71, vagas_validadas = 71, vagas_solicitadas = 71  WHERE id_vaga_serie = 54730725;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 16, vagas_efetivadas = 16, numero_vagas = 16, vagas_validadas = 16, vagas_solicitadas = 16  WHERE id_vaga_serie = 54730726;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 71, vagas_efetivadas = 71, numero_vagas = 71, vagas_validadas = 71, vagas_solicitadas = 71  WHERE id_vaga_serie = 54730727;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 9, vagas_efetivadas = 9, numero_vagas = 9, vagas_validadas = 9, vagas_solicitadas = 9  WHERE id_vaga_serie = 54730728;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 18, vagas_efetivadas = 18, numero_vagas = 18, vagas_validadas = 18, vagas_solicitadas = 18  WHERE id_vaga_serie = 54730729;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 21, vagas_efetivadas = 21, numero_vagas = 21, vagas_validadas = 21, vagas_solicitadas = 21  WHERE id_vaga_serie = 54730730;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 20, vagas_efetivadas = 20, numero_vagas = 20, vagas_validadas = 20, vagas_solicitadas = 20  WHERE id_vaga_serie = 54730731;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 16, vagas_efetivadas = 16, numero_vagas = 16, vagas_validadas = 16, vagas_solicitadas = 16  WHERE id_vaga_serie = 54730732;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 60, vagas_efetivadas = 60, numero_vagas = 60, vagas_validadas = 60, vagas_solicitadas = 60  WHERE id_vaga_serie = 54730733;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 60, vagas_efetivadas = 60, numero_vagas = 60, vagas_validadas = 60, vagas_solicitadas = 60  WHERE id_vaga_serie = 54730734;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 77, vagas_efetivadas = 77, numero_vagas = 77, vagas_validadas = 77, vagas_solicitadas = 77  WHERE id_vaga_serie = 54730735;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 77, vagas_efetivadas = 77, numero_vagas = 77, vagas_validadas = 77, vagas_solicitadas = 77  WHERE id_vaga_serie = 54730736;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 15, vagas_efetivadas = 15, numero_vagas = 15, vagas_validadas = 15, vagas_solicitadas = 15  WHERE id_vaga_serie = 54730737;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 12, vagas_efetivadas = 12, numero_vagas = 12, vagas_validadas = 12, vagas_solicitadas = 12  WHERE id_vaga_serie = 54730738;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 11, vagas_efetivadas = 11, numero_vagas = 11, vagas_validadas = 11, vagas_solicitadas = 11  WHERE id_vaga_serie = 54730739;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 15, vagas_efetivadas = 15, numero_vagas = 15, vagas_validadas = 15, vagas_solicitadas = 15  WHERE id_vaga_serie = 54730740;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 25, vagas_efetivadas = 25, numero_vagas = 25, vagas_validadas = 25, vagas_solicitadas = 25  WHERE id_vaga_serie = 54730741;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 19, vagas_efetivadas = 19, numero_vagas = 19, vagas_validadas = 19, vagas_solicitadas = 19  WHERE id_vaga_serie = 54730742;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 20, vagas_efetivadas = 20, numero_vagas = 20, vagas_validadas = 20, vagas_solicitadas = 20  WHERE id_vaga_serie = 54730743;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 41, vagas_efetivadas = 41, numero_vagas = 41, vagas_validadas = 41, vagas_solicitadas = 41  WHERE id_vaga_serie = 54730744;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 41, vagas_efetivadas = 41, numero_vagas = 41, vagas_validadas = 41, vagas_solicitadas = 41  WHERE id_vaga_serie = 54730745;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 11, vagas_efetivadas = 11, numero_vagas = 11, vagas_validadas = 11, vagas_solicitadas = 11  WHERE id_vaga_serie = 54730746;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 32, vagas_efetivadas = 32, numero_vagas = 32, vagas_validadas = 32, vagas_solicitadas = 32  WHERE id_vaga_serie = 54730747;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 32, vagas_efetivadas = 32, numero_vagas = 32, vagas_validadas = 32, vagas_solicitadas = 32  WHERE id_vaga_serie = 54730748;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 79, vagas_efetivadas = 79, numero_vagas = 79, vagas_validadas = 79, vagas_solicitadas = 79  WHERE id_vaga_serie = 54730749;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 79, vagas_efetivadas = 79, numero_vagas = 79, vagas_validadas = 79, vagas_solicitadas = 79  WHERE id_vaga_serie = 54730750;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 79, vagas_efetivadas = 79, numero_vagas = 79, vagas_validadas = 79, vagas_solicitadas = 79  WHERE id_vaga_serie = 54730751;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 33, vagas_efetivadas = 33, numero_vagas = 33, vagas_validadas = 33, vagas_solicitadas = 33  WHERE id_vaga_serie = 54730752;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 33, vagas_efetivadas = 33, numero_vagas = 33, vagas_validadas = 33, vagas_solicitadas = 33  WHERE id_vaga_serie = 54730753;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 79, vagas_efetivadas = 79, numero_vagas = 79, vagas_validadas = 79, vagas_solicitadas = 79  WHERE id_vaga_serie = 54730754;
UPDATE matricula.vaga_serie SET vagas_ocupadas = 16, vagas_efetivadas = 16, numero_vagas = 16, vagas_validadas = 16, vagas_solicitadas = 16  WHERE id_vaga_serie = 54730756;


