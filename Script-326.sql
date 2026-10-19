{panel:title=Cenário de testes}
*Ambiente de testes*: [http://boasaude-rn.testes-portalsigeduc.esig.com.br/app/public/home.jsf]
 *Usuário:* boasaudern
{panel}
{panel:title=O que foi feito}
Foi realizado a unificação da Pessoa e Matrícula.
{panel}
{panel:title=Scripts}
*Identificação do banco:* Qual o servidor de banco (s2-portal-db-01) e qual o
 banco (acadêmico e comum).
 *Script de solução:*
{code:sql}
--SOLUÇÃO
--Updated Rows	788
UPDATE ensino.matricula_componente SET id_discente = 976915 WHERE id_matricula_componente IN (17069990);
UPDATE basico.matricula_estudante_serie SET id_estudante=976915 WHERE id_matricula_discente_serie in (1324513);
update ensino.observacao_discente set id_discente = 976915 where id_observacao_discente = 522943120;
UPDATE basico.movimentacao_estudante SET id_discente=976915 WHERE id_movimentacao_estudante=69356;
UPDATE comum.pessoa_necessidade_especial SET id_pessoa=750060 WHERE id_pessoa_necessidade_especial=52292575;
UPDATE comum.pessoa_recurso_avaliacao_nee SET id_pessoa=750060 WHERE id_pessoa_recurso_avaliacao_nee=130284088;
UPDATE public.discente SET id_pessoa=750060 WHERE id_discente=976915;
DELETE FROM basico.estudante WHERE id_estudante=976919;
DELETE FROM public.discente WHERE id_discente=976919;
DELETE FROM comum.pessoa WHERE id_pessoa=750056;

{code}
*Backup:*
{code:sql}
--backup
--discente errado 975220
INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca, id_tipo_instituicao_origem) VALUES(976919, 51870849, '', NULL, NULL, true, true, NULL, NULL, NULL, false, false, NULL);
INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(976919, 2022, NULL, '202230006532', NULL, 750060, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-10-23 09:13:50.697', NULL, 5668192, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social) VALUES(750056, 'LETICIA COSTA DA SILVA', '2012-08-21', 'F', -1, NULL, NULL, NULL, NULL, NULL, 13273471484, 31, NULL, 'LEANDRO EVANGELISTA DA COSTA', 'RAQUEL FRANCO DA SILVA', '', -1, '', 24, 2408102, '', 'F', false, '2024-10-14 08:10:29.915', '', NULL, '', '', '', '', NULL, '004160528', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2024-10-14 08:10:29.915', 'LETICIA COSTA DA SILVA', NULL, NULL, 'BRASILEIRA', false, '0', 'N', '', '', '', NULL, 183261100, '', '', NULL, '', NULL, 'MARIA JOSE FRANCO', 'AVÓ', NULL, '0', '59260-000', NULL, 183261100, 24, NULL, 'AGRICULTOR', 'AGRICULTORA', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 52292574, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, 24, 24, NULL, false, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE ensino.matricula_componente SET id_discente = 976919 WHERE id_matricula_componente IN (17069990);
UPDATE basico.matricula_estudante_serie SET id_estudante=976919 WHERE id_matricula_discente_serie in (1324513);
update ensino.observacao_discente set id_discente = 976919 where id_observacao_discente = 522943120;
UPDATE basico.movimentacao_estudante SET id_discente=976919 WHERE id_movimentacao_estudante=69356;
UPDATE comum.pessoa_recurso_avaliacao_nee SET id_pessoa=750056 WHERE id_pessoa_recurso_avaliacao_nee=130284088;
UPDATE comum.pessoa_necessidade_especial SET id_pessoa=750056 WHERE id_pessoa_necessidade_especial=52292575;
UPDATE public.discente SET id_pessoa=750056 WHERE id_discente=976915;

{code}
{panel}