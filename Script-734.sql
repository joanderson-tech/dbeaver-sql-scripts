UPDATE ensino.horario_turma SET ativo=true WHERE id_horario_turma in (1409234, 1409232, 1409233, 1409230);

select*-- string_agg(id_horario_turma ::varchar, ', ') 
from ensino.horario_turma where id_turma  in (685842, 685843, 685844, 685845, 685846, 685847, 685848, 685849, 685850) and ativo; = false;


-- Turmas 'EFAFV7A OK'EFAFM6A OK'  'EFAFM6B 2025-05-22' 'EFAFM6C 2025-05-22'  'EFAFM9B 2025-05-22' 'EFAFM7A 2025-05-22'
--'EFAFM7B 2025-05-22' 'EFAFV8A 2025-03-25' 'EFAFM8C 2025-05-22'

/*
select string_agg(id_turma ::varchar, ', ') 
from ensino.turma where codigo = 'EFAFM9A' and ano = 2025;
*/

select *  --string_agg(id_turma ::varchar, ', ') 
from ensino.turma where codigo = 'EFAFM6B' and ano = 2025 and id_disciplina = 239;

select * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_aluno fa where fa.id_turma= 685732  and ativo = FALSE; and "data"  ate '2025-04-28'

select * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_turma ft   where ft.id_turma= 685703; and ativo = false;
--FORAM ATIVOS E TODOS FORAM PREENCHIDOS
--FORAM ATIVOS OS RESGISTROS QUE TINHA E ALGUMAS DATAS NÃO TEM REGISTRO 
--FICARAM SO 2 DIAS SEM LANCHAMENTO POIS NÃO TINHA NO BANCO

--Updated Rows	684
-- CARLA ELOÍSA FERNANDES DA SILVA 6º Ano - EFAFM6B / MATUTINO FORAM ATIVOS E TODOS FORAM PREENCHIDOS 
UPDATE ensino.frequencia_aluno
	SET ativo=true
	WHERE id_frequencia in ();

select string_agg(id_frequencia  ::varchar, ', ') 
from ensino.frequencia_aluno fa
join ensino.turma t on t.id_turma = fa.id_turma 
where not fa.ativo
    and fa.id_turma in (705899)
    and not exists (select 1 from ensino.frequencia_aluno fa2 where fa2.data = fa.data and fa2.id_discente = fa.id_discente and fa2.id_turma = fa.id_turma and fa2.ativo);

SELECT string_agg(id_frequencia::varchar, ', ')  
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 685745
  AND ativo = false
  AND "data" <= '2025-04-25';

SELECT string_agg(id_frequencia::varchar, ', ')  
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 685732
  AND ativo = false
  AND "data" NOT IN ( '2025-02-26','2025-05-14')
 -- AND "data" <= '2025-06-10';


-- EFAFM9B  TEVE FREQUECIA LANÇADA ATE DIA 28 2025-05-08

begin;
commit;

rollback;



select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo  AND p.nome ILIKE '%FERNANDO EDUARDO BORGES DA SILVA%'


select
	to_char(f.data, 'YYYY-MM-DD') as data_aula
from
	ensino.frequencia_aluno f
join ensino.turma t on
	t.id_turma = f.id_turma
join basico.turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
join basico.matricula_estudante_serie mes on
	mes.id_turma_serie = ts.id_turma_serie
	and mes.id_estudante = f.id_discente
	--and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10, 6 )
where
	f.ativo = true
	and f.id_turma = 685680
group by
	data_aula
order by
	data_aula;









SELECT * --string_agg(id_frequencia::varchar, ', ')  
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 685736
  AND ativo = false
  AND "data" <= '2025-04-24';





SELECT string_agg(id_frequencia::varchar, ', ')  
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 685684
  AND ativo = false
  AND "data" = '2025-02-27'
  and data_cadastro  in ('2025-02-27 00:00:00.000' )















