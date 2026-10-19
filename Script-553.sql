select * from basico.serie s;

SELECT ee.* FROM basico.etapa_ensino AS ee;


select * from basico.turma_serie ts 


SELECT nee.* FROM basico.nivel_etapa_ensino AS nee;


select s
from
    basico.serie s
join basico.etapa_ensino ee on
    s.id_etapa_ensino = ee.id_etapa_ensino
join basico.nivel_etapa_ensino nee on
    nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
where
    nee.id_nivel_etapa_ensino = 51918782;
