SELECT 
    SELECT p3.id_pessoa, p3.nome,
    p3.cpf_cnpj, p.*
FROM comum.permissao p
JOIN comum.papel p2 ON p2.id = p.id_papel
JOIN comum.unidade u ON u.id_unidade = p.id_unidade_papel
JOIN comum.usuario u2 ON u2.id_usuario = p.id_usuario
JOIN comum.pessoa p3 ON p3.id_pessoa = u2.id_pessoa
JOIN rh.servidor s ON s.id_pessoa = p3.id_pessoa
WHERE p2.id = 302
  AND p.id_unidade_papel = 27223910
ORDER BY p.data_atribuicao DESC
LIMIT 1;