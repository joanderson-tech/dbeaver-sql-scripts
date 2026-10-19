SELECT *
FROM basico.turma_serie ts
WHERE ts.nome = 'EICRINTG2G3A'
AND ts.ano = 2026
AND ts.id_escola = 83788293;

SELECT mc.*
FROM ensino.turma t
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie = 84777071;

518 283

SELECT *
FROM ensino.matricula_componente mc
WHERE mc.id_turma IN(829258,829257);

SELECT *
FROM ensino.matricula_componente mc
WHERE mc.id_turma IN(826285);


SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 87271650;



SELECT DISTINCT mc.*
FROM ensino.turma t
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie = 84777068
AND mc.id_situacao_matricula = 2
ORDER BY id_componente_curricular ;
