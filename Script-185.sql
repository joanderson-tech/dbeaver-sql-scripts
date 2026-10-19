select * from comum.pessoa p where p.nome = 'EMANUELLE RAYSSA LIMA DE SOUZA';
select * from discente d where d.id_pessoa  in (769034);
select * from basico.estudante e where e.id_estudante in (1399592,1398268);
select * from basico.matricula_estudante_serie mes where mes.id_estudante in (1399592,1398268);
select string_agg(id_matricula_componente::text, ', ')  from ensino.matricula_componente mc where mc.id_discente = 1398268;
select string_agg(id_frequencia::text, ', ')  from ensino.frequencia_aluno fa where fa.id_discente = 1398268;
select * from ensino.abono_frequencia af where af.id_estudante = 1398268;
select * from escola.solicitacao_documento sd where sd.id_estudante =  1399592;
select * from basico.movimentacao_estudante me where id_discente = 1398268;
select * from matricula.estudante_inscrito ei where id_estudante  =1398268;
select * from comum.pessoa_necessidade_especial pne where id_pessoa = 770264;

select * from comum.pessoa p 
where cpf_cnpj = 17037589438;
-- pessoa mais antigo correto 52772764 / errado 772823

select matricula , id_pessoa , * 
 from discente d 
 where id_pessoa  in (772823, 52772764 );
 --id_disc correto 1353956   / errado 1402005

select * 
 from basico.matricula_estudante_serie mes 
 where id_estudante in (1402005, 1353956)
 order by ano_calendario; 

 -- pega os ids errados no id Discente errado / e setar no update para o id discente correto /vai para o update

select string_agg(id_matricula_componente::varchar, ', ')  
from ensino.matricula_componente mc where id_discente = 1402005;
--18173479, 18173616, 18173474, 18173475, 18173476, 18173477, 18173478, 18173617, 18173618, 18173619, 18173615, 18173620

select string_agg(id_matricula_discente_serie ::varchar, ', ')  
from basico.matricula_estudante_serie where id_estudante  = 1402005;
--1499342, 1499332

select string_agg(id_renovacao_matricula::varchar, ', ')  
from matricula.renovacao_matricula where id_discente  = 1402005;
--null

select string_agg(id_frequencia::varchar, ', ')  
from ensino.frequencia_aluno where id_discente  = 1402005;
--153761225, 153818147, 153928984, 153969690, 153969734, 153969822, 153969884, 153969962, 153969983, 153970004, 153970025, 153970046, 153970091, 153970112, 153970133, 153970167, 153970188, 153970242, 153970317, 153970400, 153970435, 153970456, 153970338, 153970359, 153970498, 153970477, 153970638, 153970519, 153970596, 153970617, 153985135, 154056629, 154332772, 154425605, 154555046, 154645975, 154811153, 154923534, 157630787, 155139660, 155139794, 155249223, 155432414, 155691169, 155691466, 157767342, 156013414, 156013653, 157855477, 158011523, 158011468, 158079704, 158148242, 158384834, 158384928, 158384999, 158459964, 158603462, 158603531, 158726109, 158824444, 158897940, 158989039, 159082620, 159189019, 159292723, 159378151, 159626944, 159627233, 159701741, 159893148, 159893251, 160048515

select string_agg(id_estudante_documento_pendente::varchar, ', ')  
from basico.estudante_documento_pendente edp where id_estudante  = 1402005;
--null

select string_agg(id::varchar, ', ')  from diario.competencia_habilidades_aluno cha where id_discente =  1402005;
--NULL

select string_agg(id_historico_implantado::varchar, ', ') from diario.historico_implantado  where id_estudante  =  1402005;
--NULL

select id_observacao_discente from ensino.observacao_discente od  where id_discente  =  1402005;
--615159912

SELECT * FROM comum.pessoa_necessidade_especial pne WHERE pne.id_pessoa  = 1402005;

-------------------------------------------------------------------------------
--Usar dados antigos que serão deletados para o backup;
select * FROM basico.estudante WHERE id_estudante in (1402005);
select * FROM public.discente WHERE id_discente=1402005;
select * FROM comum.pessoa where id_pessoa = 772823; 

--backup

UPDATE ensino.matricula_componente SET id_discente =1402005 
WHERE id_matricula_componente  in (18173479, 18173616, 18173474, 18173475, 18173476, 18173477, 18173478, 18173617, 18173618, 18173619, 18173615, 18173620);


UPDATE ensino.frequencia_aluno SET id_discente= 1402005
WHERE id_frequencia in (153761225, 153818147, 153928984, 153969690, 153969734, 153969822, 153969884, 153969962, 153969983, 153970004, 153970025, 153970046, 153970091, 153970112, 153970133, 153970167, 153970188, 153970242, 153970317, 153970400, 153970435, 153970456, 153970338, 153970359, 153970498, 153970477, 153970638, 153970519, 153970596, 153970617, 153985135, 154056629, 154332772, 154425605, 154555046, 154645975, 154811153, 154923534, 157630787, 155139660, 155139794, 155249223, 155432414, 155691169, 155691466, 157767342, 156013414, 156013653, 157855477, 158011523, 158011468, 158079704, 158148242, 158384834, 158384928, 158384999, 158459964, 158603462, 158603531, 158726109, 158824444, 158897940, 158989039, 159082620, 159189019, 159292723, 159378151, 159626944, 159627233, 159701741, 159893148, 159893251, 160048515);

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1402005
	WHERE id_matricula_discente_serie=1499342;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1402005
	WHERE id_matricula_discente_serie=1499332;

INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(1402005, 51876116, '', NULL, NULL, true, false, '2024-04-11', 6353141, NULL, false, false);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(1402005, 2024, NULL, '202430074019', NULL, 772823, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-02-07 16:36:06.970', NULL, 6285364, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado)
VALUES(772823, 'EMANUELLE RAYSSA LIMA DE SOUZA', '2020-02-09', 'F', NULL, NULL, NULL, NULL, NULL, NULL, 17037589438, 31, NULL, '', 'DANIELY DE SOUZA BARBOZA', '', 1, 'MASSANGANO', 26, 2611101, '25', 'F', false, '2024-04-11 12:55:57.029', 'RUA 1', NULL, '', '', '', '', NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(87)99134-7807', NULL, '2024-02-07 16:36:06.969', 'EMANUELLE RAYSSA LIMA DE SOUZA', NULL, NULL, 'BRASILEIRO', false, '0', 'N', '', '', '', NULL, 2611101, '', '07674501552020100429240020940052', NULL, '', NULL, 'LUCILENE DOS SANTOS EVANGELISTA LIMA', 'AVÓ', 'CPF', '86823264420', '56353-700', NULL, 2611101, 26, NULL, '', '', NULL, NULL, NULL, '16079384230', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '205522616103', NULL, '', 61626741, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, 26, 26, NULL, false, '', '', 'AVO', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-------------------------------------------------------------------------------
BEGIN;
commit;
rollback;

--SOLUÇÃO

--atualiza ensino.matricula_componente seta no id correto os id discentes errados para univficar
update ensino.matricula_componente set id_discente =1353956 where id_matricula_componente  in (18173479, 18173616, 18173474, 18173475, 18173476, 18173477, 18173478, 18173617, 18173618, 18173619, 18173615, 18173620);

-- Alterar basico.matricula_estudante_serie
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1353956
	WHERE id_matricula_discente_serie=1499342;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1353956
	WHERE id_matricula_discente_serie=1499332;



-- Alterar matricula.renovacao_matricula
--UPDATE matricula.renovacao_matricula SET id_discente=978392 WHERE id_renovacao_matricula=52430537;

-- Alterar ensino.frequencia_aluno
UPDATE ensino.frequencia_aluno SET id_discente= 1353956
WHERE id_frequencia in (153761225, 153818147, 153928984, 153969690, 153969734, 153969822, 153969884, 153969962, 153969983, 153970004, 153970025, 153970046, 153970091, 153970112, 153970133, 153970167, 153970188, 153970242, 153970317, 153970400, 153970435, 153970456, 153970338, 153970359, 153970498, 153970477, 153970638, 153970519, 153970596, 153970617, 153985135, 154056629, 154332772, 154425605, 154555046, 154645975, 154811153, 154923534, 157630787, 155139660, 155139794, 155249223, 155432414, 155691169, 155691466, 157767342, 156013414, 156013653, 157855477, 158011523, 158011468, 158079704, 158148242, 158384834, 158384928, 158384999, 158459964, 158603462, 158603531, 158726109, 158824444, 158897940, 158989039, 159082620, 159189019, 159292723, 159378151, 159626944, 159627233, 159701741, 159893148, 159893251, 160048515);


--update comum.pessoa set nome  = 'JANIKLEYSON FERNANDES DA SILVA BATISTA' where id_pessoa  = 751684;

--update matricula.renovacao_excepcional_matricula_processamento set id_discente = 978392 where id_discente = 982836;

--update basico.estudante_documento_pendente set id_estudante = 1359546 where id_estudante_documento_pendente in (63032671);

--update diario.competencia_habilidades_aluno set id_discente = 978392 where id in (53936, 56228, 56227);

--update diario.historico_implantado set id_estudante = 978392 where id_historico_implantado in (32975, 32976);

--update ensino.observacao_discente set id_discente = 1399592 where id_observacao_discente = 615159912;

-- Deletar basico.estudante o ERRADO
DELETE FROM basico.estudante WHERE id_estudante=1402005;

-- Deletar public.discente
DELETE FROM public.discente WHERE id_discente=1402005;

-- Deletar comum.pessoa
DELETE FROM comum.pessoa WHERE id_pessoa=772823; 








  
 