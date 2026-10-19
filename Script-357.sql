696848

select * from ensino.horario_turma ht where ht.id_turma = 696848;


SELECT  string_agg(fa.id_frequencia::varchar , ',' )
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 696848
  AND fa.horarios = 0
  AND EXTRACT(DOW FROM fa.data) in( 1,2,3,4,5,6); -- 5 representa sexta-feira


SELECT * --string_agg(fa.id_data_aula_turma::varchar , ',')
FROM ensino.data_aula_turma  fa
WHERE fa.id_turma = 696848
  AND fa.quantidade_horarios = 1
  AND EXTRACT(DOW FROM fa.data_aula) in( 1,2,3,4,5,6,7);  -- 5 representa sexta-feira
  

select * from ava.aula_extra where id_turma = 696848;

select * from 


select
	*
from
	ensino.data_aula_turma dat
join ensino.turma t on
	t.id_turma = dat.id_turma
where
	dat.ativo
	and dat.frequencia_lancada
	and dat.id_turma = 696848
	and dat.data_aula not in ( '2024-02-28', '2024-02-29', '2024-03-01', '2024-03-02', '2024-03-04', '2024-03-05', '2024-03-06', '2024-03-07', '2024-03-08', '2024-03-11', '2024-03-12', '2024-03-13', '2024-03-14', '2024-03-15', '2024-03-18', '2024-03-19', '2024-03-20', '2024-03-21', '2024-03-22', '2024-03-25', '2024-03-26', '2024-03-27', '2024-04-01', '2024-04-02', '2024-04-03', '2024-04-04', '2024-04-05', '2024-04-08', '2024-04-09', '2024-04-10', '2024-04-11', '2024-04-12', '2024-04-15', '2024-04-16', '2024-04-17', '2024-04-18', '2024-04-19', '2024-04-22', '2024-04-23', '2024-04-24', '2024-04-25', '2024-04-26', '2024-04-29', '2024-04-30', '2024-05-02', '2024-05-03', '2024-05-06', '2024-05-07', '2024-05-08', '2024-05-09', '2024-05-10', '2024-05-11', '2024-05-13', '2024-05-14', '2024-05-15', '2024-05-16', '2024-05-17', '2024-05-20', '2024-05-21', '2024-05-22', '2024-05-23', '2024-05-24', '2024-05-27', '2024-05-28', '2024-05-29', '2024-06-03', '2024-06-04', '2024-06-05', '2024-06-06', '2024-06-07', '2024-06-10', '2024-06-11', '2024-06-12', '2024-06-13', '2024-06-14', '2024-06-15', '2024-06-17', '2024-06-18', '2024-06-19', '2024-06-20', '2024-06-21', '2024-07-10', '2024-07-11', '2024-07-12', '2024-07-15', '2024-07-16', '2024-07-17', '2024-07-18', '2024-07-19', '2024-07-22', '2024-07-23', '2024-07-24', '2024-07-25', '2024-07-26', '2024-07-29', '2024-07-30', '2024-07-31', '2024-08-01', '2024-08-02', '2024-08-05', '2024-08-06', '2024-08-07', '2024-08-08', '2024-08-09', '2024-08-10', '2024-08-12', '2024-08-13', '2024-08-14', '2024-08-19', '2024-08-20', '2024-08-21', '2024-08-22', '2024-08-23', '2024-08-26', '2024-08-27', '2024-08-28', '2024-08-29', '2024-08-30', '2024-08-31', '2024-09-02', '2024-09-03', '2024-09-04', '2024-09-05', '2024-09-09', '2024-09-10', '2024-09-11', '2024-09-12', '2024-09-13', '2024-09-14', '2024-09-16', '2024-09-17', '2024-09-18', '2024-09-19', '2024-09-20', '2024-09-23', '2024-09-24', '2024-09-25', '2024-09-26', '2024-09-27', '2024-09-28', '2024-09-30', '2024-10-01', '2024-10-02', '2024-10-03', '2024-10-04', '2024-10-07', '2024-10-08', '2024-10-09', '2024-10-10', '2024-10-11', '2024-10-15', '2024-10-16', '2024-10-17', '2024-10-18', '2024-10-21', '2024-10-22', '2024-10-23', '2024-10-24', '2024-10-25', '2024-10-26', '2024-10-28', '2024-10-29', '2024-10-30', '2024-10-31', '2024-11-01', '2024-11-04', '2024-11-05', '2024-11-06', '2024-11-07', '2024-11-08', '2024-11-11', '2024-11-12', '2024-11-13', '2024-11-14', '2024-11-18', '2024-11-19', '2024-11-21', '2024-11-22', '2024-11-25', '2024-11-26', '2024-11-27', '2024-11-28', '2024-11-29', '2024-11-30', '2024-12-02', '2024-12-03', '2024-12-04', '2024-12-05', '2024-12-06', '2024-12-07', '2024-12-09', '2024-12-10', '2024-12-11', '2024-12-12', '2024-12-13', '2024-12-14', '2024-12-16', '2024-12-17', '2024-12-18', '2024-12-19', '2024-12-20', '2024-12-23', '2024-12-26', '2024-12-27' );
	
select
	*
from
	ensino.data_aula_turma dat
join ensino.turma t on
	t.id_turma = dat.id_turma
where
	dat.ativo
	and dat.frequencia_lancada
	and dat.id_turma = 696848
	order by quantidade_horarios, data_aula ;

select
	*
from
	ensino.data_aula_turma where id_turma = 696848;

select * from ensino.data_aula_turma  where id_turma = 696848 

INSERT INTO ensino.data_aula_turma (id_data_aula_turma, id_turma, data_aula, frequencia_lancada, quantidade_horarios, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, id_motivo_inativacao) VALUES(ensino.data_aula_turma_seq, 696848, '2024-09-10', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL);

begin;

rollback;

INSERT INTO ensino.data_aula_turma (id_data_aula_turma, id_turma, data_aula, frequencia_lancada, quantidade_horarios, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, id_motivo_inativacao)
VALUES
(ensino.data_aula_turma_seq, 696848, '2024-06-18', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-06-19', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-06-20', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-10', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-11', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-15', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-16', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-17', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-18', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-19', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-22', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-23', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-24', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-25', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-26', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-29', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-07-30', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-01', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-02', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-05', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-06', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-07', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-08', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-09', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-13', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-21', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-22', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-23', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-28', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-29', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-08-30', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL),
(ensino.data_aula_turma_seq, 696848, '2024-11-01', true, 1, true, NULL, NULL, '2025-01-08 10:00:00.000', NULL, NULL);



DELETE FROM ensino.data_aula_turma
WHERE id_turma = 696848
  AND data_aula IN (
    '2024-06-18',
    '2024-06-19',
    '2024-06-20',
    '2024-07-10',
    '2024-07-11',
    '2024-07-15',
    '2024-07-16',
    '2024-07-17',
    '2024-07-18',
    '2024-07-19',
    '2024-07-22',
    '2024-07-23',
    '2024-07-24',
    '2024-07-25',
    '2024-07-26',
    '2024-07-29',
    '2024-07-30',
    '2024-08-01',
    '2024-08-02',
    '2024-08-05',
    '2024-08-06',
    '2024-08-07',
    '2024-08-08',
    '2024-08-09',
    '2024-08-13',
    '2024-08-21',
    '2024-08-22',
    '2024-08-23',
    '2024-08-28',
    '2024-08-29',
    '2024-08-30',
    '2024-11-01'
  );



INSERT INTO ensino.frequencia_turma (id_frequencia_turma, "data", aulas, id_turma, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, id_motivo_inativacao)
VALUES
(nextval('ensino.frequencia_turma_seq'), '2024-06-18', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-06-19', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-06-20', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-10', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-11', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-15', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-16', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-17', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-18', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-19', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-22', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-23', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-24', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-25', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-26', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-29', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-07-30', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-01', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-02', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-05', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-06', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-07', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-08', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-09', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-13', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-21', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-22', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-23', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-28', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-29', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-08-30', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL),
(nextval('ensino.frequencia_turma_seq'), '2024-11-01', 1, 696848, '2025-01-08 10:00:00.000', NULL, NULL, NULL, true, NULL);


DELETE FROM ensino.frequencia_turma
WHERE id_turma = 696848
  AND "data" IN (
    '2024-06-18',
    '2024-06-19',
    '2024-06-20',
    '2024-07-10',
    '2024-07-11',
    '2024-07-15',
    '2024-07-16',
    '2024-07-17',
    '2024-07-18',
    '2024-07-19',
    '2024-07-22',
    '2024-07-23',
    '2024-07-24',
    '2024-07-25',
    '2024-07-26',
    '2024-07-29',
    '2024-07-30',
    '2024-08-01',
    '2024-08-02',
    '2024-08-05',
    '2024-08-06',
    '2024-08-07',
    '2024-08-08',
    '2024-08-09',
    '2024-08-13',
    '2024-08-21',
    '2024-08-22',
    '2024-08-23',
    '2024-08-28',
    '2024-08-29',
    '2024-08-30',
    '2024-11-01'
  );

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


