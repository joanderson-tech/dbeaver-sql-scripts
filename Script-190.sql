select * from comum.pessoa p where p.nome = 'MARIA RITA DE SOUZA DOS SANTOS';
select * from comum.pessoa p where p.nome = 'MARIA EDUARDA CORREIRA ALVES';
select * from discente d where d.id_pessoa  in (52788861,776554);
select * from basico.estudante e where e.id_estudante in (1370053);
select * from basico.matricula_estudante_serie mes where mes.id_estudante in (1370053);
select string_agg(id_matricula_componente::text, ', ')  from ensino.matricula_componente mc where mc.id_discente = 1370053;
select string_agg(id_frequencia::text, ', ')  from ensino.frequencia_aluno fa where fa.id_discente = 1370053;
select * from ensino.abono_frequencia af where af.id_estudante = 1370053;
select * from escola.solicitacao_documento sd where sd.id_estudante =  1370053;
select * from basico.movimentacao_estudante me where id_discente = 1370053;
select * from matricula.estudante_inscrito ei where id_estudante  =1370053;
select * from comum.pessoa_necessidade_especial pne where id_pessoa = 1370053;

select * from comum.pessoa p 
where cpf_cnpj = 17037589438;
-- pessoa mais antigo correto 762877 / errado 52792235

select matricula , id_pessoa , * 
 from discente d 
 where id_pessoa  in (52792235,762877 );
 --id_disc correto 1392816   / errado 1373427

select * 
from basico.matricula_estudante_serie mes 
 where id_estudante in (1392816, 1373427)
 order by ano_calendario; 
 -- pega os ids errados no id Discente errado / e setar no update para o id discente correto /vai para o update

select string_agg(id_matricula_componente::varchar, ', ')  
from ensino.matricula_componente mc where id_discente = 1373427;
--17149223, 17149224, 17149225, 17149226, 17149227, 17149228, 17149229, 17149230, 17467751

select string_agg(id_matricula_discente_serie ::varchar, ', ')  
from basico.matricula_estudante_serie where id_estudante  = 1373427;
--1412594

select string_agg(id_renovacao_matricula::varchar, ', ')  
from matricula.renovacao_matricula where id_discente  = 1373427;
--null

select string_agg(id_frequencia::varchar, ', ')  
from ensino.frequencia_aluno where id_discente  = 1373427;
--151805040, 151806143, 151806095, 151805089, 151806035, 151805931, 151807451, 151806983, 151806165, 151807349, 151807432, 151807453, 151807491, 151807509, 151807614, 151807808, 151807810, 151807829, 151816675

select string_agg(id_estudante_documento_pendente::varchar, ', ')  
from basico.estudante_documento_pendente edp where id_estudante  = 1373427;
--null

select string_agg(id::varchar, ', ')  from diario.competencia_habilidades_aluno cha where id_discente =  1373427;
--NULL

select string_agg(id_historico_implantado::varchar, ', ') from diario.historico_implantado  where id_estudante  =  1373427;
--NULL

select id_observacao_discente from ensino.observacao_discente od  where id_discente  =  1373427;
--null

SELECT * FROM comum.pessoa_necessidade_especial pne WHERE pne.id_pessoa  = 1373427;

select from basico.tipo_movimentacao_estudante tme 
where  = 1402005;

-------------------------------------------------------------------------------
--Usar dados antigos que serão deletados para o backup;
select * FROM basico.estudante WHERE id_estudante in (1373427);
select * FROM public.discente WHERE id_discente=1373427;
select * FROM comum.pessoa where id_pessoa = 52792235; 

--backup

UPDATE ensino.matricula_componente 
	SET id_discente =1373427 
	WHERE id_matricula_componente  in (17149223, 17149224, 17149225, 17149226, 17149227, 17149228, 17149229, 17149230, 17467751);

UPDATE ensino.frequencia_aluno 
	SET id_discente= 1373427
	WHERE id_frequencia in (151805040, 151806143, 151806095, 151805089, 151806035, 151805931, 151807451, 151806983, 151806165, 151807349, 151807432, 151807453, 151807491, 151807509, 151807614, 151807808, 151807810, 151807829, 151816675);

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1373427
	WHERE id_matricula_discente_serie=1412594;

-- Auto-generated SQL script #202406251600
UPDATE comum.pessoa
	SET cpf_cnpj=71509621490
	WHERE id_pessoa=762877;

-- Auto-generated SQL script #202406251600
UPDATE comum.pessoa
	SET cpf_cnpj=71509621490
	WHERE id_pessoa=52792235;



INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(1373427, 1005222, NULL, NULL, NULL, true, false, NULL, NULL, NULL, false, false);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(1373427, 2023, NULL, '202352792235', NULL, 52792235, 605, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2023-02-03 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado)
VALUES(52792235, 'MARIA RITA DE SOUZA DOS SANTOS', '2012-10-14', 'F', 6, NULL, NULL, NULL, NULL, NULL, 71509621490, 31, NULL, 'GILBERTO DOS SANTOS', 'SEMIRAMES DE SOUZA DOS SANTOS', NULL, 1, 'TOPAZIO', 26, 2611101, '103', 'F', true, NULL, 'RUA CAMINHOS DO CORACAO BL UMBURUCU', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '87988226242, 87988222300', NULL, '2023-02-03 00:00:00.000', 'MARIA RITA DE SOUZA DOS SANTOS', NULL, NULL, 'Brasil', false, '1', 'N', NULL, NULL, NULL, NULL, NULL, NULL, '07674501552012100294115016877879', NULL, NULL, NULL, 'SEMIRAMES DE SOUZA DOS SANTOS', 'MAE', 'CPF', '07079092442', '56325-780', NULL, 2611101, 26, NULL, NULL, 'TRABALHADORA RURAL', NULL, NULL, NULL, '23680562280', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '150861371797', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10093473', NULL, NULL, NULL, '2015-10-09', NULL, 26, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-------------------------------------------------------------------------------
BEGIN;
commit;
rollback;

--SOLUÇÃO

UPDATE comum.pessoa
	SET cpf_cnpj= null
	WHERE id_pessoa=762877;

--atualiza ensino.matricula_componente seta no id correto os id discentes errados para univficar
UPDATE ensino.matricula_componente 
	SET id_discente =1392816 
	WHERE id_matricula_componente  in (17149223, 17149224, 17149225, 17149226, 17149227, 17149228, 17149229, 17149230, 17467751);


-- Alterar basico.matricula_estudante_serie
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1392816
	WHERE id_matricula_discente_serie=1412594;

-- Alterar matricula.renovacao_matricula
--UPDATE matricula.renovacao_matricula SET id_discente=1342055 WHERE id_renovacao_matricula=61134392;

-- Alterar ensino.frequencia_aluno
UPDATE ensino.frequencia_aluno 
	SET id_discente= 1392816
	WHERE id_frequencia in (151805040, 151806143, 151806095, 151805089, 151806035, 151805931, 151807451, 151806983, 151806165, 151807349, 151807432, 151807453, 151807491, 151807509, 151807614, 151807808, 151807810, 151807829, 151816675);



--update comum.pessoa set nome  = 'JANIKLEYSON FERNANDES DA SILVA BATISTA' where id_pessoa  = 751684;

--update matricula.renovacao_excepcional_matricula_processamento set id_discente = 978392 where id_discente = 982836;

--update basico.estudante_documento_pendente set id_estudante = 1359546 where id_estudante_documento_pendente in (63032671);

--update diario.competencia_habilidades_aluno set id_discente = 978392 where id in (53936, 56228, 56227);

--update diario.historico_implantado set id_estudante = 978392 where id_historico_implantado in (32975, 32976);

--update ensino.observacao_discente set id_discente = 1399592 where id_observacao_discente = 615159912;

-- Deletar basico.estudante o ERRADO
DELETE FROM basico.estudante WHERE id_estudante=1373427;
--1387237

-- Deletar public.discente
DELETE FROM public.discente WHERE id_discente=1373427;

-- Deletar comum.pessoa
DELETE FROM comum.pessoa WHERE id_pessoa=52792235; 




  
 