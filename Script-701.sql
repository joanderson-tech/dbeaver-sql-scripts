 select* from comum.pessoa p where p.cpf_cnpj = '13148995465'; 52222514
 
 select * from rh.servidor s where s.id_pessoa in (764346,  787056); 
 
 select * from comum.usuario u where u.id_pessoa in (764346,  787056);
 
 begin;
 


commit;

-- SOLUÇÃO EMELLY RAFAELE DE SOUZA BANCO COMUM
UPDATE comum.usuario SET id_pessoa=764346 WHERE id_usuario=120090;

DELETE FROM comum.pessoa WHERE id_pessoa=787056;


--BACKUP EMELLY RAFAELE DE SOUZA BANCO COMUM
INSERT INTO comum.pessoa (id_pessoa, endereco, cep, uf, telefone, celular, fax, tipo, cpf_cnpj, complemento, nome_representante, nome, bairro, cidade, matricula, id_cargo, nome_fantasia, data_nascimento, sexo, email, funcionario, nitpis, emite_fatura, aliquota_imposto, internacional, passaporte, pais_origem, ultima_atualizacao, valido, nome_ascii, origem, nome_mae, numero, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, data_cadastro, "semCpf", justificativa, pais_nacionalidade, id_municipio_naturalidade, id_uf_naturalidade, numero_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, orgao_expedicao_identidade, id_estado_civil, id_raca) VALUES(787056, 'Rua Desenvolvimento/Treinamento, 99999', '59000-000', NULL, '9999-9999', '9999-9999', NULL, 'F', 13148995465, 'Testes', NULL, 'EMELLY RAFAELE DE SOUZA', 'Testes', NULL, 0, 1, NULL, NULL, 'O', 'desenv@esig.com.br', NULL, NULL, false, NULL, false, NULL, NULL, NULL, false, 'EMELLY RAFAELE DE SOUZA', NULL, 'Testes', NULL, NULL, NULL, NULL, NULL, '2024-10-21 16:07:55.949', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE comum.usuario SET id_pessoa=787056 WHERE id_usuario=120090;


