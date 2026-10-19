select * from discente d where d.id_pessoa in (770110);
select * from discente d where d.matricula = '202430001854';
select * from discente d where d.matricula = '202230665400';

select * from comum.pessoa p where p.id_pessoa in (770110);

select * from basico.unificacao_estudante ue where ue.id_discente_manter in (992420, 991044);

select * from basico.matricula_estudante_serie mes where mes.id_estudante in (996060) order by mes.ano_calendario, mes.id_estudante;

select * from basico.estudante e where e.id_estudante in (996060);

select * from diario.historico_implantado  where id_estudante in (992420, 991044);

select * from basico.calendario_escolar ce ;

select * from basico.serie s where s.id_serie = 51873553;

select * from basico.turma_serie ts where ts.id_turma_serie = 53961783;

--765854 RENATA TAWANNY SANTANA SILVA --992420  202430001854
--764033 REBEKA TWANNY SANTANA SILVA --991044 202330017299
--770110 REBEKA TWANNY SANTANA SILVA (NEE) 996060  202530016125

select * FROM basico.estudante WHERE id_estudante in (996060);
select * from basico.alteracao_matricula_serie ams where ams.id_matricula_discente_serie = 1380357;
select * from ensino.matricula_componente mc where mc.id_matricula_estudante_serie = 1380357;
select * from basico.movimentacao_estudante me where me.id_discente = 996060;
select * from comum.pessoa_necessidade_especial pne where id_pessoa = 770110;
select * from comum.pessoa_recurso_avaliacao_nee pran where id_pessoa = 770110;


-- Auto-generated SQL script #202507041706
UPDATE comum.pessoa_necessidade_especial SET id_pessoa=764033 WHERE id_pessoa_necessidade_especial in (54242302,54242303,54242304)

rollback;

--Dado antigo da REBEKA TWANNY SANTANA SILVA  na data 2025-02-28 16:38:23.482
UPDATE comum.pessoa SET nome='REBEKA TWANNY SANTANA SILVA', data_nascimento='2011-07-08', sexo='F', id_raca=6, id_endereco_residencial=NULL, id_endereco_contato=NULL, passaporte=NULL, id_grau_formacao=NULL, abreviatura=NULL, cpf_cnpj=11311367489, id_pais_nacionalidade=31, id_tipo_etnia=NULL, nome_pai='MOISÉS AUGUSTO DOS SANTOS SILVA', nome_mae='ALINE REGINA DE ARAUJO SANTANA SILVA', email='', id_estado_civil=1, bairro='SÃO GERALDO', id_uf_naturalidade=24, id_municipio_naturalidade=2402600, numero='250', tipo='F', valido=false, ultima_atualizacao='2025-02-28 16:38:23.482', endereco='RUA PADRE JOSÉ MARIA CABRAL', id_conta_bancaria=NULL, numero_certificado_militar='', serie_certificado_militar='', categoria_certificado_militar='', orgao_expedicao_certificado_militar='', data_expedicao_certificado_militar=NULL, numero_identidade='', orgao_expedicao_identidade='', id_unidade_federativa_identidade=24, data_expedicao_identidade=NULL, numero_titulo_eleitor=NULL, zona_titulo_eleitor=NULL, secao_titulo_eleitor=NULL, data_expedicao_titulo_eleitor=NULL, id_unidade_federativa_titulo_eleitor=NULL, id_uf_identidade=NULL, id_uf_titulo_eleitor=NULL, id_uf_certificado_militar=NULL, codigo_area_nacional_telefone_celular=NULL, codigo_area_nacional_telefone_fixo=NULL, origem=NULL, telefone_fixo='', telefone_celular='(84)99184-1962', fax=NULL, data_cadastro=NULL, nome_ascii='REBEKA TWANNY SANTANA SILVA', id_tipo_rg=NULL, tipo_sanguineo=NULL, pais_nacionalidade='BRASILEIRA', estrangeiro=false, certidao_civil_tipo='0', certidao_civil_modelo='N', certidao_civil_num_termo='', certidao_civil_num_folha='', certidao_civil_num_livro='', certidao_civil_data=NULL, certidao_civil_id_municipio_cartorio=2402600, certidao_civil_cartorio='', certidao_civil_matricula_nova='09439101552011100117098008014099', cod_educacenso=NULL, complemento='', codigo_rh=NULL, nome_responsavel_matricula='ALINE REGINA DE ARAÚJO SANTANA SILVA', grau_parentesco_responsavel_matricula='MÃE', tipo_documento_responsavel_matricula=NULL, numero_documento_responsavel_matricula='883142563', cep='59570-000', codigo_rh_old=NULL, id_municipio_contato=2402600, id_uf_contato=24, id_pessoa_restauracao=NULL, profissaopai='REFRIGERAÇÃO', profissaomae='DO LAR', codigo_unificado=NULL, id_pessoa_unificada=NULL, id_orgao_emissor_identidade=NULL, codigo_nis='', certidao_civil_cartorio_codigo_inep=NULL, "semCpf"=false, justificativa=NULL, id_bairro_endereco=NULL, id_tipo_documento_militar=NULL, id_tipo_militar=NULL, documento_militar=NULL, semcpf=NULL, municipio_ext=NULL, uf_naturalidade_ext=NULL, codigo_inep='127659659277', id_escolaridade=NULL, codigo_sus='', id_informacoes_medicas=52874591, endereco_atual=NULL, bairro_atual=NULL, cep_atual=NULL, id_dados_pessoa_censo=NULL, email_alternativo=NULL, pis_pasep=NULL, numero_identidade_mae='', numero_identidade_pai='', orgao_expedicao_identidade_mae='', orgao_expedicao_identidade_pai='', data_expedicao_identidade_mae=NULL, data_expedicao_identidade_pai=NULL, id_uf_identidade_mae=24, id_uf_identidade_pai=24, id_localizacao_zona=1, possui_laudo=true, telefone_celular2='', telefone_celular3='', contato_celular='MÃE', contato_celular2='', contato_celular3='', id_tipo_tamanho_camisa=NULL, id_tamanho_camisa_letra=NULL, tamanho_camisa_livre=NULL, id_tipo_tamanho_short_calca=NULL, id_tamanho_short_calca_letra=NULL, tamanho_short_calca_livre=NULL, tamanho_calcado=NULL, id_tipo_tamanho_calca=NULL, id_tamanho_calca_letra=NULL, tamanho_calca_livre=NULL, nome_social=NULL, quilombola=false, cid=NULL, cpf_filiacao_1=NULL, cpf_filiacao_2=NULL WHERE id_pessoa=764033;
UPDATE comum.pessoa SET nome_mae='ALINE REGINA DE ARAUJO SANTANA SILVA',nome_responsavel_matricula='ALINE REGINA DE ARAÚJO SANTANA SILVA' WHERE id_pessoa=765854;
--Resgistro cadastrado errado 
UPDATE basico.matricula_estudante_serie SET id_situacao_matricula_serie=5 WHERE id_matricula_discente_serie=1380356;

--Deletar o registro da nova pessoa cadatrada errada mantendo so uma REBEKA TWANNY SANTANA SILVA
select 'UPDATE ensino.matricula_componente SET id_discente = 991044 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao,
	   'UPDATE ensino.matricula_componente SET id_discente = '|| mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup,
	   COUNT(mc.id_matricula_componente) AS quantidade_ids
from ensino.matricula_componente mc 
where mc.id_discente IN (996060)
GROUP BY  mc.id_discente;	

SELECT 
    'UPDATE ensino.frequencia_aluno SET id_discente = 991044 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script,
    'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup,
    COUNT(fa.id_frequencia) AS quantidade_ids
FROM  ensino.frequencia_aluno fa 
WHERE  fa.id_discente IN (996060)
GROUP BY  fa.id_discente;

UPDATE basico.matricula_estudante_serie SET id_estudante=991044 WHERE id_matricula_discente_serie=1380357;
UPDATE basico.movimentacao_estudante SET id_discente=991044 WHERE id_movimentacao_estudante=73983;
UPDATE comum.pessoa_necessidade_especial SET id_pessoa=764033 WHERE id_pessoa_necessidade_especial in (54242302,54242303,54242304);
DELETE FROM comum.pessoa_recurso_avaliacao_nee WHERE id_pessoa_recurso_avaliacao_nee=130284388;
DELETE FROM basico.estudante WHERE id_estudante=996060;
DELETE FROM public.discente WHERE id_discente=996060;
DELETE FROM comum.pessoa WHERE id_pessoa=770110;

commit;

--backup
UPDATE comum.pessoa SET nome_mae='ALINE REGINA DO ARAUJO SANTANA',nome_responsavel_matricula='ALINE REGINA DO ARAUJO SANTANA' WHERE id_pessoa=765854;
UPDATE comum.pessoa SET nome='RENATA TAWANNY SANTANA SILVA', data_nascimento='2013-09-07', sexo='F', id_raca=1, id_endereco_residencial=NULL, id_endereco_contato=NULL, passaporte=NULL, id_grau_formacao=NULL, abreviatura=NULL, cpf_cnpj=16444386403, id_pais_nacionalidade=31, id_tipo_etnia=NULL, nome_pai='MOISÉS AUGUSTO DOS SANTOS SILVA', nome_mae='ALINE REGINA DE ARAÚJO SANTANA SILVA', email='', id_estado_civil=1, bairro='SÃO GERALDO', id_uf_naturalidade=24, id_municipio_naturalidade=2402600, numero='250', tipo='F', valido=false, ultima_atualizacao='2025-06-26 11:14:07.777', endereco='RUA PADRE JOSÉ MARIA CABRAL', id_conta_bancaria=NULL, numero_certificado_militar='', serie_certificado_militar='', categoria_certificado_militar='', orgao_expedicao_certificado_militar='', data_expedicao_certificado_militar=NULL, numero_identidade='', orgao_expedicao_identidade='', id_unidade_federativa_identidade=24, data_expedicao_identidade=NULL, numero_titulo_eleitor=NULL, zona_titulo_eleitor=NULL, secao_titulo_eleitor=NULL, data_expedicao_titulo_eleitor=NULL, id_unidade_federativa_titulo_eleitor=NULL, id_uf_identidade=NULL, id_uf_titulo_eleitor=NULL, id_uf_certificado_militar=NULL, codigo_area_nacional_telefone_celular=NULL, codigo_area_nacional_telefone_fixo=NULL, origem=NULL, telefone_fixo='', telefone_celular='', fax=NULL, data_cadastro=NULL, nome_ascii='RENATA TAWANNY SANTANA SILVA', id_tipo_rg=NULL, tipo_sanguineo=NULL, pais_nacionalidade='BRASILEIRA', estrangeiro=false, certidao_civil_tipo='0', certidao_civil_modelo=NULL, certidao_civil_num_termo='', certidao_civil_num_folha='', certidao_civil_num_livro='', certidao_civil_data=NULL, certidao_civil_id_municipio_cartorio=2402600, certidao_civil_cartorio='', certidao_civil_matricula_nova='', cod_educacenso=NULL, complemento='', codigo_rh=NULL, nome_responsavel_matricula='ALINE REGINA DE ARAÚJO SANTANA SILVA', grau_parentesco_responsavel_matricula='MÃE', tipo_documento_responsavel_matricula='CPF', numero_documento_responsavel_matricula='8831425463', cep='59570-000', codigo_rh_old=NULL, id_municipio_contato=2402600, id_uf_contato=24, id_pessoa_restauracao=NULL, profissaopai='REFRIGERAÇÃO', profissaomae='DO LAR', codigo_unificado=NULL, id_pessoa_unificada=NULL, id_orgao_emissor_identidade=NULL, codigo_nis='', certidao_civil_cartorio_codigo_inep=NULL, "semCpf"=false, justificativa=NULL, id_bairro_endereco=NULL, id_tipo_documento_militar=NULL, id_tipo_militar=NULL, documento_militar=NULL, semcpf=NULL, municipio_ext=NULL, uf_naturalidade_ext=NULL, codigo_inep='', id_escolaridade=NULL, codigo_sus='', id_informacoes_medicas=52874591, endereco_atual=NULL, bairro_atual=NULL, cep_atual=NULL, id_dados_pessoa_censo=NULL, email_alternativo=NULL, pis_pasep=NULL, numero_identidade_mae='2541908', numero_identidade_pai='', orgao_expedicao_identidade_mae='', orgao_expedicao_identidade_pai='', data_expedicao_identidade_mae=NULL, data_expedicao_identidade_pai=NULL, id_uf_identidade_mae=24, id_uf_identidade_pai=24, id_localizacao_zona=1, possui_laudo=true, telefone_celular2='', telefone_celular3='', contato_celular='', contato_celular2='', contato_celular3='', id_tipo_tamanho_camisa=NULL, id_tamanho_camisa_letra=NULL, tamanho_camisa_livre='', id_tipo_tamanho_short_calca=NULL, id_tamanho_short_calca_letra=NULL, tamanho_short_calca_livre='', tamanho_calcado='0', id_tipo_tamanho_calca=NULL, id_tamanho_calca_letra=NULL, tamanho_calca_livre=NULL, nome_social=NULL, quilombola=false, cid='', cpf_filiacao_1=0, cpf_filiacao_2=0 WHERE id_pessoa=764033;
UPDATE basico.matricula_estudante_serie SET id_situacao_matricula_serie= 1 WHERE id_matricula_discente_serie=1380356;

--Deletar o registro da nova pessoa cadatrada errada mantendo so uma REBEKA TWANNY SANTANA SILVA
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2) VALUES(770110, 'REBEKA TWANNY SANTANA SILVA (NEE)', '2011-07-08', 'F', 1, NULL, NULL, NULL, NULL, NULL, 11311367489, 31, NULL, 'MOISES AUGUSTO DOS SANTOS SILVA', 'ALINE REGINA DE ARAUJO SILVA', '', 1, 'SÃO GERALDO', 24, 2402600, '150', 'F', false, '2025-06-30 09:22:57.451', 'RUA PADRE JOSE MARIA CABRAL', NULL, '', '', '', '', NULL, '', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2025-06-26 11:22:45.267', 'REBEKA TWANNY SANTANA SILVA (NEE)', NULL, NULL, 'BRASILEIRA', false, '0', NULL, '', '', '', NULL, 2402600, '', '', NULL, '', NULL, 'ALINE REGINA DE ARAUJO SANTAN SILVA', 'MÃE', 'RG', '2541908', '59570-000', NULL, 2402600, 24, NULL, '', '', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 54242301, NULL, NULL, NULL, NULL, NULL, NULL, '2541908', '', '', '', NULL, NULL, 24, 24, 1, false, '', '(84)99192-3462', '', '', '', NULL, NULL, '', NULL, NULL, '', '0', NULL, NULL, NULL, NULL, false, '', 8831425463, 0);
INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(996060, 2025, NULL, '202530016125', NULL, 770110, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2025-06-26 11:22:45.268', NULL, 5978286, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca, id_tipo_instituicao_origem) VALUES(996060, 1005224, 'ESCOLA MUNICIPAL PROFESSORA JOSEFA BOTELHO', NULL, NULL, false, false, '2025-06-30', 5978692, NULL, false, false, 3);
INSERT INTO comum.pessoa_recurso_avaliacao_nee (id_pessoa_recurso_avaliacao_nee, id_recurso_avaliacao_nee, id_pessoa, id_pessoa_transferencia, complemento, observacao) VALUES(130284388, 96598903, 770110, NULL, NULL, NULL);
UPDATE basico.matricula_estudante_serie SET id_estudante=996060 WHERE id_matricula_discente_serie=1380357;
UPDATE basico.movimentacao_estudante SET id_discente=996060 WHERE id_movimentacao_estudante=73983;
UPDATE comum.pessoa_necessidade_especial SET id_pessoa=770110 WHERE id_pessoa_necessidade_especial in (54242302,54242303,54242304);















