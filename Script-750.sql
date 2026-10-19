select * from ava.aula_extra where id_turma = 742117;   --82109390

select * from ava.aula_extra where id  = 82109390;   --82109390


-- Auto-generated SQL script #202507031738
UPDATE ava.aula_extra
	SET data_aula='2025-07-19'
	WHERE id=82109390;



UPDATE ava.aula_extra
	SET data_aula='2025-05-03'
	WHERE id=82109390;



-- Auto-generated SQL script #202507031819
UPDATE ava.aula_extra
	SET id_servidor=14661
	WHERE id=82109390;


UPDATE ava.aula_extra
	SET id_servidor=8241
	WHERE id=82109390;


82109390

select * from RH.servidor s where S.id_servidor in (8241, 14661);

select
	distinct servidor1_
from
	ensino.docente_turma docentetur0_
inner join rh.servidor servidor1_ on
	docentetur0_.id_docente = servidor1_.id_servidor,
	ensino.turma turmacompo2_,
	basico.turma_serie turmaserie3_,
	comum.pessoa pessoa4_
where
	docentetur0_.id_turma = turmacompo2_.id_turma
	and turmacompo2_.id_turma_serie = turmaserie3_.id_turma_serie
	and servidor1_.id_pessoa = pessoa4_.id_pessoa
	and turmaserie3_.id_escola = 52232831
	and (pessoa4_.nome_ascii like 'DIRLEA FERREIRA DA SILVA SOUZA'
		or pessoa4_.nome like 'DIRLEA FERREIRA DA SILVA SOUZA')
	and servidor1_.id_ativo = 1
