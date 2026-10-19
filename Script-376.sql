--backup

UPDATE basico.matricula_estudante_serie SET id_estudante=979783 
WHERE id_matricula_discente_serie in (1320579, 1326242, 1334268, 1338628, 1344247, 1349993, 1350048);

UPDATE basico.movimentacao_estudante SET id_discente=979783
WHERE id_movimentacao_estudante in (69940);

UPDATE diario.competencia_habilidades_aluno SET id_discente = 979783 
WHERE id in (39874, 48888, 50539);

UPDATE ensino.observacao_discente SET id_discente = 979783 
WHERE id_observacao_discente in (52120455,530846931) ;

UPDATE matricula.renovacao_matricula SET id_discente=979783 
WHERE id_renovacao_matricula in (51970632, 52204122, 52785524, 53071101, 53071239);

UPDATE comum.alteracao_status_aluno SET id_discente=979783
WHERE id_alteracao=530918474;

INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca, id_tipo_instituicao_origem) VALUES(979783, 51869847, NULL, NULL, NULL, false, false, '2022-08-16', 5719037, NULL, false, false, NULL);

INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(979783, 2019, NULL, '201951876815', NULL, 51876815, 605, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2019-10-08 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

