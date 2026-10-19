select * from basico.unificacao_estudante ue ;

202030023977

select * from comum.pessoa p where id_pessoa in (749222,749376);

-- 749222 pessoa correta Thais Jelson Conceição da Silva


-- Auto-generated SQL script #202501230841
UPDATE comum.pessoa
	SET data_nascimento='2017-07-19',nome_ascii='THAIS JELSON CONCEICAO DA SILVA',nome='THAIS JELSON CONCEIÇÃO DA SILVA'
	WHERE id_pessoa=749222;

UPDATE basico.matricula_estudante_serie
	SET id_estudante=976021
	WHERE id_matricula_discente_serie=1356701;

--backup 
UPDATE comum.pessoa
	SET data_nascimento='2013-10-23',nome_ascii='THAIS JELSON CONCEICAO DA SILVA',nome='THAIS JELSON CONCEIÇÃO DA SILVA'
	WHERE id_pessoa=749222;

UPDATE basico.matricula_estudante_serie
	SET id_estudante=975867
	WHERE id_matricula_discente_serie=1356701;

--ides 975867 THAIS JELSON CONCEICAO DA SILVA
--ides 976021 LAÍS JELSON CONCEIÇÃO DA SILVA


-- Auto-generated SQL script #202501230835
UPDATE basico.matricula_estudante_serie
	SET id_estudante=976021
	WHERE id_matricula_discente_serie=1356701;


select * from basico.matricula_estudante_serie mes where id_estudante = 976021;

select * from basico.matricula_estudante_serie mes where id_estudante = 975867;

