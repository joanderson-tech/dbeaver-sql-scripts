SELECT  p.codigo_nis
FROM discente d
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa;
WHERE p.nome ILIKE '%DAVI LUIZ MARTINS DE QUEIROZ%'


DELETE
FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie = 1320901;

SELECT p.id_pessoa, p.nome AS pessoa, p.cpf_cnpj, p.nome_mae, e.id_escola , e.nome AS escola
FROM comum.pessoa p
JOIN discente d ON d.id_pessoa = p.id_pessoa
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente
JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie
JOIN escola.escola e ON e.id_escola = ts.id_escola
WHERE p.codigo_nis <> ''
AND p.codigo_nis IS NOT NULL
AND p.codigo_nis = '23756469650'
AND p.id_pessoa <> 0
ORDER BY mes.id_matricula_discente_serie DESC
LIMIT 1;