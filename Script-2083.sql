SELECT p3.id_pessoa, p3.nome,
    p3.cpf_cnpj, p.*
FROM comum.permissao p
JOIN comum.papel p2 ON
p2.id = p.id_papel
JOIN comum.unidade u ON
u.id_unidade = p.id_unidade_papel
JOIN comum.usuario u2 ON
u2.id_usuario = p.id_usuario
JOIN comum.pessoa p3 ON
p3.id_pessoa = u2.id_pessoa
--JOIN rh.servidor s ON s.id_pessoa = p3.id_pessoa
WHERE p2.id = 302
AND p.id_unidade_papel = 27223910;
LIMIT 1;


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
-- Agora o LIMIT 1 pegará com segurança o topo da lista (o mais recente)
LIMIT 1;


SELECT * FROM comum.pessoa p WHERE p.id_pessoa IN (746515, 746514);


SELECT * FROM rh.servidor s WHERE s.id_pessoa IN (746515, 746514);

SELECT * FROM comum.usuario u2  WHERE u2.id_pessoa IN (746515, 746514);

BEGIN;

ROLLBACK;

--nossasenhoradosocorro-se
--### GUADALUPE DE MORAES SANTOS SILVA

UPDATE comum.usuario 	SET id_pessoa=746514 	WHERE id_usuario=104909;

DELETE FROM comum.pessoa WHERE id_pessoa=746515;

--backup GUADALUPE DE MORAES SANTOS SILVA

INSERT INTO comum.pessoa (id_pessoa, endereco, cep, uf, telefone, celular, fax, tipo, cpf_cnpj, complemento, nome_representante, nome, bairro, cidade, matricula, id_cargo, nome_fantasia, data_nascimento, sexo, email, funcionario, nitpis, emite_fatura, aliquota_imposto, internacional, passaporte, pais_origem, ultima_atualizacao, valido, nome_ascii, origem, nome_mae, numero, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, data_cadastro, "semCpf", justificativa, pais_nacionalidade, id_municipio_naturalidade, id_uf_naturalidade, numero_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, orgao_expedicao_identidade, id_estado_civil, id_raca) VALUES(746515, NULL, NULL, NULL, NULL, NULL, NULL, 'F', 58875611572, NULL, NULL, 'GUADALUPE DE MORAES SANTOS SILVA', NULL, NULL, 0, 1, NULL, '1971-03-30', 'F', 'guadalupe.silva@hotmail.com', NULL, NULL, false, NULL, false, NULL, NULL, NULL, true, 'GUADALUPE DE MORAES SANTOS SILVA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-06 11:09:20.572', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE comum.usuario 	SET id_pessoa=746515 	WHERE id_usuario=104909;
