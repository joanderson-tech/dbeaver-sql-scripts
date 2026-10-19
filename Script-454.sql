select * from comum.pessoa p where p.nome ='LUDMYLA EMYLE LIMA DA SILVA';

select * from rh.servidor s where s.id_pessoa = 51875378;

select * from ensino.docente_turma dt where id_docente  = 51876275;

select  string_agg(id_docente_turma::varchar, ', ') from ensino.docente_turma dt  where id_docente in(51876275);

select * from pessoas.historico_servidor_terceirizado hst  where id_servidor = 51876275;



O094441/6







begin;
rollback;

UPDATE ensino.docente_turma SET id_docente=1307 WHERE id_docente_turma in (51885545, 51885347, 51885349, 51885351, 51885503, 51885655, 51886465, 51886466, 51886501, 51886504, 51886506, 51886515, 51886516, 51886519, 51886525, 51886526, 51886529, 51886530, 51886542, 51905089, 51905100, 51905217, 52720912, 51997631, 51997649, 51997717, 51997732, 51997754, 51997773, 51997793, 51997802, 52720930, 51998500, 51998509, 52721005, 52720896, 52720924, 52720969, 52720997, 52721027, 52721020, 52731414);

-- Auto-generated SQL script #202504300918
UPDATE pessoas.historico_servidor_terceirizado SET id_servidor=1307 WHERE id_historico_servidor_terceirizado in (52772709,54023168,54023319);


DELETE FROM rh.servidor WHERE id_servidor=51876275;


--backup

INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, codigo_rh, id_designacao, codigo_rh_pessoa_old, codigo_rh_pessoa_new, codigo_rh_old, reducao_regime, codigo_inep, qualificacao, codigo_legado, data_ultimo_login_mobile, id_entrada, ja_alocado_completamente_apos_encaminhamento, id_tipo_contrato_servidor, forma_vacancia, data_resposta_ficha_atualizacao, id_instituicao, justificativa_finalizacao, justificativa_reducao_regime, justificativa_remocao_reducao_regime, ds_referencia, id_registro_atualizacao, id_registro_cadastro, id_classe_servidor, numero_contrato_1, numero_contrato_2, id_unidade_transferida, data_transferencia, salario, numero_termo_aditivo, quantidade_meses_termo_aditivo) VALUES(51876275, '75907', 51875378, NULL, '1', NULL, 4, 1, 1, 2884, NULL, NULL, '2021-08-04 11:45:09.114', 0.00, NULL, 605, NULL, 60, false, '1', NULL, NULL, NULL, '2025-04-29 00:00:00.000', NULL, '2025-02-27 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 1, NULL, NULL, NULL, 'encerrar', NULL, NULL, NULL, 5953978, 5953953, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE ensino.docente_turma SET id_docente=51876275 WHERE id_docente_turma in (51885545, 51885347, 51885349, 51885351, 51885503, 51885655, 51886465, 51886466, 51886501, 51886504, 51886506, 51886515, 51886516, 51886519, 51886525, 51886526, 51886529, 51886530, 51886542, 51905089, 51905100, 51905217, 52720912, 51997631, 51997649, 51997717, 51997732, 51997754, 51997773, 51997793, 51997802, 52720930, 51998500, 51998509, 52721005, 52720896, 52720924, 52720969, 52720997, 52721027, 52721020, 52731414);

UPDATE pessoas.historico_servidor_terceirizado SET id_servidor=51876275 WHERE id_historico_servidor_terceirizado in (52772709,54023168,54023319);

