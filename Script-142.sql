select * from basico.matricula_estudante_serie mes 
join public.discente d on d.id_discente = mes.id_estudante 
where mes.id_estudante = 1387054
and d.matricula = '202330095123';

SELECT * FROM public.discente 
WHERE matricula = '202330095123'

select * from basico.matricula_estudante_serie mes 
where id_matricula_discente_serie = 1426763;


select * from ensino.frequencia_aluno fa 
where id_discente = 1387054;

select * from comum.pessoa p where p.nome = 'NOEMI VITORIA RODRIGUES';
select * from discente d where d.id_pessoa in (52797000,756388);
select * from basico.estudante e where e.id_estudante in (1378192,1387054);
select * from basico.matricula_estudante_serie mes where mes.id_estudante in (1378192,1387054);
select string_agg(id_matricula_componente::text, ', ')  from ensino.matricula_componente mc where mc.id_discente = 1387054;
select string_agg(id_frequencia::text, ', ')  from ensino.frequencia_aluno fa where fa.id_discente = 1387054;
select * from ensino.abono_frequencia af where af.id_estudante = 1387054;
select * from escola.solicitacao_documento sd where sd.id_estudante =  1387054;
--id_discente pra ficar 
1387054 
-- id pessoa
756388

--mes-cancelado
1452842

begin;
rollback;

-- vai fazer os update nessa mes 
1492245

--solução
update
	ensino.frequencia_aluno
set
	id_discente = 1387054
where
	id_frequencia in(137236135, 137236005, 137235558, 137236090, 137236112, 137236158, 137237830,
137238631, 137238677, 137237745, 137237768, 137237722, 137238014, 137237791, 137239062, 137238079,
137238136, 137238196, 137238284, 137238344, 137238416, 137238476, 137238608, 137238508, 137238700, 
137238723, 137238746, 137238769, 137650944, 137650828, 137651221, 137954949, 137955009, 137651325,
138023618, 142411299, 142411409, 137651445, 138270113, 138270250, 138355890, 139842369, 139842393, 
139842571, 150143017, 150143082, 150143040, 138469101, 138720422, 138720616, 139060977, 139237865, 
140053995, 140721649, 140722159, 140721690, 140806336, 140806558, 141442199, 140806849, 141442419,
140887224, 140995020, 141093405, 153349814, 153349848, 141908496, 141908519, 141908572, 141908623,
141908716, 142142925, 142636523, 142744947, 143782489, 143782874, 143782695, 143198158, 143198360, 
143936545, 143936569, 143614740, 143992019, 144051395, 144242751, 144242571, 144242549, 145524461, 
145524483, 145524527, 145524597, 145524690, 145524796, 145524853, 145616629, 145067401, 145067363, 
145067690, 145067629, 145067668, 145067965, 145067712, 145067921, 145068009, 145068031, 145068085, 
145755304, 145755372, 145947720, 145947958, 146099147, 146371448, 146371266, 145947811, 146371482,
147426462, 147426428, 147426517, 147426619, 147426641, 147426830, 146773233, 146098994, 146773419, 
146773315, 146773397, 142636500, 147509525, 146948441, 146948327, 146948389, 147900595, 147900618,
147900641, 147900664, 148081059, 137651388, 148828888, 148828911, 148828935, 148829000, 148829085,
148829108, 148829062, 148829131, 149137088, 149137180, 145524892, 149241068, 137650993, 142636384,
137954861, 142142183, 149240936, 149240987, 149846052, 149846076, 149846100, 149846171, 149846124,
149846147, 150842152, 150843161, 150842245, 150842269, 150842634, 150842693, 149846196, 150843039,
150842293, 150843082, 150842186, 151309309, 151309333, 151309374, 151309471, 151309495, 151820011,
151820036, 151820063, 151820172, 151820252, 151820307, 152794113, 152794177, 152794201, 152794225,
152794249, 152794273, 152794297, 152794321, 152984660, 147426584, 153534446, 153534672, 153534804,
153534970, 153535116, 153535312, 153535599, 153535824, 153535908, 153536185, 153536349, 153536516,
153536594, 153536653, 153536759, 153537034, 153537118, 153537275, 153537444, 153537339, 153537705,
153537821, 153537921, 153537983, 153584002, 153675461, 153675539, 153737525, 153794618, 153892448,
153965047, 154280732, 154288140, 154379168, 154754070, 154754402, 154755002, 155155724, 155156639, 
155157332, 155201005, 155375102, 153548966, 155952095, 155954394, 156162444, 156162559, 156298658,
156490948, 156758338, 156905089, 157966730, 157966640, 157966930, 157966785, 157967177, 157967278,
158044972, 158049560, 158123192, 158185293, 158262904, 158342493, 158425290, 158499987);

update
	ensino.matricula_componente
set
	id_discente = 1387054
where
	id_matricula_componente in(17355080, 17355081, 17355082, 17355083, 17355084, 17355085, 
	17355086, 17355087, 17436782, 17436787, 17436784, 17436786, 17436789, 17436783, 17472923, 
	17436785, 17436788, 17975396, 17975397, 17975398, 17975399, 17975400, 17975402, 17975394, 17975401, 17975395);

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1387054
	WHERE id_matricula_discente_serie=1417359;

DELETE FROM basico.estudante
WHERE id_estudante=1378192;

DELETE FROM public.discente
WHERE id_discente=1378192;

DELETE FROM comum.pessoa
WHERE id_pessoa=52797000;


--backup

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1378192
	WHERE id_matricula_discente_serie=1417359;

INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(1378192, 1005219, NULL, NULL, NULL, true, false, '2024-01-25', 6270289, NULL, false, false);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, nome_social)
VALUES(52797000, 'NOEMI VITORIA RODRIGUES', '2015-09-11', 'F', 2, NULL, NULL, NULL, NULL, NULL, 71562248405, 31, NULL, 'NAO DECLARADO', 'LUCIENE LUISA RODRIGUES DE SOUSA TELES', NULL, 1, 'PROJETO MARIA TEREZA', 26, 2611101, '230', 'F', true, NULL, 'RUA 33', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '87991605490', NULL, '2023-02-03 00:00:00.000', 'NOEMI VITORIA RODRIGUES', NULL, NULL, 'Brasil', false, '1', 'N', NULL, NULL, NULL, NULL, NULL, NULL, '07492201552015100003119000071911', NULL, 'VILA KM 25', NULL, 'LUCIENE LUISA RODRIGUES DE SOUSA TELES', 'MAE', 'CPF', '10978713478', '56303-992', NULL, 2611101, 26, NULL, NULL, 'TRABALHADORA RURAL', NULL, NULL, NULL, '23734611810', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '130447605770', NULL, '898004881910525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8980188', NULL, NULL, NULL, '2010-05-05', NULL, 26, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(1378192, 2023, NULL, '202352797000', NULL, 756388, 605, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2023-02-03 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



select
	estudante1_.id_estudante as col_0_0_,
	discente2_.id_discente as col_1_0_,
	discente2_.matricula as col_2_0_,
	pessoa3_.nome_responsavel_matricula as col_3_0_,
	pessoa3_.tipo_documento_responsavel_matricula as col_4_0_,
	pessoa3_.numero_documento_responsavel_matricula as col_5_0_,
	pessoa3_.codigo_inep as col_6_0_,
	pessoa3_.nome as col_7_0_,
	pessoa3_.bairro as col_8_0_,
	discente2_.status as col_9_0_,
	discente2_.data_cadastro as col_10_0_,
	matriculae0_.id_matricula_discente_serie as col_11_0_,
	serie7_.descricao as col_12_0_,
	etapaensin8_.denominacao as col_13_0_,
	escola9_.nome as col_14_0_,
	escola9_.codigo_inep as col_15_0_,
	municipio10_.nome as col_16_0_,
	situacaoma11_.id_situacao_matricula_serie as col_17_0_,
	situacaoma11_.descricao as col_18_0_,
	matriculae0_.ano_calendario as col_19_0_,
	matriculae0_.periodo as col_20_0_,
	matriculae0_.data_cadastro as col_21_0_,
	matriculae0_.data_atualizacao as col_22_0_,
	pessoa3_.cpf_cnpj as col_23_0_,
	pessoa3_.data_nascimento as col_24_0_,
	pessoa3_.nome_mae as col_25_0_,
	pessoa3_.nome_pai as col_26_0_,
	turmaserie4_.nome as col_27_0_,
	turno5_.descricao as col_28_0_
from
	basico.matricula_estudante_serie matriculae0_
inner join basico.estudante estudante1_ on
	matriculae0_.id_estudante = estudante1_.id_estudante
inner join discente discente2_ on
	estudante1_.id_estudante = discente2_.id_discente
inner join comum.pessoa pessoa3_ on
	discente2_.id_pessoa = pessoa3_.id_pessoa
left outer join comum.municipio municipio13_ on
	pessoa3_.id_municipio_contato = municipio13_.id_municipio
left outer join basico.turma_serie turmaserie4_ on
	matriculae0_.id_turma_serie = turmaserie4_.id_turma_serie
left outer join ensino.turno turno5_ on
	turmaserie4_.id_turno = turno5_.id_turno
left outer join escola.escola_etapa_ensino_serie escolaetap6_ on
	matriculae0_.id_serie_escola = escolaetap6_.id_escola_etapa_ensino_serie
left outer join basico.serie serie7_ on
	escolaetap6_.id_serie = serie7_.id_serie
left outer join basico.etapa_ensino etapaensin8_ on
	serie7_.id_etapa_ensino = etapaensin8_.id_etapa_ensino
left outer join escola.escola escola9_ on
	escolaetap6_.id_escola = escola9_.id_escola
left outer join comum.municipio municipio10_ on
	escola9_.id_municipio = municipio10_.id_municipio
left outer join basico.situacao_matricula_serie situacaoma11_ on
	matriculae0_.id_situacao_matricula_serie = situacaoma11_.id_situacao_matricula_serie
where
	1 = 1
	and (matriculae0_.id_situacao_matricula_serie not in (5 , 4 , 6 , 9))
	and discente2_.matricula = '202330095123'
order by
	matriculae0_.ano_calendario desc,
	escola9_.nome asc,
	pessoa3_.nome asc;
