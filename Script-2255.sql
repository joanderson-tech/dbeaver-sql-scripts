SELECT p3.id_pessoa, p3.nome,p.id_unidade_papel,
    p3.cpf_cnpj, p.*
FROM comum.permissao p
JOIN comum.papel p2 ON p2.id = p.id_papel
JOIN comum.unidade u ON u.id_unidade = p.id_unidade_papel
JOIN comum.usuario u2 ON u2.id_usuario = p.id_usuario
JOIN comum.pessoa p3 ON p3.id_pessoa = u2.id_pessoa
JOIN rh.servidor s ON s.id_pessoa = p3.id_pessoa
WHERE p2.id = 302
  AND p.id_unidade_papel IN (8527, 8541, 8508, 8529, 8549, 8520, 8500, 8496, 8546, 8487, 8544, 8475, 8497, 8495, 8505, 8554, 8479, 8510, 8553, 8531, 8485, 8512, 8537, 8551, 8521, 8519, 8543, 8511, 8509, 8477, 8490, 8513, 8482, 8506, 8486, 8548, 8526, 8504, 8538, 8491, 8532, 8547, 8545, 8542, 8481, 8539, 8517, 8530, 8483, 8476, 8478, 8536, 8528, 8502, 8535, 8522, 8503, 8493, 8523, 8492, 8499, 8516, 8498, 8484, 8507, 8534, 8525, 8488, 8552, 8533, 8550, 8514, 8518, 8524, 8555)
ORDER BY p.data_atribuicao DESC;
-- Agora o LIMIT 1 pegará com segurança o topo da lista (o mais recente)
LIMIT 1;



    SELECT * 
FROM comum.permissao p;


SELECT p.* FROM comum.papel AS p
WHERE id = 302;


SELECT * FROM comum.unidade u;