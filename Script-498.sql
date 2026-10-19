begin;

select
    p.pid, p.state, p.application_name , p.query,
    to_char((now() - p.query_start), 'HH24:MI:SS') as running,
    p.datname, p.usename, p.application_name,
    pl.blocking_pid, pl.blocking_user,
    to_char(pl.blocked_duration, 'HH24:MI:SS') as blocked_duration,
    to_char(pl.blocking_duration, 'HH24:MI:SS') as blocking_duration,
    pl.blocking_application_name, pl.blocking_statement
from
    pg_stat_activity p
    LEFT JOIN (
        SELECT blocked_locks.pid         AS blocked_pid,
           blocked_activity.usename  AS blocked_user,
           now() - blocked_activity.query_start
                                     AS blocked_duration,
           blocking_locks.pid        AS blocking_pid,
           blocking_activity.usename AS blocking_user,
           now() - blocking_activity.query_start
                                     AS blocking_duration,
           blocked_activity.query    AS blocked_statement,
           blocking_activity.application_name as blocking_application_name,
           blocking_activity.query   AS blocking_statement
    FROM pg_catalog.pg_locks AS blocked_locks
    JOIN pg_catalog.pg_stat_activity AS blocked_activity
        ON blocked_activity.pid = blocked_locks.pid
    JOIN pg_catalog.pg_locks AS blocking_locks
        ON blocking_locks.locktype = blocked_locks.locktype
            AND blocking_locks.DATABASE IS NOT DISTINCT FROM blocked_locks.DATABASE
            AND blocking_locks.relation IS NOT DISTINCT FROM blocked_locks.relation
            AND blocking_locks.page IS NOT DISTINCT FROM blocked_locks.page
            AND blocking_locks.tuple IS NOT DISTINCT FROM blocked_locks.tuple
            AND blocking_locks.virtualxid IS NOT DISTINCT FROM blocked_locks.virtualxid
            AND blocking_locks.transactionid IS NOT DISTINCT FROM blocked_locks.transactionid
            AND blocking_locks.classid IS NOT DISTINCT FROM blocked_locks.classid
            AND blocking_locks.objid IS NOT DISTINCT FROM blocked_locks.objid
            AND blocking_locks.objsubid IS NOT DISTINCT FROM blocked_locks.objsubid
            AND blocking_locks.pid != blocked_locks.pid
    JOIN pg_catalog.pg_stat_activity AS blocking_activity
        ON blocking_activity.pid = blocking_locks.pid
    WHERE NOT blocked_locks.granted
    ) as pl ON pl.blocked_pid = p.pid
WHERE
    p.pid <> pg_backend_pid()
    and p.state in ('active', 'idle in transaction')
order by
    p.state, running desc;

-- encerrar processo
SELECT pg_terminate_backend(27884);