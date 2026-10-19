SELECT * FROM basico.turma_serie ts;


SELECT * FROM basico.modalidade_ensino_basico;
WHERE id_modalidade_ensino_basico = 51879299;

BEGIN;



SELECT * FROM  basico.etapa_ensino WHERE id_modalidade = 51879299;

BEGIN;
ROLLBACK;


INSERT INTO basico.modalidade_ensino_basico (id_modalidade_ensino_basico, denominacao, seq_censo, id_unidade, data_cadastro, data_atualizacao, id_registro_atualizacao, id_registro_cadastro) VALUES(51879299, 'INTEGRAL', NULL, 605, NULL, '2026-05-15 11:55:13.385', 5622813, NULL);
UPDATE basico.etapa_ensino  SET id_modalidade=51879299    WHERE id_etapa_ensino IN (51886299, 51879301, 51886059, 51886309);



UPDATE basico.etapa_ensino  SET id_modalidade=1    WHERE id_etapa_ensino IN (51886299, 51879301, 51886059, 51886309);
DELETE FROM basico.modalidade_ensino_basico WHERE id_modalidade_ensino_basico=51879299;



COMMIT;

