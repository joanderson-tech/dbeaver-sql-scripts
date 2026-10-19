select * 
from ensino.horario_turma where id_turma  in (688278); 

select * 
from ensino.horario_turma where id_turma  in (688278) and dia = '5' and ativo = false;


select string_agg(id_horario_turma ::varchar, ', ') 
from ensino.horario_turma where id_turma  in (688278) and dia = '5' and ativo = false;