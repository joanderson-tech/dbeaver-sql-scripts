WITH faltas AS (
    SELECT
        EXTRACT(MONTH FROM fa."data") AS mes,
        SUM(fa.frequencia) AS faltas,
        SUM(COALESCE(iaf.quantidade_faltas_abonadas, 0)) AS abonadas
    FROM ensino.frequencia_aluno fa
    LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
    JOIN ensino.turma t ON t.id_turma = fa.id_turma
    WHERE fa.id_discente = 982567
        AND (fa.ativo OR fa.abonada)
        AND t.ano = 2023
    GROUP BY mes
    ORDER BY mes
)
SELECT e.codigo_inep as codigo, 
	e.nome as unidade, 
	d.matricula, 
	p.nome as aluno, 
	ee.sigla as curso,
	s.sigla, 
	ts.nome as turma, *
FROM faltas;



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
	FROM ensino.frequencia_aluno fa 
		LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia 
		JOIN ensino.turma t ON t.id_turma = fa.id_turma
		join basico.turma_serie ts on ts.id_turma_serie = t.id_turma_serie
		join escola.escola e on e.id_escola = ts.id_escola 
		JOIN basico.serie s ON s.id_serie = ts.id_serie
	    JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
	    JOIN ensino.turma t2 ON t2.id_turma_serie = ts.id_turma_serie
	    JOIN ensino.matricula_componente mc ON mc.id_turma = t2.id_turma
	    join public.discente d on d.id_discente = mc.id_discente 
	    join comum.pessoa p on p.id_pessoa = d.id_pessoa 
	   	where  t2.ano = 2023
		   and fa.id_discente = '975236'
		   and e.codigo_inep = '28020642'
		   and iaf.quantidade_faltas_abonadas = 1
	   	GROUP BY e.codigo_inep, e.nome, d.matricula, 
	   			 p.nome,ee.sigla, s.sigla, ts.nome, fa."data", fa.frequencia,fa.id_discente;
	   			 
	   			
select *
from public.discente;


select *
from basico.estudante e  ;
	
select *
from comum.pessoa p ;

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
select distinct 
	fa.id_discente,
	e.codigo_inep as codigo, 
	e.nome as unidade, 
	d.matricula, 
	p.nome as aluno, 
	ee.sigla as curso,
	s.sigla as Serie, 
	ts.nome as turma,
	CAST(EXTRACT(MONTH FROM fa."data") as int) AS mes ,  
	CAST(sum(fa.frequencia) as int) AS faltas,
	CAST(sum(COALESCE(iaf.quantidade_faltas_abonadas, 0)) as int) AS abonadas 
from escola.escola e 
		JOIN basico.turma_serie ts ON ts.id_escola = e.id_escola
	    JOIN basico.serie s ON s.id_serie = ts.id_serie
	    JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
	    JOIN ensino.turma t2 ON t2.id_turma_serie = ts.id_turma_serie
		JOIN ensino.frequencia_aluno fa on fa.id_turma	= t2.id_turma
		LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
		join public.discente d on d.id_discente = fa.id_discente 
		join comum.pessoa p on p.id_pessoa = d.id_pessoa
		where e.codigo_inep = '28020642'
	GROUP BY  d.matricula,
			  e.nome,
			  e.codigo_inep,
	   		  ee.sigla, 
	   		  s.sigla, 
	   		  ts.nome, fa."data", 
	   		  fa.frequencia, 
	   		  fa.id_discente, 
	   		  p.nome
	   		  ORDER BY 1;
	   
	   			