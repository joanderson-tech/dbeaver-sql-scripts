SELECT s.* FROM rh.servidor s 
JOIN comum.pessoa p ON P.id_pessoa = s.id_pessoa  
WHERE p.id_pessoa IN (747145,747146,748690,748954);


SELECT * FROM  comum.pessoa p
WHERE p.id_pessoa IN (747145,747146,748690,748954);


SELECT * FROM discente d WHERE d.id_pessoa IN (747145,747146,748690,748954);


BEGIN;

DROP TABLE novo_docente;

SELECT t.id_turma, dt.id_docente_turma , t.nome_professor 
INTO TEMP novo_docente
FROM ensino.docente_turma dt
JOIN ensino.turma t ON t.id_turma = dt.id_turma
WHERE dt.id_docente = 233
AND t.ano IN (2024, 2025)
AND dt.ativo;

SELECT 'UPDATE ensino.turma SET nome_professor = ''ANA LARA COSTA LUCENA'' WHERE id_turma= ' || id_turma || ';' AS solução_script,
			 'UPDATE ensino.turma SET nome_professor ='  || COALESCE('''' || nome_professor || '''', 'NULL') || ' WHERE id_turma= ' || id_turma || ';' AS backup_script
FROM novo_docente h;

SELECT 'UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= ' || id_docente_turma || ';' AS solução_script,
			 'UPDATE ensino.docente_turma	SET id_docente=208 WHERE id_docente_turma= ' || id_docente_turma || ';' AS backup_script
FROM novo_docente h;




--duplicação
--id_pessoa = 748690 nome ANA CLARA COSTA LUCENA cpf_cnpj 13388677417

--id_pessoa = 748954 nome ANA LARA COSTA LUCENA cpf_cnpj 13383429407

--ok 
--id_pessoa = 747145 nome ANA CLARA COSTA LUCENA cpf_cnpj 13388677417 idRH 208

--id_pessoa = 747146 nome ANA LARA COSTA LUCENA cpf_cnpj 13383429407 -- idRH 233

BEGIN;

-----------####################################### SOLUÇÃO ################################################

SELECT t.id_turma, dt.id_docente_turma , t.nome_professor 
INTO TEMP novo_docente
FROM ensino.docente_turma dt
JOIN ensino.turma t ON t.id_turma = dt.id_turma
WHERE dt.id_docente = 233
AND t.ano IN (2024, 2025)
AND dt.ativo;

SELECT 'UPDATE ensino.turma SET nome_professor = ''ANA LARA COSTA LUCENA'' WHERE id_turma= ' || id_turma || ';' AS solução_script,
			 'UPDATE ensino.turma SET nome_professor ='  || COALESCE('''' || nome_professor || '''', 'NULL') || ' WHERE id_turma= ' || id_turma || ';' AS backup_script
FROM novo_docente h;

SELECT 'UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= ' || id_docente_turma || ';' AS solução_script,
			 'UPDATE ensino.docente_turma	SET id_docente=208 WHERE id_docente_turma= ' || id_docente_turma || ';' AS backup_script
FROM novo_docente h;

UPDATE comum.pessoa SET cpf_cnpj=13388677417	WHERE id_pessoa=747145;
UPDATE comum.pessoa SET cpf_cnpj=13383429407	WHERE id_pessoa=747146;

UPDATE rh.servidor 	SET id_pessoa=747145	WHERE id_servidor IN (232, 208);
UPDATE rh.servidor 	SET id_pessoa=747146	WHERE id_servidor = 233;

UPDATE comum.alteracao_pessoa 	SET id_pessoa=747145	WHERE id_alteracao_pessoa IN (520248240, 521104710);
UPDATE comum.alteracao_pessoa 	SET id_pessoa=747146	WHERE id_alteracao_pessoa IN (521104800,521104801,521104802);

UPDATE comum.usuario	SET id_pessoa=747145	WHERE id_usuario=105103;
UPDATE comum.usuario	SET id_pessoa=747146	WHERE id_usuario=105210;

UPDATE educacenso.educacenso_pessoa SET id_pessoa=747145	WHERE id_educacenso_pessoa=567;
UPDATE educacenso.educacenso_pessoa	SET id_pessoa=747146	WHERE id_educacenso_pessoa=568;

DELETE FROM comum.pessoa WHERE id_pessoa=748690;
DELETE FROM comum.pessoa WHERE id_pessoa=748954;

commit;

SELECT * FROM educacenso.educacenso_pessoa u WHERE u.id_pessoa IN (748690, 748954)

SELECT * FROM 

-----------####################################### BACKUP ################################################
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula, id_povo_indigena, id_foto_reconhecimento_facial, codigo_familia, data_nascimento_filiacao_1, data_nascimento_filiacao_2, data_nascimento_responsavel) VALUES(748690, 'ANA CLARA COSTA LUCENA', '2006-02-19', 'F', 5, NULL, NULL, NULL, NULL, NULL, 13388677417, 31, NULL, '', 'SILVANIA MACHADO DA COSTA', 'desenv@esig.com.br', NULL, '', 23, 2307601, '', 'F', false, '2026-03-03 15:44:55.506', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, 'ANA CLARA COSTA LUCENA', NULL, NULL, 'BRASILEIRA', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'CPF', '', '', NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula, id_povo_indigena, id_foto_reconhecimento_facial, codigo_familia, data_nascimento_filiacao_1, data_nascimento_filiacao_2, data_nascimento_responsavel) VALUES(748954, 'ANA LARA COSTA LUCENA', '2006-02-19', 'F', 5, NULL, NULL, NULL, NULL, NULL, 13383429407, 31, NULL, '', 'SILVANIA MACHADO DA COSTA', 'desenv@esig.com.br', NULL, '', 23, 2307601, '', 'F', true, '2026-03-04 17:42:50.780', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, 'ANA LARA COSTA LUCENA', NULL, NULL, 'BRASILEIRA', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE comum.alteracao_pessoa 	SET id_pessoa=748690	WHERE id_alteracao_pessoa IN (520248240, 521104710);
UPDATE comum.alteracao_pessoa 	SET id_pessoa=748954	WHERE id_alteracao_pessoa IN (521104800,521104801,521104802);

UPDATE comum.usuario	SET id_pessoa=748690	WHERE id_usuario=105103;
UPDATE comum.usuario	SET id_pessoa=748954	WHERE id_usuario=105210;

UPDATE educacenso.educacenso_pessoa SET id_pessoa=748690	WHERE id_educacenso_pessoa=567;
UPDATE educacenso.educacenso_pessoa	SET id_pessoa=748954	WHERE id_educacenso_pessoa=568;

UPDATE comum.pessoa SET cpf_cnpj=NULL	WHERE id_pessoa IN (747145, 747146);

UPDATE rh.servidor 	SET id_pessoa=748690	WHERE id_servidor IN (232, 208);
UPDATE rh.servidor 	SET id_pessoa=748954	WHERE id_servidor=233;

UPDATE ensino.docente_turma	SET id_docente=208 WHERE id_docente_turma= 52024834;
UPDATE ensino.docente_turma	SET id_docente=208 WHERE id_docente_turma= 52024833;
UPDATE ensino.docente_turma	SET id_docente=208 WHERE id_docente_turma= 52068698;
UPDATE ensino.docente_turma	SET id_docente=208 WHERE id_docente_turma= 52068701;
UPDATE ensino.docente_turma	SET id_docente=208 WHERE id_docente_turma= 52068704;
UPDATE ensino.docente_turma	SET id_docente=208 WHERE id_docente_turma= 52068708;

UPDATE ensino.turma SET nome_professor ='ANA CLARA COSTA LUCENA' WHERE id_turma= 684666;
UPDATE ensino.turma SET nome_professor =NULL WHERE id_turma= 684629;
UPDATE ensino.turma SET nome_professor ='ANA CLARA COSTA LUCENA' WHERE id_turma= 684989;
UPDATE ensino.turma SET nome_professor ='ANA CLARA COSTA LUCENA' WHERE id_turma= 685015;
UPDATE ensino.turma SET nome_professor ='ANA CLARA COSTA LUCENA' WHERE id_turma= 685037;
UPDATE ensino.turma SET nome_professor ='ANA CLARA COSTA LUCENA' WHERE id_turma= 685050;


52024834,52024833,52068698,52068701,52068704, 52068708


/*UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52024834;
UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52024833;
UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52068698;
UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52068701;
UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52068704;
UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52068708;

UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 684666;
UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 684629;
UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 684989;
UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 685015;
UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 685037;
UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 685050;*/
