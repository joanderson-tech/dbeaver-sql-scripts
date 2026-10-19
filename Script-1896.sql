INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (37, true, 61640186, 52232943, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (38, true, 61639524, 52232943, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (39, true, 61639553, 52232943, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (40, true, 61639644, 52232943, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (41, true, 61639761, 52232943, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (42, true, 61640186, 70107728, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (43, true, 61639524, 70107728, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (44, true, 61639553, 70107728, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (45, true, 61639644, 70107728, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (46, true, 61639761, 70107728, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (47, true, 61640186, 52232997, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (48, true, 61639524, 52232997, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (49, true, 61639553, 52232997, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (50, true, 61639644, 52232997, '2026-03-02 18:01:32.425005-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (51, true, 61639761, 52232997, '2026-03-02 18:01:32.425005-03');

--G1 
UPDATE basico.turma_serie	SET id_curriculo_medio= 61640186 WHERE id_turma_serie = 84521648;

--G2
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639524 WHERE id_turma_serie = 84520991;

--G3
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639553 WHERE id_turma_serie = 84521870;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639553 WHERE id_turma_serie = 84521935;

--G4
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 84521157;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 84521158;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 84521159;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 84521218;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 84521219;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 84521253;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 84521254;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 84521255;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 84521256;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 84521257;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 84521258;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = 85042982;

--G5
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = 84521406;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = 84521407;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = 84521408;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = 84521470;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = 84521471;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = 84521507;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = 84521508;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = 84521509;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = 84521510;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = 84521511;
UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = 84521512;


COMMIT;

