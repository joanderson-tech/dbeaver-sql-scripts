SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%TIA DULCINEIA%'



BEGIN;

-- 1. Criamos o mapeamento exato conforme a sua regra de negócio
CREATE TEMP TABLE temp_mapa_escolas (id_escola bigint, codigo_curriculo text);

INSERT INTO temp_mapa_escolas (id_escola, codigo_curriculo) VALUES
(52232943, 'EMEITIM2'), (52232943, 'EMEITIP1'), (52232943, 'EMEITIP2'), -- DR WASHINGTON BARROS (G3, G4, G5)
(70107728, 'EMEITIP1'), (70107728, 'EMEITIP2'),-- INFANCIA N-10 (G4, G5)
-- TIA DULCINEIA (G1 ao G5)
(52232997, 'EMEITIB2'), (52232997, 'EMEITIM1'), (52232997, 'EMEITIM2'), (52232997, 'EMEITIP1'), (52232997, 'EMEITIP2');

-- 2. Geramos a estrutura final cruzando as informações
SELECT 
    nextval('basico.escola_curriculo_sequence') as id_insert, 
    cb.id_curriculo_basico,
    mapa.id_escola
INTO TEMP curriculo_estruturas 
FROM basico.curriculo_basico cb 
JOIN temp_mapa_escolas mapa ON cb.codigo = mapa.codigo_curriculo;

-- 3. Resultado Final (Insert e Backup)
SELECT
    'INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) ' ||
    'VALUES ('|| id_insert ||', true, '|| id_curriculo_basico ||', '|| id_escola ||', '''|| now() ||''');' AS solucao,
    'DELETE FROM basico.escola_curriculo WHERE id = ' || id_insert || ';' AS backup
FROM curriculo_estruturas 
ORDER BY id_escola;


INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (92, true, 61639553, 52232943, '2026-02-24 14:56:00.020047-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (93, true, 61639644, 52232943, '2026-02-24 14:56:00.020047-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (94, true, 61639761, 52232943, '2026-02-24 14:56:00.020047-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (101, true, 61639761, 52232997, '2026-02-24 14:56:00.020047-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (99, true, 61639553, 52232997, '2026-02-24 14:56:00.020047-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (100, true, 61639644, 52232997, '2026-02-24 14:56:00.020047-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (97, true, 61640186, 52232997, '2026-02-24 14:56:00.020047-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (98, true, 61639524, 52232997, '2026-02-24 14:56:00.020047-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (96, true, 61639761, 70107728, '2026-02-24 14:56:00.020047-03');
INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) VALUES (95, true, 61639644, 70107728, '2026-02-24 14:56:00.020047-03');



DELETE FROM basico.escola_curriculo WHERE id = 92;
DELETE FROM basico.escola_curriculo WHERE id = 93;
DELETE FROM basico.escola_curriculo WHERE id = 94;
DELETE FROM basico.escola_curriculo WHERE id = 101;
DELETE FROM basico.escola_curriculo WHERE id = 99;
DELETE FROM basico.escola_curriculo WHERE id = 100;
DELETE FROM basico.escola_curriculo WHERE id = 97;
DELETE FROM basico.escola_curriculo WHERE id = 98;
DELETE FROM basico.escola_curriculo WHERE id = 96;
DELETE FROM basico.escola_curriculo WHERE id = 95;



