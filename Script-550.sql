SELECT * FROM comum.usuario u WHERE login = 'wagnercortes23@gmail.com';
SELECT x.* FROM comum.pessoa x WHERE id_pessoa = 51870018;
SELECT * FROM rh.servidor s WHERE id_pessoa = 51870018;
SELECT * FROM comum.usuario u where u.id_usuario = 104924;

select dt.* FROM ensino.docente_turma dt
INNER JOIN ensino.turma t ON t.id_turma = dt.id_turma
WHERE id_docente = 250 AND t.codigo = 'EFAFM8B';-- EICRVEIC2A


685730
SELECT * FROM ava.topico_aula ta WHERE ta.id_turma = 685730 ORDER BY "data" ASC ;
SELECT * FROM ava.topico_aula ta WHERE id_usuario = 104883 AND "data" >= '2023-01-01' ORDER BY "data" ASC ; --id_turma=698794

SELECT * FROM ensino.frequencia_aluno fa WHERE id_turma = 698794;
SELECT * FROM ensino.frequencia_aluno fa WHERE id_turma IN (685730);

select * from ensino.horario_turma ht where ht.id_turma = 685730;

-- Auto-generated SQL script #202505201712

UPDATE ensino.horario_turma
	SET ativo=true
	WHERE id_horario_turma in (1409234, 1409232, 1409233, 1409230);

select * from ensino.horario_turma ht where id_horario_turma in (1409234, 1409232, 1409233, 1409230);
select * from ensino.horario h where h.id_horario in (1409234, 1409232, 1409233, 1409230);

--usuario    104883



--Solução
UPDATE ensino.horario_turma SET ativo=true WHERE id_horario_turma in (1409234, 1409232, 1409233, 1409230);


--Backup
UPDATE ensino.horario_turma SET ativo=false WHERE id_horario_turma in (1409234, 1409232, 1409233, 1409230);