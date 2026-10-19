select * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_turma ft   where ft.id_turma= 730574  and "data" = '2025-02-20'; --and ativo = false;


select  * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_aluno fa 
where fa.id_turma= 730574;
--and ativo = false 
and "data" = '2025-02-20';
