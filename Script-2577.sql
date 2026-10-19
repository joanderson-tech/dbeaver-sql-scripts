SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo = 'SEC'; --51906797

SELECT * FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico = 51894087;

SELECT * 
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51906811, 51908329);
AND ts.id_serie IN (51892871)
AND ts.ativo;

SELECT *
--'UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
--'UPDATE basico.turma_serie SET id_serie=51892870, id_curriculo_medio=51892872 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51906811, 51908329) 
AND ts.ativo 
AND ts.id_serie = 51892870
AND ts.id_curriculo_medio = 51892872;

SELECT mc.*
FROM basico.turma_serie ts
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie  
WHERE ts.id_turma_serie IN (51906811, 51908329)  
OR ts.id_turma_serie_agrupadora IN (51906811, 51908329) ;
GROUP BY mc.id_discente ;


-- Auto-generated SQL script #202607271559
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51894087 WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=FALSE WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892878 AND ativo=true;



SELECT DISTINCT t.id_turma_serie FROM ensino.turma t WHERE t.id_turma_serie IN (51903794, 51903795, 51903796, 51903797, 51903793, 51904191, 51904192, 51904193, 51904194, 51904190, 51906750, 51906751, 51906752, 51906753, 51906749, 51906793, 51906794, 51906795, 51906796, 51906835, 51906792, 51906836, 51906837, 51906838, 51906834, 51916695, 51916696, 51916697, 51916693, 51916694);

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51906811, 51908329);
AND ts.id_serie IN (51892870);

UPDATE basico.turma_serie SET ativo=false WHERE id_turma_serie IN ( 51903797,51904194,51906753,51906796,51906838,51916697);

SELECT * FROM basico.serie_multisseriada sm  where sm.id_serie_associada  = 51893825;

SELECT * FROM basico.curriculo_basico_serie_multisseriada cbsm WHERE cbsm.id_curriculo_basico = 51906797;



SELECT * FROM ensino.turma t 
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie IN (51903796,51903797)


51869715, 51869714, 51893825

SELECT s.* FROM basico.serie  s;
WHERE id_serie = 51900646;



UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( 51906752,51903796,51904193,51906795,51906837,51916696);


UPDATE basico.turma_serie SET id_serie=51892870, id_curriculo_medio=51892872 WHERE id_turma_serie IN ( 51906752,51903796,51904193,51906795,51906837,51916696);


BEGIN;
ROLLBACK;

--associa a serie_multisseriada.
INSERT INTO basico.serie_multisseriada (id_serie_multisseriada, id_serie, id_serie_associada, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao) 
VALUES(nextval('basico.serie_multisseriada_seq'), 51900646, 51893825, true, null, NULL, now(), NULL);

--Atualiza curriculo associado a estrutura multiseriada associada a serie.
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51894087 WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=FALSE WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892878;

--backup
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51892872 WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=ativo WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892878;

--desativa as series erradas 
UPDATE basico.serie_multisseriada     SET ativo=false    WHERE id_serie_multisseriada IN (41,42);

-- desativa os curriculos associado a estrutura multiseriada 
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=true WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892878 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=true WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;

--backup e solução desativa as tumas series vinculada a serie errada. 
SELECT 
'UPDATE basico.turma_serie SET ativo=false WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET ativo=true WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693)
AND ts.id_serie IN (51892870, 51892871);

--Atualiza as turmas seria da para a serie e curriculo da nova serie.
SELECT 
'UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET id_serie=51892870, id_curriculo_medio=51892872 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693) 
AND ts.ativo 
AND ts.id_serie = 51892870
AND ts.id_curriculo_medio = 51892872;

--backup e solução desativa as matriculas do estudante alinhado com suporte.
SELECT 
'UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS solução,
'UPDATE ensino.matricula_componente SET id_situacao_matricula='||mc.id_situacao_matricula ||'  WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie  
WHERE ts.id_turma_serie IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693)  
OR ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693) 
GROUP BY mc.id_situacao_matricula;




