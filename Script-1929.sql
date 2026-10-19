
SELECT * 
FROM pg_stat_activity
WHERE state = 'active';

SELECT pg_terminate_backend(foo.pid) FROM unnest(ARRAY[30387]) AS foo (pid);
