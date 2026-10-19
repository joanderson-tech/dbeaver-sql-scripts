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
	and mc.id_discente = 975327
join ensino.turma tn
	on tn.id_disciplina = ta.id_disciplina
	and tn.id_turma_serie = 52020595
where ta.id_turma_serie = 52020593;


select * from basico.matricula_estudante_serie mes where mes.id_estudante = 975327;

select * from basico.matricula_estudante_serie mes where mes.id_turma_serie  = 52020593;