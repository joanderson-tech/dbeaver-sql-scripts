/*
RAYRA SOPHIA FEITOSA DA SILVA, CPF DO ALUNO: 08990205-76; CPF DO RESPONSÁVEL 017879335-39 ---### 202630034073
RAYSSA LORENA FEITOSA DA SILVA, CPF DO ALUNO 08990125-57 CPF do responsável 017879335-39*/


SELECT p.id_pessoa, mes.id_estudante, p.nome, d.matricula, s.descricao, mes.data_cadastro 
FROM comum.pessoa p
JOIN discente d ON d.id_pessoa = p.id_pessoa
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente 
JOIN basico.situacao_matricula_serie s ON s.id_situacao_matricula_serie = mes.id_situacao_matricula_serie 
WHERE p.id_pessoa IN (774205, 774358);

SELECT *
FROM discente d
WHERE d.id_pessoa IN (774205, 774358);

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante IN (1017185,1017184,1017348)

SELECT * FROM basico.estudante e WHERE e.id_estudante IN (1017185,1017184,1017348)

SELECT ei.id_estudante , * FROM matricula.estudante_inscrito ei WHERE ei.id_estudante  = 1017185;

SELECT * FROM basico.movimentacao_estudante me WHERE me.id_discente = 1017185;

SELECT * FROM ensino.observacao_discente od WHERE od.id_discente =1017185 



BEGIN;
ROLLBACK;

select 'UPDATE ensino.matricula_componente SET id_discente = 1017348 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao,
	   'UPDATE ensino.matricula_componente SET id_discente = '|| mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup,
	   COUNT(mc.id_matricula_componente) AS quantidade_ids
from ensino.matricula_componente mc 
where mc.id_discente IN (1017185)
GROUP BY 
    mc.id_discente;	

UPDATE ensino.matricula_componente SET id_discente = 1017348 WHERE id_matricula_componente IN (18289142, 18289143, 18289144, 18289145, 18289146, 18289147, 18289148, 18289149, 18289150, 18289151, 18289152);

UPDATE public.discente 	SET matricula='202630034073'	WHERE id_discente=1017348;

UPDATE basico.matricula_estudante_serie 	SET id_estudante=1017348	WHERE id_matricula_discente_serie=1414046;

UPDATE matricula.estudante_inscrito 	SET id_estudante=1017348	WHERE id_estudante_inscrito=54902249;

UPDATE basico.movimentacao_estudante 	SET id_discente=1017348	WHERE id_movimentacao_estudante=80045;

UPDATE ensino.observacao_discente 	SET id_discente=1017348	WHERE id_observacao_discente=550024841;

DELETE FROM basico.estudante WHERE id_estudante=1017185;

DELETE FROM public.discente WHERE id_discente=1017185;


--backup 

INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(1017185, 2026, NULL, '202630034073', NULL, 774205, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-13 14:36:36.976', NULL, 6300522, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca, id_tipo_instituicao_origem) VALUES(1017185, 1005221, NULL, NULL, NULL, false, true, '2026-02-23', 6304358, NULL, false, false, NULL);

UPDATE public.discente 	SET matricula='202630035698'	WHERE id_discente=1017348;

UPDATE basico.matricula_estudante_serie 	SET id_estudante=1017185	WHERE id_matricula_discente_serie=1414046;

UPDATE basico.movimentacao_estudante 	SET id_discente=1017185	WHERE id_movimentacao_estudante=80045;

UPDATE matricula.estudante_inscrito 	SET id_estudante=1017185	WHERE id_estudante_inscrito=54902249;

UPDATE ensino.observacao_discente 	SET id_discente=1017185	WHERE id_observacao_discente=550024841;

UPDATE ensino.matricula_componente SET id_discente = 1017185 WHERE id_matricula_componente IN (18289142, 18289143, 18289144, 18289145, 18289146, 18289147, 18289148, 18289149, 18289150, 18289151, 18289152);


