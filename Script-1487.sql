SELECT *
FROM basico.motivo_baixa_frequencia mb;

SELECT *
FROM ensino.item_abono_frequencia;

SELECT *
FROM ensino.abono_frequencia;

SELECT *
FROM discente
WHERE matricula = '202330016335';

SELECT DISTINCT dis.id_discente AS idDiscente, dis.matricula AS matricula, p.nome AS nomeEstudante, p.cpf_cnpj AS cpf, e.nome AS nomeUnidade, ee.denominacao AS nomeEtapaEnsino, s.descricao AS nomeSerie, ts.nome AS nomeTurma, d.nome AS nomeDisciplina, fa.DATA, fa.frequencia AS falta, fa.horarios AS quantidadeAula,(COALESCE(fa.abonada_escola, FALSE)
	OR COALESCE(fa.abonada, FALSE)) AS abonada, CASE WHEN (COALESCE(fa.abonada_escola, FALSE)
	OR COALESCE(fa.abonada, FALSE))
AND fa.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf.codigo || ') ' || mbf.denominacao
WHEN (COALESCE(fa.abonada_escola, FALSE)
	OR COALESCE(fa.abonada, FALSE))
AND af.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf2.codigo || ') ' || mbf2.denominacao
WHEN (COALESCE(fa.abonada_escola, FALSE)
	OR COALESCE(fa.abonada, FALSE))
AND (af.justificativa IS NOT NULL
	OR trim(af.justificativa) <> '') THEN af.justificativa
ELSE '' END AS motivoAbono
FROM ensino.frequencia_aluno fa
JOIN discente dis ON
dis.id_discente = fa.id_discente
JOIN comum.pessoa p ON
p.id_pessoa = dis.id_pessoa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
JOIN escola.escola e ON
e.id_escola = ts.id_escola
JOIN basico.serie s ON
s.id_serie = ts.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
JOIN ensino.componente_curricular d ON
d.id_componente_curricular = t.id_disciplina
LEFT JOIN ensino.item_abono_frequencia iaf ON
iaf.id_frequencia = fa.id_frequencia
LEFT JOIN ensino.abono_frequencia af ON
af.id_abono_frequencia = iaf.id_abono_frequencia
AND af.ativo = TRUE
LEFT JOIN basico.motivo_baixa_frequencia mbf ON
mbf.id_motivo_baixa_frequencia = fa.id_motivo_baixa_frequencia
LEFT JOIN basico.motivo_baixa_frequencia mbf2 ON
mbf2.id_motivo_baixa_frequencia = af.id_motivo_baixa_frequencia
WHERE fa.data BETWEEN '2025-03-10' AND '2025-10-30'
AND fa.id_discente = 973998
AND fa.ativo = TRUE
AND t.id_situacao_turma <> 4
AND ts.ativo = TRUE
AND s.ativo = TRUE
AND ee.ativo = TRUE
AND d.ativo = TRUE
LIMIT 10;
ORDER BY p.nome, fa.data,
--ee.denominacao, s.descricao, ts.nome, d.nome 
OFFSET '224000' ROWS FETCH NEXT '1000' ROWS ONLY;

SELECT *
FROM ensino.frequencia_aluno fa
WHERE fa."data" > '2025-01-01'
AND fa.horarios > 2;

SELECT *
FROM ensino.frequencia_turma ft ;

SELECT DISTINCT dis.id_discente AS idDiscente, dis.matricula AS matricula, p.nome AS nomeEstudante, p.cpf_cnpj AS cpf, ne.nome AS nomeUnidade, ee.denominacao AS nomeEtapaEnsino, s.descricao AS nomeSerie, ts.nome AS nomeTurma, d.nome AS nomeDisciplina, \nfa.data AS DATA, fa.frequencia AS falta, fa.horarios AS quantidadeAula,(COALESCE(fa.abonada_escola, FALSE)
	OR COALESCE(fa.abonada, FALSE)) AS abonada, \nCASE
WHEN (COALESCE(fa.abonada_escola, FALSE)
	OR COALESCE(fa.abonada, FALSE))
AND fa.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf.codigo || ') ' || mbf.denominacao\nWHEN (COALESCE(fa.abonada_escola, FALSE)
	OR COALESCE(fa.abonada, FALSE))
AND af.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf2.codigo || ') ' || mbf2.denominacao\nWHEN (COALESCE(fa.abonada_escola, FALSE)
	OR COALESCE(fa.abonada, FALSE))
AND (af.justificativa IS NOT NULL
	OR trim(af.justificativa) <> '') THEN af.justificativa\nELSE '' END AS motivoAbono\nFROM ensino.frequencia_aluno fa\nJOIN discente dis ON
dis.id_discente = fa.id_discente\nJOIN comum.pessoa p ON
p.id_pessoa = dis.id_pessoa\nJOIN ensino.turma t ON
t.id_turma = fa.id_turma\nJOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie\nJOIN escola.escola e ON
e.id_escola = ts.id_escola\nJOIN basico.serie s ON
s.id_serie = ts.id_serie\nJOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino\nJOIN ensino.componente_curricular d ON
d.id_componente_curricular = t.id_disciplina\nLEFT
JOIN ensino.item_abono_frequencia iaf ON
iaf.id_frequencia = fa.id_frequencia\nLEFT
JOIN ensino.abono_frequencia af ON
af.id_abono_frequencia = iaf.id_abono_frequencia
AND af.ativo = TRUE\nLEFT
JOIN basico.motivo_baixa_frequencia mbf ON
mbf.id_motivo_baixa_frequencia = fa.id_motivo_baixa_frequencia\nLEFT
JOIN basico.motivo_baixa_frequencia mbf2 ON
mbf2.id_motivo_baixa_frequencia = af.id_motivo_baixa_frequencia\nWHERE fa.data BETWEEN ? AND ?
AND fa.ativo = TRUE
AND (fa.abonada = TRUE
	OR fa.abonada_escola = TRUE)\nAND t.id_situacao_turma <> 4
AND ts.ativo = TRUE
AND s.ativo = TRUE
AND ee.ativo = TRUE
AND d.ativo = TRUE\nORDER BY p.nome, fa.data, ee.denominacao, s.descricao, ts.nome, d.nome




SELECT p.pid, p.state, p.application_name , p.query, to_char((now() - p.query_start), 'HH24:MI:SS') AS running, p.datname, p.usename, p.application_name, pl.blocking_pid, pl.blocking_user, to_char(pl.blocked_duration, 'HH24:MI:SS') AS blocked_duration, to_char(pl.blocking_duration, 'HH24:MI:SS') AS blocking_duration, pl.blocking_application_name, pl.blocking_statement
FROM pg_stat_activity p
LEFT JOIN (
        SELECT blocked_locks.pid AS blocked_pid, blocked_activity.usename AS blocked_user, now() - blocked_activity.query_start
                                     AS blocked_duration, blocking_locks.pid AS blocking_pid, blocking_activity.usename AS blocking_user, now() - blocking_activity.query_start
                                     AS blocking_duration, blocked_activity.query AS blocked_statement, blocking_activity.application_name AS blocking_application_name, blocking_activity.query AS blocking_statement
FROM pg_catalog.pg_locks AS blocked_locks
JOIN pg_catalog.pg_stat_activity AS blocked_activity
        ON
blocked_activity.pid = blocked_locks.pid
JOIN pg_catalog.pg_locks AS blocking_locks
        ON
blocking_locks.locktype = blocked_locks.locktype
AND blocking_locks.DATABASE IS NOT DISTINCT
FROM blocked_locks.DATABASE
AND blocking_locks.relation IS NOT DISTINCT
FROM blocked_locks.relation
AND blocking_locks.page IS NOT DISTINCT
FROM blocked_locks.page
AND blocking_locks.tuple IS NOT DISTINCT
FROM blocked_locks.tuple
AND blocking_locks.virtualxid IS NOT DISTINCT
FROM blocked_locks.virtualxid
AND blocking_locks.transactionid IS NOT DISTINCT
FROM blocked_locks.transactionid
AND blocking_locks.classid IS NOT DISTINCT
FROM blocked_locks.classid
AND blocking_locks.objid IS NOT DISTINCT
FROM blocked_locks.objid
AND blocking_locks.objsubid IS NOT DISTINCT
FROM blocked_locks.objsubid
AND blocking_locks.pid != blocked_locks.pid
JOIN pg_catalog.pg_stat_activity AS blocking_activity
        ON
blocking_activity.pid = blocking_locks.pid
WHERE NOT blocked_locks.granted
    ) AS pl ON
pl.blocked_pid = p.pid
WHERE p.pid <> pg_backend_pid()
AND p.state IN ('active', 'idle in transaction')
ORDER BY
    p.state, running DESC;

SELECT pg_terminate_backend(foo.pid)
FROM UNNEST(ARRAY[10578,19060]) AS foo (pid);