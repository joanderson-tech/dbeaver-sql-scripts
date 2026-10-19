SELECT * FROM basico.curriculo_basico cb WHERE cb.tipo_diario = 37 AND cb.ativo ;

SELECT * FROM basico.curriculo_basico cb WHERE cb.tipo_diario = 37 AND cb.ativo AND cb.id_curriculo_basico IN (51899009,51898996)


SELECT * FROM basico.curriculo_basico cb WHERE cb.tipo_diario = 37 AND cb.ativo AND cb.id_curriculo_basico = 51902253;


SELECT * FROM ensino_infantil.opcao_grupo_avaliacao_relatorio ;


--CORRETO
SELECT ts.nome, ts.id_escola FROM basico.turma_serie ts WHERE ts.id_turma_serie  IN(51901939,51901940,51901941,51901942);

--ERRADO
SELECT 
'UPDATE basico.turma_serie SET tipo_diario = 37 WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS SOLUÇÃO,
'UPDATE basico.turma_serie SET tipo_diario =' || ts.tipo_diario || ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS BACKUP
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio IN (51899009, 51898996)
AND ts.tipo_diario <> 37;


SELECT mes.* 
FROM basico.turma_serie ts 
JOIN basico.matricula_estudante_serie mes on mes.id_turma_serie = ts.id_turma_serie 
WHERE ts.id_curriculo_medio IN (51899009, 51898996);



-- Auto-generated SQL script #202605051043
UPDATE basico.turma_serie 	SET tipo_diario=10	WHERE id_turma_serie=51901939;
UPDATE basico.turma_serie SET tipo_diario=37 WHERE id_turma_serie = 51901940;
UPDATE basico.turma_serie SET tipo_diario=37 WHERE id_turma_serie = 51901941;
UPDATE basico.turma_serie SET tipo_diario=37 WHERE id_turma_serie = 51901942;
