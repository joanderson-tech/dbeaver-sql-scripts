--solução 
SELECT 
'UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie=51934729	WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' AS script, 
'UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie= ' || mes.id_vaga_serie || '	WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' AS backup
FROM basico.matricula_estudante_serie mes
WHERE mes.id_vaga_serie = 51934728
GROUP BY mes.id_vaga_serie;

SELECT 
'UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= 51934729	WHERE id_vaga_serie_movimentacao IN (' || STRING_AGG(id_vaga_serie_movimentacao::text, ', ') || ');' AS script, 
'UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= ' || id_vaga_serie || '	WHERE id_vaga_serie_movimentacao IN (' || STRING_AGG(id_vaga_serie_movimentacao::text, ', ') || ');' AS backup
FROM matricula.vaga_serie_movimentacao 
WHERE id_vaga_serie = 51934728
GROUP BY id_vaga_serie;

SELECT 
'UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934729	WHERE id_operacao_vaga_serie IN (' || STRING_AGG(id_operacao_vaga_serie::text, ', ') || ');' AS script, 
'UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= ' || id_vaga_serie || '	WHERE id_operacao_vaga_serie IN (' || STRING_AGG(id_operacao_vaga_serie::text, ', ') || ');' AS backup
FROM matricula.operacao_vaga_serie
WHERE id_vaga_serie = 51934728
GROUP BY id_vaga_serie;

UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934729	WHERE id_operacao_vaga_serie IN (51936318, 51936366, 51936575, 51954944, 51958229, 51962409, 51962508);

--UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934728	WHERE id_operacao_vaga_serie IN (51936318, 51936366, 51936575, 51954944, 51958229, 51962409, 51962508);


SELECT 
    -- Script SOLUÇÃO
    'UPDATE matricula.vaga_serie SET ' ||
    'vagas_ocupadas = vagas_ocupadas + ' || v30.vagas_ocupadas || ', ' ||
    'vagas_solicitadas = vagas_solicitadas + ' || v30.vagas_solicitadas || ', ' ||
    'vagas_efetivadas = vagas_efetivadas + ' || v30.vagas_efetivadas || 
    ' WHERE id_vaga_serie = 51934729;' AS script_soma,
    -- Script de BACKUP 
    'UPDATE matricula.vaga_serie SET ' ||
    'vagas_ocupadas = vagas_ocupadas - ' || v30.vagas_ocupadas || ', ' ||
    'vagas_solicitadas = vagas_solicitadas - ' || v30.vagas_solicitadas || ', ' ||
    'vagas_efetivadas = vagas_efetivadas - ' || v30.vagas_efetivadas || 
    ' WHERE id_vaga_serie = 51934729;' AS script_backup
FROM 
    (SELECT * FROM matricula.vaga_serie WHERE id_vaga_serie = 51934729) v30,
    (SELECT * FROM matricula.vaga_serie WHERE id_vaga_serie = 51934728) v31;

--UPDATE matricula.renovacao_matricula 	SET id_vaga_serie=51934729	WHERE id_renovacao_matricula=51936403;

--DELETE FROM matricula.vaga_serie WHERE id_vaga_serie=51934728;


BEGIN;

ROLLBACK;


SELECT * FROM  matricula.vaga_serie WHERE id_vaga_serie IN (51934728, 51934729) ;





INSERT INTO matricula.vaga_serie
(id_vaga_serie, id_serie, numero_vagas, ano_letivo, id_escola, data_cadastro, id_turno, vagas_validadas, vagas_ocupadas, data_validacao, id_registro_validacao, vagas_solicitadas, vagas_efetivadas, vagas_ocupadas_1opc, vagas_ocupadas_2opc, vagas_ocupadas_mtl, vagas_ocupadas_antes_processamento, vagas_ocupadas_antes_listagem_2, ocupadas_interesse_op1, vagas_ocupadas_1opc_l1, vagas_ocupadas_2opc_l1, id_calendario_matricula, periodo, numero_turmas, aceita_novas_matriculas_nee, removida, exibir_remanescentes_bloqueadas, vagas_remanescentes_bloqueadas, desricao_remanescente_bloqueada, vagas_reservadas_militares, vagas_ocupadas_mtl_op2, vagas_ocupadas_mtl_2opc, id_registro_entrada)
VALUES(51934728, 1005221, 0, 2026, 51877480, NULL, 2, 0, 0, '2025-12-26 10:54:50.000', 5628332, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51899707, 1, NULL, true, false, true, false, NULL, NULL, NULL, NULL, NULL);
