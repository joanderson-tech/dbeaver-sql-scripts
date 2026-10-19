select distinct vs.*
from basico.serie s
join matricula.vaga_serie vs on vs.id_serie  = s.id_serie
join basico.etapa_ensino ee on s.id_etapa_ensino = ee.id_etapa_ensino
join basico.modalidade_ensino_basico meb on meb.id_modalidade_ensino_basico = ee.id_modalidade
and vs.id_vaga_serie = 54733266;