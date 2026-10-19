select * from comum.pessoa p where p.nome = 'MARIANA NAYARA LIMA DA SILVA';
-- pessoa mais antigo correto 52793684 / errado 756024   

select * from comum.pessoa p where cpf_cnpj = '10776064517';

select * from comum.pessoa   where id_pessoa   in (51924933, 51925185);
select *  from basico.unificacao_estudante ue;

select matricula , id_pessoa , *  from discente d  where id_pessoa   in (51924933, 51925185);
 --id_disc correto 1374876 / errado 1386690