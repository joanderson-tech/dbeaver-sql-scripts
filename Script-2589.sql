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


--Backup estrutura SEC  

-- Remove a associação criada entre a série e a estrutura multisseriada.
DELETE
FROM basico.serie_multisseriada sm1
WHERE sm1.id_serie_multisseriada IN (SELECT id_serie_multisseriada
FROM basico.serie_multisseriada sm
WHERE sm.id_serie = 51869737
AND sm.id_serie_associada = 51893825
AND sm.ativo ) ;

-- Restaura o currículo anteriormente associado à estrutura multisseriada.
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51892872 WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=true WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892878;

-- Reativa os vínculos da estrutura multisseriada desativados na solução. 
UPDATE basico.serie_multisseriada SET ativo=false    WHERE id_serie_multisseriada IN (39, 40);
