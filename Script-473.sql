746975

select * from comum.pessoa p where p.id_pessoa = 746975;
select * from rh.servidor s where s.id_pessoa = 746975;

begin;

rollback;

DELETE FROM rh.servidor WHERE id_servidor=150;

DELETE FROM comum.pessoa WHERE id_pessoa=746975;


INSERT INTO comum.pessoa (id_pessoa, endereco, cep, uf, telefone, celular, fax, tipo, cpf_cnpj, complemento, nome_representante, nome, bairro, cidade, matricula, id_cargo, nome_fantasia, data_nascimento, sexo, email, funcionario, nitpis, emite_fatura, aliquota_imposto, internacional, passaporte, pais_origem, ultima_atualizacao, valido, nome_ascii, origem, nome_mae, numero, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, data_cadastro, "semCpf", justificativa, pais_nacionalidade, id_municipio_naturalidade, id_uf_naturalidade, numero_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, orgao_expedicao_identidade, id_estado_civil, id_raca) VALUES(746975, 'RUA MILTON FERNANDES DE MOURA', NULL, NULL, NULL, NULL, NULL, 'F', 1431430420, NULL, NULL, 'MARLEIDE ARAUJO', NULL, NULL, 0, 1, NULL, '1979-09-16', 'F', '', NULL, NULL, false, NULL, false, NULL, NULL, NULL, false, 'MARLEIDE ARAUJO', NULL, 'GERALDO CIRIACO DE ARAUJO', NULL, NULL, NULL, NULL, NULL, '2025-04-15 11:06:35.728', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, siape_antiga, id_entrada) VALUES(150, '000', 746975, NULL, '0', NULL, NULL, 1, 1, 1752, NULL, NULL, '2025-04-15 11:06:35.779', 0.00, NULL, 605, NULL, 20, false, '8', NULL, NULL, NULL, NULL, NULL, '2025-03-02 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
