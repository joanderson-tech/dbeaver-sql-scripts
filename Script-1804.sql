SELECT distinct cb.*
FROM basico.curriculo_basico cb
JOIN basico.curriculo_basico_componente cbc ON cbc.id_curriculo_basico = cb.id_curriculo_basico 
WHERE cb.id_curriculo_basico  IN (51880817,51880834,51880851,51880867)
AND cbc.id_componente_curricular IN (224,225) --História e Geografia
AND cb.ativo;


-- Auto-generated SQL script #202602131722
UPDATE basico.curriculo_basico_componente	SET ch_semana=3,ch_ano=120 WHERE id_curriculo_basico_componente=51880857;



SELECT 'UPDATE basico.curriculo_basico_componente	SET ch_semana=3,ch_ano=120 WHERE id_curriculo_basico_componente= ' || id_curriculo_basico_componente || ';' AS SOLUÇÃO, 
			 'UPDATE basico.curriculo_basico_componente	SET ch_semana=' || ch_semana || ', ch_ano=' || ch_ano || ' WHERE id_curriculo_basico_componente= ' || id_curriculo_basico_componente || ';' AS BACKUP
FROM alterar_carga_horaria_componente;


