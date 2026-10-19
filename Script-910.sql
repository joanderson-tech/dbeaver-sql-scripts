select * from ensino.horario_turma ht  where ht.id_turma
in (687183, 687182, 687176, 687177, 687178, 687179, 687180, 687175, 687181) and ativo;



select * --string_agg(id_horario_turma :: varchar, ', ')  
from ensino.horario_turma ht  where ht.id_turma in (687181);
