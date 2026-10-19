select * from discente d where d.id_pessoa = 979783;


-- idDiscente 979783 matricula  201951876815

-- idDiscente 979649 matricula  201930004544 idPessoa 51876815

--51876858 atualizado 
--51876815 deletar

-- ANNE CAROLINE COSTA FERNANDES idPessoa 755664  matricula 202530002961 idDiscente 992969

select * from comum.pessoa p where id_pessoa in (51876858  , 51876815);

select * from basico.matricula_estudante_serie mes  where id_estudante in (990082, 990068);

select * from basico.matricula_estudante_serie mes  where id_estudante = 992459;

select * from comum.pessoa p where nome = 'NICOLAS KAIQUE DA SILVA SANTOS';

--idPessoa 751845  , 751831
select * from comum.pessoa p where id_pessoa = 754787;

select matricula , id_pessoa , *  from discente d  where id_discente  = 992459;

-- NICOLAS KAIQUE DA SILVA SANTOS idPessoa 751831  matricula 202230004968 idDiscente 990068

-- NICOLAS KAIQUE DA SILVA SANTOS idPessoa 751831  matricula 202230011819 idDiscente 990082

select matricula , id_pessoa , *  from discente d  where id_pessoa   in (51876858  , 51876815);
 --id_disc correto 1374876 / errado 1386690

select * from basico.unificacao_estudante ue ;

--DELETE FROM basico.estudante WHERE id_estudante = 992459;
--DELETE FROM public.discente WHERE id_discente = 992459;
--DELETE FROM comum.pessoa WHERE id_pessoa = 754787

--202230011819


-- SOLUÇÃO de NICOLAS KAIQUE DA SILVA SANTOS e ANTHONY KAEU DA SILVA SANTOS

-- Auto-generated SQL script #202501271412
UPDATE comum.pessoa
	SET cpf_cnpj=NULL,nome='ANTHONY KAEU DA SILVA SANTOS'
	WHERE id_pessoa=751845;

UPDATE public.discente
	SET id_pessoa=751845
	WHERE id_discente=990068;


--backup de NICOLAS KAIQUE DA SILVA SANTOS e ANTHONY KAEU DA SILVA SANTOS
UPDATE comum.pessoa
	SET cpf_cnpj=17628241409, nome='ANTHONY KAEU DA SILVA SANTOS'
	WHERE id_pessoa=751845;

UPDATE public.discente
	SET id_pessoa=751831
	WHERE id_discente=990068;



