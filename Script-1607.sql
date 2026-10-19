SELECT *
FROM ensino.turma
WHERE id_turma_serie  IN (52799036, 52799037, 52799038, 52799039, 52799040);

SELECT *
FROM ensino.turma
WHERE codigo = 'MULTIINTM1A5A';

SELECT ts.*
FROM basico.turma_serie AS ts
WHERE id_turma_serie IN (52799036, 52799037, 52799038, 52799039, 52799040);

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie_multisseriado  IN (52799036, 52799037, 52799038, 52799039, 52799040);