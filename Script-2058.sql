SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo IN('AI4', 'AI5', 'AI4INT', 'AI5INT');

--Solucao
UPDATE basico.curriculo_basico 	SET tipo_diario=38	WHERE id_curriculo_basico IN(35501103, 35500365, 51896922, 51896907);
UPDATE basico.turma_serie 	SET tipo_diario=38	WHERE id_turma_serie IN (51887116,51887117,51891580,51892361,51892362,51892132,51897241,51897252,51897704,51897776,51902460,51902461);


--backup
UPDATE basico.curriculo_basico 	SET tipo_diario=2	WHERE id_curriculo_basico IN(51896922, 51896907)
UPDATE basico.curriculo_basico 	SET tipo_diario=37	WHERE id_curriculo_basico IN(35501103, 35500365)

UPDATE basico.turma_serie 	SET tipo_diario=37	WHERE id_turma_serie IN (51887116,51887117,51891580,51892361,51892362,51892132,51897241,51897252,51897704);
UPDATE basico.turma_serie 	SET tipo_diario=38	WHERE id_turma_serie IN (51897776,51902460,51902461);


SELECT *
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio IN(35501103, 35500365, 51896922, 51896907)
AND ativo
AND ts.tipo_diario = 2;

SELECT *
FROM ensino.turma t
WHERE t.id_turma_serie = 51892132;






SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || 
    ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS script_backup_turma,
    -- SOLUÇÃO DA TURMA
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || 
    CASE 
        WHEN ts.id_curriculo_medio = 51878358 THEN 52040743 -- 4 para 4E
        WHEN ts.id_curriculo_medio = 51878374 THEN 52050799 -- 5 para 5E
    END || 
    ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS script_solucao_turma,

    '-- Turma: ' || ts.nome AS nome_turma
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio IN (51878358, 51878374)
  AND ts.id_escola = 1822
  AND ts.ano = 2026
  AND ts.id_turno = 1
  AND ts.ativo = true;