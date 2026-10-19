

--solução

UPDATE comum.usuario
	SET id_pessoa=51871563
	WHERE id_usuario=106062;

DELETE FROM comum.pessoa
WHERE id_pessoa=747342;

---
UPDATE comum.usuario
	SET id_pessoa=747342
	WHERE id_usuario=106062;

INSERT INTO comum.pessoa
(id_pessoa, endereco, cep, uf, telefone, celular, fax, tipo, cpf_cnpj, complemento, nome_representante, nome, bairro, cidade, matricula, id_cargo, nome_fantasia, data_nascimento, sexo, email, funcionario, nitpis, emite_fatura, aliquota_imposto, internacional, passaporte, pais_origem, ultima_atualizacao, valido, nome_ascii, origem, nome_mae, numero, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, data_cadastro, "semCpf", justificativa, pais_nacionalidade, id_municipio_naturalidade, id_uf_naturalidade, numero_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, orgao_expedicao_identidade, id_estado_civil, id_raca)
VALUES(747342, NULL, NULL, NULL, NULL, NULL, NULL, 'F', 4774029416, NULL, NULL, 'Maria Ivaneide Gomes da Rocha', NULL, NULL, 0, 1, NULL, '1977-11-25', 'F', 'desenv@esig.com.br', NULL, NULL, false, NULL, false, NULL, NULL, NULL, true, 'MARIA IVANEIDE GOMES DA ROCHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-16 18:48:35.121', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
