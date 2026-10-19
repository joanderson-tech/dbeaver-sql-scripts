select * from comum.pessoa p where p.nome ilike '%JHONATAS KEVIN DA SILVA ROCHA%';

select * from comum.pessoa p where p.id_pessoa in (51882458,747754);

select * from discente d where d.id_pessoa in (51882458,747754);

select * from basico.matricula_estudante_serie mes where mes.id_estudante in (973702,979452);

973702	2026		202630029850		51882458
979452	2026		202630059850		747754



--pessoa completa 747754 -- discente 979452 202630059850
--pessoa incompleta 51882458 -- discente 973702 202630029850

-- Auto-generated SQL script #202606190841
UPDATE comum.pessoa	SET cpf_cnpj=51882458	WHERE id_pessoa=747754;



UPDATE comum.pessoa	SET cpf_cnpj=null	WHERE id_pessoa=747754;
