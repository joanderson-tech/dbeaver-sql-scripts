select *from basico.usuario_familiar uf where uf.id_discente_medio  in (974738);

select p.nome, * from comum.usuario u 
join comum.pessoa p on p.id_pessoa = u.id_pessoa
where u.id_usuario in (105067,105174);


select * from comum.usuario u join comum.pessoa p on u.id_pessoa = p.id_pessoa where p.id_pessoa = 51878834;

select * from comum.usuario u where u.id_pessoa in (747176)

select * from comum.pessoa p where p.nome ilike '%MARIA ISOLDA DA SILVA%';

select * from comum.tipo_usuario tu ;


DELETE FROM basico.usuario_familiar WHERE id_usuario_familiar=52031224;
DELETE FROM comum.usuario WHERE id_usuario=105198;
DELETE FROM comum.pessoa WHERE id_pessoa=747176;


insert into comum.usuario (id_usuario, id_servidor, id_pessoa, login, tipo, autorizado, data_cadastro,  id_unidade, email, inativo,ramal) values (?,?,?,?,?,?,?,?,?,?,?)]; 

ERROR: duplicate key value violates unique constraint "usuario_login_key"

Detalhe: Key (login)=(mariaisoldadatv124@gmail.com) already exists.; nested exception is org.postgresql.util.PSQLException: ERROR: duplicate key value violates unique constraint "usuario_login_key"
  Detalhe: Key (login)=(mariaisoldadatv124@gmail.com) already exists.


-- Auto-generated SQL script #202508111031
UPDATE basico.usuario_familiar
	SET ativo=false
	WHERE id_usuario_familiar=52031223;

select
	*
from
	basico.estudante estudante_
where
	estudante_.id_estudante =974738;


select p.nome, * from comum.pessoa p 
join discente d on d.id_pessoa = p.id_pessoa
where d.id_discente  in (974738, 974081);


-- Auto-generated SQL script #202507311203
UPDATE basico.usuario_familiar SET ativo=false WHERE id_usuario_familiar=52021343;
UPDATE basico.usuario_familiar SET ativo=false WHERE id_usuario_familiar=52029762;


UPDATE basico.usuario_familiar SET ativo=true WHERE id_usuario_familiar=52021343;
UPDATE basico.usuario_familiar SET ativo=true WHERE id_usuario_familiar=52029762;

--Nelma graciele de pontes  747129
--747168

--===================
begin;
rollback;

DELETE FROM basico.usuario_familiar WHERE id_usuario_familiar=52031223;
DELETE FROM comum.usuario WHERE id_usuario=105192;
DELETE FROM comum.pessoa WHERE id_pessoa=747173;

commit;

INSERT INTO comum.usuario (id_usuario, login, email, inativo, ultimo_acesso, autorizado, id_unidade, id_pessoa, tipo, ramal, objetivo_cadastro, justificativa_negado, id_foto, data_cadastro, expira_senha, id_servidor, funcionario, id_consignataria, hash_mobile_authenticator, data_ultimo_login_mobile) VALUES(105192, 'mariaisoldadatv124@gmail.com', NULL, false, NULL, true, 1, 747173, 3, NULL, NULL, NULL, NULL, '2025-08-11 10:30:04.168', NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2) VALUES(747173, 'Maria Isolda da Silva', NULL, 'O', NULL, NULL, NULL, NULL, NULL, NULL, 1479122459, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MARIA ISOLDA DA SILVA', NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO basico.usuario_familiar (id_usuario_familiar, id_usuario, id_discente_medio, data_cadastro, ativo) VALUES(52031223, 105192, 974738, '2025-08-11 10:30:06.660', false);