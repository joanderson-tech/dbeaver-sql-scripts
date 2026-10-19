SELECT *
FROM ava.plano_aula pa;
--JOIN ava.plano_aula_categoria pac ON pac.id_plano_aula = pa.id_plano_aula
WHERE pa.id_turma = 687699;
ORDER BY pac.mes, pac.semana, pac.unidade_tematica DESC;

SELECT DISTINCT t.id_turma, t.codigo, t.ano, e.nome AS escola, s.descricao, cc.nome AS componente, CASE WHEN t.total_matriculados IS NULL THEN 0
ELSE t.total_matriculados END AS total_matriculados
FROM ensino.docente_turma dt
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = t.id_disciplina
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
JOIN basico.serie s ON
s.id_serie = ts.id_serie
JOIN escola.escola e ON
e.id_escola = ts.id_escola
WHERE dt.ativo = TRUE
AND t.id_situacao_turma <> 4
AND ts.ano = 2026
AND dt.id_docente = 72
AND t.id_disciplina = 220
AND t.id_turma <> 687699
ORDER BY s.descricao;


SELECT *,  FROM ensino.turma t where t.id_turma_serie  = 51950567;

SELECT ts.cur, ts.* FROM basico.turma_serie AS ts
WHERE id_turma_serie = 51950567


select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo AND t.ano = 2026; and p.nome = 'FRANCISCA CARLA BENTO BEZERRA';