--- restaura e atualizar medias finas ---
UPDATE ensino.matricula_componente SET media_final = 8.00, frequencia = 100.0, data_atualizacao = NOW()
WHERE id_matricula_componente = 17074183;
UPDATE ensino.matricula_componente SET media_final = 7.50, frequencia = 100.0, data_atualizacao = NOW()
WHERE id_matricula_componente = 17074182;
UPDATE ensino.matricula_componente SET media_final = 7.50, frequencia = 100.0, data_atualizacao = NOW()
WHERE id_matricula_componente = 17074187;
UPDATE ensino.matricula_componente SET media_final = 8.40, frequencia = 100.0, data_atualizacao = NOW()
WHERE id_matricula_componente = 17074185;
UPDATE ensino.matricula_componente SET media_final = 8.40, frequencia = 100.0, data_atualizacao = NOW()
WHERE id_matricula_componente = 17074186;
UPDATE ensino.matricula_componente SET media_final = 8.10, frequencia = 100.0, data_atualizacao = NOW()
WHERE id_matricula_componente = 17074184;
UPDATE ensino.matricula_componente SET media_final = 8.40, frequencia = 100.0, data_atualizacao = NOW()
WHERE id_matricula_componente = 17074188;
UPDATE ensino.matricula_componente SET media_final = 8.40, frequencia = 100.0,data_atualizacao = NOW()
WHERE id_matricula_componente = 17074191;
UPDATE ensino.matricula_componente SET media_final = 8.10, frequencia = 100.0, data_atualizacao = NOW()
WHERE id_matricula_componente = 17074189;

BEGIN;

ROLLBACK ;

--- remnover notas zeradas dos novos componentes ---
DELETE FROM ensino.nota_unidade nu WHERE nu.id_matricula_componente IN (17074182, 17074183, 17074184, 17074185, 17074186, 17074187, 17074188, 17074189, 17074190, 17074191) 
AND nu.nota IS NULL;

 SELECT * FROM ensino.nota_unidade nu WHERE nu.id_matricula_componente IN (17074182, 17074183, 17074184, 17074185, 17074186, 17074187, 17074188, 17074189, 17074190, 17074191) ;
AND nu.nota IS NULL;

-- mover as notas para os componentes corretos
UPDATE ensino.nota_unidade SET id_matricula_componente = 17074182 WHERE id_matricula_componente = 17064335;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17074183 WHERE id_matricula_componente = 17064334;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17074184 WHERE id_matricula_componente = 17064333;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17074185 WHERE id_matricula_componente = 17064332;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17074186 WHERE id_matricula_componente = 17064331;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17074187 WHERE id_matricula_componente = 17064328;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17074188 WHERE id_matricula_componente = 17064327;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17074189 WHERE id_matricula_componente = 17064329;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17074191 WHERE id_matricula_componente = 17064330;


SELECT * FROM ensino.nota_unidade nu 
WHERE nu.id_matricula_componente = 17074182;


COMMIT;
