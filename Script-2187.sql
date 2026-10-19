BEGIN;

---SOLUÇÃO LIVIA SANTOS FERREIRA
UPDATE ensino.docente_turma SET id_docente=1064 WHERE id_docente_turma=52200167;
DELETE FROM rh.servidor WHERE id_servidor=1117;
---SOLUÇÃO ALENILDES OLIVEIRA DOS SANTOS
UPDATE ensino.docente_turma SET id_docente=392 WHERE id_docente_turma IN (52164167, 52059632, 52059634, 52059635, 52059637, 52059640, 52059642, 52094770, 52094789, 52094808, 52094836, 52094883, 52094889, 52095184, 52129658, 52164133, 52164153, 52164159, 52164161, 52164165) ;
DELETE FROM rh.servidor WHERE id_servidor=955;
---SOLUÇÃO JENNYFER ALVES ROCHA
UPDATE ensino.docente_turma SET id_docente=745 WHERE id_docente_turma=52129657;
DELETE FROM rh.servidor WHERE id_servidor=1109;


ROLLBACK;


COMMIT;


SELECT *  FROM rh.servidor WHERE id_servidor IN (1117, 955, 1109);


INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, siape_antiga, id_entrada) VALUES(955, '8487', 746647, NULL, '2', NULL, NULL, 1, 1, 2891, NULL, NULL, '2026-04-01 13:38:39.476', 0.00, NULL, 605, NULL, 25, false, '1', NULL, NULL, NULL, NULL, NULL, '2026-03-11 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, siape_antiga, id_entrada) VALUES(1117, '54173', 749702, NULL, '1', NULL, NULL, 1, 1, 2891, NULL, NULL, '2026-04-07 10:31:45.126', 0.00, NULL, 605, NULL, 25, false, '1', NULL, NULL, NULL, NULL, NULL, '2026-04-07 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

