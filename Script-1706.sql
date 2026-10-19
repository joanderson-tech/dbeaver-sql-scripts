begin;

update basico.matricula_estudante_serie 
set id_turma_serie = 52316624, id_turma_serie_multisseriado = 52316625, id_turno = 522590070, id_curriculo_medio = 52308506, id_serie_escola = 51883972
where id_matricula_discente_serie = 1325219;

update ensino.matricula_componente set id_turma = 688112 where id_matricula_componente = 17098338;
update ensino.matricula_componente set id_turma = 688123 where id_matricula_componente = 17098344;
update ensino.matricula_componente set id_turma = 688116 where id_matricula_componente = 17098340;
update ensino.matricula_componente set id_turma = 688113 where id_matricula_componente = 17098339;
update ensino.matricula_componente set id_turma = 688124 where id_matricula_componente = 17098345;
update ensino.matricula_componente set id_turma = 688120 where id_matricula_componente = 17098343;
update ensino.matricula_componente set id_turma = 688111 where id_matricula_componente = 17098337;
update ensino.matricula_componente set id_turma = 688119 where id_matricula_componente = 17098342;
update ensino.matricula_componente set id_turma = 688117 where id_matricula_componente = 17098341;

update ensino.matricula_componente set id_situacao_matricula = 7
where id_matricula_componente IN (17098355,17098378,17098401,17098424,17098447,17098470,17098493,17098516,17098539,17098562,17098585,17098608,17098631,17098654,17098677,17098700,17098723,17098746,17100586);

INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688106, 529,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688107, 531,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688108, 538,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688109, 539,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688110, 540,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688101, 462,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688102, 500,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688103, 524,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688104, 525,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688105, 528,  974918, 2025, 1, 1325219);

INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688118, 529,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688121, 531,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688114, 538,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688126, 539,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688115, 540,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688128, 462,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688125, 500,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688122, 524,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688129, 525,  974918, 2025, 1, 1325219);
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie) VALUES(nextval('ensino.matricula_componente_seq'), 2, 688127, 528,  974918, 2025, 1, 1325219);

update ensino.turma set id_situacao_turma = 1, data_consolidacao = null
where id_turma IN (688112,688113,688116,688119,688120,688123,688124,688117);

commit;
rollback;