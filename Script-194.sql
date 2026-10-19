select * from comum.pessoa p where p.cpf_cnpj = 4774029416;
select * from rh.servidor s where id_pessoa in(747341, 51871563); 
select * from comum.usuario u where id_pessoa in(747341, 51871563); 

--51873204
--106062 - Maria Ivaneide Gomes da Rocha 51871687
--106062 - Maria Ivaneide Gomes da Rocha

begin;
commit;
rollback;

--SOLUÇÃO
UPDATE comum.pessoa
	SET nome='Maria Ivaneide Gomes da Rocha'
	WHERE id_pessoa=51871563;

---------------
UPDATE comum.pessoa
	SET email='ivaneidegomesbezerra@gmail.com'
	WHERE id_pessoa=51871563;

UPDATE comum.usuario
	SET id_pessoa=51871563
	WHERE id_usuario=106062;

DELETE FROM comum.pessoa
WHERE id_pessoa=747341;


SELECT x.* FROM basico.etapa_ensino x;

select * from basico.serie s ;