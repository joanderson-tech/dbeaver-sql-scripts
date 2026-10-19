SELECT dt FROM ensino.docente_turma dt
WHERE dt.id_turma = 708161
AND dt.ativo IS TRUE
AND dt.finalizada  IS FALSE
AND dt.auxiliar  IS FALSE
--AND dt.data_fim  >= now();