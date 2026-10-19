select string_agg(id_turma :: varchar, ', ') 
from ensino.turma t where t.codigo ilike 'MULTIVMULTA' and ano = 2025 and id_turma_serie = 52241253 and t.id_disciplina in (238,230, 229);

select * from basico.turma_serie ts where ts.id_escola  = 1304 and ts.nome = 'MULTIVMULTA' and ano = 2025;

select * --string_agg(id_horario_turma :: varchar, ',')  
from ensino.horario_turma ht  where ht.id_turma in (688613) and ativo = false and data_fim  = '2025-04-25'

select * from escola.escola e where e.nome ilike '%ESCOLA MUNICIPAL JOSÉ ARLINDO DA SILVA%'


select * from  ensino.horario_turma WHERE id_horario_turma in (1412330,1412331,1412332,1412320,1412321,1412322,1412323,1412324,1412325,1412326,1412327,1412328,1412329,1412333,1412334,1412335,1412336,1412337,1412338,1412339,1412340,1412341,1412342,1412343,1412344);


--SOLUÇÃO
UPDATE ensino.horario_turma SET data_alteracao='2025-07-30 00:00:00.000' WHERE id_horario_turma in (1413758,1413759,1413760,1413761,1413763,1413764,1413765,1413766,1413773,1413774,1413775,1413768,1413769,1413770,1413771,1413776,1413779,1413778,1413780,1413781);

UPDATE ensino.horario_turma SET data_alteracao='2025-07-30 00:00:00.000',data_fim='2025-07-30' WHERE id_horario_turma in (1412330,1412331,1412332,1412320,1412321,1412322,1412323,1412324,1412325,1412326,1412327,1412328,1412329,1412333,1412334,1412335,1412336,1412337,1412338,1412339,1412340,1412341,1412342,1412343,1412344);


--BACKUP
UPDATE ensino.horario_turma SET data_alteracao=NULL WHERE id_horario_turma in (1413758,1413759,1413760,1413761,1413763,1413764,1413765,1413766,1413773,1413774,1413775,1413768,1413769,1413770,1413771,1413776,1413779,1413778,1413780,1413781);

UPDATE ensino.horario_turma SET data_alteracao='2025-04-25 06:58:36.000',data_fim='2025-04-25' WHERE id_horario_turma in (1412330,1412331,1412332,1412320,1412321,1412322,1412323,1412324,1412325,1412326,1412327,1412328,1412329,1412333,1412334,1412335,1412336,1412337,1412338,1412339,1412340,1412341,1412342,1412343,1412344);











--Solucao EFAIM1A Educação Física
UPDATE ensino.horario_turma SET data_inicio='2025-07-02',data_fim='2025-12-15' WHERE id_horario_turma in (1415524,1415529);
UPDATE ensino.horario_turma	SET data_inicio='2025-07-01',data_alteracao='2025-07-30 00:00:00.000',data_fim='2025-07-01'	WHERE id_horario_turma in (1415499,1415504);
UPDATE ensino.horario_turma	SET data_inicio='2025-03-10',data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01'	WHERE id_horario_turma in (1414062,1414067);

--BACKUP EFAIM1A Educação Física
UPDATE ensino.horario_turma SET data_inicio=NULL,data_fim=NULL WHERE id_horario_turma in (1415524,1415529);
UPDATE ensino.horario_turma	SET data_inicio='2025-07-28',data_alteracao='2025-07-31 16:39:23.000',data_fim='2025-07-31'	WHERE id_horario_turma in (1415499,1415504);
UPDATE ensino.horario_turma	SET data_inicio=null,data_alteracao=null,data_fim=null	WHERE id_horario_turma in (52328470,52328471);









2025-07-02
2025-12-15

select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma in (688613);

ALTER TABLE basico.turma_serie ADD COLUMN id_registro_atualizacao int4 NULL;
ALTER TABLE basico.turma_serie ADD COLUMN data_atualizacao date NULL;
ALTER TABLE basico.turma_serie ADD CONSTRAINT turma_serie_id_registro_atualizacao_fk FOREIGN KEY (id_registro_atualizacao) REFERENCES comum.registro_entrada(id_entrada);


DELETE FROM ensino.horario_turma WHERE id_horario_turma=1414174;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1415437;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1414179;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1415442;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1415457;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1415447;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1415452;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1415462;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1415467;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1414194;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1415482;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=52328472;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=52328470;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=52328471;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1414184;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1414189;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1415472;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1415477;



INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1414174, 687235, 1, 127243, '6', '07:00:00', '07:50:00', '2025-03-10', '2025-07-28', NULL, NULL, NULL, false, '2025-07-28 14:22:12.000', NULL, NULL, 5667351);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1415437, 687235, 1, 127243, '4', '07:00:00', '07:45:00', '2025-07-28', '2025-07-28', NULL, NULL, NULL, false, '2025-07-28 15:31:20.000', NULL, NULL, 5675455);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1414179, 687235, 1, 127244, '6', '07:50:00', '08:40:00', '2025-03-10', '2025-07-28', NULL, NULL, NULL, false, '2025-07-28 14:22:12.000', NULL, NULL, 5667351);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1415442, 687235, 1, 127244, '4', '07:45:00', '08:30:00', '2025-07-28', '2025-07-28', NULL, NULL, NULL, false, '2025-07-28 15:31:20.000', NULL, NULL, 5675455);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1415462, 687235, 1, 127243, '4', '07:00:00', '07:45:00', '2025-07-28', '2025-12-15', NULL, NULL, NULL, true, NULL, NULL, NULL, 5675455);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1415467, 687235, 1, 127244, '4', '07:45:00', '08:30:00', '2025-07-28', '2025-12-15', NULL, NULL, NULL, true, NULL, NULL, NULL, 5675455);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1414194, 687236, 1, 127248, '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, 5667351);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1415482, 687236, 1, 127248, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 5675455);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(52328472, 687236, 1, 127248, '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2025-07-28 14:22:12.000', NULL, NULL, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1415457, 687236, 1, 127248, '4', '10:15:00', '11:00:00', '2025-07-28', '2025-07-28', NULL, NULL, NULL, false, '2025-07-28 15:31:20.000', NULL, NULL, 5675455);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(52328470, 687237, 1, 127245, '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2025-07-28 14:22:12.000', NULL, NULL, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(52328471, 687237, 1, 127246, '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2025-07-28 14:22:12.000', NULL, NULL, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1414184, 687237, 1, 127245, '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, 5667351);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1414189, 687237, 1, 127246, '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, 5667351);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1415472, 687237, 1, 127245, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 5675455);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1415477, 687237, 1, 127246, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 5675455);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1415447, 687237, 1, 127245, '4', '08:30:00', '09:15:00', '2025-07-28', '2025-07-28', NULL, NULL, NULL, false, '2025-07-28 15:31:20.000', NULL, NULL, 5675455);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES(1415452, 687237, 1, 127246, '4', '09:30:00', '10:15:00', '2025-07-28', '2025-07-28', NULL, NULL, NULL, false, '2025-07-28 15:31:20.000', NULL, NULL, 5675455);