BEGIN;


--solução 
SELECT 
'UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie=51934731	WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' AS script, 
'UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie= ' || mes.id_vaga_serie || '	WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' AS backup
FROM basico.matricula_estudante_serie mes
WHERE mes.id_vaga_serie = 51934730
GROUP BY mes.id_vaga_serie;

UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie=51934731	WHERE id_matricula_discente_serie IN (1340067, 1340064, 1340063, 1340066);

UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie= 51934730	WHERE id_matricula_discente_serie IN (1340067, 1340064, 1340063, 1340066);

SELECT 
'UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= 51934731	WHERE id_vaga_serie_movimentacao IN (' || STRING_AGG(id_vaga_serie_movimentacao::text, ', ') || ');' AS script, 
'UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= ' || id_vaga_serie || '	WHERE id_vaga_serie_movimentacao IN (' || STRING_AGG(id_vaga_serie_movimentacao::text, ', ') || ');' AS backup
FROM matricula.vaga_serie_movimentacao 
WHERE id_vaga_serie = 51934730
GROUP BY id_vaga_serie;

UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= 51934731	WHERE id_vaga_serie_movimentacao IN (2138212, 2138213, 2138214, 2138164, 2138165, 2138166, 2138235, 2138236, 2138237, 2138259, 2138260, 2138261);


UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= 51934730	WHERE id_vaga_serie_movimentacao IN (2138212, 2138213, 2138214, 2138164, 2138165, 2138166, 2138235, 2138236, 2138237, 2138259, 2138260, 2138261);

SELECT 
'UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934731	WHERE id_operacao_vaga_serie IN (' || STRING_AGG(id_operacao_vaga_serie::text, ', ') || ');' AS script, 
'UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= ' || id_vaga_serie || '	WHERE id_operacao_vaga_serie IN (' || STRING_AGG(id_operacao_vaga_serie::text, ', ') || ');' AS backup
FROM matricula.operacao_vaga_serie
WHERE id_vaga_serie = 51934730
GROUP BY id_vaga_serie;

UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934731	WHERE id_operacao_vaga_serie IN (51936315, 51936355, 51936362, 51936571, 51954933, 51954940, 51958221, 51958226, 51962406, 51962504, 51971346, 51976171, 51976321, 51976435, 51976480, 51976537, 51978946, 51979130, 51979750, 51979865, 51979908);



UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934730	WHERE id_operacao_vaga_serie IN (51936315, 51936355, 51936362, 51936571, 51954933, 51954940, 51958221, 51958226, 51962406, 51962504, 51971346, 51976171, 51976321, 51976435, 51976480, 51976537, 51978946, 51979130, 51979750, 51979865, 51979908);


SELECT 
    -- Script SOLUÇÃO
    'UPDATE matricula.vaga_serie SET ' ||
    'vagas_ocupadas = vagas_ocupadas + ' || v30.vagas_ocupadas || ', ' ||
    'vagas_solicitadas = vagas_solicitadas + ' || v30.vagas_solicitadas || ', ' ||
    'vagas_efetivadas = vagas_efetivadas + ' || v30.vagas_efetivadas || 
    ' WHERE id_vaga_serie = 51934731;' AS script_soma,
    -- Script de BACKUP 
    'UPDATE matricula.vaga_serie SET ' ||
    'vagas_ocupadas = vagas_ocupadas - ' || v30.vagas_ocupadas || ', ' ||
    'vagas_solicitadas = vagas_solicitadas - ' || v30.vagas_solicitadas || ', ' ||
    'vagas_efetivadas = vagas_efetivadas - ' || v30.vagas_efetivadas || 
    ' WHERE id_vaga_serie = 51934731;' AS script_backup
FROM 
    (SELECT * FROM matricula.vaga_serie WHERE id_vaga_serie = 51934731) v30,
    (SELECT * FROM matricula.vaga_serie WHERE id_vaga_serie = 51934730) v31;



UPDATE matricula.vaga_serie SET vagas_ocupadas = vagas_ocupadas + 9, vagas_solicitadas = vagas_solicitadas + 9, vagas_efetivadas = vagas_efetivadas + 9 WHERE id_vaga_serie = 51934731;

UPDATE matricula.vaga_serie SET vagas_ocupadas = vagas_ocupadas - 9, vagas_solicitadas = vagas_solicitadas - 9, vagas_efetivadas = vagas_efetivadas - 9 WHERE id_vaga_serie = 51934731;

UPDATE matricula.renovacao_matricula 	SET id_vaga_serie=51934731	WHERE id_renovacao_matricula=51936403;

DELETE FROM matricula.vaga_serie WHERE id_vaga_serie=51934730;


COMMIT;
