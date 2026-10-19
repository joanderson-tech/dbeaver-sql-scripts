select *
from  basico.serie s 
join basico.etapa_ensino ee on s.id_etapa_ensino = ee.id_etapa_ensino 
join basico.modalidade_ensino_basico meb on meb.id_modalidade_ensino_basico = ee.id_modalidade 
join basico.nivel_etapa_ensino nee on nee.id_nivel_etapa_ensino = ee.id_nivel_etapa 
where s.descricao in ('NÍVEL II','NÍVEL III', 'MULTISSERIADO');

