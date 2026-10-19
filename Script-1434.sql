SELECT ht.id_horario_turma, ht.id_turma, ht.id_horario, ht.dia, ht.ativo, ht.data_alteracao, h.id_horario, h.inicio, h.fim, t.codigo, t.periodo, t.id_disciplina
FROM ensino.horario_turma ht
JOIN ensino.turma t
	USING (id_turma)
JOIN ensino.horario h
	USING (id_horario)
WHERE t.id_turma_serie = 72506400
AND ht.ativo = trueValue()
ORDER BY ht.data_alteracao, ht.id_horario, dia;


SELECT *FROM ensino.turma t WHERE t.id_turma_serie = 72506400;  IN (760711,760712,760713,760714,760715,760716,760717,760718);

SELECT * FROM 


select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma_serie = 72506400;  IN (760711,760712,760713,760714,760715,760716,760717,760718);


SELECT ts.nome, ts.tipo_diario FROM basico.turma_serie ts WHERE ts.id_turma_serie IN (72531258, 73417705);


-- Auto-generated SQL script #202511131004
UPDATE ensino.horario_turma 	SET id_turma=768432 	WHERE id_horario_turma IN (1655475,1655480,1655485,1655490);

UPDATE ensino.horario_turma 	SET id_turma=768426 	WHERE id_horario_turma IN (1655475,1655480,1655485,1655490);

