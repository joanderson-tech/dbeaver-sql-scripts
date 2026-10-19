select * 
from basico.calendario_escolar ce  
where ce.ano = 2022;


-- Solução 
UPDATE basico.calendario_escolar
	SET ativo=false
	WHERE id_calendario_escolar=10;