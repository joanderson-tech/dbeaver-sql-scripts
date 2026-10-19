SELECT *
FROM rh.servidor s
WHERE s.id_cargo <> 2695;

SELECT c.*
FROM rh.cargo c
WHERE c.id_cargo = 2695


SELECT u.nome, va.*
FROM pessoas.vaga_administrativa va
JOIN comum.unidade u ON u.id_unidade = va.id_unidade
WHERE va.ativo = TRUE;
.


SELECT *
FROM comum.unidade u
WHERE u.id_unidade IN (8490, 8488, 8497, 8484, 8502, 8486, 8479, 8495, 8483, 8542, 8493, 8530, 8478, 8524, 8499, 8505, 8492, 8529, 8504, 8482, 8546, 8500, 8485, 8491, 8543, 8527, 8496, 8487, 8476, 8510, 8498, 8537, 8506, 8553, 8549, 8507, 8541, 8532, 8535, 8516, 8538, 8520, 8525, 8519, 8531, 8554, 8522, 8534, 8551, 8539, 8521, 8526, 8545, 8511, 8517, 8528, 8555, 8518, 8509, 8508, 8547, 8514, 8533, 8550, 8477, 8523, 8544, 8475, 8513, 8512, 8503, 8481, 8548, 8536, 8552, 7483);


SELECT 
    u.id_unidade, 
    u.nome
FROM 
    comum.unidade u
WHERE 
    u.id_unidade IN (8490, 8488, 8497, 8484, 8502, 8486, 8479, 8495, 8483, 8542, 8493, 8530, 8478, 8524, 8499, 8505, 8492, 8529, 8504, 8482, 8546, 8500, 8485, 8491, 8543, 8527, 8496, 8487, 8476, 8510, 8498, 8537, 8506, 8553, 8549, 8507, 8541, 8532, 8535, 8516, 8538, 8520, 8525, 8519, 8531, 8554, 8522, 8534, 8551, 8539, 8521, 8526, 8545, 8511, 8517, 8528, 8555, 8518, 8509, 8508, 8547, 8514, 8533, 8550, 8477, 8523, 8544, 8475, 8513, 8512, 8503, 8481, 8548, 8536, 8552, 7483)
    AND NOT EXISTS (
        SELECT 1 
        FROM pessoas.vaga_administrativa va 
        WHERE va.id_unidade = u.id_unidade
    );




SELECT va.*
FROM pessoas.vaga_administrativa va
--JOIN comum.unidade u ON u.id_unidade = va.id_unidade 
WHERE va.ativo = TRUE;


SELECT * FROM comum.pessoa WHERE cpf_cnpj = '69317127568';


ESCOLA MUL MONS JASON BARBOSA COELHO