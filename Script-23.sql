select * from basico.curriculo_basico cb
where ano_entrada_vigor = 2023;


SELECT *
FROM escola.escola e
WHERE e.nome LIKE '%ESCOLA MUNICIPAL FREI DAMIAO%';


select * from ensino.turma t 
where t.ano =2023
and t.id_turma = 52798391
;

select cb.codigo, * 
from basico.turma_serie ts 
join basico.curriculo_basico cb on cb.id_curriculo_basico = ts.id_curriculo_medio 
where ts.nome ilike 'EIUMEICPA';




