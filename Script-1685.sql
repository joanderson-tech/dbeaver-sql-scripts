SELECT DISTINCT ts
FROM escola.escola e
JOIN basico.turma_serie ts ON
ts.id_escola = e.id_escola
--JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
WHERE e.nome ILIKE '%ESCOLA MUNICIPAL BENEDITO LOPES%'
AND ts.ano = 2025
AND ts.nome ILIKE '%MULTIVM1A5B%'
AND ts.ativo;
AND T.id_situacao_turma = 1;
-- Auto-generated SQL script #202601211416
UPDATE ensino.turma
SET
id_situacao_turma = 3
WHERE id_turma IN (705804, 705804, 705826, 705826, 705771, 705771, 706275, 706275, 705859, 705859, 705848, 705848, 705837, 705837, 705782, 705782, 705815, 705815, 705793, 705793, 705892, 705958, 705925, 705881, 705936, 705870, 705903, 705947, 706276, 705914, 706058, 706058, 706128, 706128, 706088, 706088, 706138, 706138, 706078, 706078, 706098, 706098, 706108, 706108, 706118, 706118, 706068, 706068, 706277, 706277, 705989, 705989, 705979, 705979, 705999, 705999, 706039, 706039, 706019, 706019, 706029, 706029, 706009, 706009, 705969, 705969, 706049, 706049, 706278, 706278);

UPDATE ensino.turma SET id_situacao_turma = 1 WHERE id_turma IN (705793, 706275);

698760, 698761, 698762, 698763, 698764, 698765, 698766, 698767, 698768, 704167

SELECT DISTINCT t
--string_agg(t.id_turma::varchar , ', ')  
FROM ensino.matricula_componente mc
JOIN ensino.turma t ON
t.id_turma = mc.id_turma
WHERE t.id_turma_serie  IN (53081434,53081435,53081436,52701073,53081437);
--,53081434,53081435,53081436,52701073,53081437)
AND t.id_situacao_turma <> 4;
-- 52701073,53081437

52701073
53081433
53081434
53081435
53081436
53081437




SELECT count(id_turma)
FROM ensino.turma t
WHERE t.id_turma_serie IN ( SELECT ts.id_turma_serie
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora = 52701073
AND id_disciplina = 220 );

SELECT count(id_turma)
FROM ensino.turma t
WHERE t.id_turma_serie IN ( SELECT ts.id_turma_serie
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora = 52701073
AND id_disciplina = 220
AND id_situacao_turma = 3 );