 BEGIN;
 
SELECT *
--INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 690516;
AND ht.ativo = FALSE;

SELECT * FROM basico.calendario_escolar ce ;;


UPDATE ensino.horario_turma	SET data_inicio='2025-05-27', data_fim = '2025-12-18' 	WHERE id_horario_turma IN (1420650,1420651,1420655,1420656);


UPDATE ensino.horario_turma	SET data_inicio=NULL, data_fim= null 	WHERE id_horario_turma IN (1420650,1420651,1420655,1420656);

COMMIT;