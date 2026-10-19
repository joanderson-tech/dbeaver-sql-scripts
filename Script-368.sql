select * from comum.pessoa p where p.nome = 'ALISSON RICK DOS SANTOS SILVA';
select * from discente d where d.id_pessoa  in (52788861,776554);
select * from basico.estudante e where e.id_estudante in (1370053);
select * from basico.matricula_estudante_serie mes where mes.id_estudante in (974338);
select string_agg(id_matricula_componente::text, ', ')  from ensino.matricula_componente mc where mc.id_discente = 1370053;
select string_agg(id_frequencia::text, ', ')  from ensino.frequencia_aluno fa where fa.id_discente = 1370053;
select * from ensino.abono_frequencia af where af.id_estudante = 980057;
select * from escola.solicitacao_documento sd where sd.id_estudante =  980057;
select * from basico.movimentacao_estudante me where id_discente = 980057;
select * from matricula.estudante_inscrito ei where id_estudante  =980057;
select * from comum.pessoa_necessidade_especial pne where id_pessoa = 747977;
select * from comum.alteracao_pessoa ap where id_pessoa = 747928;
select * from comum.pessoa_recurso_avaliacao_nee pran where id_pessoa = 747977;
select  string_agg(id_atendimento_educacao_especial_estudante::varchar, ', ') from educacao_especial.atendimento_educacao_especial_estudante where id_estudante = 979962;
select  string_agg(id_alteracao_pessoa::varchar, ', ') from comum.alteracao_pessoa ap where id_pessoa in(772776); 
select  * from transporte.rota_discente rd  where rd.id_discente in(1401957);
select  string_agg(id_rota_discente::varchar, ', ') from transporte.rota_discente rd  where rd.id_discente in(1401957);
select  * from rh.servidor s  where s.id_pessoa  in(772776);
select  * from basico.movimentacao_estudante me where me.id_discente  in(1401957);
select  * from educacenso.educacenso_pessoa ep  where ep.id_pessoa  in(772776);
  

select * from comum.pessoa p where p.nome = 'LAIS JELSON CONCEICAO DA SILVA';
-- pessoa mais antigo correto 52793684 / errado 756024   

select * from comum.pessoa p where cpf_cnpj in ('14701606413',	'12371091405');


select * from comum.pessoa   where id_pessoa  in (749222, 749376);



select matricula , id_pessoa , *  from discente d  where id_pessoa   in (749376, 749222);
 --id_disc correto 1374876 / errado 1386690

select matricula , id_pessoa , *  from discente d where id_discente in (975867, 976021);

select matricula , id_pessoa , *  from discente d where matricula  in ('202030023977', '202030025514');

select string_agg(id_matricula_componente::varchar, ', ')  
from ensino.matricula_componente mc where id_discente = 976021;

select string_agg(id_matricula_discente_serie ::varchar, ', ')  
from basico.matricula_estudante_serie where id_estudante  = 975867;

select string_agg(id_renovacao_matricula::varchar, ', ')  
from matricula.renovacao_matricula where id_discente  = 1386690;

select string_agg(id_frequencia::varchar, ', ')  
from ensino.frequencia_aluno where id_discente  = 1386690 ;

select string_agg(id_estudante_documento_pendente::varchar, ', ')  
from basico.estudante_documento_pendente edp where id_estudante  = 1386690;

select string_agg(id::varchar, ', ')  from diario.competencia_habilidades_aluno cha where id_discente =  1386690;

select string_agg(id_historico_implantado::varchar, ', ') from diario.historico_implantado  where id_estudante  =  1386690;

select id_observacao_discente from ensino.observacao_discente od  where id_discente  =  1386690;

SELECT * FROM comum.pessoa_necessidade_especial pne WHERE pne.id_pessoa  = 756024;

-------------------------------------------------------------------------------
--Usar dados antigos que serão deletados para o backup;
select * FROM basico.estudante WHERE id_estudante in (1386690);
select * FROM public.discente WHERE id_discente=1386690;
select * FROM comum.pessoa where id_pessoa = 756024; 

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

--update ensino.observacao_discente set id_discente = 1399592 where id_observacao_discente = 519272692;

-- Deletar basico.estudante o ERRADO
DELETE FROM basico.estudante WHERE id_estudante=1373427;
--1387237

-- Deletar public.discente
DELETE FROM public.discente WHERE id_discente=1373427;

-- Deletar comum.pessoa
DELETE FROM comum.pessoa WHERE id_pessoa=52792235; 

  
-------------------------------
 
  --id_disc correto 973930   / errado 974800

SELECT 
mes.id_matricula_discente_serie ,
d.id_discente ,
p.id_pessoa ,
p.nome ,
d.matricula ,
mes.ano_calendario ,
d.data_cadastro ,
p.cpf_cnpj , 
p.data_nascimento ,
p.nome_mae,
mes.id_turma_serie ,
mes.id_situacao_matricula_serie 
FROM discente d 
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente 
WHERE 1=1 
AND p.nome = 'ANDRE WILLYAN DE OLIVEIRA SILVA'
OR p.cpf_cnpj = 71209914425;

-- 202330018779, sai 202430001021 e  202330071220
select 'UPDATE basico.matricula_estudante_serie SET id_estudante = 1018453 WHERE id_matricula_discente_serie = ' 
|| mes.id_matricula_discente_serie || ';' script,
 'UPDATE basico.matricula_estudante_serie SET id_estudante = ' || mes.id_estudante || ' WHERE id_matricula_discente_serie = ' 
|| mes.id_matricula_discente_serie || ';' bacupt
from basico.matricula_estudante_serie mes
where mes.id_estudante IN (1394600, 1384626);


-------------------------------------------------
--id_disc correto 973930   / errado 974800
-- 02 script para unificar a MC

select 'UPDATE ensino.matricula_componente SET id_discente = 973930 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao,
	   'UPDATE ensino.matricula_componente SET id_discente = '|| mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup,
	   COUNT(mc.id_matricula_componente) AS quantidade_ids
from ensino.matricula_componente mc 
where mc.id_discente IN (974800)
GROUP BY 
    mc.id_discente;	
   
-- 03 FREQUENCIA

SELECT 
    'UPDATE ensino.frequencia_aluno SET id_discente = 973930 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script,
    'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup,
    COUNT(fa.id_frequencia) AS quantidade_ids
FROM 
    ensino.frequencia_aluno fa 
WHERE 
    fa.id_discente IN (974800)
GROUP BY 
    fa.id_discente;	


-- 04 -- estudante inscrito
SELECT 
 	'UPDATE matricula.estudante_inscrito SET id_estudante = 973930 WHERE id_estudante_inscrito = '
	|| ei.id_estudante_inscrito || ';' script,
	'UPDATE matricula.estudante_inscrito SET id_estudante = '
	|| ei.id_estudante  || ' WHERE id_estudante_inscrito = '
	|| ei.id_estudante_inscrito || ';' backup
