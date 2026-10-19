BEGIN;

update ensino.matricula_componente set ano = 2019
where id_matricula_componente in (17180566, 17180554, 17180558, 17180556, 17180560, 17180550, 17180564, 17180562, 17180552);


COMMIT;