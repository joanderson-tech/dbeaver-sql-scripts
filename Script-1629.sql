UPDATE comum.pessoa SET cpf_cnpj=7586122490	WHERE id_pessoa=757450;
UPDATE comum.usuario 	SET id_pessoa=757450	WHERE id_usuario=105633;
DELETE FROM comum.pessoa WHERE id_pessoa=754243;


UPDATE comum.pessoa SET cpf_cnpj=null	WHERE id_pessoa=757450;
UPDATE comum.usuario 	SET id_pessoa=754243	WHERE id_usuario=105633;




SELECT * FROM comum.pessoa p WHERE p.id_pessoa IN (754243,757450);

SELECT * FROM comum.usuario u WHERE u.id_pessoa  IN (754243,757450);
