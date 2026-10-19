select  * from comum.pessoa p where p.nome = 'EDLEUZA MARIA RODRIGUES';
787214  52220194


select * from rh.servidor s where s.id_pessoa in (787214,  52220194);

select * from comum.usuario u where u.id_pessoa in (787214,  52220194);

rollback;

begin;

commit;


UPDATE comum.pessoa SET nome_ascii='EDLEUZA MARIA RODRIGUES',nome='EDLEUZA MARIA RODRIGUES' WHERE id_pessoa=52220194;
UPDATE comum.usuario SET id_pessoa=52220194 WHERE id_usuario=120270;
DELETE FROM comum.pessoa WHERE id_pessoa=787214;


INSERT INTO comum.pessoa (id_pessoa, endereco, cep, uf, telefone, celular, fax, tipo, cpf_cnpj, complemento, nome_representante, nome, bairro, cidade, matricula, id_cargo, nome_fantasia, data_nascimento, sexo, email, funcionario, nitpis, emite_fatura, aliquota_imposto, internacional, passaporte, pais_origem, ultima_atualizacao, valido, nome_ascii, origem, nome_mae, numero, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, data_cadastro, "semCpf", justificativa, pais_nacionalidade, id_municipio_naturalidade, id_uf_naturalidade, numero_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, orgao_expedicao_identidade, id_estado_civil, id_raca) VALUES(787214, NULL, NULL, NULL, NULL, NULL, NULL, 'F', 6843312411, NULL, NULL, 'EDLEUZA MARIA RODRIGUES FLORENCIO', NULL, NULL, 0, 1, NULL, NULL, 'O', NULL, NULL, NULL, false, NULL, false, NULL, NULL, NULL, false, 'EDLEUZA MARIA RODRIGUES FLORENCIO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-21 18:07:06.438', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE comum.usuario SET id_pessoa=787214 WHERE id_usuario=120270;
UPDATE comum.pessoa SET nome_ascii='EDLEUZA MARIA RODRIGUES FLORENCIO',nome='EDLEUZA MARIA RODRIGUES FLORENCIO' WHERE id_pessoa=52220194;
