--SELECIONA POR TURMA  EFAIV23B
select * 
from ensino.docente_turma dt
where dt.id_turma = 683211;

select * from ensino.docente_turma_alteracao
where id_docente_turma = 52445855;


---backup ensino.docente_turma
INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(18, 2356, 52445855, 683211, NULL, NULL, NULL, '2023-09-04 16:01:45.896', NULL, true, '2023-12-23 00:00:00.000', '2023-12-29 00:00:00.000', NULL, NULL, false, true, false, false, NULL, false, NULL, 'A professora será alocada no 4º ano.', 5695958, 5695958, '2023-09-04 16:02:33.629', NULL, NULL, NULL, false);

---backup Maria 2023-08-03
UPDATE ensino.docente_turma
SET ch_dedicada_periodo=18, id_docente=2356, id_turma=683211, id_docente_externo=NULL, docext=NULL, nova=NULL, data_cadastro='2023-09-04 15:16:37.567', codigo_rh=NULL, ativo=true, data_inicio='2023-08-03 00:00:00.000', data_fim='2023-12-22 00:00:00.000', id_turma_auxiliar=NULL, tipo_participacao=NULL, suplementar=false, finalizada=true, complementar=false, auxiliar=false, justificativa_ch_alternativa=NULL, ch_alternativa=false, id_afastamento=NULL, justificativa_cancelamento='A professora será alocada no 4º ano.', id_registro_cadastro=5695958, id_registro_atualizacao=5695958, data_alteracao='2023-09-04 15:18:36.936', id_atividade_ape=NULL, id_encaminhamento_candidato_escola=NULL, justificativa_alocacao=NULL, regra_excecao_validacao_regras_alocacao_qualificacao=false
WHERE id_docente_turma=52445778;

UPDATE ensino.docente_turma_alteracao
SET id_docente_turma=52445855, data_inicio='2023-12-23 00:00:00.000', data_fim='2023-12-29 00:00:00.000', id_usuario=104990, data_cadastro='2023-09-04 00:00:00.000'
WHERE id_docente_turma_alteracao=52445856;

INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(18, 2356, 52445855, 683211, NULL, NULL, NULL, '2023-09-04 16:01:45.896', NULL, true, '2023-12-23 00:00:00.000', '2023-12-29 00:00:00.000', NULL, NULL, false, true, false, false, NULL, false, NULL, 'A professora será alocada no 4º ano.', 5695958, 5695958, '2023-09-04 16:02:33.629', NULL, NULL, NULL, false);

UPDATE ensino.docente_turma
	SET data_inicio='2023-08-03 00:00:00.000'
	WHERE id_docente_turma=52445778;

UPDATE ensino.docente_turma_alteracao
	SET id_docente_turma=52445855
	WHERE id_docente_turma_alteracao=52445856;


---Solução 

DELETE FROM ensino.docente_turma
WHERE id_docente_turma=52445855;

UPDATE ensino.docente_turma
	SET data_inicio='2023-08-05 00:00:00.000 -0300'
	WHERE id_docente_turma=52445778;

-- Auto-generated SQL script #202309061620
UPDATE ensino.docente_turma_alteracao
	SET id_docente_turma=52445778
	WHERE id_docente_turma_alteracao=52445856;






begin;

commit;

rollback;


