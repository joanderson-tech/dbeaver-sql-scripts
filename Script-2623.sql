SELECT nome_pai 
FROM comum.pessoa WHERE nome ilike 'MARIA ALYCIA DA SILVA ARAUJO SALDANHA';

SELECT * FROM comum.pessoa p WHERE p.nome = 'DANIEL ARAUJO SALDANHA';

SELECT * FROM comum.pessoa p WHERE p.nome ILIKE 'MARIA APARECIDA da silva f%';


SELECT * FROM comum.usuario u WHERE  u.id_pessoa = 810251;


select * from basico.usuario_familiar uf WHERE  id_usuario=137709;

 SELECT *  FROM basico.usuario_familiar uf   WHERE uf.id_usuario = 137709; 


SELECT 

BEGIN;

DELETE FROM comum.usuario WHERE id_usuario=137709;

DELETE FROM comum.pessoa WHERE id_pessoa=810251;


ROLLBACK;



UPDATE basico.usuario_familiar SET ativo = true WHERE id_usuario = 137709 AND ativo = TRUE;
















