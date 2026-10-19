select *
from comum.pessoa p 
where nome ilike 'NOEMI VITORIA RODRIGUES';
-- pessoa mais antigo correto 756388 / errado 52797000

select matricula , id_pessoa , * 
 from discente d 
 where id_pessoa  in (756388, 52797000);
 --id_disc correto 1387054   / errado 1378192

select ano_calendario , id_estudante , * 
 from basico.matricula_estudante_serie mes 
 where id_estudante in (1378192, 1387054)
 order by ano_calendario; 

 -- pega os ids errados no id Discente errado / e setar no update para o id discente correto /vai para o update

select string_agg(id_matricula_componente::varchar, ', ')  
from ensino.matricula_componente mc where id_discente = 1378192;
--null

select string_agg(id_matricula_discente_serie ::varchar, ', ')  
from basico.matricula_estudante_serie where id_estudante  = 1378192;
--1417359

select string_agg(id_renovacao_matricula::varchar, ', ')  
from matricula.renovacao_matricula where id_discente  = 1378192;
--null

select string_agg(id_frequencia::varchar, ', ')  
from ensino.frequencia_aluno where id_discente  = 1378192;
--null

select string_agg(id_estudante_documento_pendente::varchar, ', ')  
from basico.estudante_documento_pendente edp where id_estudante  = 1378192;
--NULL

select string_agg(id::varchar, ', ')  from diario.competencia_habilidades_aluno cha where id_discente =  1378192;
--NULL

select string_agg(id_historico_implantado::varchar, ', ') from diario.historico_implantado  where id_estudante  =  1378192;
--NULL

select id_observacao_discente from ensino.observacao_discente od  where id_discente  =  1378192;

SELECT * FROM comum.pessoa_necessidade_especial pne WHERE pne.id_pessoa  = 52797000;

-------------------------------------------------------------------------------
--Usar dados antigos que serão deletados para o backup;
select * FROM basico.estudante WHERE id_estudante=1378192;
select * FROM public.discente WHERE id_discente=1378192;
select * FROM comum.pessoa where id_pessoa = 52797000; 


--backup

INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(1378192, 1005219, NULL, NULL, NULL, true, false, '2024-01-25', 6270289, NULL, false, false);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(1378192, 2023, NULL, '202352797000', NULL, 756388, 605, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2023-02-03 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado)
VALUES(52797000, 'NOEMI VITORIA RODRIGUES', '2015-09-11', 'F', 2, NULL, NULL, NULL, NULL, NULL, 71562248405, 31, NULL, 'NAO DECLARADO', 'LUCIENE LUISA RODRIGUES DE SOUSA TELES', NULL, 1, 'PROJETO MARIA TEREZA', 26, 2611101, '230', 'F', true, NULL, 'RUA 33', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '87991605490', NULL, '2023-02-03 00:00:00.000', 'NOEMI VITORIA RODRIGUES', NULL, NULL, 'Brasil', false, '1', 'N', NULL, NULL, NULL, NULL, NULL, NULL, '07492201552015100003119000071911', NULL, 'VILA KM 25', NULL, 'LUCIENE LUISA RODRIGUES DE SOUSA TELES', 'MAE', 'CPF', '10978713478', '56303-992', NULL, 2611101, 26, NULL, NULL, 'TRABALHADORA RURAL', NULL, NULL, NULL, '23734611810', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '130447605770', NULL, '898004881910525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8980188', NULL, NULL, NULL, '2010-05-05', NULL, 26, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE basico.matricula_estudante_serie SET id_estudante=1378192 WHERE id_matricula_discente_serie in (1417359);

-------------------------------------------------------------------------------
BEGIN;

--SOLUÇÃO 

--atualiza ensino.matricula_componente seta no id correto os id discentes errados para univficar
--update ensino.matricula_componente set id_discente =973672 where id_matricula_componente  in (17032218, 17032213, 17032216, 17032214, 17032217, 17032219, 17032212, 17032211, 17032215);

-- Alterar basico.matricula_estudante_serie
UPDATE basico.matricula_estudante_serie SET id_estudante=1387054 WHERE id_matricula_discente_serie in (1417359);

-- Alterar matricula.renovacao_matricula
--UPDATE matricula.renovacao_matricula SET id_discente=978392 WHERE id_renovacao_matricula=52430537;

-- Alterar ensino.frequencia_aluno
--UPDATE ensino.frequencia_aluno SET id_discente= 973672
--WHERE id_frequencia in (137251457, 137251519, 137251488, 137251550, 137253897, 137253928, 137253959, 137259011, 137259012, 137259013, 137259014, 137259017, 137259018, 137259010, 137259015, 137259019, 137259142, 137259143, 137259144, 137261654, 137261684, 137261744, 137262101, 137261714, 137262131, 137263940, 137263970, 137264000, 137264030, 137264060, 137264090, 137264120, 137265608, 137265609, 137265644, 137267645, 137267676, 137267707, 137267738, 137267769, 137267800, 137267831, 137267862, 137269681, 137269560, 137269069, 137269712, 137269743, 137269774, 137269805, 137269836, 137269867, 137269927, 137269958, 137269989, 137270245, 137273562, 137276971, 137277176, 137279200, 137282393, 137283637, 137284765, 137288790, 137288820, 137290376, 137290780, 137293384, 137293472, 137301649, 137298109, 137298078, 137290942, 137290973, 137291004, 137300458, 137300590, 137300620, 137300650, 137301101, 137301131, 137301161, 137302696, 137290911, 137303952, 137303983, 137304225, 137304255, 137304285, 137304315, 137304345, 137304375, 137305303, 137306674, 137307146, 137307732, 137309489, 137309986, 137310040, 137310910, 137311439, 137314631, 137314659, 137315228, 137315971, 137316060, 137316088, 137317132, 137317160, 137317188, 137317244, 137318109, 137318710, 137319630, 137320794, 137320843, 137322845, 137325069, 137325127, 137325098, 137325627, 137326641, 137326909, 137329625, 137365700, 137330422, 137330590, 137330619, 137365732, 137332068, 137290811, 137297826, 137297857, 137305841, 137312970, 137313001, 137315095, 137332900, 137332929, 137333484, 137333515, 137335487, 137331231, 137335755, 137336142, 137337037, 137340137, 137340195, 137340224, 137340340, 137340253, 137340311, 137341163, 137341195, 137341227, 137341489, 137342373, 137342430, 137342637, 137343595, 137346629, 137347046, 137348783, 137348812, 137351019, 137352153, 137352207, 137352886, 137353067, 137353098, 137353129, 137355142, 137355166, 137355463, 137356663, 137358008, 137358402, 137360277, 137360308, 137361615, 137362310, 137363408, 137364144, 137364173, 137366845, 137367785, 137367832, 137368151, 137368335, 137369498, 137371083, 137371691, 137372106, 137372138, 137372690, 137374868, 137374904, 137375395, 137377264, 137378802, 137378830, 137378858, 137378886, 137382878, 137383321, 137385206, 137385238, 137386133, 137386241, 137386524, 137387458, 137389368, 137389994, 137390100, 137372718, 137390241, 137392820, 137393255, 137393415, 137394591, 137395147, 137395358, 137395389, 137398069, 137398241, 137398269, 137398297, 137398325, 137398353, 137398692, 137400397, 137402888, 137406848, 137408797, 137409184, 137410440, 137414909, 137416189, 137416719, 137418542, 137422985, 137423501, 137423529, 137423557, 137423585, 137423613, 137423641, 137423669, 137425127, 137425843, 137429234, 137429265, 137429296, 137429346, 137431363, 137431394, 137431425, 137432769, 137433245, 137434371, 137434903, 137434931, 137434987, 137435015, 137435122, 137435066, 137435177, 137435178, 137435233, 137435234, 137435289, 137435290, 137435345, 137435401, 137435402, 137435513, 137435514, 137435457, 137435569, 137435570, 137435625, 137435626, 137435681, 137435682, 137340706, 137435715, 137436379, 137436429, 137436430, 137436485, 137436486, 137436519, 137436547, 137436603, 137436631, 137436659, 137436687, 137436715, 137436743, 137436855, 137436827, 137436883, 137436911, 137436983, 137436984, 137436985, 137259016, 137270271, 137282333, 137282363, 137292140, 137292170, 137299965, 137299995, 137317216, 137340166, 137340282, 137434959, 137435346, 137435458, 137436575, 137435065, 137435121, 137436771, 137436799, 137438331);

--update comum.pessoa set nome  = 'JANIKLEYSON FERNANDES DA SILVA BATISTA' where id_pessoa  = 751684;

--update matricula.renovacao_excepcional_matricula_processamento set id_discente = 978392 where id_discente = 982836;

--update basico.estudante_documento_pendente set id_estudante = 978392 where id_estudante_documento_pendente in (52293500, 52293501);

--update diario.competencia_habilidades_aluno set id_discente = 978392 where id in (53936, 56228, 56227);

--update diario.historico_implantado set id_estudante = 978392 where id_historico_implantado in (32975, 32976);

--update ensino.observacao_discente set id_discente = 978392 where id_observacao_discente = 52408646;

-- Deletar basico.estudante o ERRADO
DELETE FROM basico.estudante WHERE id_estudante=1378192;

-- Deletar public.discente
DELETE FROM public.discente WHERE id_discente=1378192;

-- Deletar comum.pessoa
DELETE FROM comum.pessoa WHERE id_pessoa=52797000; 

commit;
rollback;
--backup 