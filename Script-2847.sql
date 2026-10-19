SELECT t.*
FROM ensino.matricula_componente mc, 
ensino.turma t
WHERE mc.id_turma = t.id_turma
--AND mc.id_discente = 1407259
AND t.id_turma_serie = 95789029


MPAMG3G4G5A, UNFMM2PA



830012,853602


95789029, 97008002



SELECT t.*
from ensino.turma t
WHERE  t.id_turma_serie = 97008002;


select * from ensino.matricula_componente mc where mc.id_turma in (830013, 830014, 830015, 830016, 830017, 830012);