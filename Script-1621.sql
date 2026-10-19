--solução 
SELECT 
'UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie=51934739	WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' AS script, 
'UPDATE basico.matricula_estudante_serie 	SET id_vaga_serie= ' || mes.id_vaga_serie || '	WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' AS backup
FROM basico.matricula_estudante_serie mes
WHERE mes.id_vaga_serie = 51934740
GROUP BY mes.id_vaga_serie;

SELECT 
'UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= 51934739	WHERE id_vaga_serie_movimentacao IN (' || STRING_AGG(id_vaga_serie_movimentacao::text, ', ') || ');' AS script, 
'UPDATE matricula.vaga_serie_movimentacao 	SET id_vaga_serie= ' || id_vaga_serie || '	WHERE id_vaga_serie_movimentacao IN (' || STRING_AGG(id_vaga_serie_movimentacao::text, ', ') || ');' AS backup
FROM matricula.vaga_serie_movimentacao 
WHERE id_vaga_serie = 51934740
GROUP BY id_vaga_serie;

SELECT 
'UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934739	WHERE id_operacao_vaga_serie IN (' || STRING_AGG(id_operacao_vaga_serie::text, ', ') || ');' AS script, 
'UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= ' || id_vaga_serie || '	WHERE id_operacao_vaga_serie IN (' || STRING_AGG(id_operacao_vaga_serie::text, ', ') || ');' AS backup
FROM matricula.operacao_vaga_serie
WHERE id_vaga_serie = 51934740
GROUP BY id_vaga_serie;

UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934739	WHERE id_operacao_vaga_serie IN (51936318, 51936366, 51936575, 51954944, 51958229, 51962409, 51962508);

--UPDATE matricula.operacao_vaga_serie 	SET id_vaga_serie= 51934740	WHERE id_operacao_vaga_serie IN (51936318, 51936366, 51936575, 51954944, 51958229, 51962409, 51962508);


SELECT 
    -- Script SOLUÇÃO
    'UPDATE matricula.vaga_serie SET ' ||
    'vagas_ocupadas = vagas_ocupadas + ' || v30.vagas_ocupadas || ', ' ||
    'vagas_solicitadas = vagas_solicitadas + ' || v30.vagas_solicitadas || ', ' ||
    'vagas_efetivadas = vagas_efetivadas + ' || v30.vagas_efetivadas || 
    ' WHERE id_vaga_serie = 51934739;' AS script_soma,
    -- Script de BACKUP 
    'UPDATE matricula.vaga_serie SET ' ||
    'vagas_ocupadas = vagas_ocupadas - ' || v30.vagas_ocupadas || ', ' ||
    'vagas_solicitadas = vagas_solicitadas - ' || v30.vagas_solicitadas || ', ' ||
    'vagas_efetivadas = vagas_efetivadas - ' || v30.vagas_efetivadas || 
    ' WHERE id_vaga_serie = 51934739;' AS script_backup
FROM 
    (SELECT * FROM matricula.vaga_serie WHERE id_vaga_serie = 51934739) v30,
    (SELECT * FROM matricula.vaga_serie WHERE id_vaga_serie = 51934740) v31;

--UPDATE matricula.renovacao_matricula 	SET id_vaga_serie=51934739	WHERE id_renovacao_matricula=51936403;

--DELETE FROM matricula.vaga_serie WHERE id_vaga_serie=51934740;

SELECT * FROM  matricula.vaga_serie WHERE id_vaga_serie IN (51934739, 51934740) ;



BEGIN;