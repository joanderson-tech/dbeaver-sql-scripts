WITH faltas AS ( SELECT fa.id_discente, ts1.id_turma_serie, COALESCE(sum(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0) AS faltas
FROM ensino.frequencia_aluno fa
INNER JOIN ensino.turma t ON
t.id_turma = fa.id_turma
INNER JOIN basico.turma_serie ts1 ON
ts1.id_turma_serie = t.id_turma_serie
WHERE fa.frequencia > 0
--AND fa.ativo
GROUP BY fa.id_discente, ts1.id_turma_serie ) 
SELECT e.nome AS nome_escola, ts.nome AS nome_turma, ts.id_turma_serie AS id_turma_serie, s.descricao AS nome_serie, 
d.matricula AS matricula_estudante, d.id_discente AS id_discente, p.cpf_cnpj AS cpf, COALESCE(p.nome_social, p.nome) 
AS nome_estudante, est.participa_bolsa_familia AS participa_bolsa_familia, 
COALESCE((SELECT f.faltas FROM faltas f WHERE f.id_discente = d.id_discente AND f.id_turma_serie = ts.id_turma_serie ), 0) AS faltas
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN basico.estudante est ON
est.id_estudante = d.id_discente
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
JOIN escola.escola_etapa_ensino_serie eees ON
eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
AND eees.ativo
LEFT JOIN basico.turma_serie ts ON
ts.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
LEFT JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
LEFT JOIN escola.escola e ON
e.id_escola = COALESCE(ts.id_escola, eees.id_escola)
LEFT JOIN basico.serie s ON
s.id_serie = COALESCE(ts.id_serie, eees.id_serie)
LEFT JOIN basico.etapa_ensino es ON
es.id_etapa_ensino = s.id_etapa_ensino
LEFT JOIN basico.modalidade_ensino_basico meb ON
meb.id_modalidade_ensino_basico = es.id_modalidade
LEFT JOIN basico.nivel_etapa_ensino nee ON
nee.id_nivel_etapa_ensino = es.id_nivel_etapa
WHERE mes.id_situacao_matricula_serie IN (1, 3, 8, 7)
AND mes.ano_calendario = 2026
AND e.id_escola = 51877788
--AND mes.id_estudante  = 976337
AND EXISTS ( SELECT 1
FROM ensino.frequencia_aluno fa
INNER JOIN ensino.turma t ON
t.id_turma = fa.id_turma
INNER JOIN basico.turma_serie ts1 ON
ts1.id_turma_serie = t.id_turma_serie
WHERE fa.id_discente = d.id_discente
AND fa.frequencia > 0
AND ts1.id_turma_serie = ts.id_turma_serie )
AND ts.id_turma_serie IS NOT NULL
GROUP BY e.nome, ts.nome, ts.id_turma_serie, s.descricao, d.matricula, d.id_discente, d.id_discente, p.cpf_cnpj, COALESCE(p.nome_social, p.nome), est.participa_bolsa_familia
ORDER BY e.nome, ts.nome, COALESCE(p.nome_social, p.nome);

SELECT * --sum(fa.frequencia)
FROM ensino.frequencia_aluno fa
INNER JOIN ensino.turma t ON
t.id_turma = fa.id_turma
INNER JOIN basico.turma_serie ts1 ON
ts1.id_turma_serie = t.id_turma_serie
WHERE fa.frequencia > 0
AND t.id_turma_serie = 51885380
AND fa.id_discente = 976337
AND fa.ativo;




