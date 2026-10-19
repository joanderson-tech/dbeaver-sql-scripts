select * -- string_agg(id_horario_turma :: varchar, ', ')  
from ensino.horario_turma ht  where ht.id_turma in (687235, 687236, 687237) and ativo;


select * from ensino.frequencia_aluno fa where fa.id_turma in ( 687235, 687236, 687237) and ativo;

select * -- string_agg(id_horario_turma :: varchar, ', ')  
from ensino.horario_turma ht  where ht.id_turma in ( 687236, 687237)


select * -- string_agg(id_horario_turma :: varchar, ',')  
from ensino.horario_turma ht  where ht.id_turma in (687230, 687231, 687232, 687233, 687234, 687229, 687235, 687236, 687237) ; 