SELECT 
    'UPDATE basico.curriculo_basico SET carga_horaria= 1400	WHERE id_curriculo_basico IN (' || STRING_AGG(cb.id_curriculo_basico::text, ', ') || ');' AS script,
    'UPDATE basico.curriculo_basico SET carga_horaria= ' || cb.carga_horaria || ' WHERE id_curriculo_basico IN (' || STRING_AGG(cb.id_curriculo_basico::text, ', ') || ');' AS backup
FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246) AND cb.carga_horaria <> 1400
GROUP BY  cb.id_curriculo_basico;