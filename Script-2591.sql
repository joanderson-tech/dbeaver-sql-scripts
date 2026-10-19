SELECT dt.*
FROM ensino.docente_turma dt
JOIN rh.servidor s ON
s.id_servidor = dt.id_docente
--JOIN comum.pessoa p ON p.id_pessoa = s.id_pessoa 
WHERE dt.id_turma = 682013
AND dt.finalizada = FALSE
AND dt.ativo
ORDER BY dt.data_cadastro DESC
LIMIT 1;

SELECT s.*
FROM ensino.docente_turma dt
JOIN rh.servidor s ON
s.id_servidor = dt.id_docente
WHERE dt.id_turma = 682013
AND dt.finalizada = FALSE
AND dt.ativo
ORDER BY dt.data_cadastro DESC
LIMIT 1;