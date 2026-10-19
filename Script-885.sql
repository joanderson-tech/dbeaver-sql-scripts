UPDATE basico.curriculo_basico SET tipo_diario=37 WHERE id_curriculo_basico in (35502680);
UPDATE basico.turma_serie SET tipo_diario=37 WHERE id_turma_serie in (51891704, 51891700, 51891698, 51891701, 51891699, 51891702, 51891703, 51891904, 51892519, 51892574, 51892591, 51894380, 51894711);



UPDATE basico.curriculo_basico SET tipo_diario=10 WHERE id_curriculo_basico in (35502680);
UPDATE basico.turma_serie SET tipo_diario=10 WHERE id_turma_serie in (51891704, 51891700, 51891698, 51891701, 51891699, 51891702, 51891703, 51891904, 51892519, 51892574, 51892591, 51894380, 51894711);

10

select * from basico.curriculo_basico cb where cb.id_curriculo_basico = 35502680;


select*  --string_agg(id_turma_serie:: varchar, ', ') 
from basico.turma_serie ts where ts.id_curriculo_medio = 35502680 and ativo;