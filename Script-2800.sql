SELECT * FROM comum.papel p ;

SELECT  p2.nome, p.data_atribuicao, * FROM comum.permissao p 
JOIN comum.papel p2 ON p2.id = p.id_papel 
WHERE p.id_usuario IN (33);

105240

SELECT * FROM comum.usuario u WHERE u.id_pessoa IN (33); 