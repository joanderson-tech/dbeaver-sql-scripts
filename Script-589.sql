select * --string_agg(id_horario_turma::varchar, ', ') 
from ensino.horario_turma ht where ht.id_turma  in (685674, 685679, 685680, 685682, 685677, 685681, 685675, 685676, 685678) and ht.ativo= true;
