SELECT nu.*
FROM ensino.nota_unidade nu
WHERE nu.id_matricula_componente IN (17074182, 17074183, 17074184, 17074185, 17074186, 17074187, 17074188, 17074189,17074190, 17074191)
AND nota IS NULL;





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

--- remnover notas zeradas dos novos componentes ---ffffffffffffffffffffffffffffff

BEGIN;

DELETE FROM ensino.nota_unidade nu WHERE nu.id_matricula_componente IN (17074182, 17074183, 17074184, 17074185, 17074186, 17074187, 17074188, 17074189, 17074190, 17074191) AND nota IS NULL;

COMMIT;

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


---===================================



INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274407, 0, 1, NULL, 17074182, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274408, 0, 2, NULL, 17074182, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274409, 0, 3, NULL, 17074182, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274410, 0, 4, NULL, 17074182, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274411, 0, 1, NULL, 17074183, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274412, 0, 2, NULL, 17074183, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274413, 0, 3, NULL, 17074183, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274414, 0, 4, NULL, 17074183, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274415, 0, 1, NULL, 17074184, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274416, 0, 2, NULL, 17074184, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274417, 0, 3, NULL, 17074184, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274418, 0, 4, NULL, 17074184, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274419, 0, 1, NULL, 17074185, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274420, 0, 2, NULL, 17074185, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274421, 0, 3, NULL, 17074185, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274422, 0, 4, NULL, 17074185, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274423, 0, 1, NULL, 17074186, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274424, 0, 2, NULL, 17074186, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274425, 0, 3, NULL, 17074186, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274426, 0, 4, NULL, 17074186, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274427, 0, 1, NULL, 17074187, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274428, 0, 2, NULL, 17074187, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274429, 0, 3, NULL, 17074187, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274430, 0, 4, NULL, 17074187, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274431, 0, 1, NULL, 17074188, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274432, 0, 2, NULL, 17074188, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274433, 0, 3, NULL, 17074188, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274434, 0, 4, NULL, 17074188, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274435, 0, 1, NULL, 17074189, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274436, 0, 2, NULL, 17074189, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274437, 0, 3, NULL, 17074189, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274438, 0, 4, NULL, 17074189, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274439, 0, 1, NULL, 17074191, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274440, 0, 2, NULL, 17074191, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274441, 0, 3, NULL, 17074191, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);
INSERT INTO ensino.nota_unidade
(id_nota_unidade, faltas, unidade, nota, id_matricula_componente, recuperacao, "@nota_numeric", data_cadastro, ativo, id_registro_atualizacao, data_atualizacao, id_registro_cadastro, id_descricao_nota, ausente, nota_anterior)
VALUES(52274442, 0, 4, NULL, 17074191, false, NULL, '2026-05-08 08:59:50.764', true, NULL, NULL, 5662786, NULL, false, NULL);


BEGIN;

UPDATE ensino.nota_unidade SET id_matricula_componente = 17064335 WHERE id_matricula_componente = 17074182;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17064334 WHERE id_matricula_componente = 17074183;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17064333 WHERE id_matricula_componente = 17074184;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17064332 WHERE id_matricula_componente = 17074185;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17064331 WHERE id_matricula_componente = 17074186;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17064328 WHERE id_matricula_componente = 17074187;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17064327 WHERE id_matricula_componente = 17074188;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17064329 WHERE id_matricula_componente = 17074189;
UPDATE ensino.nota_unidade SET id_matricula_componente = 17064330 WHERE id_matricula_componente = 17074191;

UPDATE ensino.nota_unidade SET id_matricula_componente=17074182 WHERE id_nota_unidade=52274407;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074182 WHERE id_nota_unidade=52274408;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074182 WHERE id_nota_unidade=52274409;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074182 WHERE id_nota_unidade=52274410;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074183 WHERE id_nota_unidade=52274411;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074183 WHERE id_nota_unidade=52274412;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074183 WHERE id_nota_unidade=52274413;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074183 WHERE id_nota_unidade=52274414;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074184 WHERE id_nota_unidade=52274415;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074184 WHERE id_nota_unidade=52274416;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074184 WHERE id_nota_unidade=52274417;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074184 WHERE id_nota_unidade=52274418;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074185 WHERE id_nota_unidade=52274419;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074185 WHERE id_nota_unidade=52274420;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074185 WHERE id_nota_unidade=52274421;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074185 WHERE id_nota_unidade=52274422;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074186 WHERE id_nota_unidade=52274423;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074186 WHERE id_nota_unidade=52274424;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074186 WHERE id_nota_unidade=52274425;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074186 WHERE id_nota_unidade=52274426;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074187 WHERE id_nota_unidade=52274427;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074187 WHERE id_nota_unidade=52274428;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074187 WHERE id_nota_unidade=52274429;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074187 WHERE id_nota_unidade=52274430;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074188 WHERE id_nota_unidade=52274431;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074188 WHERE id_nota_unidade=52274432;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074188 WHERE id_nota_unidade=52274433;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074188 WHERE id_nota_unidade=52274434;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074189 WHERE id_nota_unidade=52274435;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074189 WHERE id_nota_unidade=52274436;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074189 WHERE id_nota_unidade=52274437;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074189 WHERE id_nota_unidade=52274438;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074191 WHERE id_nota_unidade=52274439;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074191 WHERE id_nota_unidade=52274440;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074191 WHERE id_nota_unidade=52274441;
UPDATE ensino.nota_unidade SET id_matricula_componente=17074191 WHERE id_nota_unidade=52274442;



COMMIT;
