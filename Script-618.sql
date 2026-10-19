select * from comum.pessoa p where p.nome = 'LUCAS MATHEUS ATYLAS MEDEIROS DA SILVA'

select * from basico.matricula_estudante_serie mes where mes.id_estudante = 980613 and mes.id_matricula_discente_serie = 1358136;

--MULTIINTM12B-M1

select *
from ensino.turma where codigo = 'MULTIINTM12B' and ano = 2025;

select  cc.nome , FA.id_turma ,  SUM(fa.frequencia) AS total_frequencia
from ensino.frequencia_aluno fa
join ensino.turma t on t.id_turma = fa.id_turma
join ensino.componente_curricular cc on cc.id_componente_curricular = t.id_disciplina 
where fa.id_discente = 980613 
and fa.id_turma in  (711137)
GROUP BY  cc.nome, FA.id_turma
ORDER BY  cc.nome, FA.id_turma;

select * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_turma ft   where ft.id_turma in (711137, 711156, 711158, 711157, 711143, 711140, 711139, 711138, 711149, 711147, 711141, 711142, 711144, 711146, 711154, 711151, 711148, 711150, 711153, 711152, 711145, 711155);

SELECT string_agg(id_matricula_componente  ::varchar, ', ')  FROM ensino.matricula_componente mc where mc.id_discente = 980613  and ano = 2025 and id_situacao_matricula = 2
and mc.id_turma in (711137);


select * from ensino.falta_unidade fa
where id_matricula_componente in ( 17449634);

select *from ensino.matricula_componente mc where mc.id_matricula_componente = 17449634;


select * 
from basico.turma_serie ts
join ensino.turma t on t.id_turma_serie = ts.id_turma_serie
where ts.id_turma_serie in ( 53509495) 
and ts.ano = 2025;


select * from ensino.falta_unidade fu 
where id_matricula_componente in (17449634, 17449635, 17449636, 17449637, 17449638, 17449639, 17449640, 17449641, 17449642, 17449643, 17449644, 17449645, 17449646, 17449647, 17449648, 17449649, 17449650, 17449651, 17449652, 17449653, 17449654, 17449844, 17449845, 17449846, 17449847, 17449848, 17449849, 17449850, 17449851, 17449852, 17449853, 17449854, 17449855, 17449856, 17449857, 17449858, 17449859, 17449860, 17449861, 17449862, 17449863, 17449864, 17449865, 17449655);



select
	distinct mc.*
from
	ensino.matricula_componente mc
join ensino.turma t on
	t.id_turma = mc.id_turma
where
	mc.id_situacao_matricula in ( 5, 6, 2, 8 )
	and mc.id_discente = 980613
	and t.id_turma_serie = 53509493
	--and mc.id_componente_curricular = 293
	and t.id_situacao_turma <> 4
	and mc.id_situacao_matricula <> 7;




