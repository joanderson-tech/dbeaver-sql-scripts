/*Mesmo retirando a servidora ANA PAULA DOS SANTOS DE ANDRADE de matricula 000513/1 da 
ANA PAULA DOS SANTOS | CPF 719.918.675-49 |	000000513 / 1*/


select p.id_pessoa, s.id_servidor , p.nome , p.cpf_cnpj, s.siape, p.data_nascimento, p.ultima_atualizacao   from rh.servidor s 
join comum.pessoa p on p.id_pessoa = s.id_pessoa 
where p.id_pessoa in (54378358, 746592) ;


--755043 -- servidor

select * from comum.pessoa p where p.nome ilike '%ANA PAULA DOS SANTOS DE ANDRADE%'

select p.nome , p.cpf_cnpj , p.data_nascimento , p.ultima_atualizacao from comum.pessoa p where id_pessoa in (54378358, 746592) ;


select * from comum.usuario u where u.id_pessoa in (54378358, 746592) ;


select * from rh.servidor s where s.id_pessoa in (54378358, 746592) ;

select * from pessoas.historico_servidor_terceirizado  s where s.id_servidor in (54381361,1013);

select * from pessoas.vaga_administrativa   s where s.id_servidor in (54381361,1013);

select * from rh.historico_transferencia_servidores s where s.id_servidor in (54381361,1013);

select * from comum.alteracao_pessoa where id_pessoa = 746592;

select * from educacenso.educacenso_pessoa where id_pessoa = 746592;

select * from discente d where d.id_pessoa = 746592;

select * from basico.matricula_estudante_serie mes where mes.id_estudante = 1010490;

select * from basico.alteracao_matricula_serie where id_matricula_discente_serie = 1385381;

select * from ensino.matricula_componente mc where mc.id_matricula_estudante_serie = 1385381;


select * from matricula.emissao_documento_matricula edm where edm.id_matricula_estudante_serie = 1385381;

select * from basico.movimentacao_estudante me where me.id_discente = 1010490;

select * from comum.alteracao_status_aluno asa where asa.id_discente = 1010490;


SELECT string_agg(id_frequencia::text, ', ')
FROM ensino.frequencia_aluno fa 
WHERE fa.id_discente IN (1010490);

-- Auto-generated SQL script #202509101510
UPDATE comum.alteracao_pessoa SET id_pessoa=54378358 WHERE id_alteracao_pessoa in (518926340,518926341,524142086,535442063,544971040,544971115,544970391);


select * from ensino.observacao_discente od  where id_discente  =  1010490;


select * from  public.discente WHERE id_discente=1010490;


begin;

--solução
UPDATE comum.usuario SET id_pessoa=755043 WHERE id_usuario=107349;
DELETE FROM comum.pessoa WHERE id_pessoa=756152;

commit;

rollback;

--backup
UPDATE comum.usuario SET id_pessoa=755043 WHERE id_usuario=756152;
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula) VALUES(756152, 'Aline Cristina da Cunha', NULL, 'O', NULL, NULL, NULL, NULL, NULL, NULL, 1517442460, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ALINE CRISTINA DA CUNHA', NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL);






select nome_ascii, * from comum.pessoa WHERE id_pessoa=54378358;