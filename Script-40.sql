select * 
from basico.etapa_ensino ee ;

select * 
from basico.modalidade_ensino_basico meb ;

SELECT DISTINCT etapa.* 
FROM basico.etapa_ensino ee  
INNER JOIN modalidade modal ON etapa.modalidade_id = modal.id 
WHERE etapa.ativo = true 
  AND (:idModalidade IS NULL OR modal.id = :idModalidade) 
  AND (:idNivel IS NULL OR etapa.nivelEtapa_id = :nivel);
