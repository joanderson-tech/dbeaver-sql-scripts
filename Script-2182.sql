SELECT * FROM comum.pessoa p WHERE p.nome_ascii ILIKE 'FRANCISCA ROMAO DO NASCIMENTO';

SELECT * FROM rh.servidor s WHERE s.id_pessoa IN (781277, 783855);

SELECT * FROM discente d WHERE d.id_pessoa   IN (781277, 783855);

SELECT * FROM comum.usuario u WHERE u.id_pessoa IN (781277, 783855);



-- SOLUÇÃO
UPDATE comum.usuario 	SET id_pessoa=783855	WHERE id_usuario=111239;
UPDATE comum.pessoa 	SET cpf_cnpj=6626412485	WHERE id_pessoa=783855;
DELETE FROM comum.pessoa WHERE id_pessoa=781277;




INSERT INTO comum.pessoa (id_pessoa, endereco, cep, uf, telefone, celular, fax, tipo, cpf_cnpj, complemento, nome_representante, nome, bairro, cidade, matricula, id_cargo, nome_fantasia, data_nascimento, sexo, email, funcionario, nitpis, emite_fatura, aliquota_imposto, internacional, passaporte, pais_origem, ultima_atualizacao, valido, nome_ascii, origem, nome_mae, numero, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, data_cadastro, "semCpf", justificativa, pais_nacionalidade, id_municipio_naturalidade, id_uf_naturalidade, numero_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, orgao_expedicao_identidade, id_estado_civil, id_raca) VALUES(781277, NULL, NULL, NULL, NULL, '(84)98891-9314', NULL, 'F', 6626412485, NULL, NULL, 'FRANCISCA ROMÃO DO NASCIMENTO', NULL, NULL, 0, 1, NULL, '1981-04-27', 'O', NULL, NULL, NULL, false, NULL, false, NULL, NULL, NULL, false, 'FRANCISCA ROMAO DO NASCIMENTO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-12 23:22:47.238', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE comum.pessoa SET cpf_cnpj=NULL	WHERE id_pessoa=783855;
UPDATE comum.usuario 	SET id_pessoa=781277	WHERE id_usuario=111239;