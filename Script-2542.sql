
SELECT * FROM comum.pessoa p WHERE p.nome = 'ALUNO TREINAMENTO';


SELECT * FROM discente d WHERE d.id_pessoa IN (747263);

SELECT * FROM 

SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_estudante IN (974129) 
AND mes.ano_calendario = 2026;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 54285070;

SELECT * FROM ensino.frequencia_aluno fa WHERE fa.id_discente = 974129 AND fa.id_turma = 688012 AND fa.id_motivo_baixa_frequencia = 183491;--AND fa."data" = '2026-05-12'


SELECT * FROM basico.motivo_baixa_frequencia mbf WHERE mbf.id_motivo_baixa_frequencia = 183491;


-- Auto-generated SQL script #202607101541
UPDATE basico.motivo_baixa_frequencia
    SET ativo=false
    WHERE id_motivo_baixa_frequencia=183491;



SELECT freq.id_frequencia, freq.data, freq.frequencia, freq.id_turma, t.id_disciplina, cc.nome, freq.id_discente, d.id_pessoa, p.nome, mbf.codigo, freq.ativo, mbf.ativo, freq.horarios, freq.id_motivo_baixa_frequencia
FROM ensino.frequencia_aluno freq
INNER JOIN ensino.turma t ON freq.id_turma = t.id_turma
INNER JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina
INNER JOIN public.discente d ON d.id_discente = freq.id_discente
INNER JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
LEFT JOIN basico.motivo_baixa_frequencia mbf ON mbf.id_motivo_baixa_frequencia = freq.id_motivo_baixa_frequencia
WHERE freq.id_discente = 974129
AND t.ano = 2026
AND freq.ativo
AND (freq.abonada = FALSE OR freq.abonada IS NULL)
AND freq.frequencia > 0
AND t.id_turma_serie = 51953956
--AND mbf.ativo
AND t.id_turma = 688012
ORDER BY freq.data, cc.nome;

