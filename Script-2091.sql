SELECT DISTINCT u.nome AS ESCOLA, p3.nome AS NOME, p3.cpf_cnpj AS CPF ,s.siape AS MATRICULA, s.id_cargo, p2.nome 
FROM comum.permissao p
JOIN comum.papel p2 ON p2.id = p.id_papel
JOIN comum.unidade u ON u.id_unidade = p.id_unidade_papel
JOIN comum.usuario u2 ON u2.id_usuario = p.id_usuario
JOIN comum.pessoa p3 ON p3.id_pessoa = u2.id_pessoa
LEFT JOIN rh.servidor s ON p3.id_pessoa = s.id_pessoa 
WHERE  p.id_unidade_papel IN (8490, 8488, 8497, 8484, 8502, 8486, 8479, 8495, 8483, 8542, 8493, 8530, 8478, 8524, 8499, 8505, 8492, 8529, 8504, 8482, 8546, 8500, 8485, 8491, 8543, 8527, 8496, 8487, 8476, 8510, 8498, 8537, 8506, 8553, 8549, 8507, 8541, 8532, 8535, 8516, 8538, 8520, 8525, 8519, 8531, 8554, 8522, 8534, 8551, 8539, 8521, 8526, 8545, 8511, 8517, 8528, 8555, 8518, 8509, 8508, 8547, 8514, 8533, 8550, 8477, 8523, 8544, 8475, 8513, 8512, 8503, 8481, 8548, 8536, 8552, 7483)
AND s.id_cargo  2695;




SELECT DISTINCT P2.*
FROM comum.permissao p
JOIN comum.papel p2 ON p2.id = p.id_papel;
--WHERE p2.id IN (302) ;
WHERE p2.descricao  ILIKE '%administrativo%'