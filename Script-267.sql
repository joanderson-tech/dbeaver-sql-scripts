SELECT * FROM basico.turma_serie ts where id_serie = 52274083;

select * from basico.turma_serie ts 
where id_escola = 2329 
and id_serie = 52274083 
and ativo
and ano = 2024;

select * from escola.escola e where nome ilike '%CMEI MARGARIDA FRANCELINA%';

select * from basico.curriculo_basico_componente cbc where id_curriculo_basico = 52468046;

select * from basico.curriculo_basico_componente cbc where id_curriculo_basico = 52274336;

select * from basico.curriculo_basico cb where id_curriculo_basico = 52468046;

select * from basico.curriculo_basico_serie_multisseriada cbsm where id_curriculo_basico = 52468046;

select * from basico.curriculo_basico_serie_multisseriada cbsm where id_curriculo_basico = 52274336;

select * from basico.curriculo_basico cb where id_curriculo_basico in (52468046);
 
select * from basico.curriculo_basico cb where id_curriculo_basico in (52274860,52274863);

select * from basico.curriculo_basico_componente cbc where id_curriculo_basico in (52274860 ,52063654);

select * from basico.curriculo_basico_componente cbc where id_curriculo_basico in (52274863 ,52063656);

select * from basico.turma_serie ts where id_turma_serie_agrupadora = 52340559;

select * from ensino.turma t where id_turma_serie = 52463853;

select * from basico.turma_serie ts where id_turma_serie = 52340559;

select * from ensino.turma where id_turma_serie = 52340559;

select * from 

-- ID_SERIE 52274083
-- id_curriculo_basico 52468046
-- id escola 2329
-- id_curriculo_basico antigo 52274336
-- novos  id_curriculo_basico_serie_associada 52063656 52063654
-- antigo id_curriculo_basico_serie_associada 52274860 52274863

-- ids antigos relação 52274860 com novos 52063654 
-- ids antigos relação 52274863 com novos 52063656 

52340559

begin; 
rollback;
commit;

-- 01 
UPDATE basico.turma_serie SET id_curriculo_medio=52468046, tipo_diario = 11 WHERE id_turma_serie=52340559;
UPDATE basico.turma_serie SET id_curriculo_medio=52063654 WHERE id_turma_serie=52463852;
UPDATE basico.turma_serie SET id_curriculo_medio=52063656 WHERE id_turma_serie=52463853;

-- 2) excluir matricula_componente dos alunos matriculados da disciplina de Atividade polivalente B 
UPDATE ensino.matricula_componente mc SET id_situacao_matricula = 7
FROM basico.matricula_estudante_serie mes 
	JOIN ensino.turma t ON t.id_turma_serie = mes.id_turma_serie_multisseriado 
WHERE mes.id_turma_serie_multisseriado in (52463852, 52463853) 
	AND mes.id_situacao_matricula_serie = 1
	AND t.id_disciplina = 293
	AND mc.id_turma = t.id_turma 
	AND mc.id_discente = mes.id_estudante;

--3) excluir turmas da disciplina Atividade polivalente B da turma
UPDATE ensino.turma t SET id_situacao_turma = 4
WHERE t.id_turma_serie in (52463852, 52463853) 
	AND t.id_disciplina = 293;

--4) inativar notas da disciplina de Atividade polivalente B
UPDATE ensino.nota_unidade nu SET ativo = false 
FROM ensino.matricula_componente mc
	JOIN ensino.turma t ON t.id_turma = mc.id_turma AND t.id_turma_serie in (52463852, 52463853)  AND t.id_disciplina = 293
WHERE nu.id_matricula_componente = mc.id_matricula_componente;


---
INSERT INTO ensino.turma (ano,periodo,id_situacao_turma,capacidade_aluno,id_disciplina,id_turma,codigo,observacao,tipo,data_cadastro,agrupadora,id_turma_serie,nota,extra,ordem,id_categoria_componente) 
VALUES ('2024','1','1','30','220',nextval('ensino.turma_seq'),'CREMUCREA-M1','1','1',now(),true,'52463852','f','f','1','1');

INSERT INTO ensino.turma (ano,periodo,id_situacao_turma,capacidade_aluno,id_disciplina,id_turma,codigo,observacao,tipo,data_cadastro,agrupadora,id_turma_serie,nota,extra,ordem,id_categoria_componente) 
VALUES ('2024','1','1','30','220',nextval('ensino.turma_seq'),'CREMUCREA-M2','1','1',now(),true,'52463853','f','f','1','1');

update ensino.turma t set id_turma_agrupadora = te.id_turma
from ensino.turma te 
where te.id_turma_serie = 52463852 
and te.id_disciplina = 220
and t.id_turma = 7002518;

update ensino.turma t set id_turma_agrupadora = te.id_turma
from ensino.turma te 
where te.id_turma_serie = 52463853 
and te.id_disciplina = 220
and t.id_turma = 7002520;
------

INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,data_atualizacao,id_registro_atualizacao,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '9','975864','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0',null,null,'1','f','f','f','1326750','f'
from ensino.turma t 
where t.id_turma_serie = 52463852 
and t.id_disciplina = 220;

INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '2','976072','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0','1','f','f','f','1326452','f'
from ensino.turma t 
where t.id_turma_serie = 52463852 
and t.id_disciplina = 220;

INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '2','976073','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0','1','f','f','f','1326453','f'
from ensino.turma t 
where t.id_turma_serie = 52463852 
and t.id_disciplina = 220;

INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '2','976074','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0','1','f','f','f','1326456','f'
from ensino.turma t 
where t.id_turma_serie = 52463852 
and t.id_disciplina = 220;

---------------------------------------

INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '2','975648','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0','1','f','f','f','1326708','f'
from ensino.turma t 
where t.id_turma_serie = 52463853 
and t.id_disciplina = 220;

INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '2','975798','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0','1','f','f','f','1325621','f'
from ensino.turma t 
where t.id_turma_serie = 52463853 
and t.id_disciplina = 220;


INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '2','975799','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0','1','f','f','f','1325620','f'
from ensino.turma t 
where t.id_turma_serie = 52463853 
and t.id_disciplina = 220;

INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '2','975800','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0','1','f','f','f','1325623','f'
from ensino.turma t 
where t.id_turma_serie = 52463853 
and t.id_disciplina = 220;


INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '2','975801','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0','1','f','f','f','1326624','f'
from ensino.turma t 
where t.id_turma_serie = 52463853 
and t.id_disciplina = 220;


INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '2','975802','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0','1','f','f','f','1325622','f'
from ensino.turma t 
where t.id_turma_serie = 52463853 
and t.id_disciplina = 220;

INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '2','975804','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0','1','f','f','f','1325625','f'
from ensino.turma t 
where t.id_turma_serie = 52463853 
and t.id_disciplina = 220;


INSERT INTO ensino.matricula_componente (id_situacao_matricula,id_discente,media_final,numero_faltas,id_matricula_componente,id_turma,data_cadastro,ano,periodo,id_componente_curricular,frequencia,prova_especial,id_tipo_matricula_componente,ausente_recuperacao,nao_optou,conselho_classe,id_matricula_estudante_serie,avaliacao_por_conceito) 
select '2','975806','0.00','0',nextval('ensino.matricula_componente_seq'),t.id_turma ,now(),'2024','1','220','100','0.0','1','f','f','f','1325626','f'
from ensino.turma t 
where t.id_turma_serie = 52463853 
and t.id_disciplina = 220;

---------------------------------------




select create_insert_statement('ensino. matricula_componente'::regclass::oid, mc, true) from ensino.matricula_componente mc where mc.id_turma = 7002520;


select * from ensino.matricula_componente mc where id_turma = 7002518;


begin; 
rollback;
commit;


select * from ensino.turma t where id_turma_serie = 52463853;


--backup
-- Turma serie agrupadora 
UPDATE basico.turma_serie SET id_curriculo_medio=52274336, tipo_diario = 1 WHERE id_turma_serie=52340559;

-- Turma serie associadas 
UPDATE basico.turma_serie SET id_curriculo_medio=52274860 WHERE id_turma_serie=52463852;
UPDATE basico.turma_serie SET id_curriculo_medio=52274863 WHERE id_turma_serie=52463853;


-- 2) excluir matricula_componente dos alunos matriculados da disciplina de Atividade polivalente B 
UPDATE ensino.matricula_componente mc SET id_situacao_matricula = 2
FROM basico.matricula_estudante_serie mes 
	JOIN ensino.turma t ON t.id_turma_serie = mes.id_turma_serie_multisseriado 
WHERE mes.id_turma_serie_multisseriado in (52463852, 52463853) 
	AND mes.id_situacao_matricula_serie = 1
	AND t.id_disciplina = 293
	AND mc.id_turma = t.id_turma 
	AND mc.id_discente = mes.id_estudante;


--3) excluir turmas da disciplina Atividade polivalente B da turma
UPDATE ensino.turma t SET id_situacao_turma = 1
WHERE t.id_turma_serie in (52463852, 52463853) 
	AND t.id_disciplina = 293;

--4) inativar notas da disciplina de Atividade polivalente B
UPDATE ensino.nota_unidade nu SET ativo = true 
FROM ensino.matricula_componente mc
	JOIN ensino.turma t ON t.id_turma = mc.id_turma AND t.id_turma_serie in (52463852, 52463853)  AND t.id_disciplina = 293
WHERE nu.id_matricula_componente = mc.id_matricula_componente;


delete from ensino.matricula_componente mc
using ensino.turma t 
where t.id_turma_serie = 52463852 
and t.id_disciplina = 220
and mc.id_turma = t.id_turma;

delete from ensino.matricula_componente mc
using ensino.turma t 
where t.id_turma_serie = 52463853 
and t.id_disciplina = 220
and mc.id_turma = t.id_turma;

update ensino.turma set id_turma_agrupadora = null where id_turma in (7002518, 7002520);

delete from ensino.turma where id_turma_serie = 52463852 and id_disciplina = 220;
delete from ensino.turma where id_turma_serie = 52463853 and id_disciplina = 220;




