select * from comum.pessoa p where p.nome = 'EMANUELLE RAYSSA LIMA DE SOUZA';
select * from discente d where d.id_pessoa  in (769034);
select * from basico.estudante e where e.id_estudante in (1399592,1398268);
select * from basico.matricula_estudante_serie mes where mes.id_estudante in (1399592,1398268);
select string_agg(id_matricula_componente::text, ', ')  from ensino.matricula_componente mc where mc.id_discente = 1398268;
select string_agg(id_frequencia::text, ', ')  from ensino.frequencia_aluno fa where fa.id_discente = 1398268;
select * from ensino.abono_frequencia af where af.id_estudante = 1398268;
select * from escola.solicitacao_documento sd where sd.id_estudante =  1387237;
select * from basico.movimentacao_estudante me where id_discente = 1387237;
select * from matricula.estudante_inscrito ei where id_estudante  =1387237;
select * from comum.pessoa_necessidade_especial pne where id_pessoa = 770264;

select * from comum.pessoa p 
where cpf_cnpj = 17037589438;
-- pessoa mais antigo correto 52760863 / errado 756571

select matricula , id_pessoa , * 
 from discente d 
 where id_pessoa  in (52760863, 772823 );
 --id_disc correto 52760863   / errado 1387237

select * 
 from basico.matricula_estudante_serie mes 
 where id_estudante in (1342055)
 order by ano_calendario; 
 -- pega os ids errados no id Discente errado / e setar no update para o id discente correto /vai para o update

select string_agg(id_matricula_componente::varchar, ', ')  
from ensino.matricula_componente mc where id_discente = 1387237;
--17344236, 17344237, 17344238, 17344232, 17344234, 17344235, 17344231, 17344233, 17472979, 17856556, 17856557, 17856558, 17856559, 17856560, 17856561, 17856562, 17856563, 17856555

select string_agg(id_matricula_discente_serie ::varchar, ', ')  
from basico.matricula_estudante_serie where id_estudante  = 1387237;
--1426996, 1448536

select string_agg(id_renovacao_matricula::varchar, ', ')  
from matricula.renovacao_matricula where id_discente  = 1387237;
--61134392

select string_agg(id_frequencia::varchar, ', ')  
from ensino.frequencia_aluno where id_discente  = 1387237;
--140096844, 140102493, 141195688, 141195689, 141195690, 141195691, 141195692, 141195693, 141195694, 141195695, 141195696, 140097911, 140097932, 140098051, 150185950, 140098149, 140098288, 140098391, 141195687, 140098565, 140098680, 140098797, 140098873, 140098939, 140099115, 140099257, 140099345, 140099487, 140099556, 140099597, 140099734, 140099775, 140099855, 140099944, 140100053, 140100143, 140100254, 140100294, 140096749, 140096583, 142516469, 142516536, 140087167, 140100579, 140100781, 140100828, 140100945, 140101003, 140101137, 140101257, 140101540, 140101648, 140101731, 140101861, 140101930, 140102150, 140102321, 140102646, 140096219, 140096413, 140096889, 140305255, 140099023, 142328877, 142329053, 142329506, 142330522, 143291977, 142331487, 142331883, 143144178, 142333520, 142332432, 142333674, 143144468, 142333903, 150190124, 142327714, 142327930, 142328307, 142334023, 142333958, 142334180, 142701864, 142701954, 143091160, 143091186, 143093443, 143291978, 144022416, 144022531, 144022665, 144022701, 144022727, 144022819, 144022930, 145438082, 145438242, 145438577, 145438829, 145439169, 145439066, 145439304, 145439468, 145503628, 144810091, 144809559, 144811770, 144811795, 144811820, 144811845, 144811870, 144881080, 147315909, 147315964, 147317002, 147317351, 147317596, 147318161, 147318910, 147319259, 146562394, 146562419, 146562592, 146562697, 146562781, 146562806, 146562832, 146562858, 146562884, 146562910, 146562936, 146562962, 146562988, 146563014, 148097397, 148097523, 148097587, 148097962, 148097810, 148097855, 148097900, 150103048, 150103344, 150103472, 150103512, 150103586, 150103698, 150932464, 150933068, 150933393, 150933518, 151380659, 151380867, 151380893, 151464176, 151646485, 152611664, 152611577, 152611639, 151901688, 153146860, 153146938, 150189786, 150189934, 150190291, 150932180, 150932362, 150932757, 153222685, 150932609, 151380634, 151380940, 151561076, 151758501, 152106008, 151901906, 152106812, 152611614, 150186180, 150185792, 150186118, 148629943, 150103230, 150186273, 150186360, 150101717, 150102581, 153246114, 153246033, 153246155, 153246072, 153246525, 153247597, 153247724, 69198342, 61922108, 62047457, 62063344, 62063413, 62063834, 62064490, 62066792, 62064520, 62101098, 62163037, 62744420, 62748718, 62744446, 62745590, 62063460, 62748741, 62750203, 62968216, 62969387, 63117320, 63356208, 63356776, 63356803, 63357443, 63357466, 63357382, 63357418, 63359014, 63357491, 63357807, 63357830, 63358909, 63358946, 63358973, 64743846, 64744486, 64745151, 64744503, 64744522, 65198240, 70021084, 66239526, 66809408, 67506674, 67798799, 68472271, 70105280, 70105387, 70402912, 70557426, 70557518, 70568438, 70639272, 70670874, 70670856, 70639248, 70670959, 70700017, 69650277, 69660478, 70713384, 159425721, 159425745, 159425768, 159425791, 159425814, 70751735, 70751760, 70774006, 70783140, 159856483, 159995197, 160155822, 160249021, 160356982, 160466605

select string_agg(id_estudante_documento_pendente::varchar, ', ')  
from basico.estudante_documento_pendente edp where id_estudante  = 1387237;
--null

select string_agg(id::varchar, ', ')  from diario.competencia_habilidades_aluno cha where id_discente =  1387237;
--NULL

select string_agg(id_historico_implantado::varchar, ', ') from diario.historico_implantado  where id_estudante  =  1387237;
--NULL

select id_observacao_discente from ensino.observacao_discente od  where id_discente  =  1387237;
--null

SELECT * FROM comum.pessoa_necessidade_especial pne WHERE pne.id_pessoa  = 1387237;

select from basico.tipo_movimentacao_estudante tme 
where  = 1402005;

-------------------------------------------------------------------------------
--Usar dados antigos que serão deletados para o backup;
select * FROM basico.estudante WHERE id_estudante in (1402005);
select * FROM public.discente WHERE id_discente=1402005;
select * FROM comum.pessoa where id_pessoa = 772823; 


DELETE FROM basico.estudante WHERE id_estudante=1402005;

DELETE FROM public.discente WHERE id_discente=1402005;

DELETE FROM comum.pessoa WHERE id_pessoa=772823; 
--backup


UPDATE ensino.matricula_componente 
	SET id_discente =1387237 
	WHERE id_matricula_componente  in (17344236, 17344237, 17344238, 17344232, 17344234, 17344235, 17344231, 17344233, 17472979, 17856556, 17856557, 17856558, 17856559, 17856560, 17856561, 17856562, 17856563, 17856555);

UPDATE ensino.frequencia_aluno 
	SET id_discente= 1387237
	WHERE id_frequencia in (140096844, 140102493, 141195688, 141195689, 141195690, 141195691, 141195692, 141195693, 141195694, 141195695, 141195696, 140097911, 140097932, 140098051, 150185950, 140098149, 140098288, 140098391, 141195687, 140098565, 140098680, 140098797, 140098873, 140098939, 140099115, 140099257, 140099345, 140099487, 140099556, 140099597, 140099734, 140099775, 140099855, 140099944, 140100053, 140100143, 140100254, 140100294, 140096749, 140096583, 142516469, 142516536, 140087167, 140100579, 140100781, 140100828, 140100945, 140101003, 140101137, 140101257, 140101540, 140101648, 140101731, 140101861, 140101930, 140102150, 140102321, 140102646, 140096219, 140096413, 140096889, 140305255, 140099023, 142328877, 142329053, 142329506, 142330522, 143291977, 142331487, 142331883, 143144178, 142333520, 142332432, 142333674, 143144468, 142333903, 150190124, 142327714, 142327930, 142328307, 142334023, 142333958, 142334180, 142701864, 142701954, 143091160, 143091186, 143093443, 143291978, 144022416, 144022531, 144022665, 144022701, 144022727, 144022819, 144022930, 145438082, 145438242, 145438577, 145438829, 145439169, 145439066, 145439304, 145439468, 145503628, 144810091, 144809559, 144811770, 144811795, 144811820, 144811845, 144811870, 144881080, 147315909, 147315964, 147317002, 147317351, 147317596, 147318161, 147318910, 147319259, 146562394, 146562419, 146562592, 146562697, 146562781, 146562806, 146562832, 146562858, 146562884, 146562910, 146562936, 146562962, 146562988, 146563014, 148097397, 148097523, 148097587, 148097962, 148097810, 148097855, 148097900, 150103048, 150103344, 150103472, 150103512, 150103586, 150103698, 150932464, 150933068, 150933393, 150933518, 151380659, 151380867, 151380893, 151464176, 151646485, 152611664, 152611577, 152611639, 151901688, 153146860, 153146938, 150189786, 150189934, 150190291, 150932180, 150932362, 150932757, 153222685, 150932609, 151380634, 151380940, 151561076, 151758501, 152106008, 151901906, 152106812, 152611614, 150186180, 150185792, 150186118, 148629943, 150103230, 150186273, 150186360, 150101717, 150102581, 153246114, 153246033, 153246155, 153246072, 153246525, 153247597, 153247724, 69198342, 61922108, 62047457, 62063344, 62063413, 62063834, 62064490, 62066792, 62064520, 62101098, 62163037, 62744420, 62748718, 62744446, 62745590, 62063460, 62748741, 62750203, 62968216, 62969387, 63117320, 63356208, 63356776, 63356803, 63357443, 63357466, 63357382, 63357418, 63359014, 63357491, 63357807, 63357830, 63358909, 63358946, 63358973, 64743846, 64744486, 64745151, 64744503, 64744522, 65198240, 70021084, 66239526, 66809408, 67506674, 67798799, 68472271, 70105280, 70105387, 70402912, 70557426, 70557518, 70568438, 70639272, 70670874, 70670856, 70639248, 70670959, 70700017, 69650277, 69660478, 70713384, 159425721, 159425745, 159425768, 159425791, 159425814, 70751735, 70751760, 70774006, 70783140, 159856483, 159995197, 160155822, 160249021, 160356982, 160466605);

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1387237
	WHERE id_matricula_discente_serie=1426996;

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1387237
	WHERE id_matricula_discente_serie=1448536;

UPDATE matricula.renovacao_matricula 
	SET id_discente=1387237 
	WHERE id_renovacao_matricula=61134392;

UPDATE comum.pessoa
	SET cpf_cnpj= null
	WHERE id_pessoa=52760863;

UPDATE escola.solicitacao_documento
	SET id_estudante=1387237
	WHERE id_solicitacao_documento=8530;


INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(1387237, 1005218, 'ESCOLA MUNICIPAL PROFESSOR WALTER GIL', NULL, NULL, true, false, '2024-05-28', 6477698, NULL, false, false);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(1387237, 2023, NULL, '202330096953', NULL, 756571, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2023-02-23 08:57:57.535', NULL, 5646299, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, nome_social)
VALUES(756571, 'MARIA JULIA DE AQUINO MELO', '2016-11-29', 'F', NULL, NULL, NULL, NULL, NULL, NULL, 12259026575, 31, NULL, 'IGOR SILVA DE MELO ALMEIDA', 'PALOMA RODRIGUES DE AQUINO SOUZA', '', NULL, 'TOPAZIO', 26, 2611101, '101', 'F', false, '2024-05-28 11:11:56.489', 'RUA F, BL FEIRA NOVA', NULL, '', '', '', '', NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(87)98144-0103', NULL, '2023-02-23 08:57:57.533', 'MARIA JULIA DE AQUINO MELO', NULL, NULL, '', false, '0', 'N', '', '', '', NULL, 2611101, '', '01086801552016100025188002953896', NULL, 'VIVENDAS 1', NULL, 'PALOMA RODRIGUES DE AQUINO SOUZA', 'MAE', 'CPF', '3234836582', '56325-750', NULL, 2611101, 26, NULL, '', '', NULL, NULL, NULL, '23769734420', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '183551300657', NULL, '898005163456859', 52830899, NULL, NULL, NULL, NULL, NULL, NULL, '1442473720', '', '', '', NULL, NULL, 26, 26, NULL, false, '', '', 'MAE', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-------------------------------------------------------------------------------
BEGIN;
commit;
rollback;

--SOLUÇÃO

--atualiza ensino.matricula_componente seta no id correto os id discentes errados para univficar
UPDATE ensino.matricula_componente 
	SET id_discente =1342055 
	WHERE id_matricula_componente  in (17344236, 17344237, 17344238, 17344232, 17344234, 17344235, 17344231, 17344233, 17472979, 17856556, 17856557, 17856558, 17856559, 17856560, 17856561, 17856562, 17856563, 17856555);


-- Alterar basico.matricula_estudante_serie
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1342055
	WHERE id_matricula_discente_serie=1426996;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1342055
	WHERE id_matricula_discente_serie=1448536;


-- Alterar matricula.renovacao_matricula
UPDATE matricula.renovacao_matricula 
	SET id_discente=1342055 
	WHERE id_renovacao_matricula=61134392;

-- Alterar ensino.frequencia_aluno
UPDATE ensino.frequencia_aluno 
	SET id_discente= 1342055
	WHERE id_frequencia in (140096844, 140102493, 141195688, 141195689, 141195690, 141195691, 141195692, 141195693, 141195694, 141195695, 141195696, 140097911, 140097932, 140098051, 150185950, 140098149, 140098288, 140098391, 141195687, 140098565, 140098680, 140098797, 140098873, 140098939, 140099115, 140099257, 140099345, 140099487, 140099556, 140099597, 140099734, 140099775, 140099855, 140099944, 140100053, 140100143, 140100254, 140100294, 140096749, 140096583, 142516469, 142516536, 140087167, 140100579, 140100781, 140100828, 140100945, 140101003, 140101137, 140101257, 140101540, 140101648, 140101731, 140101861, 140101930, 140102150, 140102321, 140102646, 140096219, 140096413, 140096889, 140305255, 140099023, 142328877, 142329053, 142329506, 142330522, 143291977, 142331487, 142331883, 143144178, 142333520, 142332432, 142333674, 143144468, 142333903, 150190124, 142327714, 142327930, 142328307, 142334023, 142333958, 142334180, 142701864, 142701954, 143091160, 143091186, 143093443, 143291978, 144022416, 144022531, 144022665, 144022701, 144022727, 144022819, 144022930, 145438082, 145438242, 145438577, 145438829, 145439169, 145439066, 145439304, 145439468, 145503628, 144810091, 144809559, 144811770, 144811795, 144811820, 144811845, 144811870, 144881080, 147315909, 147315964, 147317002, 147317351, 147317596, 147318161, 147318910, 147319259, 146562394, 146562419, 146562592, 146562697, 146562781, 146562806, 146562832, 146562858, 146562884, 146562910, 146562936, 146562962, 146562988, 146563014, 148097397, 148097523, 148097587, 148097962, 148097810, 148097855, 148097900, 150103048, 150103344, 150103472, 150103512, 150103586, 150103698, 150932464, 150933068, 150933393, 150933518, 151380659, 151380867, 151380893, 151464176, 151646485, 152611664, 152611577, 152611639, 151901688, 153146860, 153146938, 150189786, 150189934, 150190291, 150932180, 150932362, 150932757, 153222685, 150932609, 151380634, 151380940, 151561076, 151758501, 152106008, 151901906, 152106812, 152611614, 150186180, 150185792, 150186118, 148629943, 150103230, 150186273, 150186360, 150101717, 150102581, 153246114, 153246033, 153246155, 153246072, 153246525, 153247597, 153247724, 69198342, 61922108, 62047457, 62063344, 62063413, 62063834, 62064490, 62066792, 62064520, 62101098, 62163037, 62744420, 62748718, 62744446, 62745590, 62063460, 62748741, 62750203, 62968216, 62969387, 63117320, 63356208, 63356776, 63356803, 63357443, 63357466, 63357382, 63357418, 63359014, 63357491, 63357807, 63357830, 63358909, 63358946, 63358973, 64743846, 64744486, 64745151, 64744503, 64744522, 65198240, 70021084, 66239526, 66809408, 67506674, 67798799, 68472271, 70105280, 70105387, 70402912, 70557426, 70557518, 70568438, 70639272, 70670874, 70670856, 70639248, 70670959, 70700017, 69650277, 69660478, 70713384, 159425721, 159425745, 159425768, 159425791, 159425814, 70751735, 70751760, 70774006, 70783140, 159856483, 159995197, 160155822, 160249021, 160356982, 160466605);

UPDATE comum.pessoa
	SET cpf_cnpj=12259026575
	WHERE id_pessoa=52760863;

UPDATE escola.solicitacao_documento
	SET id_estudante=1342055
	WHERE id_solicitacao_documento=8530;



--update comum.pessoa set nome  = 'JANIKLEYSON FERNANDES DA SILVA BATISTA' where id_pessoa  = 751684;

--update matricula.renovacao_excepcional_matricula_processamento set id_discente = 978392 where id_discente = 982836;

--update basico.estudante_documento_pendente set id_estudante = 1359546 where id_estudante_documento_pendente in (63032671);

--update diario.competencia_habilidades_aluno set id_discente = 978392 where id in (53936, 56228, 56227);

--update diario.historico_implantado set id_estudante = 978392 where id_historico_implantado in (32975, 32976);

--update ensino.observacao_discente set id_discente = 1399592 where id_observacao_discente = 615159912;

-- Deletar basico.estudante o ERRADO
DELETE FROM basico.estudante WHERE id_estudante=1387237;
--1387237

-- Deletar public.discente
DELETE FROM public.discente WHERE id_discente=1387237;

-- Deletar comum.pessoa
DELETE FROM comum.pessoa WHERE id_pessoa=756571; 


"estudante" violates foreign key constraint "id_estudante_fkey" on table "solicitacao_documento"
  Detalhe: Key (id_estudante)=(1387237) is still referenced from table "solicitacao_documento".




  
 