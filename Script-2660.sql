SELECT 
   fa.*
FROM ensino.frequencia_aluno fa 
JOIN ensino.turma t ON t.id_turma = fa.id_turma 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
WHERE 
   fa.data BETWEEN '2026-02-04' AND '2026-04-24'
   AND fa.data_atualizacao  BETWEEN '2026-07-22 00:00:00.000' AND '2026-07-30 00:00:00.000'
   AND fa.ativo = FALSE
   AND ts.ativo 
   AND ts.ano = 2026
ORDER BY fa.data ASC;

select p.nome,
        u.login, t.codigo,t.id_disciplina, t.id_turma 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma_serie = 84520742;

SELECT * FROM basico.turma_serie ts 
WHERE ts.ano = 2026
AND ts.ativo
AND ts.data_cadastro BETWEEN '2026-07-22 00:00:00.000' AND '2026-07-30 00:00:00.000'

SELECT * FROM basico.turma_serie ts 
WHERE ts.ano = 2026
AND ts.ativo
AND ts.data_cadastro >= '2026-07-22 00:00:00.000' ;


SELECT * 
FROM basico.turma_serie ts 
WHERE ts.ano = 2026
  AND ts.ativo
  AND ts.data_cadastro BETWEEN '2026-07-22 00:00:00.000' AND '2026-07-29 23:59:59.999';