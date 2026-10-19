SELECT * FROM basico.curriculo_basico_serie_multisseriada cbsm WHERE cbsm.id_curriculo_basico = 51893832;


SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693)
AND ts.id_escola = 51890129;

SELECT ts.*
FROM basico.turma_serie ts
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie  
WHERE ts.id_turma_serie IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693)  
OR ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693) 
AND ts.id_escola = 51890129;
GROUP BY mc.id_situacao_matricula;



SELECT dt.* FROM ensino.docente_turma dt 
JOIN rh.servidor s ON s.id_servidor = dt.id_docente ;
WHERE dt.id_turma = 685025;
AND dt.finalizada = FALSE;