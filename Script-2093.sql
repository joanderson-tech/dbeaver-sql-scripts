--solucao

begin;

-- ESTRUTURAS DO GRUPO 1

--Cria tabela temporaria vazia
select *
into temp turmas_grupo_1
from ensino.turma limit 0;

-- insere os registros na tabela temporaria
INSERT INTO turmas_grupo_1 
(ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, id_turma, codigo, tipo, id_registro_cadastro, data_cadastro, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, nota, extra, ordem, permite_multiplos_professores) values
(2026, 1, 1, 13, 518, nextval('ensino.turma_seq'), 'EICRINTG1A', 1, 8022614, now(), 804754, false, 1, 84521648, false, false, 6, false),
(2026, 1, 1, 13, 283, nextval('ensino.turma_seq'), 'EICRINTG1A', 1, 8022614, now(), 804754, false, 1, 84521648, false, false, 7, false)
returning id_turma;

--Backup para deletar as turmas criadas
select 
 'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';' as backup
from turmas_grupo_1;

--Criando as turmas componentes do GRUPO 1
insert into ensino.turma
select * from turmas_grupo_1; -- 2 registros

----**Criacao de matriculas componentes**

--Cria tabela temporaria para matricula_componente 518
select *
into temp mc_temp_grupo_1_518
from ensino.matricula_componente mc
limit 0;

--518 - Ateliê
INSERT INTO mc_temp_grupo_1_518 (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito)
SELECT
    mc.id_situacao_matricula,
    mc.id_discente,
    mc.media_final,
    mc.numero_faltas,
    nextval('ensino.matricula_componente_seq'),
    tg.id_turma,
    mc.id_recuperacao,
    mc.apto,
    mc.id_registro_cadastro,
    mc.data_cadastro,
    mc.ano,
    mc.periodo,
    518,
    mc.id_restricoes,
    mc.recuperacao,
    mc.observacao,
    mc.id_usuario_consolidacao,
    mc.data_consolidacao,
    mc.rematricula,
    mc.media_anual,
    mc.frequencia,
    mc.id_matricula_componente_importada,
    mc.prova_especial,
    mc.id_historico_implantado,
    mc.media_anual_modulo,
    mc.motivo_exclusao,
    mc.data_atualizacao,
    mc.justificativa_aproveitamento,
    mc.id_registro_atualizacao,
    mc.data_reabertura_ficha,
    mc.data_alteracao_aproveitamento,
    mc.id_tipo_matricula_componente,
    mc.escola_aproveitamento,
    mc.id_aproveitamento,
    mc.media_exame_nacional,
    mc.ausente_recuperacao,
    mc.nao_optou,
    mc.conselho_classe,
    mc.id_matricula_estudante_serie,
    mc.carga_horaria_implantada,
    mc.parecer_descritivo_implantado,
    mc.conceito_implantado,
    mc.avaliacao_por_conceito
FROM ensino.matricula_componente mc
join turmas_grupo_1 tg on tg.id_disciplina = 518
WHERE mc.id_turma IN (821992);

--Backup para deletar matriculas
select 
'DELETE FROM ensino.matricula_componente WHERE id_matricula_componente = ' || id_matricula_componente || ';' as backup
from mc_temp_grupo_1_518;

--Inserindo matricula componentes
insert into ensino.matricula_componente
select * from mc_temp_grupo_1_518; -- 13 registros

--Cria tabela temporaria para matricula_componente 283
select *
into temp mc_temp_grupo_1_283
from ensino.matricula_componente mc
limit 0;

--283 - PSICOMOTRICIDADE
INSERT INTO mc_temp_grupo_1_283 (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito)
SELECT
    mc.id_situacao_matricula,
    mc.id_discente,
    mc.media_final,
    mc.numero_faltas,
    nextval('ensino.matricula_componente_seq'),
    tg.id_turma,
    mc.id_recuperacao,
    mc.apto,
    mc.id_registro_cadastro,
    mc.data_cadastro,
    mc.ano,
    mc.periodo,
    283,
    mc.id_restricoes,
    mc.recuperacao,
    mc.observacao,
    mc.id_usuario_consolidacao,
    mc.data_consolidacao,
    mc.rematricula,
    mc.media_anual,
    mc.frequencia,
    mc.id_matricula_componente_importada,
    mc.prova_especial,
    mc.id_historico_implantado,
    mc.media_anual_modulo,
    mc.motivo_exclusao,
    mc.data_atualizacao,
    mc.justificativa_aproveitamento,
    mc.id_registro_atualizacao,
    mc.data_reabertura_ficha,
    mc.data_alteracao_aproveitamento,
    mc.id_tipo_matricula_componente,
    mc.escola_aproveitamento,
    mc.id_aproveitamento,
    mc.media_exame_nacional,
    mc.ausente_recuperacao,
    mc.nao_optou,
    mc.conselho_classe,
    mc.id_matricula_estudante_serie,
    mc.carga_horaria_implantada,
    mc.parecer_descritivo_implantado,
    mc.conceito_implantado,
    mc.avaliacao_por_conceito
FROM ensino.matricula_componente mc
join turmas_grupo_1 tg on tg.id_disciplina = 283
WHERE mc.id_turma IN (821992);

--Backup para deletar matriculas
select 
'DELETE FROM ensino.matricula_componente WHERE id_matricula_componente = ' || id_matricula_componente || ';' as backup
from mc_temp_grupo_1_283;

--Inserindo matricula componentes
insert into ensino.matricula_componente
select * from mc_temp_grupo_1_283; -- 13 registros


-- GRUPO 2

-- ESTRUTURAS DO GRUPO 2

--Cria tabela temporaria vazia
select *
into temp turmas_grupo_2
from ensino.turma limit 0;

-- insere os registros na tabela temporaria
INSERT INTO turmas_grupo_2
(ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, id_turma, codigo, tipo, id_registro_cadastro, data_cadastro, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, nota, extra, ordem, permite_multiplos_professores) values
(2026, 1, 1, 20, 518, nextval('ensino.turma_seq'), 'EICRINTG2A', 1, 8022614, now(), 804097, false, 1, 84520991, false, false, 6, false),
(2026, 1, 1, 20, 283, nextval('ensino.turma_seq'), 'EICRINTG2A', 1, 8022614, now(), 804097, false, 1, 84520991, false, false, 7, false)
returning id_turma;

--Backup para deletar as turmas criadas
select 
 'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';' as backup
from turmas_grupo_2;

--Criando as turmas componentes do GRUPO 2 - NOSSA INFANCIA TIA DULCINEIA
insert into ensino.turma
select * from turmas_grupo_2; -- 2 registros

----**Criacao de matriculas componentes**

--Cria tabela temporaria para matricula_componente 518
select *
into temp mc_temp_grupo_2_518
from ensino.matricula_componente mc
limit 0;

--518 - Ateliê
INSERT INTO mc_temp_grupo_2_518 (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito)
SELECT
    mc.id_situacao_matricula,
    mc.id_discente,
    mc.media_final,
    mc.numero_faltas,
    nextval('ensino.matricula_componente_seq'),
    tg.id_turma,
    mc.id_recuperacao,
    mc.apto,
    mc.id_registro_cadastro,
    mc.data_cadastro,
    mc.ano,
    mc.periodo,
    518,
    mc.id_restricoes,
    mc.recuperacao,
    mc.observacao,
    mc.id_usuario_consolidacao,
    mc.data_consolidacao,
    mc.rematricula,
    mc.media_anual,
    mc.frequencia,
    mc.id_matricula_componente_importada,
    mc.prova_especial,
    mc.id_historico_implantado,
    mc.media_anual_modulo,
    mc.motivo_exclusao,
    mc.data_atualizacao,
    mc.justificativa_aproveitamento,
    mc.id_registro_atualizacao,
    mc.data_reabertura_ficha,
    mc.data_alteracao_aproveitamento,
    mc.id_tipo_matricula_componente,
    mc.escola_aproveitamento,
    mc.id_aproveitamento,
    mc.media_exame_nacional,
    mc.ausente_recuperacao,
    mc.nao_optou,
    mc.conselho_classe,
    mc.id_matricula_estudante_serie,
    mc.carga_horaria_implantada,
    mc.parecer_descritivo_implantado,
    mc.conceito_implantado,
    mc.avaliacao_por_conceito
FROM ensino.matricula_componente mc
join turmas_grupo_2 tg on tg.id_disciplina = 518
WHERE mc.id_turma IN (818514);

--Backup para deletar matriculas
select 
'DELETE FROM ensino.matricula_componente WHERE id_matricula_componente = ' || id_matricula_componente || ';' as backup
from mc_temp_grupo_2_518;

--Inserindo matricula componentes
insert into ensino.matricula_componente
select * from mc_temp_grupo_2_518; -- 14 registros

--Cria tabela temporaria para matricula_componente 283
select *
into temp mc_temp_grupo_2_283
from ensino.matricula_componente mc
limit 0;

--283 - PSICOMOTRICIDADE
INSERT INTO mc_temp_grupo_2_283 (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito)
SELECT
    mc.id_situacao_matricula,
    mc.id_discente,
    mc.media_final,
    mc.numero_faltas,
    nextval('ensino.matricula_componente_seq'),
    tg.id_turma,
    mc.id_recuperacao,
    mc.apto,
    mc.id_registro_cadastro,
    mc.data_cadastro,
    mc.ano,
    mc.periodo,
    283,
    mc.id_restricoes,
    mc.recuperacao,
    mc.observacao,
    mc.id_usuario_consolidacao,
    mc.data_consolidacao,
    mc.rematricula,
    mc.media_anual,
    mc.frequencia,
    mc.id_matricula_componente_importada,
    mc.prova_especial,
    mc.id_historico_implantado,
    mc.media_anual_modulo,
    mc.motivo_exclusao,
    mc.data_atualizacao,
    mc.justificativa_aproveitamento,
    mc.id_registro_atualizacao,
    mc.data_reabertura_ficha,
    mc.data_alteracao_aproveitamento,
    mc.id_tipo_matricula_componente,
    mc.escola_aproveitamento,
    mc.id_aproveitamento,
    mc.media_exame_nacional,
    mc.ausente_recuperacao,
    mc.nao_optou,
    mc.conselho_classe,
    mc.id_matricula_estudante_serie,
    mc.carga_horaria_implantada,
    mc.parecer_descritivo_implantado,
    mc.conceito_implantado,
    mc.avaliacao_por_conceito
FROM ensino.matricula_componente mc
join turmas_grupo_2 tg on tg.id_disciplina = 283
WHERE mc.id_turma IN (818514);

--Backup para deletar matriculas
select 
'DELETE FROM ensino.matricula_componente WHERE id_matricula_componente = ' || id_matricula_componente || ';' as backup
from mc_temp_grupo_2_283;

--Inserindo matricula componentes
insert into ensino.matricula_componente
select * from mc_temp_grupo_2_283; -- 14 registros


-- GRUPO 3 SOLUCAO NOSSA INFANCIA TIA DULCINEIA

-- ESTRUTURAS DO GRUPO 3 NOSSA INFANCIA TIA DULCINEIA

--Cria tabela temporaria vazia
select *
into temp turmas_grupo_3_dulcineia
from ensino.turma limit 0;

-- insere os registros na tabela temporaria
INSERT INTO turmas_grupo_3_dulcineia 
(ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, id_turma, codigo, tipo, id_registro_cadastro, data_cadastro, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, nota, extra, ordem, permite_multiplos_professores) values
(2026, 1, 1, 20, 518, nextval('ensino.turma_seq'), 'EICRINTG3A', 1, 8022614, now(), 805041, false, 1, 84521935, false, false, 6, false),
(2026, 1, 1, 20, 283, nextval('ensino.turma_seq'), 'EICRINTG3A', 1, 8022614, now(), 805041, false, 1, 84521935, false, false, 7, false)
returning id_turma;

--Backup para deletar as turmas criadas
select 
 'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';' as backup
from turmas_grupo_3_dulcineia;

--Criando as turmas componentes do GRUPO 3 - NOSSA INFANCIA TIA DULCINEIA
insert into ensino.turma
select * from turmas_grupo_3_dulcineia; -- 2 registros

----**Criacao de matriculas componentes**

--Cria tabela temporaria para matricula_componente 518
select *
into temp mc_temp_grupo_3_518_dulcineia
from ensino.matricula_componente mc
limit 0;

--518 - Ateliê
INSERT INTO mc_temp_grupo_3_518_dulcineia (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito)
SELECT
    mc.id_situacao_matricula,
    mc.id_discente,
    mc.media_final,
    mc.numero_faltas,
    nextval('ensino.matricula_componente_seq'),
    tg.id_turma,
    mc.id_recuperacao,
    mc.apto,
    mc.id_registro_cadastro,
    mc.data_cadastro,
    mc.ano,
    mc.periodo,
    518,
    mc.id_restricoes,
    mc.recuperacao,
    mc.observacao,
    mc.id_usuario_consolidacao,
    mc.data_consolidacao,
    mc.rematricula,
    mc.media_anual,
    mc.frequencia,
    mc.id_matricula_componente_importada,
    mc.prova_especial,
    mc.id_historico_implantado,
    mc.media_anual_modulo,
    mc.motivo_exclusao,
    mc.data_atualizacao,
    mc.justificativa_aproveitamento,
    mc.id_registro_atualizacao,
    mc.data_reabertura_ficha,
    mc.data_alteracao_aproveitamento,
    mc.id_tipo_matricula_componente,
    mc.escola_aproveitamento,
    mc.id_aproveitamento,
    mc.media_exame_nacional,
    mc.ausente_recuperacao,
    mc.nao_optou,
    mc.conselho_classe,
    mc.id_matricula_estudante_serie,
    mc.carga_horaria_implantada,
    mc.parecer_descritivo_implantado,
    mc.conceito_implantado,
    mc.avaliacao_por_conceito
FROM ensino.matricula_componente mc
join turmas_grupo_3_dulcineia tg on tg.id_disciplina = 518
WHERE mc.id_turma IN (823476);

--Backup para deletar matriculas
select 
'DELETE FROM ensino.matricula_componente WHERE id_matricula_componente = ' || id_matricula_componente || ';' as backup
from mc_temp_grupo_3_518_dulcineia;

--Inserindo matricula componentes
insert into ensino.matricula_componente
select * from mc_temp_grupo_3_518_dulcineia; -- 21 registros

--Cria tabela temporaria para matricula_componente 283
select *
into temp mc_temp_grupo_3_283_dulcineia
from ensino.matricula_componente mc
limit 0;

--283 - PSICOMOTRICIDADE
INSERT INTO mc_temp_grupo_3_283_dulcineia (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito)
SELECT
    mc.id_situacao_matricula,
    mc.id_discente,
    mc.media_final,
    mc.numero_faltas,
    nextval('ensino.matricula_componente_seq'),
    tg.id_turma,
    mc.id_recuperacao,
    mc.apto,
    mc.id_registro_cadastro,
    mc.data_cadastro,
    mc.ano,
    mc.periodo,
    283,
    mc.id_restricoes,
    mc.recuperacao,
    mc.observacao,
    mc.id_usuario_consolidacao,
    mc.data_consolidacao,
    mc.rematricula,
    mc.media_anual,
    mc.frequencia,
    mc.id_matricula_componente_importada,
    mc.prova_especial,
    mc.id_historico_implantado,
    mc.media_anual_modulo,
    mc.motivo_exclusao,
    mc.data_atualizacao,
    mc.justificativa_aproveitamento,
    mc.id_registro_atualizacao,
    mc.data_reabertura_ficha,
    mc.data_alteracao_aproveitamento,
    mc.id_tipo_matricula_componente,
    mc.escola_aproveitamento,
    mc.id_aproveitamento,
    mc.media_exame_nacional,
    mc.ausente_recuperacao,
    mc.nao_optou,
    mc.conselho_classe,
    mc.id_matricula_estudante_serie,
    mc.carga_horaria_implantada,
    mc.parecer_descritivo_implantado,
    mc.conceito_implantado,
    mc.avaliacao_por_conceito
FROM ensino.matricula_componente mc
join turmas_grupo_3_dulcineia tg on tg.id_disciplina = 283
WHERE mc.id_turma IN (823476);

--Backup para deletar matriculas
select 
'DELETE FROM ensino.matricula_componente WHERE id_matricula_componente = ' || id_matricula_componente || ';' as backup
from mc_temp_grupo_3_283_dulcineia;

--Inserindo matricula componentes
insert into ensino.matricula_componente
select * from mc_temp_grupo_3_283_dulcineia; -- 21 registros


-- GRUPO 3 SOLUCAO NOSSA INFANCIA DR WASHINGTON BARROS

-- ESTRUTURAS DO GRUPO 3 NOSSA INFANCIA DR WASHINGTON BARROS

--Cria tabela temporaria vazia
select *
into temp turmas_grupo_3_washington
from ensino.turma limit 0;

-- insere os registros na tabela temporaria
INSERT INTO turmas_grupo_3_washington
(ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, id_turma, codigo, tipo, id_registro_cadastro, data_cadastro, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, nota, extra, ordem, permite_multiplos_professores) values
(2026, 1, 1, 20, 518, nextval('ensino.turma_seq'), 'EICRINTG3A', 1, 8022614, now(), 804976, false, 1, 84521870, false, false, 6, false),
(2026, 1, 1, 20, 283, nextval('ensino.turma_seq'), 'EICRINTG3A', 1, 8022614, now(), 804976, false, 1, 84521870, false, false, 7, false)
returning id_turma;

--Backup para deletar as turmas criadas
select 
 'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';' as backup
from turmas_grupo_3_washington;

--Criando as turmas componentes do GRUPO 3 - NOSSA INFANCIA DR WASHINGTON BARROS
insert into ensino.turma
select * from turmas_grupo_3_washington;

----**Criacao de matriculas componentes**

--Cria tabela temporaria para matricula_componente 518
select *
into temp mc_temp_grupo_3_518_washington
from ensino.matricula_componente mc
limit 0;

--518 - Ateliê
INSERT INTO mc_temp_grupo_3_518_washington (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito)
SELECT
    mc.id_situacao_matricula,
    mc.id_discente,
    mc.media_final,
    mc.numero_faltas,
    nextval('ensino.matricula_componente_seq'),
    tg.id_turma,
    mc.id_recuperacao,
    mc.apto,
    mc.id_registro_cadastro,
    mc.data_cadastro,
    mc.ano,
    mc.periodo,
    518,
    mc.id_restricoes,
    mc.recuperacao,
    mc.observacao,
    mc.id_usuario_consolidacao,
    mc.data_consolidacao,
    mc.rematricula,
    mc.media_anual,
    mc.frequencia,
    mc.id_matricula_componente_importada,
    mc.prova_especial,
    mc.id_historico_implantado,
    mc.media_anual_modulo,
    mc.motivo_exclusao,
    mc.data_atualizacao,
    mc.justificativa_aproveitamento,
    mc.id_registro_atualizacao,
    mc.data_reabertura_ficha,
    mc.data_alteracao_aproveitamento,
    mc.id_tipo_matricula_componente,
    mc.escola_aproveitamento,
    mc.id_aproveitamento,
    mc.media_exame_nacional,
    mc.ausente_recuperacao,
    mc.nao_optou,
    mc.conselho_classe,
    mc.id_matricula_estudante_serie,
    mc.carga_horaria_implantada,
    mc.parecer_descritivo_implantado,
    mc.conceito_implantado,
    mc.avaliacao_por_conceito
FROM ensino.matricula_componente mc
join turmas_grupo_3_dulcineia tg on tg.id_disciplina = 518
WHERE mc.id_turma IN (823149);

--Backup para deletar matriculas
select 
'DELETE FROM ensino.matricula_componente WHERE id_matricula_componente = ' || id_matricula_componente || ';' as backup
from mc_temp_grupo_3_518_washington;

--Inserindo matricula componentes
insert into ensino.matricula_componente
select * from mc_temp_grupo_3_518_washington; -- 21 registros

--Cria tabela temporaria para matricula_componente 283
select *
into temp mc_temp_grupo_3_283_washington
from ensino.matricula_componente mc
limit 0;

--283 - PSICOMOTRICIDADE
INSERT INTO mc_temp_grupo_3_283_washington (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito)
SELECT
    mc.id_situacao_matricula,
    mc.id_discente,
    mc.media_final,
    mc.numero_faltas,
    nextval('ensino.matricula_componente_seq'),
    tg.id_turma,
    mc.id_recuperacao,
    mc.apto,
    mc.id_registro_cadastro,
    mc.data_cadastro,
    mc.ano,
    mc.periodo,
    283,
    mc.id_restricoes,
    mc.recuperacao,
    mc.observacao,
    mc.id_usuario_consolidacao,
    mc.data_consolidacao,
    mc.rematricula,
    mc.media_anual,
    mc.frequencia,
    mc.id_matricula_componente_importada,
    mc.prova_especial,
    mc.id_historico_implantado,
    mc.media_anual_modulo,
    mc.motivo_exclusao,
    mc.data_atualizacao,
    mc.justificativa_aproveitamento,
    mc.id_registro_atualizacao,
    mc.data_reabertura_ficha,
    mc.data_alteracao_aproveitamento,
    mc.id_tipo_matricula_componente,
    mc.escola_aproveitamento,
    mc.id_aproveitamento,
    mc.media_exame_nacional,
    mc.ausente_recuperacao,
    mc.nao_optou,
    mc.conselho_classe,
    mc.id_matricula_estudante_serie,
    mc.carga_horaria_implantada,
    mc.parecer_descritivo_implantado,
    mc.conceito_implantado,
    mc.avaliacao_por_conceito
FROM ensino.matricula_componente mc
join turmas_grupo_3_dulcineia tg on tg.id_disciplina = 283
WHERE mc.id_turma IN (823149);

--Backup para deletar matriculas
select 
'DELETE FROM ensino.matricula_componente WHERE id_matricula_componente = ' || id_matricula_componente || ';' as backup
from mc_temp_grupo_3_283_washington;

--Inserindo matricula componentes
insert into ensino.matricula_componente
select * from mc_temp_grupo_3_283_washington; -- 21 registros

commit;

rollback;