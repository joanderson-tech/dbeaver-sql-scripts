WITH vagas AS ( SELECT vs.*, s.bloquear_oferta_vagas
FROM matricula.vaga_serie vs
JOIN basico.serie s ON
s.id_serie = vs.id_serie
JOIN escola.escola_turno et ON
et.id_escola = vs.id_escola
AND et.id_turno = vs.id_turno
AND et.ativo
JOIN escola.escola_etapa_ensino_serie eees ON
eees.id_escola = vs.id_escola
AND eees.id_serie = vs.id_serie
WHERE vs.id_calendario_matricula = 51899707
AND eees.ativo
AND NOT vs.removida) SELECT e.id_escola, e.nome AS escola,(SELECT ano_letivo
FROM vagas
LIMIT 1) AS ano_letivo, m.id_municipio, m.nome AS municipio, 51899707 id_calendario_matricula,(SELECT MAX(data_validacao)
FROM vagas vsv
WHERE vsv.id_escola = e.id_escola) AS data_validacao,(SELECT COUNT(DISTINCT vsp.*)
FROM vagas vsp
WHERE vsp.id_escola = e.id_escola
AND vsp.vagas_validadas IS NULL
AND vsp.bloquear_oferta_vagas = FALSE) AS qtd_pendentes
FROM escola.escola e
JOIN comum.municipio m
	USING(id_municipio)
WHERE EXISTS (SELECT *
FROM vagas vs
WHERE vs.id_escola = e.id_escola
AND NOT vs.bloquear_oferta_vagas)
AND m.id_municipio = 2803500
AND e.id_escola = 51877480
AND e.id_dependencia_administrativa <> 2
ORDER BY e.nome;

SELECT s.id_serie , s.descricao , vs.*
FROM matricula.vaga_serie vs
JOIN basico.serie s ON
s.id_serie = vs.id_serie
WHERE vs.id_escola = 51877480
AND vs.id_serie = 1005219
AND vs.ano_letivo = 2026
AND vs.id_turno = 2;

SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_vaga_serie IN (51934731, 51934730);

SELECT * FROM ensino.turno t ;



-- Auto-generated SQL script #202601061443
UPDATE matricula.vaga_serie
	SET vagas_ocupadas=8,vagas_solicitadas=8,vagas_efetivadas=8
	WHERE id_vaga_serie=51934731;

SELECT mes.id_vaga_serie, * FROM basico.matricula_estudante_serie mes WHERE mes.id_vaga_serie IN (51934731, 51934730);

UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie=51934730	WHERE id_matricula_discente_serie IN (1340065,1340060,1340061);

SELECT * --string_agg(id_vaga_serie_movimentacao::varchar, ', ') 
FROM matricula.vaga_serie_movimentacao vsm WHERE vsm.id_vaga_serie in (51934731);

SELECT string_agg(id_operacao_vaga_serie::varchar, ', ') FROM matricula.operacao_vaga_serie ovs WHERE ovs.id_vaga_serie = 51934731;

BEGIN;


SELECT 
'UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie=51934731	WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' AS script, 
'UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie= ' || mes.id_vaga_serie || '	WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' AS backup
FROM basico.matricula_estudante_serie mes
WHERE mes.id_vaga_serie = 51934730
GROUP BY mes.id_vaga_serie;

UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie=51934731	WHERE id_matricula_discente_serie IN (1340067, 1340064, 1340063, 1340066);

--UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie= 51934730	WHERE id_matricula_discente_serie IN (1340067, 1340064, 1340063, 1340066);


SELECT 
'UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= 51934731	WHERE id_vaga_serie_movimentacao IN (' || STRING_AGG(id_vaga_serie_movimentacao::text, ', ') || ');' AS script, 
'UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= ' || id_vaga_serie || '	WHERE id_vaga_serie_movimentacao IN (' || STRING_AGG(id_vaga_serie_movimentacao::text, ', ') || ');' AS backup
FROM matricula.vaga_serie_movimentacao 
WHERE id_vaga_serie = 51934730
GROUP BY id_vaga_serie;

UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= 51934731	WHERE id_vaga_serie_movimentacao IN (2138212, 2138213, 2138214, 2138164, 2138165, 2138166, 2138235, 2138236, 2138237, 2138259, 2138260, 2138261);

--UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= 51934730	WHERE id_vaga_serie_movimentacao IN (2138212, 2138213, 2138214, 2138164, 2138165, 2138166, 2138235, 2138236, 2138237, 2138259, 2138260, 2138261);

SELECT 
'UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934731	WHERE id_operacao_vaga_serie IN (' || STRING_AGG(id_operacao_vaga_serie::text, ', ') || ');' AS script, 
'UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= ' || id_vaga_serie || '	WHERE id_operacao_vaga_serie IN (' || STRING_AGG(id_operacao_vaga_serie::text, ', ') || ');' AS backup
FROM matricula.operacao_vaga_serie
WHERE id_vaga_serie = 51934730
GROUP BY id_vaga_serie;

UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934731	WHERE id_operacao_vaga_serie IN (51936315, 51936355, 51936362, 51936571, 51954933, 51954940, 51958221, 51958226, 51962406, 51962504, 51971346);

--UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934730	WHERE id_operacao_vaga_serie IN (51936315, 51936355, 51936362, 51936571, 51954933, 51954940, 51958221, 51958226, 51962406, 51962504, 51971346);

SELECT * FROM matricula.renovacao_matricula rm WHERE rm.id_vaga_serie = 51934730;

UPDATE matricula.renovacao_matricula 	SET id_vaga_serie=51934731	WHERE id_renovacao_matricula=51936403;


DELETE FROM matricula.vaga_serie WHERE id_vaga_serie=51934730;

ROLLBACK;

COMMIT;



INSERT INTO matricula.vaga_serie
(id_vaga_serie, id_serie, numero_vagas, ano_letivo, id_escola, data_cadastro, id_turno, vagas_validadas, vagas_ocupadas, data_validacao, id_registro_validacao, vagas_solicitadas, vagas_efetivadas, vagas_ocupadas_1opc, vagas_ocupadas_2opc, vagas_ocupadas_mtl, vagas_ocupadas_antes_processamento, vagas_ocupadas_antes_listagem_2, ocupadas_interesse_op1, vagas_ocupadas_1opc_l1, vagas_ocupadas_2opc_l1, id_calendario_matricula, periodo, numero_turmas, aceita_novas_matriculas_nee, removida, exibir_remanescentes_bloqueadas, vagas_remanescentes_bloqueadas, desricao_remanescente_bloqueada, vagas_reservadas_militares, vagas_ocupadas_mtl_op2, vagas_ocupadas_mtl_2opc, id_registro_entrada)
VALUES(51934730, 1005219, 0, 2026, 51877480, NULL, 2, 30, 8, '2025-12-26 10:54:50.000', 5628332, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51899707, 1, 1, true, false, true, false, NULL, NULL, NULL, NULL, NULL);


UPDATE matricula.renovacao_matricula 	SET id_vaga_serie=51934730	WHERE id_renovacao_matricula=51936403;



SELECT * FROM matricula.vaga_serie WHERE id_vaga_serie  IN (51934731, 51934730);

SELECT 
    -- Script 
    'UPDATE matricula.vaga_serie SET ' ||
    'vagas_ocupadas = vagas_ocupadas + ' || v30.vagas_ocupadas || ', ' ||
    'vagas_solicitadas = vagas_solicitadas + ' || v30.vagas_solicitadas || ', ' ||
    'vagas_efetivadas = vagas_efetivadas + ' || v30.vagas_efetivadas || 
    ' WHERE id_vaga_serie = 51934731;' AS script_soma,
    -- Script de Backup 
    'UPDATE matricula.vaga_serie SET ' ||
    'vagas_ocupadas = vagas_ocupadas - ' || v30.vagas_ocupadas || ', ' ||
    'vagas_solicitadas = vagas_solicitadas - ' || v30.vagas_solicitadas || ', ' ||
    'vagas_efetivadas = vagas_efetivadas - ' || v30.vagas_efetivadas || 
    ' WHERE id_vaga_serie = 51934731;' AS script_backup
FROM 
    (SELECT * FROM matricula.vaga_serie WHERE id_vaga_serie = 51934731) v30,
    (SELECT * FROM matricula.vaga_serie WHERE id_vaga_serie = 51934730) v31;


UPDATE matricula.vaga_serie SET vagas_ocupadas = vagas_ocupadas + 8, vagas_solicitadas = vagas_solicitadas + 8, vagas_efetivadas = vagas_efetivadas + 8 WHERE id_vaga_serie = 51934731;

UPDATE matricula.vaga_serie SET vagas_ocupadas = vagas_ocupadas - 8, vagas_solicitadas = vagas_solicitadas - 8, vagas_efetivadas = vagas_efetivadas - 8 WHERE id_vaga_serie = 51934731;

INSERT INTO matricula.vaga_serie
(id_vaga_serie, id_serie, numero_vagas, ano_letivo, id_escola, data_cadastro, id_turno, vagas_validadas, vagas_ocupadas, data_validacao, id_registro_validacao, vagas_solicitadas, vagas_efetivadas, vagas_ocupadas_1opc, vagas_ocupadas_2opc, vagas_ocupadas_mtl, vagas_ocupadas_antes_processamento, vagas_ocupadas_antes_listagem_2, ocupadas_interesse_op1, vagas_ocupadas_1opc_l1, vagas_ocupadas_2opc_l1, id_calendario_matricula, periodo, numero_turmas, aceita_novas_matriculas_nee, removida, exibir_remanescentes_bloqueadas, vagas_remanescentes_bloqueadas, desricao_remanescente_bloqueada, vagas_reservadas_militares, vagas_ocupadas_mtl_op2, vagas_ocupadas_mtl_2opc, id_registro_entrada)
VALUES(51934730, 1005219, 0, 2026, 51877480, NULL, 2, 29, 8, '2026-01-06 16:08:00.000', 5630858, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51899707, 1, 1, true, false, true, false, NULL, NULL, NULL, NULL, NULL);


COMMIT;



