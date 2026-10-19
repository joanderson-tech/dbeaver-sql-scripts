SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie = 54881473;  --24  --curriculo 20


SELECT ts.tipo_diario, * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 54872993;


SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_turma_serie IN (54881473, 54883018)



-- Auto-generated SQL script #202604091120
UPDATE basico.turma_serie 	SET tipo_diario=20 	WHERE id_turma_serie IN (54881473, 54883018);
