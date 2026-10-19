/*select * from comum.pessoa where id_pessoa in (747310, 749599);

select * from discente d where d.id_pessoa in (747310, 749599);
749599
 
select * from matricula.movimentacao_estudante_escola mee where mee.id_movimentacao_estudante_escola in (52268254);

select * from ensino.matricula_componente mc where mc.id_matricula_estudante_serie = 1320591;

select * from basico.matricula_estudante_serie mes where mes.id_estudante = 974324 and mes.ano_calendario = 2025;

select * from basico.matricula_estudante_serie mes where mes.id_estudante = 974474 and mes.ano_calendario = 2025;

select * from matricula.solicitacao_transferencia st where st.id_matricula_discente_serie = 1317988;

select * FROM matricula.movimentacao_estudante_escola mee  where mee.id_matricula_estudante_serie  in (1320590,1317988,1320589,1320072);

select string_agg(t.id_turma :: varchar , ', ')
from ensino.turma t where t.id_turma_serie in (51882957) and t.id_situacao_turma = 1; --51883085

select string_agg(fa.id_frequencia :: varchar , ', ') 
from ensino.frequencia_aluno fa  
where fa.id_discente = 974324 
and fa.id_turma in (682559, 682555, 682553, 682556, 682554, 682557, 682558, 682562, 682560)
and fa."data" >= '2025-04-15';


    --(682559, 682555, 682553, 682556, 682554, 682557, 682558, 682562, 682560) 


in (51882957,51882933)*/

select string_agg(t.id_turma :: varchar , ', ')
from ensino.turma t where t.id_turma_serie in (51883085) and t.id_situacao_turma = 1; --51883085

select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma in (682660, 682659, 682658, 682662, 682664, 682666, 682661, 682663) ;


--solução GUSTAVO SOUZA SANTOS
UPDATE basico.matricula_estudante_serie	SET data_matricula_turma='2025-04-15 00:00:00.000',data_cadastro='2025-04-15 00:00:00.000' WHERE id_matricula_discente_serie=1320591;
UPDATE matricula.movimentacao_estudante_escola SET "data"='2025-04-15',data_cadastro='2025-04-15 00:00:00.000',data_solicitacao ='2025-04-15'	WHERE id_movimentacao_estudante_escola=52268357;
UPDATE ensino.frequencia_aluno SET ativo=false WHERE id_frequencia in (137490871, 137490888, 137521325, 137521342, 137521359, 137521376, 137521393, 137521410, 137521427, 137521444, 137521461, 137521478, 137521495, 137521512, 137521529, 137521569, 137521586, 137521603, 137521620, 137521637, 137521654, 137521671, 137521688, 137521705, 137521722, 137521739, 137521756, 137521773, 137521790, 137521807, 137491092, 137491296)

--solução MYKE RIAN DIAS VICTOR FERNANDES
UPDATE basico.matricula_estudante_serie	SET data_matricula_turma='2025-04-15 00:00:00.000',data_cadastro='2025-04-15 00:00:00.000' WHERE id_matricula_discente_serie=1320590;
UPDATE matricula.movimentacao_estudante_escola SET "data"='2025-04-15',data_cadastro='2025-04-15 00:00:00.000',data_solicitacao ='2025-04-15'	WHERE id_movimentacao_estudante_escola in (52268259,52268254);
UPDATE ensino.frequencia_aluno SET ativo=false WHERE id_frequencia in (137231235, 137231259, 137630654, 137630678, 137630702, 137630750, 137630726, 137630846, 137630894, 137630990, 137631014, 137630774, 137630798, 137630822, 137630870, 137630918, 137630942, 137630966, 137631038, 137656520, 137656394, 137656544, 137656568, 137656592, 137656370, 137656418, 137656442, 137656476, 137656646, 137656700, 137656744, 137656975, 137656999, 137232300, 137637911, 137637959, 137637935, 137638007, 137638055, 137638079, 137637983, 137638031, 137638151, 137638175, 137638223, 137638103, 137638127, 137638199, 137638271, 137638247, 137638295, 137638319, 137638481, 137638505, 137233561, 137638979, 137639003, 137638643, 137638739, 137638529, 137638553, 137638598, 137638667, 137638691, 137638715, 137638763, 137638787, 137638811, 137638883, 137638931, 137638835, 137638859, 137638907, 137638955, 137651177, 137652787, 137657138, 137657162, 137657210, 137657258, 137657186, 137657234, 137657282, 137236413, 137657306, 137657330, 137657426, 137657498, 137657354, 137657378, 137657402, 137657450, 137657474, 137680281, 137680305, 137680353, 137680377, 137680209, 137680233, 137680257, 137680329, 137680401, 137680542, 137680590, 137680638, 137680662, 137680494, 137680518, 137680566, 137680614, 137680686, 137666512, 137666632, 137666488, 137666536, 137666560, 137666584, 137666608, 137666656, 137666680);

--MUDANDO POIS IA CONSTA DUAS MATRICULAS COM STATUS MATRICULADO
UPDATE basico.matricula_estudante_serie	SET id_situacao_matricula_serie=5 WHERE id_matricula_discente_serie=1320589;

--uNIFICAÇÃO
select 'UPDATE ensino.matricula_componente SET id_discente = 974324 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao,
	   'UPDATE ensino.matricula_componente SET id_discente = '|| mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup,
	   COUNT(mc.id_matricula_componente) AS quantidade_ids
from ensino.matricula_componente mc 
where mc.id_discente IN (976393)
GROUP BY  mc.id_discente;	

UPDATE ensino.matricula_componente SET id_discente = 974324 WHERE id_matricula_componente IN (17036250, 17036253, 17036257, 17036251, 17036258, 17036255, 17036254, 17036252, 17036256, 17026718, 17026012, 17026013, 17026014, 17026015, 17026717, 17026719, 17026720, 17026721, 17026722, 17026723, 17026724, 17026725);

SELECT 
    'UPDATE ensino.frequencia_aluno SET id_discente = 974324 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script,
    'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup,
    COUNT(fa.id_frequencia) AS quantidade_ids
FROM ensino.frequencia_aluno fa 
where fa.id_discente IN (976393)
GROUP BY fa.id_discente;

UPDATE ensino.frequencia_aluno SET id_discente = 974324 WHERE id_frequencia IN (137574388, 137574482, 137574421, 137574435, 137574468, 137574515, 137574529, 137574543, 137574557, 137574591, 137167147, 137580068, 137580082, 137567686, 137567700, 137567728, 137567756, 137565677, 137565794, 137565808, 137565630, 137565892, 137565920, 137565948, 137565976, 137565532, 137565560, 137565546, 137565574, 137565602, 137565588, 137565616, 137565644, 137565710, 137565738, 137565724, 137565752, 137565850, 137565864, 137565878, 137565906, 137565766, 137565822, 137565836, 137565780, 137567081, 137567137, 137567151, 137565934, 137565962, 137565990, 137566004, 137567095, 137567109, 137567123, 137567165, 137567193, 137567207, 137567263, 137567053, 137567550, 137567564, 137567039, 137567067, 137567616, 137567644, 137567658, 137567179, 137567221, 137567235, 137567249, 137567277, 137567602, 137567714, 137567742, 137567798, 137567812, 137567630, 137567672, 137567770, 137567784, 137569180, 137569194, 137569432, 137569446, 137567826, 137567840, 137567854, 137569063, 137569091, 137569105, 137569000, 137569014, 137569383, 137569028, 137569077, 137569138, 137569166, 137569152, 137569306, 137569334, 137569348, 137569320, 137569397, 137569488, 137569460, 137569474, 137569502, 137574213, 137574254);

UPDATE basico.matricula_estudante_serie	SET id_estudante=974324 WHERE id_matricula_discente_serie in (1320590, 1320072);
update ensino.observacao_discente set id_discente = 974324 where id_observacao_discente = 522670900;
UPDATE basico.movimentacao_estudante SET id_discente=974324 WHERE id_movimentacao_estudante=68796;

DELETE FROM basico.estudante WHERE id_estudante=976393;
DELETE FROM public.discente WHERE id_discente=976393;
DELETE FROM comum.pessoa WHERE id_pessoa=749599;



--backup GUSTAVO SOUZA SANTOS
UPDATE basico.matricula_estudante_serie	SET data_matricula_turma=null,data_cadastro='2025-07-10 15:21:52.738' WHERE id_matricula_discente_serie=1320591;
UPDATE matricula.movimentacao_estudante_escola SET "data"='2025-04-15',data_cadastro='2025-04-15 00:00:00.000',data_solicitacao ='2025-04-15'	WHERE id_movimentacao_estudante_escola in (52268259,52268254);
UPDATE ensino.frequencia_aluno SET ativo= true WHERE id_frequencia in (137490871, 137490888, 137521325, 137521342, 137521359, 137521376, 137521393, 137521410, 137521427, 137521444, 137521461, 137521478, 137521495, 137521512, 137521529, 137521569, 137521586, 137521603, 137521620, 137521637, 137521654, 137521671, 137521688, 137521705, 137521722, 137521739, 137521756, 137521773, 137521790, 137521807, 137491092, 137491296)

--backup MYKE RIAN DIAS VICTOR FERNANDES
UPDATE basico.matricula_estudante_serie	SET data_matricula_turma=null,data_cadastro='2025-07-10 15:21:52.738' WHERE id_matricula_discente_serie=1320590;
UPDATE matricula.movimentacao_estudante_escola SET "data"='2025-07-10',data_cadastro='2025-07-10 14:18:50.661', data_solicitacao ='2025-04-16'	WHERE id_movimentacao_estudante_escola=52268254;
UPDATE matricula.movimentacao_estudante_escola SET "data"='2025-07-10',data_cadastro='2025-07-10 14:20:41.535', data_solicitacao = NULL	WHERE id_movimentacao_estudante_escola=52268259;
UPDATE ensino.frequencia_aluno SET ativo= true WHERE id_frequencia in (137231235, 137231259, 137630654, 137630678, 137630702, 137630750, 137630726, 137630846, 137630894, 137630990, 137631014, 137630774, 137630798, 137630822, 137630870, 137630918, 137630942, 137630966, 137631038, 137656520, 137656394, 137656544, 137656568, 137656592, 137656370, 137656418, 137656442, 137656476, 137656646, 137656700, 137656744, 137656975, 137656999, 137232300, 137637911, 137637959, 137637935, 137638007, 137638055, 137638079, 137637983, 137638031, 137638151, 137638175, 137638223, 137638103, 137638127, 137638199, 137638271, 137638247, 137638295, 137638319, 137638481, 137638505, 137233561, 137638979, 137639003, 137638643, 137638739, 137638529, 137638553, 137638598, 137638667, 137638691, 137638715, 137638763, 137638787, 137638811, 137638883, 137638931, 137638835, 137638859, 137638907, 137638955, 137651177, 137652787, 137657138, 137657162, 137657210, 137657258, 137657186, 137657234, 137657282, 137236413, 137657306, 137657330, 137657426, 137657498, 137657354, 137657378, 137657402, 137657450, 137657474, 137680281, 137680305, 137680353, 137680377, 137680209, 137680233, 137680257, 137680329, 137680401, 137680542, 137680590, 137680638, 137680662, 137680494, 137680518, 137680566, 137680614, 137680686, 137666512, 137666632, 137666488, 137666536, 137666560, 137666584, 137666608, 137666656, 137666680);

--MUDANDO POIS IA CONSTA DUAS MATRICULAS COM STATUS MATRICULADO
UPDATE basico.matricula_estudante_serie	SET id_situacao_matricula_serie=1 WHERE id_matricula_discente_serie=1320589;

--BACKUP UNIFICAÇÃO
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2) VALUES(749599, 'MIKE RIAN DIAS VICTOR FERNANDES', '2018-09-21', 'M', 2, NULL, NULL, NULL, NULL, NULL, 15879200426, 31, NULL, 'TERTULIANO FERNANDES FILHO', 'SIMONE DIAS VICTOR SABINO', '', -1, '', 25, 2504009, '', 'F', false, '2025-07-10 14:42:09.102', 'Sitio Barra', NULL, '', '', '', '', NULL, '', '', 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(83)99624-3151', NULL, '2025-04-25 08:15:21.262', 'MIKE RIAN DIAS VICTOR FERNANDES', NULL, NULL, 'BRASILEIRA', false, '0', 'N', '', '', '', NULL, 2507705, '', '07059901552018100021231002153258', NULL, '', NULL, 'Simone Dias Victor Sabino', 'Mãe', NULL, '0', '58660-000', NULL, 2507705, 25, NULL, 'agricultor', 'agricultora', NULL, NULL, NULL, '16331717670', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '702604797402348', 51908068, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, 25, 25, 2, false, '', '', 'SIMONE', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '', 0, 0);
INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca, id_tipo_instituicao_origem) VALUES(976393, 1005339, 'E M E F JOSÉ PEIXE', NULL, NULL, true, true, NULL, NULL, NULL, false, false, 3);
INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(976393, 2025, NULL, '202530028959', NULL, 749599, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2025-04-25 08:15:21.263', NULL, 5625518, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE basico.matricula_estudante_serie	SET id_estudante=976393 WHERE id_matricula_discente_serie in (1320590, 1320072);
update ensino.observacao_discente set id_discente = 976393 where id_observacao_discente = 522670900;
UPDATE basico.movimentacao_estudante SET id_discente=976393 WHERE id_movimentacao_estudante=68796;




