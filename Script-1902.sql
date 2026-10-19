BEGIN;

update basico.matricula_estudante_serie mes set id_situacao_matricula_serie = 3 where mes.id_matricula_discente_serie = 1320909;

COMMIT;