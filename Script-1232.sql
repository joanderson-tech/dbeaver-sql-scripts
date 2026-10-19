BEGIN;
COMMIT ;
ROLLBACK;

--1º Patrícia Silva Santos 
UPDATE ava.aula_extra SET id_servidor=54387259 WHERE id=53982091;
UPDATE ensino.docente_turma	SET id_docente=54387259 WHERE id_docente_turma in (51980255,52873785,53941880);
UPDATE pessoas.historico_servidor_terceirizado SET id_servidor=54387259 WHERE id_historico_servidor_terceirizado in (54492313,54492315);

DELETE FROM rh.servidor WHERE id_servidor=1734;

--2º Maria da Conceição Santos Araújo da Silva 
UPDATE ensino.docente_turma SET id_docente=54389192 WHERE id_docente_turma=51927806;
UPDATE rh.historico_transferencia_servidores SET id_servidor=54389192 WHERE id_historico_transferencia_servidor=52420900;
UPDATE pessoas.historico_servidor_terceirizado	SET id_servidor=54389192 WHERE id_historico_servidor_terceirizado IN (54521037, 54521040);

DELETE FROM rh.servidor WHERE id_servidor=1090;

--3º -Amanda Fernandes Lima
DELETE FROM rh.servidor WHERE id_servidor=54386368;

--4º Ana Lucia de Santana Santos 
UPDATE ensino.docente_turma SET id_docente=54387604 WHERE id_docente_turma in (51959118,52426334,52710211);
DELETE FROM rh.servidor WHERE id_servidor=1718;

--5º Luana de Jesus Santos 
UPDATE ensino.docente_turma SET id_docente=54389113 WHERE id_docente_turma in (52973939, 52973940, 53031045, 53031121, 52973933, 52973934, 52973936, 52973937);
UPDATE pessoas.historico_servidor_terceirizado SET id_servidor=54389113 WHERE id_historico_servidor_terceirizado in (53047465);
UPDATE rh.historico_transferencia_servidores SET id_servidor=54389113 WHERE id_historico_transferencia_servidor=52952404;

DELETE FROM rh.servidor WHERE id_servidor=2836;

--BANCO COMUM
--2º Maria da Conceição Santos Araújo da Silva 
DELETE FROM rh.servidor WHERE id_servidor=1090;
--4º Ana Lucia de Santana Santos 
DELETE FROM rh.servidor WHERE id_servidor=1718;
--5º Luana de Jesus Santos 
DELETE FROM rh.servidor WHERE id_servidor=2836;