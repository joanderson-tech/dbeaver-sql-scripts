SELECT *
FROM ensino.horario h
WHERE h.ativo = TRUE
AND h.tipo IN (524350830)
AND h.id_unidade = 5847
AND h.id_etapa_ensino = 1
AND ano_entrada_vigor = ( SELECT ano_entrada_vigor
FROM ensino.horario
WHERE ativo = TRUE
AND nivel = h.nivel
AND tipo = h.tipo
AND id_unidade = h.id_unidade
AND id_etapa_ensino = h.id_etapa_ensino
AND ano_entrada_vigor <= 2026
ORDER BY ano_entrada_vigor DESC
LIMIT 1)
ORDER BY h.tipo, h.ordem;



SELECT * FROM ensino.horario h WHERE ativo = TRUE
AND ano_entrada_vigor = 2026;

SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie = 	52563983;


SELECT * FROM  basico.etapa_ensino ee;


-- Auto-generated SQL script #202606011623
UPDATE basico.turma_serie
	SET permite_disciplina_contraturno=false
	WHERE id_turma_serie=52563983;



-- Auto-generated SQL script #202606011517
UPDATE ensino.horario
	SET id_etapa_ensino=1
	WHERE id_horario IN (52566316, 52566317, 52566318, 52566319, 52566320, 52566321, 52566322, 52566323, 52566324, 52566325, 52566326, 52566327, 52566328, 52566329, 52566330, 52566331);

