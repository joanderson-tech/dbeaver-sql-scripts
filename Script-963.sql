BEGIN;

CREATE TEMPORARY TABLE backup_matricula_componente_2 AS
SELECT *
FROM ensino.matricula_componente
WHERE id_situacao_matricula = 2
  AND id_matricula_estudante_serie = 1327785;

CREATE TEMPORARY TABLE backup_matricula_componente_7 AS
SELECT *
FROM ensino.matricula_componente
WHERE id_situacao_matricula = 7
  AND id_matricula_estudante_serie = 1327729;


SELECT  'UPDATE ensino.matricula_componente SET id_situacao_matricula=2 WHERE id_matricula_componente=' || id_matricula_componente || ';'
FROM backup_matricula_componente_2
WHERE id_matricula_estudante_serie = 1327785;

SELECT  'UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente=' || id_matricula_componente || ';'
FROM backup_matricula_componente_7
WHERE id_matricula_estudante_serie = 1327785;

SELECT
  string_agg('UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente=' || id_matricula_componente || ';', chr(10))
FROM ensino.backup_matricula_componente_2
WHERE id_matricula_estudante_serie = 1327785;

SELECT
  string_agg('UPDATE ensino.matricula_componente SET id_situacao_matricula=2 WHERE id_matricula_componente=' || id_matricula_componente || ';', chr(10))
FROM ensino.backup_matricula_componente_7
WHERE id_matricula_estudante_serie = 1327785;

rollback;
commit;
begin;

SELECT *
FROM ensino.matricula_componente
WHERE id_matricula_estudante_serie = 1327785;


