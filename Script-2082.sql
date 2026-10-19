SELECT * FROM rh.servidor s WHERE s.id_pessoa = 746514;

SELECT * FROM comum.pessoa p WHERE p.nome ilike'%MONICA OLIVEIRA DA SILVA%'


SELECT * FROM comum.pessoa p WHERE p.id_pessoa IN (51873522);



SELECT * FROM comum.pessoa p WHERE p.id_pessoa IN (51873522);
SELECT * FROM rh.servidor s WHERE s.id_pessoa IN (51873522);

SELECT * FROM comum.usuario u2  WHERE u2.id_pessoa IN (51873101);

SELECT e.id_unidade_escola, e.nome 
FROM comum.pessoa p
JOIN discente d ON
d.id_pessoa = p.id_pessoa
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN basico.turma_serie ts ON
ts.id_turma_serie = mes.id_turma_serie
JOIN escola.escola e ON
e.id_escola = ts.id_escola
WHERE p.nome = 'PEDRO LEONARDO OLIVEIRA SANTOS'
AND mes.ano_calendario = 2026;