BEGIN;

UPDATE basico.curriculo_basico	SET tipo_diario=2,possui_parte_diversificada=TRUE, tipo_diario_diversificado= 31	WHERE id_curriculo_basico IN (52040743,52050799);

SELECT 
'UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = '|| ts.id_turma_serie||';' AS solução, 
'UPDATE basico.turma_serie SET tipo_diario= '|| ts.tipo_diario||'	WHERE id_turma_serie = '|| ts.id_turma_serie||';' AS backup
FROM basico.turma_serie ts WHERE ts.id_curriculo_medio IN (52040743,52050799)
AND ts.ativo;


UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52035878;
UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52035889;
UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52035885;
UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52035128;
UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52038661;
UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52035127;
UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52035867;
UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52035892;
UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52035873;
UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52035856;
UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52035862;
UPDATE basico.turma_serie SET tipo_diario=2	WHERE id_turma_serie = 52035865;


COMMIT;

---


UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52035878;
UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52035889;
UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52035885;
UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52035128;
UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52038661;
UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52035127;
UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52035867;
UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52035892;
UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52035873;
UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52035856;
UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52035862;
UPDATE basico.turma_serie SET tipo_diario= 31	WHERE id_turma_serie = 52035865;