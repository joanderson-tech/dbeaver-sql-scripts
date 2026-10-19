SELECT DISTINCT u.nome AS escola, p3.nome, p3.cpf_cnpj ,s.id_servidor 
FROM comum.permissao p
JOIN comum.papel p2 ON p2.id = p.id_papel
JOIN comum.unidade u ON u.id_unidade = p.id_unidade_papel
JOIN comum.usuario u2 ON u2.id_usuario = p.id_usuario
JOIN comum.pessoa p3 ON p3.id_pessoa = u2.id_pessoa
LEFT JOIN rh.servidor s ON p3.id_pessoa = s.id_pessoa 
WHERE p2.id IN (302) 
  AND p.id_unidade_papel IN (8490, 8488, 8497, 8484, 8502, 8486, 8479, 8495, 8483, 8542, 8493, 8530, 8478, 8524, 8499, 8505, 8492, 8529, 8504, 8482, 8546, 8500, 8485, 8491, 8543, 8527, 8496, 8487, 8476, 8510, 8498, 8537, 8506, 8553, 8549, 8507, 8541, 8532, 8535, 8516, 8538, 8520, 8525, 8519, 8531, 8554, 8522, 8534, 8551, 8539, 8521, 8526, 8545, 8511, 8517, 8528, 8555, 8518, 8509, 8508, 8547, 8514, 8533, 8550, 8477, 8523, 8544, 8475, 8513, 8512, 8503, 8481, 8548, 8536, 8552, 7483)
 AND s.id_servidor IS null;
  
  
  
 
  SELECT 
    p.id_unidade_papel, 
    u.nome AS nome_unidade,
    p3.nome AS nome_pessoa_sem_rh,
    p3.cpf_cnpj
FROM comum.permissao p
JOIN comum.unidade u ON u.id_unidade = p.id_unidade_papel
JOIN comum.usuario u2 ON u2.id_usuario = p.id_usuario
JOIN comum.pessoa p3 ON p3.id_pessoa = u2.id_pessoa
-- O LEFT JOIN tenta encontrar o servidor, se não encontrar, traz NULL
LEFT JOIN rh.servidor s ON s.id_pessoa = p3.id_pessoa
WHERE p.id_papel = 302
  AND p.id_unidade_papel IN (
      8490, 8488, 8497, 8484, 8502, 8486, 8479, 8495, 8483, 8542, 8493, 8530, 8478, 8524, 
      8499, 8505, 8492, 8529, 8504, 8482, 8546, 8500, 8485, 8491, 8543, 8527, 8496, 8487, 
      8476, 8510, 8498, 8537, 8506, 8553, 8549, 8507, 8541, 8532, 8535, 8516, 8538, 8520, 
      8525, 8519, 8531, 8554, 8522, 8534, 8551, 8539, 8521, 8526, 8545, 8511, 8517, 8528, 
      8555, 8518, 8509, 8508, 8547, 8514, 8533, 8550, 8477, 8523, 8544, 8475, 8513, 8512, 
      8503, 8481, 8548, 8536, 8552, 7483
  )
  -- Filtro crucial: só mostra quem NÃO tem correspondência no RH
  AND s.id_pessoa IS NULL
ORDER BY u.nome ASC;
  
  
  
  
SELECT DISTINCT 
    u.id_unidade, 
    u.nome AS nome_escola
FROM comum.permissao p
JOIN comum.papel p2 ON p2.id = p.id_papel
JOIN comum.unidade u ON u.id_unidade = p.id_unidade_papel
WHERE u.id_unidade IN (8490, 8488, 8497, 8484, 8502, 8486, 8479, 8495, 8483, 8542, 8493, 8530, 8478, 8524, 8499, 8505, 8492, 8529, 8504, 8482, 8546, 8500, 8485, 8491, 8543, 8527, 8496, 8487, 8476, 8510, 8498, 8537, 8506, 8553, 8549, 8507, 8541, 8532, 8535, 8516, 8538, 8520, 8525, 8519, 8531, 8554, 8522, 8534, 8551, 8539, 8521, 8526, 8545, 8511, 8517, 8528, 8555, 8518, 8509, 8508, 8547, 8514, 8533, 8550, 8477, 8523, 8544, 8475, 8513, 8512, 8503, 8481, 8548, 8536, 8552, 7483)
AND NOT EXISTS (
    SELECT 1 
    FROM comum.permissao p
      where p.id_papel = 302
     
)
ORDER BY u.nome ASC;



SELECT 
    u.id_unidade, 
    u.nome AS nome_escola
FROM comum.unidade u
WHERE u.id_unidade IN (8490, 8488, 8497, 8484, 8502, 8486, 8479, 8495, 8483, 8542, 8493, 8530, 8478, 8524, 8499, 8505, 8492, 8529, 8504, 8482, 8546, 8500, 8485, 8491, 8543, 8527, 8496, 8487, 8476, 8510, 8498, 8537, 8506, 8553, 8549, 8507, 8541, 8532, 8535, 8516, 8538, 8520, 8525, 8519, 8531, 8554, 8522, 8534, 8551, 8539, 8521, 8526, 8545, 8511, 8517, 8528, 8555, 8518, 8509, 8508, 8547, 8514, 8533, 8550, 8477, 8523, 8544, 8475, 8513, 8512, 8503, 8481, 8548, 8536, 8552, 7483)
AND NOT EXISTS (
   
    SELECT 1 
    FROM comum.permissao p
    WHERE p.id_unidade_papel = u.id_unidade
      AND p.id_papel = 302
)
ORDER BY u.nome ASC;


