SELECT vs.*
FROM matricula.vaga_serie vs
JOIN
    (
        SELECT id_serie, id_escola, ano_letivo, vagas_validadas, id_turno
FROM matricula.vaga_serie
WHERE id_turno = 1
AND id_escola IN (1037, 1040, 1041, 1042, 1043, 1048, 1052, 1054, 1055)
GROUP BY
            id_serie, id_escola, ano_letivo, vagas_validadas, id_turno
HAVING
            COUNT(*) > 1
    ) AS chaves_duplicadas
    ON
vs.id_serie = chaves_duplicadas.id_serie
AND vs.id_escola = chaves_duplicadas.id_escola
AND vs.ano_letivo = chaves_duplicadas.ano_letivo
AND vs.vagas_validadas = chaves_duplicadas.vagas_validadas
AND vs.id_turno = chaves_duplicadas.id_turno
ORDER BY
    vs.id_escola, vs.id_serie, vs.vagas_validadas, vs.id_vaga_serie;