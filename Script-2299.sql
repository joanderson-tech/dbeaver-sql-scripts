BEGIN;

UPDATE basico.curriculo_basico SET tipo_diario = 48 WHERE id_curriculo_basico IN (67366644, 67367753);
UPDATE basico.curriculo_basico SET tipo_diario = 49 WHERE id_curriculo_basico = 67367880;
SELECT 
    'UPDATE basico.turma_serie SET tipo_diario = ' || 
    CASE 
        WHEN ts.id_curriculo_medio IN (67366644, 67367753) THEN '48'
        WHEN ts.id_curriculo_medio = 67367880 THEN '49'
    END || 
    ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS solucao,
    'UPDATE basico.turma_serie SET tipo_diario = ' || COALESCE(ts.tipo_diario::text, 'NULL') || 
    ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS backup
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio IN (67366644, 67367753, 67367880)
AND ts.ativo;
COMMIT;


UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67379102;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67379151;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67495410;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67495411;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67495413;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67495415;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67495417;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67495418;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67495420;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67495421;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67495424;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67495426;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67379159;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67379161;
UPDATE basico.turma_serie SET tipo_diario = 49 WHERE id_turma_serie = 67379163;
UPDATE basico.turma_serie SET tipo_diario = 49 WHERE id_turma_serie = 67379165;




UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67379102;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67379151;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67495410;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67495411;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67495413;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67495415;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67495417;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67495418;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67495420;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67495421;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67495424;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie = 67495426;
UPDATE basico.turma_serie SET tipo_diario = 0 WHERE id_turma_serie = 67379159;
UPDATE basico.turma_serie SET tipo_diario = 0 WHERE id_turma_serie = 67379161;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67379163;
UPDATE basico.turma_serie SET tipo_diario = 48 WHERE id_turma_serie = 67379165;