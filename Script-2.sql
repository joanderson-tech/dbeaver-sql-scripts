select *
FROM comum.pessoa p
WHERE p.nome LIKE 'MAURICEIA%';

select s.id_ativo
FROM comum.pessoa p
join rh.servidor s on s.id_pessoa = p.id_pessoa 
WHERE p.nome LIKE 'MAURICEIA%';

select * 
from rh.servidor s 
where s.id_pessoa  = 762052;

select * from rh.servidor s
where s.siape in('934747', '0934747');

--apagar 441 


select string_agg(id_docente_turma::varchar,',')  from ensino.docente_turma dt 
where dt.id_docente in(441);

select string_agg(id_docente_turma::varchar,',')  from ensino.docente_turma dt 
where dt.id_docente in(441);

select * from pessoas.historico_servidor_terceirizado hst
where hst.id_servidor in(441,290);


-- Solução
UPDATE ensino.docente_turma
	SET id_docente=290
	WHERE id_docente_turma in(52845018,52845019,52845020,52845073,52845074,52845075,52845076,52845077,52845078,52845079,52845080,52845081,52845082,52845083,52845084,52845085,52845086,52979355,52979356,52979357,52979352,52979353,52979354,52979349,52979350,52979351,52979346,52979347,52979348,52979358,52979359,52979343,52979344,52979345);

--backup
UPDATE ensino.docente_turma
	SET id_docente = 441
	WHERE id_docente_turma in(52845018,52845019,52845020,52845073,52845074,52845075,52845076,52845077,52845078,52845079,52845080,52845081,52845082,52845083,52845084,52845085,52845086,52979355,52979356,52979357,52979352,52979353,52979354,52979349,52979350,52979351,52979346,52979347,52979348,52979358,52979359,52979343,52979344,52979345);


--backup 
INSERT INTO rh.servidor
(id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, codigo_rh, id_designacao, codigo_rh_pessoa_old, codigo_rh_pessoa_new, codigo_rh_old, reducao_regime, codigo_inep, qualificacao, codigo_legado, data_ultimo_login_mobile, id_entrada, ja_alocado_completamente_apos_encaminhamento, id_tipo_contrato_servidor, forma_vacancia, data_resposta_ficha_atualizacao, id_instituicao, justificativa_finalizacao, justificativa_reducao_regime, justificativa_remocao_reducao_regime, ds_referencia, id_registro_atualizacao, id_registro_cadastro, id_classe_servidor, numero_contrato_1, numero_contrato_2, id_unidade_transferida, data_transferencia, salario)
VALUES(441, '934747', 762052, NULL, '1', NULL, 1, 1, 7, 2959, NULL, NULL, NULL, 0.00, NULL, 605, NULL, 40, false, '8', NULL, NULL, NULL, NULL, NULL, '2023-03-14 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5720482, 11, NULL, NULL, NULL, NULL, NULL);

--Solução
DELETE FROM rh.servidor
WHERE id_servidor=441;



begin;
commit;

rollback;


