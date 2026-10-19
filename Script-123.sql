	
select * from comum.usuario u 
where u.id_usuario = 105399;


SELECT * FROM comum.unidade u
where u.ativo;

select * from rh.servidor s 
where s.id_pessoa = 754070;

SELECT * FROM comum.pessoa p 
where p.id_pessoa = 754070;

--Idpessoa
754070
--IdUnidade
2035
--id Unidade Secretaria de educação
605


begin;
commit;

select * from comum.usuario u 



UPDATE comum.usuario
	SET id_unidade=605
	WHERE id_usuario=105399;

UPDATE comum.usuario
	SET id_unidade=2035
	WHERE id_usuario=105399;





