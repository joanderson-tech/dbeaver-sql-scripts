BEGIN;

--solução
UPDATE basico.matricula_estudante_serie SET id_situacao_matricula_serie=1, data_matricula_turma = '2025-06-12 00:00:00.000' WHERE id_matricula_discente_serie=1341701;
UPDATE basico.matricula_estudante_serie SET id_situacao_matricula_serie=6, data_matricula_turma = '2025-05-12 15:28:14.632' WHERE id_matricula_discente_serie=1341572;

select 
'update ensino.matricula_componente set id_situacao_matricula = 2 where id_matricula_componente = ' || mc.id_matricula_componente|| ';' as solucao,
'update ensino.matricula_componente set id_matricula_estudante_serie = 9 where id_matricula_componente = ' || mc.id_matricula_componente|| ';' as backup
from ensino.matricula_componente mc 
where id_matricula_componente in (17359462,17359463,17359459,17359455,17359456,17359457,17359458,17359460,17359461);

select 
'update ensino.matricula_componente set id_situacao_matricula = 9 where id_matricula_componente = ' || mc.id_matricula_componente|| ';' as solucao,
'update ensino.matricula_componente set id_matricula_estudante_serie = 2 where id_matricula_componente = ' || mc.id_matricula_componente|| ';' as backup
from ensino.matricula_componente mc 
where id_matricula_componente in (17364138,17364139,17364140,17364141,17364133,17364134,17364135,17364136,17364137);




update ensino.matricula_componente set id_situacao_matricula = 2 where id_matricula_componente = 17359455;
update ensino.matricula_componente set id_situacao_matricula = 2 where id_matricula_componente = 17359456;
update ensino.matricula_componente set id_situacao_matricula = 2 where id_matricula_componente = 17359457;
update ensino.matricula_componente set id_situacao_matricula = 2 where id_matricula_componente = 17359458;
update ensino.matricula_componente set id_situacao_matricula = 2 where id_matricula_componente = 17359459;
update ensino.matricula_componente set id_situacao_matricula = 2 where id_matricula_componente = 17359460;
update ensino.matricula_componente set id_situacao_matricula = 2 where id_matricula_componente = 17359461;
update ensino.matricula_componente set id_situacao_matricula = 2 where id_matricula_componente = 17359462;
update ensino.matricula_componente set id_situacao_matricula = 2 where id_matricula_componente = 17359463;


update ensino.matricula_componente set id_situacao_matricula = 9 where id_matricula_componente = 17364133;
update ensino.matricula_componente set id_situacao_matricula = 9 where id_matricula_componente = 17364134;
update ensino.matricula_componente set id_situacao_matricula = 9 where id_matricula_componente = 17364135;
update ensino.matricula_componente set id_situacao_matricula = 9 where id_matricula_componente = 17364136;
update ensino.matricula_componente set id_situacao_matricula = 9 where id_matricula_componente = 17364137;
update ensino.matricula_componente set id_situacao_matricula = 9 where id_matricula_componente = 17364138;
update ensino.matricula_componente set id_situacao_matricula = 9 where id_matricula_componente = 17364139;
update ensino.matricula_componente set id_situacao_matricula = 9 where id_matricula_componente = 17364140;
update ensino.matricula_componente set id_situacao_matricula = 9 where id_matricula_componente = 17364141;



commit;