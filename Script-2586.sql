--Solução estrutura MULTIMAP    

-- Associa a série correta à estrutura multisseriada.
INSERT INTO basico.serie_multisseriada (id_serie_multisseriada, id_serie, id_serie_associada, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao) 
VALUES(nextval('basico.serie_multisseriada_seq'), 51900646, 51893825, true, null, NULL, now(), NULL);

-- Atualiza o currículo associado à estrutura multisseriada para utilizar a série correta.
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51894087 WHERE id_curriculo_basico=51893832 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=FALSE WHERE id_curriculo_basico=51893832 AND id_curriculo_basico_serie_associada=51892878;

-- Desativa os vínculos incorretos da estrutura multisseriada.
UPDATE basico.serie_multisseriada SET ativo=false    WHERE id_serie_multisseriada IN (41,42);

-- Gera os scripts de solução e backup para desativar os vínculos de turma/série associados à série incorreta.
SELECT 
'UPDATE basico.turma_serie SET ativo=false WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET ativo=true WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693)
AND ts.id_serie IN (51892871);

-- Gera os scripts de solução e backup para atualizar a série e o currículo das turmas para a estrutura correta.
SELECT 
'UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET id_serie=51892870, id_curriculo_medio=51892872 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693) 
AND ts.ativo 
AND ts.id_serie = 51892870
AND ts.id_curriculo_medio = 51892872;

-- Gera os scripts de solução e backup para atualizar a situação das matrículas dos componentes dos estudantes, conforme alinhamento com o suporte.
SELECT 
'UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS solução,
'UPDATE ensino.matricula_componente SET id_situacao_matricula='||mc.id_situacao_matricula ||'  WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie  
WHERE ts.id_turma_serie IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693)  
OR ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693) 
GROUP BY mc.id_situacao_matricula;

--Backup estrutura MULTIMAP  

-- Remove a associação criada entre a série e a estrutura multisseriada.
DELETE
FROM basico.serie_multisseriada sm1
WHERE sm1.id_serie_multisseriada IN (SELECT id_serie_multisseriada
FROM basico.serie_multisseriada sm
WHERE sm.id_serie = 51900646
AND sm.id_serie_associada = 51893825
AND sm.ativo ) ;

-- Restaura o currículo anteriormente associado à estrutura multisseriada.
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51892872 WHERE id_curriculo_basico=51893832 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=true WHERE id_curriculo_basico=51893832 AND id_curriculo_basico_serie_associada=51892878;

-- Reativa os vínculos da estrutura multisseriada desativados na solução. 
UPDATE basico.serie_multisseriada SET ativo=false    WHERE id_serie_multisseriada IN (41,42);
