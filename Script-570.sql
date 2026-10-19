select * --string_agg(id_horario_turma::varchar, ', ') 
from ensino.horario_turma ht where ht.id_turma  in (685734, 685736, 685729, 685730, 685731, 685732, 685728, 685733, 685735); and ht.ativo= false;

select string_agg(id_turma::varchar, ', ') 
from ensino.turma t where t.id_turma_serie = 52224701;


select * --string_agg(id_horario_turma::varchar, ', ') 
from ensino.horario_turma ht where ht.id_turma  in (685679, 685680, 685681, 685682, 685678, 685674, 685675, 685676, 685677); and ht.ativo= false;


select string_agg(id_turma::varchar, ', ') 
from ensino.turma t where t.id_turma_serie = 52224682;