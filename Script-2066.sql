SELECT * FROM comum.pessoa p WHERE p.nome = 'ELIZABETH SOPHIA LOPES DOS SANTOS SOUZA';


SELECT * FROM discente d WHERE d.id_pessoa = 18499;


SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_estudante = 984784
AND mes.ano_calendario = 2026;


-- EFAIPIN2D ESCOLA MUNICIPAL LEONEL BRIZOLA

-- EFAIPIN5D ESCOLA MUNICIPAL LEONEL BRIZOLA

--FALTA DIRETOR
-- PREV2EIP1B  ESCOLA MUNICIPAL APULCRO MOTA 
-- EFAIV35A    ESCOLA MUNICIPAL MAJOR JOÃO TELES


SELECT 
    p3.id_pessoa, 
    p3.cpf_cnpj 
FROM 
    comum.permissao p
JOIN 
    comum.papel p2 ON p2.id = p.id_papel
JOIN 
    comum.unidade u ON u.id_unidade = p.id_unidade_papel
JOIN 
    comum.usuario u2 ON u2.id_usuario = p.id_usuario
JOIN 
    comum.pessoa p3 ON p3.id_pessoa = u2.id_pessoa
WHERE 
    p2.id = :ID_GESTOR_MODULO_ESCOLA -- Substituir pelo ID numérico do Gestor
    AND p.id_unidade_papel = :ID_UNIDADE -- Substituir pelo ID da unidade desejada
LIMIT 1;