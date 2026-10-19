SELECT *
FROM matricula.movimentacao_estudante_escola mee
WHERE mee.id_matricula_estudante_serie IN (1586156);

mes.id


SELECT  p.nome, mes.*
FROM basico.matricula_estudante_serie mes
JOIN discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
WHERE p.nome ILIKE '%FELIPE LUIZ RODRIGUES DE ARAUJO%'
AND mes.ano_calendario = 2025;

73417705


-- Auto-generated SQL script #202510301208
UPDATE basico.matricula_estudante_serie
	SET data_matricula_turma='2025-09-01 10:48:02.713'
	WHERE id_matricula_discente_serie=1586156;
