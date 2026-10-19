select * from ensino.matricula_componente where id_turma in (683931, 683926, 683933, 683929, 683928, 683927, 683930, 683932);
select string_agg(id_turma :: varchar , ', ') from ensino.turma t where t.id_turma_serie  = 51913677;


select * from ensino.matricula_componente where id_turma  = 683926 and id_discente = 980723;

select * from ensino.alteracao_matricula am where am.id_matricula_disciplina in (17169067);
begin;

rollback;

UPDATE basico.matricula_estudante_serie SET id_situacao_matricula_serie = 2, id_usuario_consolidacao = 1, data_consolidacao = now()  WHERE id_matricula_discente_serie = 1324394;; 
UPDATE ensino.matricula_componente SET media_anual = null, media_anual_modulo = null, media_final = 0.0, recuperacao = null, numero_faltas = 0, frequencia = 100.0, id_usuario_consolidacao = 1, data_consolidacao = now(), id_situacao_matricula = 5 WHERE id_matricula_componente = 17169072;  
UPDATE ensino.matricula_componente SET media_anual = null, media_anual_modulo = null, media_final = 0.0, recuperacao = null, numero_faltas = 28, frequencia = 81.6, id_usuario_consolidacao = 1, data_consolidacao = now(), id_situacao_matricula = 5 WHERE id_matricula_componente = 17169067;  
UPDATE ensino.matricula_componente SET media_anual = null, media_anual_modulo = null, media_final = 0.0, recuperacao = null, numero_faltas = 28, frequencia = 81.6, id_usuario_consolidacao = 1, data_consolidacao = now(), id_situacao_matricula = 5 WHERE id_matricula_componente = 17023689;  
UPDATE ensino.matricula_componente SET media_anual = null, media_anual_modulo = null, media_final = 0.0, recuperacao = null, numero_faltas = 0, frequencia = 100.0, id_usuario_consolidacao = 1, data_consolidacao = now(), id_situacao_matricula = 5 WHERE id_matricula_componente = 17169070;  
UPDATE ensino.matricula_componente SET media_anual = null, media_anual_modulo = null, media_final = 0.0, recuperacao = null, numero_faltas = 0, frequencia = 100.0, id_usuario_consolidacao = 1, data_consolidacao = now(), id_situacao_matricula = 5 WHERE id_matricula_componente = 17169066;  
UPDATE ensino.matricula_componente SET media_anual = null, media_anual_modulo = null, media_final = 0.0, recuperacao = null, numero_faltas = 0, frequencia = 100.0, id_usuario_consolidacao = 1, data_consolidacao = now(), id_situacao_matricula = 5 WHERE id_matricula_componente = 17169068; 
UPDATE ensino.matricula_componente SET media_anual = null, media_anual_modulo = null, media_final = 0.0, recuperacao = null, numero_faltas = 0, frequencia = 100.0, id_usuario_consolidacao = 1, data_consolidacao = now(), id_situacao_matricula = 5 WHERE id_matricula_componente = 17169073;  
UPDATE ensino.matricula_componente SET media_anual = null, media_anual_modulo = null, media_final = 0.0, recuperacao = null, numero_faltas = 0, frequencia = 100.0, id_usuario_consolidacao = 1, data_consolidacao = now(), id_situacao_matricula = 5 WHERE id_matricula_componente = 17169069;  
UPDATE ensino.matricula_componente SET media_anual = null, media_anual_modulo = null, media_final = 0.0, recuperacao = null, numero_faltas = 0, frequencia = 100.0, id_usuario_consolidacao = 1, data_consolidacao = now(), id_situacao_matricula = 5 WHERE id_matricula_componente = 17169071; 


Detalhe: Key (id_discente, id_situacao_matricula, id_turma)=(980723, 5, 683926)


DELETE FROM ensino.matricula_componente WHERE id_matricula_componente=17023689;

INSERT INTO ensino.matricula_componente (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito) VALUES(2, 980723, 0.00, 28, 17023689, 683926, NULL, NULL, NULL, '2022-01-25 14:25:52.801', 2022, NULL, 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86.7, NULL, 0.0, NULL, NULL, NULL, '2025-07-30 15:16:16.297', NULL, 6052014, NULL, NULL, 1, NULL, NULL, NULL, false, false, false, NULL, NULL, NULL, NULL, false);

-- Auto-generated SQL script #202507301535
UPDATE ensino.matricula_componente
	SET id_situacao_matricula=5
	WHERE id_matricula_componente=17023689;




-- Auto-generated SQL script #202507301535
UPDATE ensino.matricula_componente
	SET id_situacao_matricula=2
	WHERE id_matricula_componente=17023689;
