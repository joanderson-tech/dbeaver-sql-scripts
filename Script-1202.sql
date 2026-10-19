begin;

--MARIA APARECIDA DA SILVA MOURA
UPDATE comum.pessoa SET cpf_cnpj=12531142428 WHERE id_pessoa=757392;
UPDATE comum.usuario SET id_pessoa=757392 WHERE id_usuario=105831;
DELETE FROM comum.pessoa WHERE id_pessoa=755451;


--ADRIANA FERREIRA LINS
UPDATE comum.pessoa SET cpf_cnpj=6126592409 WHERE id_pessoa=756732;
UPDATE comum.usuario SET id_pessoa=756732 WHERE id_usuario=105327;
DELETE FROM comum.pessoa WHERE id_pessoa=752513;

rollback;

select * from comum.pessoa p where p.id_pessoa in (755451, 752513);


