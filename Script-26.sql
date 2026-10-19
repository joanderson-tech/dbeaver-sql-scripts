select 
	fa.id_discente,
	e.codigo_inep as codigo, 
	e.nome as unidade, 
	d.matricula, 
	p.nome as aluno, 
	ee.sigla as curso,
	s.sigla, 
	ts.nome as turma,
	CAST(EXTRACT(MONTH FROM fa."data") as int) AS mes, 
	CAST(sum(fa.frequencia) as int) AS faltas,
	CAST(sum(COALESCE(iaf.quantidade_faltas_abonadas, 0)) as int) AS abonadas 
		from escola.escola e 
		JOIN basico.turma_serie ts ON ts.id_escola = e.id_escola
	    JOIN basico.serie s ON s.id_serie = ts.id_serie
	    JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
	    JOIN ensino.turma t2 ON t2.id_turma_serie = ts.id_turma_serie
	    JOIN ensino.matricula_componente mc ON mc.id_turma = t2.id_turma
	    join public.discente d on d.id_discente = mc.id_discente 
	    join comum.pessoa p on p.id_pessoa = d.id_pessoa 
	   	join ensino.frequencia_aluno fa on fa.id_turma = t2.id_turma
	   	join ensino.abono_frequencia af on af.id_estudante = d.id_discente 
	   	LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia 
	   	WHERE fa.ativo OR fa.abonada
		   AND t2.ano = 2023
		   and iaf.quantidade_faltas_abonadas = 1
	   	GROUP BY e.codigo_inep, e.nome, d.matricula, 
	   			 p.nome,ee.sigla, s.sigla, ts.nome, fa."data", fa.frequencia, af.justificativa, fa.id_discente;
	   			 
---- Mes, faltas mes e abonadas faltas 
select
   CAST(EXTRACT(MONTH FROM fa."data") as int) AS mes, 
   CAST(sum(fa.frequencia) as int) AS faltas, 
   CAST(sum(COALESCE(iaf.quantidade_faltas_abonadas, 0)) as int) AS abonadas 
FROM ensino.frequencia_aluno fa 
LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia 
JOIN ensino.turma t ON t.id_turma = fa.id_turma 
WHERE fa.id_discente = 974724
   AND (fa.ativo OR fa.abonada) 
   AND t.ano = 2023 
GROUP BY 1
ORDER BY 1;


---- Total de falta e abonadas
SELECT
  'Total' AS mes,
  CAST(SUM(fa.frequencia) AS INT) AS faltas,
  CAST(SUM(COALESCE(iaf.quantidade_faltas_abonadas, 0)) AS INT) AS abonadas
FROM ensino.frequencia_aluno fa
LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
JOIN ensino.turma t ON t.id_turma = fa.id_turma
WHERE fa.id_discente = 982567
  AND (fa.ativo OR fa.abonada)
  AND t.ano = 2023;

SELECT
   CAST(EXTRACT(MONTH FROM fa."data") as int) AS mes,
   CAST(sum(fa.frequencia) as int) AS faltas,
   CAST(sum(COALESCE(iaf.quantidade_faltas_abonadas, 0)) as int) AS abonadas
FROM ensino.frequencia_aluno fa
LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
JOIN ensino.turma t ON t.id_turma = fa.id_turma
WHERE fa.id_discente = 973998
   AND (fa.ativo OR fa.abonada)
   AND t.ano = ano
GROUP BY 1
ORDER BY 1;

WITH FaltasPorMes AS (
  SELECT
    CAST(EXTRACT(MONTH FROM fa."data") as int) AS mes,
    CAST(sum(fa.frequencia) as int) AS faltas
  FROM ensino.frequencia_aluno fa
  LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
  JOIN ensino.turma t ON t.id_turma = fa.id_turma
  WHERE fa.id_discente = 973998
    AND (fa.ativo OR fa.abonada)
    AND t.ano = ano
  GROUP BY 1
)
SELECT
  mes,
  faltas,
  SUM(faltas) OVER () AS total_faltas,
  CASE
    WHEN SUM(faltas) OVER () = 0 THEN 0  -- Evita a divisão por zero
    else 100.00 - ROUND(CAST(faltas AS NUMERIC) / SUM(faltas) OVER () * 100, 2)
  END AS percentFaltaMes
FROM FaltasPorMes
ORDER BY mes;

WITH FaltasPorMes AS (
  SELECT
    CAST(EXTRACT(MONTH FROM fa."data") as int) AS mes,
    CAST(sum(fa.frequencia) as int) AS faltas
  FROM ensino.frequencia_aluno fa
  LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
  JOIN ensino.turma t ON t.id_turma = fa.id_turma
  WHERE fa.id_discente = 973998
    AND (fa.ativo OR fa.abonada)
    AND t.ano = ano
  GROUP BY 1
)
SELECT
  mes,
  faltas,
  SUM(faltas) OVER () AS total_faltas,
  CASE
    WHEN SUM(faltas) OVER () = 0 THEN 0 
    ELSE 100.00 - ROUND(CAST(faltas AS NUMERIC) / SUM(faltas) OVER () * 100, 2)
  END AS percentFaltaMes
FROM FaltasPorMes
ORDER BY mes;



		
select *
from ensino.item_abono_frequencia ;

select *
from public.discente;


select *
from basico.estudante e  ;
	
select *
from comum.pessoa p 
where p.nome ='ISIS SOPHIA MENEZES LIMA';

select *
from basico.matricula_estudante_serie mes ;

select *
from basico.turma_serie ts ;

select *
from basico.serie s;

select *
from ensino.matricula_componente mc;

select *
from ensino.turma;
