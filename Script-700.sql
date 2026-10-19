select *  --string_agg(id_turma ::varchar, ', ') 
from ensino.turma where codigo = 'EICRINTB2A' and ano = 2025;

select * from ensino.componente_curricular cc ;


select *  --string_agg(id_turma ::varchar, ', ') 
from ensino.turma t where t.id_turma = 757728; 


select
	distinct mc.id_matricula_componente,
	sdeu.unidade
from
	ensino.matricula_componente mc
join ensino.turma t on
	t.id_turma = mc.id_turma
	and mc.id_matricula_componente in ( 19903184, 19903186, 19903187, 19903188, 19903189, 19903181, 19903185, 19903183, 19903182 )
join basico.matricula_estudante_serie mes on
	mes.id_estudante = mc.id_discente
	and mes.ano_calendario = mc.ano
	and t.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
join ensino.solicitacao_dispensa_estudante sde on
	sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie
join ensino.solicitacao_dispensa_estudante_componente sdec on
	sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
	and sdec.id_componente_curricular = mc.id_componente_curricular
join ensino.solicitacao_dispensa_estudante_unidade sdeu on
	sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
where
	t.id_situacao_turma <> 4
	and mes.id_situacao_matricula_serie <> 5
	and sde.id_status_solicitacao_dispensa_estudante = 2
	and sde.ativo
	and sdec.ativo
	and sdeu.ativo
order by
	mc.id_matricula_componente,
	sdeu.unidade;

SELECT * FROM basico.curriculo_basico cb where cb.id_serie = 51869716; 72759174



SELECT * FROM basico.curriculo_basico  WHERE id_curriculo_basico   = 72759174;  MUPREINT  -- 51963189 CMPEX02    51948319   EIP1INT 51948319

select * from ensino_infantil.relatorio_avaliativo_habilidade h where h.id_relatorio_avaliativo_componente =  18;


SELECT * FROM ensino_infantil.configuracao_relatorio  AS cr WHERE cr.id_curriculo_basico in (72759174) ; 

select * --string_agg(id_habilidade_competencia ::varchar, ', ')
from ensino_infantil.configuracao_relatorio_componente_habilidade crh where id_configuracao_relatorio_componente = 423 ;

select * --string_agg(id_habilidade_competencia ::varchar, ', ')
from ensino_infantil.configuracao_relatorio_componente_habilidade crh where id_configuracao_relatorio_componente = 48 ;

select * from ensino_infantil.configuracao_relatorio_componente crc 
where crc.id_configuracao_relatorio = 62; and crc.id_componente_curricular = 508

select * from basico.matricula_estudante_serie mes where mes.id_estudante  = 1439295;


select mc
from
	ensino.matricula_componente mc
join ensino.turma t on
	t.id_turma = mc.id_turma
	and mc.id_matricula_componente in ( 19903184, 19903186, 19903187, 19903188, 19903189, 19903181, 19903185, 19903183, 19903182 )
	
	
	
	
	
	
	
	
	
	select * from ensino_infantil.relatorio_avaliativo where
	id_relatorio_avaliativo = 90444;
	
	
	
	
	
	
 update
	ensino_infantil.relatorio_avaliativo
set
	id_situacao_relatorio_avaliativo = 1,
	situacao = 0,
	id_registro_atualizacao = 7382663,
	data_alteracao = 'Tue Jun 17 08:19:38 BRT 2025'
where
	id_relatorio_avaliativo = 90444;
 
 
  
 select* from comum.pessoa p where p.cpf_cnpj = '13148995465'; 52222514
 
 select * from rh.servidor s where s.id_pessoa in (764346,  787056); 
 
 select * from comum.usuario u where u.id_pessoa in (764346,  787056);
 
begin; 


commit;


-- SOLUÇÃO EMELLY RAFAELE DE SOUZA
UPDATE comum.pessoa SET valido=true WHERE id_pessoa=764346;
UPDATE comum.usuario SET id_pessoa=764346 WHERE id_usuario=120090;
DELETE FROM comum.pessoa WHERE id_pessoa=787056;


-- SOLUÇÃO EMELLY RAFAELE DE SOUZA BANCO COMUM
UPDATE comum.usuario SET id_pessoa=764346 WHERE id_usuario=120090;
DELETE FROM comum.pessoa WHERE id_pessoa=787056;


--BACKUP EMELLY RAFAELE DE SOUZA
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2) VALUES(787056, 'EMELLY RAFAELE DE SOUZA', '1998-01-01', 'F', 1, NULL, NULL, NULL, NULL, NULL, 13148995465, NULL, NULL, NULL, 'Conteúdo protegido ', 'desenv@esig.com.br', 1, 'Testes', 29, 2918407, NULL, 'F', true, NULL, 'Rua Desenvolvimento/Treinamento, 99999', NULL, NULL, NULL, NULL, NULL, NULL, '9192622', 'SDS', 26, '2011-03-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EMELLY RAFAELE DE SOUZA', NULL, NULL, 'BRASILEIRA', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Testes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21040105728', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL);
UPDATE comum.usuario SET id_pessoa=787056 WHERE id_usuario=120090;
UPDATE comum.pessoa SET valido=null WHERE id_pessoa=764346;

--BACKUP EMELLY RAFAELE DE SOUZA BANCO COMUM
INSERT INTO comum.pessoa (id_pessoa, endereco, cep, uf, telefone, celular, fax, tipo, cpf_cnpj, complemento, nome_representante, nome, bairro, cidade, matricula, id_cargo, nome_fantasia, data_nascimento, sexo, email, funcionario, nitpis, emite_fatura, aliquota_imposto, internacional, passaporte, pais_origem, ultima_atualizacao, valido, nome_ascii, origem, nome_mae, numero, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, data_cadastro, "semCpf", justificativa, pais_nacionalidade, id_municipio_naturalidade, id_uf_naturalidade, numero_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, orgao_expedicao_identidade, id_estado_civil, id_raca) VALUES(787056, 'Rua Desenvolvimento/Treinamento, 99999', '59000-000', NULL, '9999-9999', '9999-9999', NULL, 'F', 13148995465, 'Testes', NULL, 'EMELLY RAFAELE DE SOUZA', 'Testes', NULL, 0, 1, NULL, NULL, 'O', 'desenv@esig.com.br', NULL, NULL, false, NULL, false, NULL, NULL, NULL, false, 'EMELLY RAFAELE DE SOUZA', NULL, 'Testes', NULL, NULL, NULL, NULL, NULL, '2024-10-21 16:07:55.949', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE comum.usuario SET id_pessoa=787056 WHERE id_usuario=120090;






