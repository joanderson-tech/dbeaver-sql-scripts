select *-- string_agg(id_horario_turma ::varchar, ', ') 
from ensino.horario_turma where id_turma  in (699838, 699841, 699839, 699840, 699837, 699825, 699826, 699827, 699828, 699829, 699830, 699831, 699832, 699836, 699833, 699834, 699835);
