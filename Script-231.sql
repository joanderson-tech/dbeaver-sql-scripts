select * from comum.pessoa p where p.nome = 'ALISSON RICK DOS SANTOS SILVA';
select * from discente d where d.id_pessoa  in (52788861,776554);
select * from basico.estudante e where e.id_estudante in (1370053);
select * from basico.matricula_estudante_serie mes where mes.id_estudante in (1370053);
select string_agg(id_matricula_componente::text, ', ')  from ensino.matricula_componente mc where mc.id_discente = 1370053;
select string_agg(id_frequencia::text, ', ')  from ensino.frequencia_aluno fa where fa.id_discente = 1370053;
select * from ensino.abono_frequencia af where af.id_estudante = 1402340;
select * from escola.solicitacao_documento sd where sd.id_estudante =  1402340;
select * from basico.movimentacao_estudante me where id_discente = 1402340;
select * from matricula.estudante_inscrito ei where id_estudante  =1402340;
select * from comum.pessoa_necessidade_especial pne where id_pessoa = 1402340;

select * from comum.pessoa p where p.nome = 'JULIA RAABE BEZERRA DOS SANTOS';
-- pessoa mais antigo correto 749373 / errado 753092   753578

select * from comum.pessoa   where id_pessoa  in (749373 , 753092, 753578 );

select matricula , id_pessoa , * 
 from discente d 
 where id_pessoa  in (749373 , 753092, 753578 );
 --id_disc correto 976297   / errado 979712   980104

select * 
from basico.matricula_estudante_serie mes 
 where id_estudante in (1379458, 1361021)
 order by ano_calendario; 
 -- pega os ids errados no id Discente errado / e setar no update para o id discente correto /vai para o update

select string_agg(id_matricula_componente::varchar, ', ')  
from ensino.matricula_componente mc where id_discente = 979712;
--17149223, 17149224, 17149225, 17149226, 17149227, 17149228, 17149229, 17149230, 17467751

select string_agg(id_matricula_discente_serie ::varchar, ', ')  
from basico.matricula_estudante_serie where id_estudante  = 979712;
--

select string_agg(id_renovacao_matricula::varchar, ', ')  
from matricula.renovacao_matricula where id_discente  = 979712;
--null

select string_agg(id_frequencia::varchar, ', ')  
from ensino.frequencia_aluno where id_discente  = 979712 ;
--151805040, 151806143, 151806095, 151805089, 151806035, 151805931, 151807451, 151806983, 151806165, 151807349, 151807432, 151807453, 151807491, 151807509, 151807614, 151807808, 151807810, 151807829, 151816675

select string_agg(id_estudante_documento_pendente::varchar, ', ')  
from basico.estudante_documento_pendente edp where id_estudante  = 979712;
--null

select string_agg(id::varchar, ', ')  from diario.competencia_habilidades_aluno cha where id_discente =  979712;
--NULL

select string_agg(id_historico_implantado::varchar, ', ') from diario.historico_implantado  where id_estudante  =  979712;
--NULL

select id_observacao_discente from ensino.observacao_discente od  where id_discente  =  979712;
--null

SELECT * FROM comum.pessoa_necessidade_especial pne WHERE pne.id_pessoa  = 979712;

select from basico.tipo_movimentacao_estudante tme 
where  = 1402005;

-------------------------------------------------------------------------------
--Usar dados antigos que serão deletados para o backup;
select * FROM basico.estudante WHERE id_estudante in (979712);
select * FROM public.discente WHERE id_discente=979712;
select * FROM comum.pessoa where id_pessoa = 753092; 

--backup

-------------------------------------------------------------------------------
BEGIN;
commit;
rollback;

--SOLUÇÃO

--atualiza ensino.matricula_componente seta no id correto os id discentes errados para univficar
UPDATE ensino.matricula_componente 
	SET id_discente =1392816 
	WHERE id_matricula_componente  in (17149223, 17149224, 17149225, 17149226, 17149227, 17149228, 17149229, 17149230, 17467751);


-- Alterar basico.matricula_estudante_serie
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1392816
	WHERE id_matricula_discente_serie=1412594;

-- Alterar matricula.renovacao_matricula
--UPDATE matricula.renovacao_matricula SET id_discente=1342055 WHERE id_renovacao_matricula=61134392;

-- Alterar ensino.frequencia_aluno
UPDATE ensino.frequencia_aluno 
	SET id_discente= 1392816
	WHERE id_frequencia in (151805040, 151806143, 151806095, 151805089, 151806035, 151805931, 151807451, 151806983, 151806165, 151807349, 151807432, 151807453, 151807491, 151807509, 151807614, 151807808, 151807810, 151807829, 151816675);



--update comum.pessoa set nome  = 'JANIKLEYSON FERNANDES DA SILVA BATISTA' where id_pessoa  = 751684;

--update matricula.renovacao_excepcional_matricula_processamento set id_discente = 978392 where id_discente = 982836;

--update basico.estudante_documento_pendente set id_estudante = 1359546 where id_estudante_documento_pendente in (63032671);

--update diario.competencia_habilidades_aluno set id_discente = 978392 where id in (41638);

--update diario.historico_implantado set id_estudante = 978392 where id_historico_implantado in (32975, 32976);

--update ensino.observacao_discente set id_discente = 1399592 where id_observacao_discente = 615159912;

-- Deletar basico.estudante o ERRADO
DELETE FROM basico.estudante WHERE id_estudante=1373427;
--1387237

-- Deletar public.discente
DELETE FROM public.discente WHERE id_discente=1373427;

-- Deletar comum.pessoa
DELETE FROM comum.pessoa WHERE id_pessoa=52792235; 



 



  
 