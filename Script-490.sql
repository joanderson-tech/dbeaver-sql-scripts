select string_agg(id::varchar, ', ')
from ava.aula_extra ae
where ae.data_aula = '2025-05-24';