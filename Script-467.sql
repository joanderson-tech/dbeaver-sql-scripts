select string_agg(id_frequencia::varchar, ', ')  
from ensino.frequencia_aluno where id_discente  = 986751 ;