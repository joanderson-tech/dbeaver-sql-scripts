
SELECT distinct *
from
	ensino.docente_turma docentetur0_
inner join ensino.turma turmacompo1_ on
	docentetur0_.id_turma = turmacompo1_.id_turma
inner join ensino.docente_turma docentestu3_ on
	turmacompo1_.id_turma = docentestu3_.id_turma
left outer join rh.servidor servidor8_ on
	docentestu3_.id_docente = servidor8_.id_servidor
left outer join comum.pessoa pessoa9_ on
	servidor8_.id_pessoa = pessoa9_.id_pessoa
left outer join ensino.docente_externo docenteext10_ on
	docentestu3_.id_docente_externo = docenteext10_.id_docente_externo
left outer join comum.pessoa pessoa11_ on
	docenteext10_.id_pessoa = pessoa11_.id_pessoa
inner join ensino.componente_curricular componente4_ on
	turmacompo1_.id_disciplina = componente4_.id_componente_curricular
inner join ensino.situacao_turma situacaotu5_ on
	turmacompo1_.id_situacao_turma = situacaotu5_.id_situacao_turma
left outer join ensino.horario_turma horarios6_ on
	turmacompo1_.id_turma = horarios6_.id_turma
left outer join ensino.Horario horario7_ on
	horarios6_.id_horario = horario7_.id_horario
left outer join ensino.horario_turma horarios12_ on
	turmacompo1_.id_turma = horarios12_.id_turma
left outer join ensino.Horario horario13_ on
	horarios12_.id_horario = horario13_.id_horario
inner join rh.servidor servidor2_ on
	docentetur0_.id_docente = servidor2_.id_servidor
where
	turmacompo1_.ano = 2023
	and servidor2_.id_servidor = 642
	and (situacaotu5_.id_situacao_turma in (1 , 2 , 3 , 7))
	and docentetur0_.ativo = true
	and horarios6_.ativo = true
	and turmacompo1_.codigo = 'EFAFM7A'
	

	
	
order by
	turmacompo1_.id_turma,
	horarios6_.id_horario_turma,
	horario7_.id_horario,
	docentestu3_.id_docente_turma,
	servidor8_.id_servidor,
	docenteext10_.id_docente_externo,
	horarios12_.id_horario_turma,
	horario13_.id_horario
	
-- Auto-generated SQL script #202312201102
UPDATE ensino.horario_turma
	SET ativo=true
	WHERE id_horario_turma=1416002;
UPDATE ensino.horario_turma
	SET ativo=true
	WHERE id_horario_turma=1416019;


--id turma EFAFM7A 
691629

select t.descricao_horario,* from ensino.turma t 
where t.codigo = 'EFAFM7A'
and t.id_turma = 689729;

-- Auto-generated SQL script #202312201119
UPDATE ensino.turma
	SET descricao_horario='3M2'
	WHERE id_turma=690341;

-- Auto-generated SQL script #202312201132
UPDATE basico.turma_serie
	SET ativo=true 
	WHERE id_turma_serie=51916420;

select * from ensino.docente_turma
where id_docente = 642
and id_docente_turma = 51922777;


