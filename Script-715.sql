select * from discente d where d.matricula = '202130002272';
select * from basico.matricula_estudante_serie mes where id_estudante = 973694 and  ano_calendario in (2024);




select * --string_agg(id_alteracao_matricula_serie  ::varchar, ', ')  
from basico.alteracao_matricula_serie ams where ams.id_matricula_discente_serie  = 1322610;

select string_agg(id_turma  ::varchar, ', ')   
from ensino.turma t where t.id_turma_serie in (52112055);

select *  -- string_agg(id_matricula_componente   ::varchar, ', ')
from ensino.matricula_componente mc where id_discente = 973694  and mc.id_turma in (685520, 685519, 685522, 685524, 685525, 685523, 685518, 685521, 685517) and id_situacao_matricula = 9;

select *  -- string_agg(id_matricula_componente   ::varchar, ', ')
from ensino.matricula_componente mc where id_discente = 973694  and mc.id_turma in (685534, 685530, 685533, 685532, 685526, 685528, 685527, 685529, 685531)  and id_situacao_matricula = 5;


-- identificação do estudante e matrícula
select
	mes.*
from basico.matricula_estudante_serie mes 
join public.discente d on d.id_discente = mes.id_estudante 
where mes.ano_calendario = 2023
	and d.matricula = '202330000120';
	
select tipo_diario, * from basico.turma_serie ts where id_turma_serie_agrupadora = 52020591;

-- geração dos scrips de atualização das matrículas componentes
select 
	'update ensino.matricula_componente set id_turma = '||ta.id_turma||' where id_matricula_componente = '||mc.id_matricula_componente||';' as backup,
	'update ensino.matricula_componente set id_turma = '||tn.id_turma||' where id_matricula_componente = '||mc.id_matricula_componente||';' as solucao
--	mc.id_matricula_componente, ta.id_turma, ta.id_disciplina, ta.id_situacao_turma, tn.id_turma, tn.id_disciplina, tn.id_situacao_turma
from ensino.turma ta
join ensino.matricula_componente mc 
	on mc.id_turma = ta.id_turma
	and mc.id_discente = 973694
join ensino.turma tn
	on tn.id_disciplina = ta.id_disciplina
	and tn.id_turma_serie = 52037330
where ta.id_turma_serie = 52112053;

begin;

UPDATE basico.matricula_estudante_serie	SET id_serie_multisseriado=1005222,id_turma_serie_multisseriado=52112055	WHERE id_matricula_discente_serie=1322211;

UPDATE ensino.matricula_componente	SET id_turma=685526	WHERE id_matricula_componente=17065575;
UPDATE ensino.matricula_componente	SET id_turma=685527	WHERE id_matricula_componente=17065576;
UPDATE ensino.matricula_componente	SET id_turma=685528	WHERE id_matricula_componente=17065577;
UPDATE ensino.matricula_componente	SET id_turma=685529	WHERE id_matricula_componente=17065578;
UPDATE ensino.matricula_componente	SET id_turma=685530	WHERE id_matricula_componente=17065579;
UPDATE ensino.matricula_componente	SET id_turma=685531	WHERE id_matricula_componente=17065580;
UPDATE ensino.matricula_componente	SET id_turma=685532	WHERE id_matricula_componente=17065581;
UPDATE ensino.matricula_componente	SET id_turma=685533	WHERE id_matricula_componente=17065582;
UPDATE ensino.matricula_componente	SET id_turma=685534	WHERE id_matricula_componente=17065583;

commit;


--backup
UPDATE basico.matricula_estudante_serie SET id_serie_multisseriado=1005221,id_turma_serie_multisseriado=52112054 WHERE id_matricula_discente_serie=1322211;

UPDATE ensino.matricula_componente  SET id_turma=685517 WHERE id_matricula_componente=17065575;
UPDATE ensino.matricula_componente	SET id_turma=685518	WHERE id_matricula_componente=17065576;
UPDATE ensino.matricula_componente	SET id_turma=685519	WHERE id_matricula_componente=17065577;
UPDATE ensino.matricula_componente	SET id_turma=685520	WHERE id_matricula_componente=17065578;
UPDATE ensino.matricula_componente	SET id_turma=685521	WHERE id_matricula_componente=17065579;
UPDATE ensino.matricula_componente	SET id_turma=685522	WHERE id_matricula_componente=17065580;
UPDATE ensino.matricula_componente	SET id_turma=685523	WHERE id_matricula_componente=17065581;
UPDATE ensino.matricula_componente	SET id_turma=685524	WHERE id_matricula_componente=17065582;
UPDATE ensino.matricula_componente	SET id_turma=685525	WHERE id_matricula_componente=17065583;




