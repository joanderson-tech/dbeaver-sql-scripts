SELECT * FROM ensino.registro_falta_professor rfp WHERE rfp.id_docente_turma IN (51896188,52110813);
AND rfp.ativo ;

SELECT DISTINCT  ts.id_turma_serie, p.nome,
        u.login, t.id_disciplina, t.codigo, ts.id_escola, dt
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
    where dt.ativo and p.nome = 'DENISE ALEXANDRE DA SILVA'
    AND t.ano = 2026;


--51896182 -- 682706 --66


51896188
52110813
DELETE FROM ensino.registro_falta_professor WHERE id_registro_falta_professor=12509;


INSERT INTO ensino.registro_falta_professor (id_registro_falta_professor, id_docente_turma, data_aula, numero_faltas, id_professor_substituto, motivo, ativo, justificativa, data_cadastro, abonada, data_abono, justificativa_abono, id_arquivo, justificativa_avaliacao, id_registro_avaliacao) VALUES(12509, 52110813, '2026-04-08', 1, NULL, 'Problema saúde', false, 'Atestado médico', NULL, false, NULL, NULL, NULL, NULL, NULL);


