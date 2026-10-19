select * from basico.estudante e;


select * from comum.pessoa p where p.nome = 'HARLLEY KAUA DANTAS MORAIS';
-- pessoa mais antigo correto 52793684 / errado 756024   

select * from comum.pessoa p where cpf_cnpj = '10776064517';

select * from comum.pessoa   where id_pessoa  in (766360, 757516);

select matricula , id_pessoa , *  from discente d  where id_pessoa   in (766360, 763738);


select * from basico.matricula_estudante_serie mes where mes.id_estudante in (1019779,1022377);