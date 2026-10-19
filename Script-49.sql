---- Mes, faltas mes e abonadas faltas 
select 
   CAST(EXTRACT(MONTH FROM fa."data") as int) AS mes, 
   CAST(sum(fa.frequencia) as int) AS faltas, 
   CAST(sum(COALESCE(iaf.quantidade_faltas_abonadas, 0)) as int) AS abonadas 
FROM ensino.frequencia_aluno fa 
LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia 
JOIN ensino.turma t ON t.id_turma = fa.id_turma 
WHERE fa.id_discente = 976752
   AND (fa.ativo OR fa.abonada) 
   AND t.ano = 2023 
   and fa.id_turma in (683473)
GROUP BY 1
ORDER BY 1;

select *
FROM ensino.frequencia_aluno fa;

SELECT x.* FROM public.discente x
WHERE x.matricula  = '202330032830';

select *
from basico.matricula_estudante_serie mes 
where mes.id_estudante = 976752;

select *
from ensino.turma t 
where t.id_turma_serie = 51889212;