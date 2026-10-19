select * -- string_agg(id_horario_turma ::varchar, ', ') 
from ensino.horario_turma where id_turma  in (730573, 730574, 730575, 730578, 730577, 730580, 730581, 730576, 730579, 730582); and ativo = false;
