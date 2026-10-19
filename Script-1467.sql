SELECT *
FROM ensino.turma t
WHERE t.id_turma_serie = 73417705;

73417706

SELECT *
FROM ensino.horario_turma ht
WHERE ht.id_turma IN (768431, 768426);

SELECT *
FROM ensino.horario_turma ht
WHERE ht.id_registro_entrada = 7135262;

SELECT *
FROM ensino.horario_turma ht
WHERE ht.id_turma = 768426;
AND ht.ativo
LIMIT 1;

SELECT *
FROM ensino.horario_turma ht
WHERE ht.id_turma = 768426;

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie = 73417705;

SELECT *
FROM ensino.docente_turma dt
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
WHERE dt.ativo
AND t.id_turma_serie = 73417705;
-- Auto-generated SQL script #202511271708
UPDATE basico.curriculo_basico
SET
permite_multiplos_professores_polivalente = FALSE
WHERE id_curriculo_basico = 51870329;
-- Auto-generated SQL script #202511271709
UPDATE basico.curriculo_basico_componente
SET
permite_alocacao_adjunto = FALSE, permite_multiplos_professores = FALSE
WHERE id_curriculo_basico_componente = 52230559;

SELECT *
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico = 51870329;
--ts.id_turma_serie = 73417705

SELECT dt
FROM ensino.turma t
RIGHT JOIN ensino.docente_turma dt ON
dt.id_turma = t.id_turma
WHERE t.id_turma_serie = 73417705
AND t.id_disciplina = 220
AND now() BETWEEN dt.data_inicio AND dt.data_fim
AND NOT dt.finalizada
AND dt.ativo;

SELECT CASE WHEN count(dt.id_docente_turma) > 0 THEN TRUE
ELSE FALSE END
FROM ensino.turma t
JOIN ensino.docente_turma dt ON
dt.id_turma = t.id_turma
WHERE t.id_turma_serie = 73417705
AND t.id_disciplina = 220
AND now() BETWEEN dt.data_inicio AND dt.data_fim
AND NOT dt.finalizada
AND dt.ativo;
