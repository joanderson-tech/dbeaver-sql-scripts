SELECT distinct mes.*
from discente d 
join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente 
WHERE d.matricula = '202230008546'
and mes.ano_calendario = 2026;