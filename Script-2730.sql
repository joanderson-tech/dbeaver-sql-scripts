SELECT * FROM escola.escola e WHERE e.nome ILIKE '%ESCOLA MUNICIPAL VER SEBASTIÃO PRUDENCIO DE LIMA%';

SELECT * FROM basico.turma_serie ts 
WHERE ts.id_escola = 974
AND ts.ano = 2026
AND ts.nome = 'EJAINPIA';

SELECT * FROM basico.matricula_estudante_serie mes 
WHERE mes.id_turma_serie = 57376304;
