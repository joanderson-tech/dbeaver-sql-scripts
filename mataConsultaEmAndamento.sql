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
FROM UNNEST(ARRAY[28826]) AS foo (pid);

9999999999999999999999999 9;

SELECT *
FROM basico.mapeamento_series_tce_se mssts;

SELECT *
FROM basico.series_tce_se;

SELECT *
FROM basico.serie s;
JOIN basico.series_tce_se se ON
se.codigo = s.sigla;

SELECT e.id_unidade_escola
FROM escola.escola e
WHERE e.id_escola IN (51870383, 53898193, 51870352, 51870340, 51870385, 51870339, 51870351, 53898153, 51870345, 51870363, 51870342, 51870343, 51870382, 51870374, 51870362, 51870347, 51870361, 51870356, 51870367, 51870376, 53877856, 51870384, 55087459, 51870381, 51870368, 51870377, 51870358, 51870359, 52902326, 51870369, 51870365, 51870371, 51870353, 51870378, 51870344, 51870341, 54454612, 51870380, 51870372, 51870360, 51870357, 51870346, 51870355, 51870364, 51870354, 54448999, 51870373, 53886804, 51870379, 51870366, 51870350, 51870375, 51870348, 51870370, 51870349);

SELECT *
FROM escola.escola e
WHERE e.id_unidade_escola = '27223947';

SELECT *
FROM comum.unidade u
WHERE u.id_unidade = 27223947;

SELECT DISTINCT ts.id_escola
FROM basico.turma_serie ts
WHERE ano = 2026
AND ts.ativo ;

SELECT CASE WHEN EXISTS (SELECT 1
FROM comum.registro_entrada re
WHERE DATA >= NOW() - INTERVAL '10 DAYS') THEN 'EM USO'
ELSE 'PODE APAGAR' END AS situacao
