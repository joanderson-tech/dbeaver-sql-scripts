BEGIN;
ROLLBACK;



SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51906811, 51908329);

--associa a serie_multisseriada.
INSERT INTO basico.serie_multisseriada (id_serie_multisseriada, id_serie, id_serie_associada, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao) 
VALUES(nextval('basico.serie_multisseriada_seq'), 51869737, 51893825, true, null, NULL, now(), NULL);

-- backup
DELETE
FROM basico.serie_multisseriada sm1
WHERE sm1.id_serie_multisseriada IN (SELECT id_serie_multisseriada
FROM basico.serie_multisseriada sm
WHERE sm.id_serie = 51869737
AND sm.id_serie_associada = 51893825
AND sm.ativo ) ;


--Atualiza curriculo associado a estrutura multiseriada associada a serie.
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51894087 WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=FALSE WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892878;

--backup desativa os curriculos associado a estrutura multiseriada 
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51892872 WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=true WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892878;

--desativa as series erradas 
UPDATE basico.serie_multisseriada SET ativo=false    WHERE id_serie_multisseriada IN (39, 40);

--backup desativa as series erradas 
UPDATE basico.serie_multisseriada SET ativo=false    WHERE id_serie_multisseriada IN (39, 40);


--backup e solução desativa as tumas series vinculada a serie errada. 
SELECT 
'UPDATE basico.turma_serie SET ativo=false WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET ativo=true WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51906811, 51908329)
AND ts.id_serie IN (51892871);

UPDATE basico.turma_serie SET ativo=false WHERE id_turma_serie IN ( 51906814,51908332);

--Atualiza as turmas seria da para a serie e curriculo da nova serie.
SELECT 
'UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET id_serie=51892870, id_curriculo_medio=51892872 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51906811, 51908329) 
AND ts.ativo 
AND ts.id_serie = 51892870
AND ts.id_curriculo_medio = 51892872;

UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( 51906813,51908331);


--backup e solução desativa as matriculas do estudante alinhado com suporte.
SELECT 
'UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS solução,
'UPDATE ensino.matricula_componente SET id_situacao_matricula='||mc.id_situacao_matricula ||'  WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie  
WHERE ts.id_turma_serie IN (51906811, 51908329)  
OR ts.id_turma_serie_agrupadora IN (51906811, 51908329) 
GROUP BY mc.id_situacao_matricula;

UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN ( 17029253,17029254,17029255,17029256,17029257,17029258,17029259,17029260,17029261);
UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN ( 17029262,17029263,17029264,17029265,17029266,17029267,17029268,17029269,17029270,17029271,17029272,17029273,17029496,17029497,17029498,17029499,17029500,17029501,17029502,17029503,17029504);




