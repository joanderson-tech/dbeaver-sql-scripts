select * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_turma ft   where ft.id_turma= 699834 and ativo ;

select * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_aluno fa 
where fa.id_turma = 699834 ;