/*Mesmo retirando a servidora ANA PAULA DOS SANTOS DE ANDRADE de matricula 000513/1 da 
ANA PAULA DOS SANTOS | CPF 719.918.675-49 |	000000513 / 1*/


select p from rh.servidor s 
join comum.pessoa p on p.id_pessoa = s.id_pessoa 
where p.cpf_cnpj = '71991867549'


--755043 -- servidor

select * from comum.pessoa p where id_pessoa in (54378358, 746592) ;

select * from comum.usuario u where u.id_pessoa in (54378358) ;

select * from comum.usuario u where u.id_pessoa in (54378358, 746592) ;


select * from rh.servidor s where s.id_pessoa in (54378358, 746592) ;

select * from pessoas.historico_servidor_terceirizado  s where s.id_servidor in (54381361,1013);

select * from pessoas.vaga_administrativa   s where s.id_servidor in (54381361,1013);

select * from rh.historico_transferencia_servidores s where s.id_servidor in (54381361,1013);

Erro SQL [23503]: ERROR: update or delete on table "pessoa" violates foreign key constraint "id_pessoa_fk" on table "alteracao_pessoa"
  Detalhe: Key (id_pessoa)=(746592) is still referenced from table "alteracao_pessoa".
  
  select * from comum.alteracao_pessoa where id_pessoa = 746592;


begin;

--solução
UPDATE rh.historico_transferencia_servidores SET id_servidor=54381361 WHERE id_historico_transferencia_servidor=52415015;

UPDATE pessoas.historico_servidor_terceirizado	SET id_servidor=54381361	WHERE id_historico_servidor_terceirizado in (54497103, 54497112, 54497129);

UPDATE comum.usuario SET id_pessoa=54378358 WHERE id_usuario=105040;

UPDATE comum.alteracao_pessoa SET id_pessoa=54378358 WHERE id_alteracao_pessoa in (518926340,518926341,524142086,535442063,544971040,544971115,544970391);

UPDATE educacenso.educacenso_pessoa SET id_pessoa=54378358 WHERE id_educacenso_pessoa=493;

--Deletar os dados do estudante conforme solicitado pelo suporte.

DELETE FROM ensino.frequencia_aluno WHERE id_frequencia in (150380290, 150398140, 150418387, 150418588, 150418599, 150418601, 150418638, 150418642, 150418657, 150418664, 150418667, 150418691, 150418696, 150418722, 150418749, 150436859, 150455215, 150559418, 150559425, 150559456, 150559466, 150579367, 150653685, 150653700, 150653716, 150709548, 150709558, 150709561, 150728540, 150766546, 150794704, 150825132, 150901288, 150901302, 150901327, 150968399, 150968431, 150968435, 150968441, 151022096, 151022090, 151099267, 151099300, 151099303, 151204924, 151204939, 151204949);

DELETE FROM comum.alteracao_status_aluno WHERE id_alteracao=544332880;

DELETE FROM basico.alteracao_matricula_serie WHERE id_alteracao_matricula_serie in (699336,699808,699809);

DELETE FROM ensino.observacao_discente WHERE id_observacao_discente in (541666712,544332910);

DELETE FROM basico.movimentacao_estudante WHERE id_movimentacao_estudante in(78815, 79144);

DELETE FROM matricula.emissao_documento_matricula WHERE id_emissao_documento_matricula in (892675, 889994, 889995, 889996);

DELETE FROM ensino.matricula_componente WHERE id_matricula_componente in (17843102,17843103);

DELETE FROM basico.matricula_estudante_serie WHERE id_matricula_discente_serie=1385381;

DELETE FROM basico.estudante WHERE id_estudante=1010490;

DELETE FROM public.discente WHERE id_discente=1010490;

DELETE FROM rh.servidor WHERE id_servidor=1013;

DELETE FROM comum.pessoa WHERE id_pessoa=746592;

--banco Comum
INSERT INTO comum.pessoa (id_pessoa, endereco, cep, uf, telefone, celular, fax, tipo, cpf_cnpj, complemento, nome_representante, nome, bairro, cidade, matricula, id_cargo, nome_fantasia, data_nascimento, sexo, email, funcionario, nitpis, emite_fatura, aliquota_imposto, internacional, passaporte, pais_origem, ultima_atualizacao, valido, nome_ascii, origem, nome_mae, numero, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, data_cadastro, "semCpf", justificativa, pais_nacionalidade, id_municipio_naturalidade, id_uf_naturalidade, numero_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, orgao_expedicao_identidade, id_estado_civil, id_raca) VALUES (54378358,'RUA W,',NULL,NULL,'(79)99684-2065',NULL,NULL,'F',71991867549,NULL,NULL,'ANA PAULA DOS SANTOS','CONJUNTO JARDIM',NULL,NULL,NULL,NULL,'1974-04-13','F',NULL,NULL,NULL,NULL,NULL,false,NULL,NULL,'2025-07-04 00:00:00.000',true,'ANA PAULA DOS SANTOS',NULL,'NÃO INFORMADO',NULL,NULL,NULL,NULL,NULL,'2022-12-06 11:13:31.657',false,NULL,NULL,2804607,28,NULL,NULL,NULL,NULL,NULL,NULL);

UPDATE comum.usuario SET id_pessoa=54378358 WHERE id_usuario=105040;

DELETE FROM rh.servidor WHERE id_servidor=1013;

DELETE FROM comum.pessoa WHERE id_pessoa=746592;

commit;

rollback;

--backup
--Estudante

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150380290, '2025-03-24', 1, 1, 709607, 1010490, '2025-03-24 20:58:13.598', 6032683, NULL, NULL, true, 0, NULL, false, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150398140, '2025-03-25', 0, 1, 709607, 1010490, '2025-03-25 20:11:04.337', 6033591, NULL, NULL, true, 0, NULL, false, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418387, '2025-03-26', 1, 1, 709607, 1010490, '2025-03-26 19:58:27.446', 6034452, NULL, NULL, true, 0, NULL, false, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418588, '2025-03-10', 1, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418599, '2025-03-20', 1, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418601, '2025-03-18', 1, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418638, '2025-03-21', 1, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418642, '2025-03-07', 0, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, '2025-04-02 21:15:29.000', 6039319, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418657, '2025-03-14', 0, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418664, '2025-03-12', 1, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418667, '2025-03-19', 0, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418691, '2025-03-17', 0, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418696, '2025-03-13', 1, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418722, '2025-03-06', 1, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150418749, '2025-03-11', 0, 1, 709607, 1010490, '2025-03-26 20:14:04.000', 6034459, '2025-04-02 21:15:29.000', 6039319, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150436859, '2025-03-27', 0, 1, 709607, 1010490, '2025-03-27 19:55:26.000', 6035278, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150455215, '2025-03-28', 0, 1, 709607, 1010490, '2025-03-28 20:00:06.000', 6036035, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150559418, '2025-04-03', 1, 1, 709607, 1010490, '2025-04-03 20:16:55.000', 6040206, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150559425, '2025-03-31', 1, 1, 709607, 1010490, '2025-04-03 20:16:55.000', 6040206, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150559456, '2025-04-02', 1, 1, 709607, 1010490, '2025-04-03 20:16:55.000', 6040206, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150559466, '2025-04-01', 1, 1, 709607, 1010490, '2025-04-03 20:16:55.000', 6040206, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150579367, '2025-04-04', 0, 1, 709607, 1010490, '2025-04-04 20:44:10.000', 6040974, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150653685, '2025-04-09', 0, 1, 709607, 1010490, '2025-04-09 20:54:30.000', 6043978, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150653700, '2025-04-07', 0, 1, 709607, 1010490, '2025-04-09 20:54:30.000', 6043978, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150653716, '2025-04-08', 0, 1, 709607, 1010490, '2025-04-09 20:54:30.000', 6043978, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150709548, '2025-04-14', 1, 1, 709607, 1010490, '2025-04-14 17:07:20.000', 6046371, '2025-04-21 08:35:14.000', 6048389, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150709558, '2025-04-11', 1, 1, 709607, 1010490, '2025-04-14 17:07:20.000', 6046371, '2025-04-21 08:35:14.000', 6048389, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150709561, '2025-04-10', 1, 1, 709607, 1010490, '2025-04-14 17:07:20.000', 6046371, '2025-04-14 20:53:52.000', 6046468, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150728540, '2025-04-15', 1, 1, 709607, 1010490, '2025-04-15 15:18:49.000', 6047173, '2025-04-21 08:35:14.000', 6048389, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150766546, '2025-04-16', 1, 1, 709607, 1010490, '2025-04-21 08:35:14.000', 6048389, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150794704, '2025-04-22', 0, 1, 709607, 1010490, '2025-04-22 20:40:17.000', 6049458, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150825132, '2025-04-24', 1, 1, 709607, 1010490, '2025-04-24 20:02:30.000', 6050750, '2025-04-25 08:56:16.000', 6050956, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150901288, '2025-04-28', 0, 1, 709607, 1010490, '2025-04-29 20:53:51.000', 6053669, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150901302, '2025-04-25', 0, 1, 709607, 1010490, '2025-04-29 20:53:51.000', 6053669, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150901327, '2025-04-29', 0, 1, 709607, 1010490, '2025-04-29 20:53:51.000', 6053669, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150968399, '2025-04-30', 0, 1, 709607, 1010490, '2025-05-06 08:32:32.000', 6056419, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150968431, '2025-05-06', 0, 1, 709607, 1010490, '2025-05-06 08:32:32.000', 6056419, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150968435, '2025-05-05', 0, 1, 709607, 1010490, '2025-05-06 08:32:32.000', 6056419, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(150968441, '2025-05-02', 0, 1, 709607, 1010490, '2025-05-06 08:32:32.000', 6056419, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(151022096, '2025-05-07', 1, 1, 709607, 1010490, '2025-05-08 19:47:02.000', 6058980, '2025-05-08 19:56:37.000', 6058980, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(151022090, '2025-05-08', 1, 1, 709607, 1010490, '2025-05-08 19:47:02.000', 6058980, '2025-05-08 19:56:37.000', 6058980, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(151099267, '2025-05-09', 0, 1, 709607, 1010490, '2025-05-14 11:07:08.000', 6062216, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(151099300, '2025-05-13', 0, 1, 709607, 1010490, '2025-05-14 11:07:08.000', 6062216, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(151099303, '2025-05-12', 0, 1, 709607, 1010490, '2025-05-14 11:07:08.000', 6062216, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(151204924, '2025-05-15', 0, 1, 709607, 1010490, '2025-05-20 20:19:48.000', 6066849, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(151204939, '2025-05-14', 0, 1, 709607, 1010490, '2025-05-20 20:19:48.000', 6066849, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola) VALUES(151204949, '2025-05-16', 0, 1, 709607, 1010490, '2025-05-20 20:19:48.000', 6066849, NULL, NULL, true, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO basico.alteracao_matricula_serie (id_alteracao_matricula_serie, id_usuario, id_matricula_discente_serie, id_situacao_matricula_serie_nova, data_alteracao, codmovimento, id_movimentacao_aluno, observacao, id_situacao_matricula_serie_antiga, id_escola_etapa_ensino_serie_antiga, id_escola_etapa_ensino_serie_nova, id_turno_antigo, id_turno_novo, id_turma_serie_antiga, id_turma_serie_nova, motivo) VALUES(699336, 105011, 1385381, 5, '2025-05-21 21:58:02.667', 4008, 78815, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO basico.alteracao_matricula_serie (id_alteracao_matricula_serie, id_usuario, id_matricula_discente_serie, id_situacao_matricula_serie_nova, data_alteracao, codmovimento, id_movimentacao_aluno, observacao, id_situacao_matricula_serie_antiga, id_escola_etapa_ensino_serie_antiga, id_escola_etapa_ensino_serie_nova, id_turno_antigo, id_turno_novo, id_turma_serie_antiga, id_turma_serie_nova, motivo) VALUES(699808, 105011, 1385381, 1, '2025-07-27 09:23:21.426', 4009, 78815, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO basico.alteracao_matricula_serie (id_alteracao_matricula_serie, id_usuario, id_matricula_discente_serie, id_situacao_matricula_serie_nova, data_alteracao, codmovimento, id_movimentacao_aluno, observacao, id_situacao_matricula_serie_antiga, id_escola_etapa_ensino_serie_antiga, id_escola_etapa_ensino_serie_nova, id_turno_antigo, id_turno_novo, id_turma_serie_antiga, id_turma_serie_nova, motivo) VALUES(699809, 105011, 1385381, 5, '2025-07-27 09:25:48.763', 4008, 79144, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.observacao_discente (id_observacao_discente, observacao, enviar_email, ultima_atualizacao, id_matricula, id_discente, id_registro, "data", id_movimentacao, ativo) VALUES(541666712, 'SEGUNDO A PROFESSORA CLARENICE A ALUNA NUNCA COMPARECEU!', false, '2025-05-21 21:58:02.705', NULL, 1010490, NULL, '2025-05-21 21:58:02.705', 78815, false);
INSERT INTO ensino.observacao_discente (id_observacao_discente, observacao, enviar_email, ultima_atualizacao, id_matricula, id_discente, id_registro, "data", id_movimentacao, ativo) VALUES(544332910, 'SEGUNDO A PROFESSORA CLARENICE A ALUNA NUNCA COMPARECEU!', false, '2025-07-27 09:25:48.813', NULL, 1010490, NULL, '2025-07-27 09:25:48.813', 79144, true);

INSERT INTO ensino.matricula_componente (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito) VALUES(7, 1010490, 0.00, NULL, 17843102, 712064, NULL, NULL, NULL, '2025-03-20 20:17:02.502', 2025, 1, 513, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, false, false, false, 1385381, NULL, NULL, NULL, false);
INSERT INTO ensino.matricula_componente (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito) VALUES(7, 1010490, 0.00, 2, 17843103, 709607, NULL, NULL, NULL, '2025-03-20 20:17:02.502', 2025, 1, 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.7, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, 6034452, NULL, NULL, 1, NULL, NULL, NULL, false, false, false, 1385381, NULL, NULL, NULL, false);

INSERT INTO matricula.emissao_documento_matricula (id_emissao_documento_matricula, id_tipo_documento, id_matricula_estudante_serie, id_registro_entrada, data_emissao) VALUES(892675, 1, 1385381, 6024648, '2025-03-11');
INSERT INTO matricula.emissao_documento_matricula (id_emissao_documento_matricula, id_tipo_documento, id_matricula_estudante_serie, id_registro_entrada, data_emissao) VALUES(889994, 1, 1385381, 6016701, '2025-02-05');
INSERT INTO matricula.emissao_documento_matricula (id_emissao_documento_matricula, id_tipo_documento, id_matricula_estudante_serie, id_registro_entrada, data_emissao) VALUES(889995, 2, 1385381, 6016701, '2025-02-05');
INSERT INTO matricula.emissao_documento_matricula (id_emissao_documento_matricula, id_tipo_documento, id_matricula_estudante_serie, id_registro_entrada, data_emissao) VALUES(889996, 3, 1385381, 6016701, '2025-02-05');

INSERT INTO basico.movimentacao_estudante (id_movimentacao_estudante, id_discente, data_ocorrencia, data_retorno, data_cadastro_retorno, id_usuario_cadastro, id_usuario_retorno, ativo, codmergpa, periodo_referencia, observacao, valor_movimentacao, id_usuario_cancelamento, data_estorno, apostilamento, codmergpapos, inicio_afastamento, apo_inferido, apo_anterior, apo_ano, tipo_retorno, limite_trancamento, x, ano_ocorrencia, periodo_ocorrencia, id_tipo_movimentacao_estudante, ano_escolar, id_motivo_abandono, abandono, data_falecimento) VALUES(78815, 1010490, '2025-05-21 21:58:02.615', NULL, NULL, 105011, NULL, false, NULL, NULL, 'SEGUNDO A PROFESSORA CLARENICE A ALUNA NUNCA COMPARECEU!', NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, 5, 2025, NULL, NULL, NULL);
INSERT INTO basico.movimentacao_estudante (id_movimentacao_estudante, id_discente, data_ocorrencia, data_retorno, data_cadastro_retorno, id_usuario_cadastro, id_usuario_retorno, ativo, codmergpa, periodo_referencia, observacao, valor_movimentacao, id_usuario_cancelamento, data_estorno, apostilamento, codmergpapos, inicio_afastamento, apo_inferido, apo_anterior, apo_ano, tipo_retorno, limite_trancamento, x, ano_ocorrencia, periodo_ocorrencia, id_tipo_movimentacao_estudante, ano_escolar, id_motivo_abandono, abandono, data_falecimento) VALUES(79144, 1010490, '2025-07-27 09:25:48.719', NULL, NULL, 105011, NULL, true, NULL, NULL, 'SEGUNDO A PROFESSORA CLARENICE A ALUNA NUNCA COMPARECEU!', NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, 5, 2025, NULL, NULL, NULL);

INSERT INTO comum.alteracao_status_aluno (id_alteracao, status, "data", id_usuario, movimento, id_discente, ano, periodo, observacao) VALUES(544332880, 1, '2025-07-27 09:23:21.082', 105011, 4009, 1010490, 2025, NULL, NULL);

INSERT INTO basico.matricula_estudante_serie (id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie, bloquear_renovacao) VALUES(1385381, 1010490, 5, NULL, NULL, 51977270, false, 6016701, '2025-02-05 14:02:51.606', NULL, 52466764, 2025, 518752290, NULL, 1, 'N', NULL, NULL, NULL, NULL, NULL, NULL, 6114012, '2025-07-27 09:25:48.000', false, NULL, '2025-02-05 14:02:29.721', NULL, NULL, 1, false);

INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca, id_tipo_instituicao_origem) VALUES(1010490, 51977261, 'ESCOLA MUNICIPAL PADRE PEDRO', NULL, NULL, false, true, '2025-07-27', 6114012, NULL, false, false, 3);

INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(1010490, 2025, NULL, '202530020692', NULL, 746592, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2025-02-05 14:02:51.365', NULL, 6016701, NULL, NULL, NULL, NULL, NULL, NULL);

--
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula) VALUES(746592, 'ANA PAULA DOS SANTOS DE ANDRADE', '1980-01-01', 'F', 1, NULL, NULL, NULL, NULL, NULL, 83800751534, 31, NULL, 'JOSÉ AUGUSTO DOS SANTOS', 'Conteúdo protegido ', 'desenv@esig.com.br', NULL, 'Testes', 28, 2800308, '1446', 'F', false, '2025-09-04 11:42:54.362', 'Rua Desenvolvimento/Treinamento, 99999', 518926350, '', '', '', '', NULL, '1552942', 'SSP', 28, '2010-03-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(79)99182-6371', NULL, '2023-02-13 09:04:46.062', 'ANA PAULA DOS SANTOS DE ANDRADE', NULL, NULL, 'BRASILEIRA', false, '0', 'N', '', '', '', NULL, 2804805, '', '11048601551980100125092002515377', NULL, 'Testes', NULL, 'ANA PAULA DOS SANTOS', '', NULL, '1552942', '49160-000', NULL, 2804805, 28, NULL, '', '', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '700501592227155', 53878447, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, 28, 28, NULL, false, '', '', 'ANA PAULA', '', '', NULL, NULL, '', NULL, NULL, '', '0', NULL, NULL, NULL, NULL, false, '', 0, 0, NULL, NULL, NULL);

INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, codigo_rh, id_designacao, codigo_rh_pessoa_old, codigo_rh_pessoa_new, codigo_rh_old, reducao_regime, codigo_inep, qualificacao, codigo_legado, data_ultimo_login_mobile, id_entrada, ja_alocado_completamente_apos_encaminhamento, id_tipo_contrato_servidor, forma_vacancia, data_resposta_ficha_atualizacao, id_instituicao, justificativa_finalizacao, justificativa_reducao_regime, justificativa_remocao_reducao_regime, ds_referencia, id_registro_atualizacao, id_registro_cadastro, id_classe_servidor, numero_contrato_1, numero_contrato_2, id_unidade_transferida, data_transferencia, salario, numero_termo_aditivo, quantidade_meses_termo_aditivo) VALUES(1013, '000513', 746592, NULL, '1', NULL, 1, 1, 2, 807, NULL, NULL, NULL, 0.00, NULL, 27223950, NULL, 30, false, '1', NULL, NULL, NULL, NULL, NULL, '2025-09-04 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6148385, 5624177, 11, '', '', 605, '2015-09-01 00:00:00.000', 0.00, NULL, NULL);

UPDATE comum.usuario SET id_pessoa=746592 WHERE id_usuario=105040;

UPDATE pessoas.historico_servidor_terceirizado	SET id_servidor=1013 WHERE id_historico_servidor_terceirizado in (54497103, 54497112, 54497129);

UPDATE rh.historico_transferencia_servidores SET id_servidor=1013 WHERE id_historico_transferencia_servidor=52415015;

UPDATE comum.alteracao_pessoa SET id_pessoa=746592 WHERE id_alteracao_pessoa in (518926340,518926341,524142086,535442063,544971040,544971115,544970391);

UPDATE educacenso.educacenso_pessoa SET id_pessoa=746592 WHERE id_educacenso_pessoa=493;

UPDATE public.discente SET id_pessoa=746592 WHERE id_discente=1010490;

begin;

--banco Comum
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula) VALUES(746592, 'ANA PAULA DOS SANTOS DE ANDRADE', '1980-01-01', 'F', 1, NULL, NULL, NULL, NULL, NULL, 83800751534, 31, NULL, 'JOSÉ AUGUSTO DOS SANTOS', 'Conteúdo protegido ', 'desenv@esig.com.br', NULL, 'Testes', 28, 2800308, '1446', 'F', false, '2025-09-04 11:42:54.362', 'Rua Desenvolvimento/Treinamento, 99999', 518926350, '', '', '', '', NULL, '1552942', 'SSP', 28, '2010-03-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(79)99182-6371', NULL, '2023-02-13 09:04:46.062', 'ANA PAULA DOS SANTOS DE ANDRADE', NULL, NULL, 'BRASILEIRA', false, '0', 'N', '', '', '', NULL, 2804805, '', '11048601551980100125092002515377', NULL, 'Testes', NULL, 'ANA PAULA DOS SANTOS', '', NULL, '1552942', '49160-000', NULL, 2804805, 28, NULL, '', '', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '700501592227155', 53878447, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, 28, 28, NULL, false, '', '', 'ANA PAULA', '', '', NULL, NULL, '', NULL, NULL, '', '0', NULL, NULL, NULL, NULL, false, '', 0, 0, NULL, NULL, NULL);

INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, codigo_rh, id_designacao, codigo_rh_pessoa_old, codigo_rh_pessoa_new, codigo_rh_old, reducao_regime, codigo_inep, qualificacao, codigo_legado, data_ultimo_login_mobile, id_entrada, ja_alocado_completamente_apos_encaminhamento, id_tipo_contrato_servidor, forma_vacancia, data_resposta_ficha_atualizacao, id_instituicao, justificativa_finalizacao, justificativa_reducao_regime, justificativa_remocao_reducao_regime, ds_referencia, id_registro_atualizacao, id_registro_cadastro, id_classe_servidor, numero_contrato_1, numero_contrato_2, id_unidade_transferida, data_transferencia, salario, numero_termo_aditivo, quantidade_meses_termo_aditivo) VALUES(1013, '000513', 746592, NULL, '1', NULL, 1, 1, 2, 807, NULL, NULL, NULL, 0.00, NULL, 27223950, NULL, 30, false, '1', NULL, NULL, NULL, NULL, NULL, '2025-09-04 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6148385, 5624177, 11, '', '', 605, '2015-09-01 00:00:00.000', 0.00, NULL, NULL);

UPDATE comum.usuario SET id_pessoa=746592 WHERE id_usuario=105040;

DELETE FROM comum.pessoa WHERE id_pessoa=54378358;

rollback;



INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula) VALUES(746592, 'ANA PAULA DOS SANTOS DE ANDRADE', '1980-01-01', 'F', 1, NULL, NULL, NULL, NULL, NULL, 83800751534, 31, NULL, 'JOSÉ AUGUSTO DOS SANTOS', 'Conteúdo protegido ', 'desenv@esig.com.br', NULL, 'Testes', 28, 2800308, '1446', 'F', false, '2025-09-04 11:42:54.362', 'Rua Desenvolvimento/Treinamento, 99999', 518926350, '', '', '', '', NULL, '1552942', 'SSP', 28, '2010-03-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(79)99182-6371', NULL, '2023-02-13 09:04:46.062', 'ANA PAULA DOS SANTOS DE ANDRADE', NULL, NULL, 'BRASILEIRA', false, '0', 'N', '', '', '', NULL, 2804805, '', '11048601551980100125092002515377', NULL, 'Testes', NULL, 'ANA PAULA DOS SANTOS', '', NULL, '1552942', '49160-000', NULL, 2804805, 28, NULL, '', '', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '700501592227155', 53878447, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, 28, 28, NULL, false, '', '', 'ANA PAULA', '', '', NULL, NULL, '', NULL, NULL, '', '0', NULL, NULL, NULL, NULL, false, '', 0, 0, NULL, NULL, NULL);

INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, codigo_rh, id_designacao, codigo_rh_pessoa_old, codigo_rh_pessoa_new, codigo_rh_old, reducao_regime, codigo_inep, qualificacao, codigo_legado, data_ultimo_login_mobile, id_entrada, ja_alocado_completamente_apos_encaminhamento, id_tipo_contrato_servidor, forma_vacancia, data_resposta_ficha_atualizacao, id_instituicao, justificativa_finalizacao, justificativa_reducao_regime, justificativa_remocao_reducao_regime, ds_referencia, id_registro_atualizacao, id_registro_cadastro, id_classe_servidor, numero_contrato_1, numero_contrato_2, id_unidade_transferida, data_transferencia, salario, numero_termo_aditivo, quantidade_meses_termo_aditivo) VALUES(1013, '000513', 746592, NULL, '1', NULL, 1, 1, 2, 807, NULL, NULL, NULL, 0.00, NULL, 27223950, NULL, 30, false, '1', NULL, NULL, NULL, NULL, NULL, '2025-09-04 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6148385, 5624177, 11, '', '', 605, '2015-09-01 00:00:00.000', 0.00, NULL, NULL);

UPDATE comum.usuario SET id_pessoa=746592 WHERE id_usuario=105040;

UPDATE pessoas.historico_servidor_terceirizado	SET id_servidor=1013 WHERE id_historico_servidor_terceirizado in (54497103, 54497112, 54497129);

UPDATE rh.historico_transferencia_servidores SET id_servidor=1013 WHERE id_historico_transferencia_servidor=52415015;


commit;


	
	select
	count(distinct s.id_servidor)
from
	rh.servidor s
left join comum.pessoa p
		using (id_pessoa)
left join comum.unidade u on
	u.id_unidade = s.id_unidade
left join comum.responsavel_unidade ru on
	ru.id_servidor = s.id_servidor
left join rh.categoria c
		using (id_categoria)
left join rh.situacao_servidor ss
		using (id_situacao)
left join rh.escolaridade e on
	e.id_escolaridade = p.id_escolaridade
left join rh.formacao f
		using (id_formacao)
where
	1 = 1
	--and s.tipo_vinculo = ?
	and s.id_ativo = 1
	
select
	distinct s.id_servidor,
	s.siape,
	s.digito_siape,
	s.data_transferencia,
	s.tipo_vinculo,
	p.id_pessoa,
	p.cpf_cnpj,
	p.nome,
	p.email,
	p.sexo,
	u.id_unidade,
	u.codigo_unidade,
	u.nome as unidade,
	c.id_categoria,
	c.descricao as categoria,
	ss.id_situacao,
	ss.descricao as situacao,
	e.id_escolaridade,
	e.descricao as escolaridade,
	f.id_formacao,
	f.denominacao as formacao ,
	cargo.denominacao as denominacaoCargo
from
	rh.servidor s
left join comum.pessoa p
		using (id_pessoa)
left join comum.unidade u on
	u.id_unidade = s.id_unidade
left join comum.responsavel_unidade ru on
	ru.id_servidor = s.id_servidor
left join rh.categoria c
		using (id_categoria)
left join rh.cargo cargo on
	cargo.id_cargo = s.id_cargo
left join rh.situacao_servidor ss
		using (id_situacao)
left join rh.escolaridade e on
	e.id_escolaridade = p.id_escolaridade
left join rh.formacao f
		using (id_formacao)
where
	1 = 1
	and upper(p.nome) like upper('%ANA PAULA DOS SANTOS%')
	and s.id_ativo = 1
order by
	p.nome asc
limit 100 offset 0;


2015-09-01 00:00:00.000

select s.id_unidade_transferida  from rh.servidor s where s.id_servidor = 1013;
begin;

UPDATE rh.servidor SET data_transferencia='2015-09-01 00:00:00.000', id_unidade_transferida = 605 WHERE id_servidor =  54381361;

UPDATE rh.servidor SET data_transferencia=NULL, id_unidade_transferida = NULL WHERE id_servidor =  54381361;


1013