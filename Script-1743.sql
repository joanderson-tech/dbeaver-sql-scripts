BEGIN;

WITH novos_curriculos AS (
    INSERT INTO basico.curriculo_basico (id_curriculo_basico, id_serie, situacao, ativo, ano_entrada_vigor, id_registro_entrada, data_cadastro, id_registro_atualizacao, data_alteracao, codigo, carga_horaria, codigo_rh, ordem, id_turno, tipo_diario, id_unidade, id_escola, permite_parecer_descritivo, multisseriado, tipo_diario_diversificado, possui_parte_diversificada, diario_diversificado_reprova_por_falta, 
    permite_multiplos_professores_polivalente, habilita_relatorio_final_polivalente)
VALUES
    (nextval('hibernate_sequence'), 1005223, NULL, TRUE, 2025, NULL, CURRENT_DATE, NULL, NULL, 'EFAF6-25', 800, NULL, NULL, NULL, 0, 605, NULL, FALSE, FALSE, NULL, FALSE, FALSE, FALSE, FALSE),
    (nextval('hibernate_sequence'), 1005224, NULL, TRUE, 2025, NULL, CURRENT_DATE, NULL, NULL, 'EFAF7-25', 800, NULL, NULL, NULL, 0, 605, NULL, FALSE, FALSE, NULL, FALSE, FALSE, FALSE, FALSE)
    RETURNING id_curriculo_basico, codigo
)
INSERT INTO basico.curriculo_basico_componente (id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)
SELECT nextval('hibernate_sequence'), nc.id_curriculo_basico, cbc.id_componente_curricular, cbc.ch_ano, cbc.programa, NULL, CURRENT_DATE, cbc.obrigatoria, cbc.codigo_rh, cbc.ch_semana, cbc.id_modulo, cbc.ordem, cbc.permite_alocacao_adjunto, cbc.permite_contraturno, cbc.componente_eletivo, cbc.id_categoria_componente, cbc.optativa, cbc.permite_multiplos_professores
FROM novos_curriculos nc
JOIN basico.curriculo_basico_componente cbc  ON ((nc.codigo = 'EFAF6-25' AND cbc.id_curriculo_basico = 52168252)OR (nc.codigo = 'EFAF7-25' AND cbc.id_curriculo_basico = 52168262));
-- EFAF7-25 --

UPDATE basico.turma_serie
SET tipo_diario=0, id_curriculo_medio = (SELECT id_curriculo_basico FROM basico.curriculo_basico cb WHERE cb.codigo IN ('EFAF6-25', 'EFAF7-25') AND cb.ano_entrada_vigor = 2026 AND cb.id_serie IN (1005224))
WHERE id_turma_serie IN (52967441, 52967450, 52967443, 52967533, 52967621, 52967442, 52973900);
-- EFAF6-25 --
UPDATE basico.turma_serie
SET tipo_diario=0, id_curriculo_medio = (SELECT id_curriculo_basico FROM basico.curriculo_basico cb WHERE cb.codigo IN ('EFAF6-25', 'EFAF7-25') AND cb.ano_entrada_vigor = 2026 AND cb.id_serie IN (1005223))
WHERE id_turma_serie IN (52967620, 52967440, 52969179, 52967531, 52967439, 52967623, 52967485, 52967532);


COMMIT;

ROLLBACK;

SELECT * FROM basico.curriculo_basico cb ;
