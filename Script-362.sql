
select * from ensino.horario_turma ht where ht.id_turma = 683574; order by ativo ;

SELECT string_agg(fa.id_frequencia::varchar , ',' )
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 683465
  AND fa.horarios = 1
  AND EXTRACT(DOW FROM fa.data) in(1,2,3,4,5); -- 5 representa sexta-feira


SELECT string_agg(fa.id_data_aula_turma::varchar , ',')
FROM ensino.data_aula_turma fa
WHERE fa.id_turma = 683465
  AND fa.quantidade_horarios = 1
  AND EXTRACT(DOW FROM fa.data_aula) in( 1,2,3,4,5);  -- 5 representa sexta-feira
  
  
  segunda 1 
  terca 2 
  quarta 2 
  quinta 1
  sexta 2 
  15/06/2024
  
  select * FROM ensino.data_aula_turma fa
WHERE fa.id_turma = 683466; 

select * FROM ensino.frequencia_turma 
WHERE id_turma  = 683466;

select * FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 683669;

select * from ava.aula_extra ae where id_turma = 683223;


 SELECT id_disciplina, id_turma, descricao_horario
FROM ensino.turma t
WHERE t.codigo = 'EJAF2NN4A' AND ano = 2024 AND descricao_horario IS NOT NULL;


-- Auto-generated SQL script #202501162310
UPDATE ensino.data_aula_turma
	SET quantidade_horarios=1
	WHERE id_data_aula_turma=24738;

 begin;
commit;
rollback;

INSERT INTO ensino.data_aula_turma ( id_data_aula_turma, id_turma, data_aula, frequencia_lancada, quantidade_horarios, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, id_motivo_inativacao
)
SELECT
    nextval('ensino.data_aula_turma_seq'), 683453, d::date, true, 1, true, NULL, NULL, '2025-01-14 10:00:00.000', NULL, NULL     
FROM (
    VALUES 
		('2024-03-07'),
		('2024-03-18'),
		('2024-03-20'),
		('2024-04-17')
) AS dates(d); 

INSERT INTO ensino.frequencia_turma (id_frequencia_turma, "data", aulas, id_turma, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, id_motivo_inativacao)
SELECT
    nextval('ensino.frequencia_turma_seq'), d::date, 1, 683453, '2025-01-14 10:00:00.000', NULL, NULL, NULL, true, NULL
FROM (
   VALUES 
     	('2024-03-07'),
		('2024-03-18'),
		('2024-03-20'),
		('2024-04-17')
) AS dates(d);    




DELETE FROM ensino.data_aula_turma
WHERE id_turma = 683453 and data_aula IN (
		('2024-03-07'),
		('2024-03-18'),
		('2024-03-20'),
		('2024-04-17')
);


DELETE FROM ensino.frequencia_turma
WHERE id_turma = 683453 AND "data"  IN (
    	('2024-03-07'),
		('2024-03-18'),
		('2024-03-20'),
		('2024-04-17')
  );
