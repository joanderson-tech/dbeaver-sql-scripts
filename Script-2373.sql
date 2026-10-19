
BEGIN;

-- SCRIPT DE BACKUP
SELECT 
    'INSERT INTO ensino_infantil.habilidade_competencia_etapa_ensino (id_habilidade_competencia, id_etapa_ensino) VALUES ' || 
    STRING_AGG('(' || id_habilidade_competencia || ', ' || id_etapa_ensino || ')', ', ') || ';' AS backup_etapa_ensino
FROM ensino_infantil.habilidade_competencia_etapa_ensino
WHERE id_etapa_ensino IN (9, 10);

SELECT 
    'INSERT INTO ensino_infantil.habilidade_competencia_serie (id_habilidade_competencia, id_serie) VALUES ' || 
    STRING_AGG('(' || id_habilidade_competencia || ', ' || id_serie || ')', ', ') || ';' AS backup_serie
FROM ensino_infantil.habilidade_competencia_serie
WHERE id_serie IN (15289953, 15289982, 15289983, 1005302, 15290011, 15290013);

-- SCRIPT DE SOLUÇÃO
DELETE FROM ensino_infantil.habilidade_competencia_etapa_ensino
WHERE id_etapa_ensino = 9
  AND id_habilidade_competencia NOT IN (511, 512, 513, 514, 515, 517);

DELETE FROM ensino_infantil.habilidade_competencia_etapa_ensino
WHERE id_etapa_ensino = 10
  AND id_habilidade_competencia NOT IN (511, 512, 513, 514, 515, 516, 517);

DELETE FROM ensino_infantil.habilidade_competencia_serie
WHERE id_serie IN (15289953, 15289982, 15289983, 1005302)
  AND id_habilidade_competencia NOT IN (511, 512, 513, 514, 515, 517);

DELETE FROM ensino_infantil.habilidade_competencia_serie
WHERE id_serie IN (15290011, 15290013)
  AND id_habilidade_competencia NOT IN (511, 512, 513, 514, 515, 516, 517);

INSERT INTO ensino_infantil.habilidade_competencia_etapa_ensino 
    (id_habilidade_competencia, id_etapa_ensino)
VALUES
    -- EJA 1º Segmento
    (511, 9), (512, 9), (513, 9),
    (514, 9), (515, 9), (517, 9),
    -- EJA 2º Segmento
    (511, 10), (512, 10), (513, 10),
    (514, 10), (515, 10), (517, 10),
    (516, 10);

INSERT INTO ensino_infantil.habilidade_competencia_serie 
    (id_habilidade_competencia, id_serie)
VALUES
    -- 1º PERIODO
    (511, 15289953), (512, 15289953), (513, 15289953), 
    (514, 15289953), (515, 15289953), (517, 15289953),
    -- CICLO I (1º, 2º E 3º ANO)
    (511, 15289982), (512, 15289982), (513, 15289982), 
    (514, 15289982), (515, 15289982), (517, 15289982),
    -- CICLO II (4º E 5º ANO)
    (511, 15289983), (512, 15289983), (513, 15289983), 
    (514, 15289983), (515, 15289983), (517, 15289983),
    -- MULTI (CICLO I E II)
    (511, 1005302), (512, 1005302), (513, 1005302), 
    (514, 1005302), (515, 1005302), (517, 1005302),
    -- CICLO III (6º E 7º ANO)
    (511, 15290011), (512, 15290011), (513, 15290011), 
    (514, 15290011), (515, 15290011), (517, 15290011), 
    (516, 15290011),
    -- CICLO IV (8º E 9º ANO)
    (511, 15290013), (512, 15290013), (513, 15290013), 
    (514, 15290013), (515, 15290013), (517, 15290013), 
    (516, 15290013);


ROLLBACK ;

COMMIT;