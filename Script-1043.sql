select mc
from ensino.turma t 
join ensino.matricula_componente mc on mc.id_turma = t.id_turma 
where t.id_turma  = 702677
--and mc.id_discente = 979352;