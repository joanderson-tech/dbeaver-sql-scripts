BEGIN;

CREATE TEMP TABLE backup_ajuste_notas AS
SELECT 
    mc.id_matricula_componente,
    mc.media_final AS valor_antigo
FROM basico.curriculo_basico cb
JOIN basico.turma_serie ts ON ts.id_curriculo_medio = cb.id_curriculo_basico 
JOIN basico.serie s ON ts.id_serie = s.id_serie AND s.id_etapa_ensino = 4
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_turma  = t.id_turma 
WHERE cb.codigo IN ('Matriz6ano', 'Matriz7ano' , 'Matriz8ano' , 'Matriz9ano')
AND ts.ativo 
AND ts.ano = 2025
AND t.id_situacao_turma <>4
AND mc.id_situacao_matricula NOT IN (3,7)
AND mc.id_componente_curricular = 230
AND mc.media_final = 0;

SELECT
'UPDATE ensino.matricula_componente SET media_final = ' || mc.valor_antigo || ' WHERE id_matricula_componente =  ' || mc.id_matricula_componente || ';' AS BACKUP
FROM backup_ajuste_notas mc;


UPDATE ensino.matricula_componente
SET media_final = NULL
FROM backup_ajuste_notas
WHERE ensino.matricula_componente.id_matricula_componente = backup_ajuste_notas.id_matricula_componente;


--ROLLBACK;
COMMIT;