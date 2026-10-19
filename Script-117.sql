
select * from discente d 
where d.matricula = '202430031147'



SELECT * FROM comum.pessoa p
where p.cpf_cnpj = '16536792475';

select * from basico.matricula_estudante_serie mes 
where mes.id_estudante = 1397620;

select * from basico.matricula_estudante_serie mes 
where mes.id_estudante = 1364037;



SELECT x.* FROM basico.estudante x
WHERE id_estudante = 1364037;



select  * from basico.matricula_estudante_serie mes 
where mes.id_estudante = 1397620; 


select p.nome_mae, p.nome_pai, p.cpf_cnpj, * from comum.pessoa p 
where p.nome = 'JOAO MIGUEL DOS SANTOS';

select * from discente d 
where d.id_pessoa in (52782845,351698);

select * from basico.estudante e 
where e.id_estudante in (1364037
,1397620);




begin; 
commit;
rollback;


--Solução 
--Estudante 2023 
UPDATE comum.pessoa
SET nome='JOAO MIGUEL DOS SANTOS', data_nascimento='2018-08-09', sexo='M', id_raca=2, id_endereco_residencial=NULL, id_endereco_contato=NULL, passaporte=NULL, id_grau_formacao=NULL, abreviatura=NULL, cpf_cnpj=16518674458, id_pais_nacionalidade=31, id_tipo_etnia=NULL, nome_pai='', nome_mae='THAYLANE MICAELLI LEITE DOS SANTOS', email=NULL, id_estado_civil=1, bairro='PEDRO RAIMUNDO', id_uf_naturalidade=26, id_municipio_naturalidade=2611101, numero='320', tipo='F', valido=true, ultima_atualizacao=NULL, endereco='RUA CARLOS FERREIRA GOMES', id_conta_bancaria=NULL, numero_certificado_militar=NULL, serie_certificado_militar=NULL, categoria_certificado_militar=NULL, orgao_expedicao_certificado_militar=NULL, data_expedicao_certificado_militar=NULL, numero_identidade='', orgao_expedicao_identidade=NULL, id_unidade_federativa_identidade=NULL, data_expedicao_identidade=NULL, numero_titulo_eleitor=NULL, zona_titulo_eleitor=NULL, secao_titulo_eleitor=NULL, data_expedicao_titulo_eleitor=NULL, id_unidade_federativa_titulo_eleitor=NULL, id_uf_identidade=NULL, id_uf_titulo_eleitor=NULL, id_uf_certificado_militar=NULL, codigo_area_nacional_telefone_celular=NULL, codigo_area_nacional_telefone_fixo=NULL, origem=NULL, telefone_fixo=NULL, telefone_celular='8799570676', fax=NULL, data_cadastro='2023-02-03 00:00:00.000', nome_ascii='JOAO MIGUEL DOS SANTOS', id_tipo_rg=NULL, tipo_sanguineo=NULL, pais_nacionalidade='Brasil', estrangeiro=false, certidao_civil_tipo='1', certidao_civil_modelo='N', certidao_civil_num_termo=NULL, certidao_civil_num_folha=NULL, certidao_civil_num_livro=NULL, certidao_civil_data=NULL, certidao_civil_id_municipio_cartorio=NULL, certidao_civil_cartorio=NULL, certidao_civil_matricula_nova='07674501552019100415012020497236', cod_educacenso=NULL, complemento=NULL, codigo_rh=NULL, nome_responsavel_matricula='THAYLANE MICAELLI LEITE DOS SANTOS', grau_parentesco_responsavel_matricula='MAE', tipo_documento_responsavel_matricula='CPF', numero_documento_responsavel_matricula='15825387439', cep='56318-180', codigo_rh_old=NULL, id_municipio_contato=2611101, id_uf_contato=26, id_pessoa_restauracao=NULL, profissaopai=NULL, profissaomae=NULL, codigo_unificado=NULL, id_pessoa_unificada=NULL, id_orgao_emissor_identidade=NULL, codigo_nis='23878829953', certidao_civil_cartorio_codigo_inep=NULL, "semCpf"=false, justificativa=NULL, id_bairro_endereco=NULL, id_tipo_documento_militar=NULL, id_tipo_militar=NULL, documento_militar=NULL, semcpf=NULL, municipio_ext=NULL, uf_naturalidade_ext=NULL, codigo_inep='185324841667', id_escolaridade=NULL, codigo_sus='700201969918724', id_informacoes_medicas=NULL, endereco_atual=NULL, bairro_atual=NULL, cep_atual=NULL, id_dados_pessoa_censo=NULL, email_alternativo=NULL, pis_pasep=NULL, numero_identidade_mae='10917437', numero_identidade_pai=NULL, orgao_expedicao_identidade_mae=NULL, orgao_expedicao_identidade_pai=NULL, data_expedicao_identidade_mae='2018-10-08', data_expedicao_identidade_pai=NULL, id_uf_identidade_mae=26, id_uf_identidade_pai=NULL, id_localizacao_zona=NULL, possui_laudo=false, telefone_celular2=NULL, telefone_celular3=NULL, contato_celular=NULL, contato_celular2=NULL, contato_celular3=NULL
WHERE id_pessoa=52782845;


--Estudante 2024
INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, nome_social)
VALUES(nextval('comum.pessoa_seq_aux'), 'JOAO MIGUEL DOS SANTOS', '2019-06-10', 'M', 2, NULL, NULL, NULL, NULL, NULL, 16536792475, 31, NULL, 'DAMIAO MACEDO DA SILVA', 'IARA MARIA DOS SANTOS', NULL, NULL, 'POVOADO DE ATALHO', 26, 2611101, 'S/N', 'F', true, NULL, 'RUA CARLOS FERREIRA GOMES', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '87991356888', NULL, '2023-02-03 00:00:00.000', 'JOAO MIGUEL DOS SANTOS', NULL, NULL, 'Brasil', false, '0', 'N', '', '', '', NULL, 2611101, '', '15076301552019100017277002013624', NULL, 'ZONA RURAL', NULL, 'IARA MARIA DOS SANTOS', 'MAE', 'CPF', '11213633427', '56301992', NULL, 2611101, 26, NULL, 'AGRICULTOR', 'AGRICULTORA', NULL, NULL, NULL, '23878829953', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '185324841667', NULL, '700201969918724', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9246199', '9044210', 'SDS', 'SDS', NULL, NULL, 26, 26, NULL, false, NULL, NULL, 'IARA MARIA DOS SANTOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--Pegar o id da pessoa 
select * from comum.pessoa p 
where p.nome_mae  = 'IARA MARIA DOS SANTOS'
and p.nome = 'JOAO MIGUEL DOS SANTOS';


UPDATE public.discente
	SET id_pessoa=:id_pessoa 
	WHERE id_discente=1397620;


UPDATE basico.estudante
	SET id_serie_ingresso=52230487
	WHERE id_estudante=1397620;


--backup 
-- id_pessoa = 52782845
UPDATE public.discente
	SET id_pessoa= 52782845
	WHERE id_discente=1397620;

UPDATE basico.estudante
	SET id_serie_ingresso= 51869714
	WHERE id_estudante=1397620;

UPDATE comum.pessoa
SET nome='JOAO MIGUEL DOS SANTOS', data_nascimento='2019-06-10', sexo='M', id_raca=2, id_endereco_residencial=NULL, id_endereco_contato=NULL, passaporte=NULL, id_grau_formacao=NULL, abreviatura=NULL, cpf_cnpj=16536792475, id_pais_nacionalidade=31, id_tipo_etnia=NULL, nome_pai='DAMIAO MACEDO DA SILVA', nome_mae='IARA MARIA DOS SANTOS', email=NULL, id_estado_civil=NULL, bairro='POVOADO DE ATALHO', id_uf_naturalidade=26, id_municipio_naturalidade=2611101, numero='S/N', tipo='F', valido=true, ultima_atualizacao=NULL, endereco='RUA CARLOS FERREIRA GOMES', id_conta_bancaria=NULL, numero_certificado_militar=NULL, serie_certificado_militar=NULL, categoria_certificado_militar=NULL, orgao_expedicao_certificado_militar=NULL, data_expedicao_certificado_militar=NULL, numero_identidade='', orgao_expedicao_identidade='', id_unidade_federativa_identidade=26, data_expedicao_identidade=NULL, numero_titulo_eleitor=NULL, zona_titulo_eleitor=NULL, secao_titulo_eleitor=NULL, data_expedicao_titulo_eleitor=NULL, id_unidade_federativa_titulo_eleitor=NULL, id_uf_identidade=NULL, id_uf_titulo_eleitor=NULL, id_uf_certificado_militar=NULL, codigo_area_nacional_telefone_celular=NULL, codigo_area_nacional_telefone_fixo=NULL, origem=NULL, telefone_fixo=NULL, telefone_celular='87991356888', fax=NULL, data_cadastro='2023-02-03 00:00:00.000', nome_ascii='JOAO MIGUEL DOS SANTOS', id_tipo_rg=NULL, tipo_sanguineo=NULL, pais_nacionalidade='Brasil', estrangeiro=false, certidao_civil_tipo='0', certidao_civil_modelo='N', certidao_civil_num_termo='', certidao_civil_num_folha='', certidao_civil_num_livro='', certidao_civil_data=NULL, certidao_civil_id_municipio_cartorio=2611101, certidao_civil_cartorio='', certidao_civil_matricula_nova='15076301552019100017277002013624', cod_educacenso=NULL, complemento='ZONA RURAL', codigo_rh=NULL, nome_responsavel_matricula='IARA MARIA DOS SANTOS', grau_parentesco_responsavel_matricula='MAE', tipo_documento_responsavel_matricula='CPF', numero_documento_responsavel_matricula='11213633427', cep='56301992', codigo_rh_old=NULL, id_municipio_contato=2611101, id_uf_contato=26, id_pessoa_restauracao=NULL, profissaopai='AGRICULTOR', profissaomae='AGRICULTORA', codigo_unificado=NULL, id_pessoa_unificada=NULL, id_orgao_emissor_identidade=NULL, codigo_nis='23878829953', certidao_civil_cartorio_codigo_inep=NULL, "semCpf"=false, justificativa=NULL, id_bairro_endereco=NULL, id_tipo_documento_militar=NULL, id_tipo_militar=NULL, documento_militar=NULL, semcpf=NULL, municipio_ext=NULL, uf_naturalidade_ext=NULL, codigo_inep='185324841667', id_escolaridade=NULL, codigo_sus='700201969918724', id_informacoes_medicas=NULL, endereco_atual=NULL, bairro_atual=NULL, cep_atual=NULL, id_dados_pessoa_censo=NULL, email_alternativo=NULL, pis_pasep=NULL, numero_identidade_mae='9246199', numero_identidade_pai='9044210', orgao_expedicao_identidade_mae='SDS', orgao_expedicao_identidade_pai='SDS', data_expedicao_identidade_mae=NULL, data_expedicao_identidade_pai=NULL, id_uf_identidade_mae=26, id_uf_identidade_pai=26, id_localizacao_zona=NULL, possui_laudo=false, telefone_celular2=NULL, telefone_celular3=NULL, contato_celular='IARA MARIA DOS SANTOS', contato_celular2=NULL, contato_celular3=NULL, id_tipo_tamanho_camisa=NULL, id_tamanho_camisa_letra=NULL, tamanho_camisa_livre=NULL, id_tipo_tamanho_short_calca=NULL, id_tamanho_short_calca_letra=NULL, tamanho_short_calca_livre=NULL, tamanho_calcado=NULL, nome_social=NULL
WHERE id_pessoa=52782845;








--comum.pessoa_seq_aux



