select t.id_turma, ts.nome, cc.nome, p.nome, s.siape, dt.ch_dedicada_periodo, dt.data_inicio, dt.data_fim, dt.id_docente_turma, t.codigo, tr.descricao, t.agrupadora, t.grupo, s.digito_siape, s.id_servidor, t.id_turma_agrupadora, t.id_disciplina, ser.tipo_diario, ser.id_etapa_ensino, t.periodo, t.id_modulo, mod.denominacao, t.id_situacao_turma, t.descricao_horario, dt.suplementar, p.id_pessoa, de.id_docente_externo, de.id_pessoa, pde.nome, pde.cpf_cnpj, t.tipo, cc.id_tipo_componente
from basico.turma_serie ts
join ensino.turma t
	using (id_turma_serie)
join basico.curriculo_basico_componente cbc on
cbc.id_curriculo_basico = ts.id_curriculo_medio
and cbc.id_componente_curricular = t.id_disciplina
join basico.serie ser
	using (id_serie)
join ensino.componente_curricular cc on
( cc.id_componente_curricular = t.id_disciplina )
join ensino.turno tr on
( tr.id_turno = ts.id_turno )
left join ensino.docente_turma dt on
t.id_turma = dt.id_turma
and (dt.ativo = trueValue()
	and dt.finalizada = falseValue() )
and case when t.id_disciplina = 220 then suplementar = false
else 1 = 1 end
and auxiliar = falseValue()
and dt.data_fim >= current_date + interval '0 seconds'
left join rh.servidor s on
( dt.id_docente = s.id_servidor )
left join comum.pessoa p
	using (id_pessoa)
left join ensino.docente_externo de on
( dt.id_docente_externo = de.id_docente_externo )
left join comum.pessoa pde on
( pde.id_pessoa = de.id_pessoa )
left join basico.modulo mod on
t.id_modulo = mod.id_modulo
where ts.id_turma_serie = 51896830
and t.id_situacao_turma <> 4
and cc.id_tipo_componente <> 6
order by (id_turma_agrupadora is null) desc, t.tipo, t.grupo, t.id_modulo, t.ordem asc, cc.nome asc, dt.id_docente_turma asc ;

select *
from ensino.turma t
where t.id_turma_serie = 51896830;

select *
from basico.curriculo_basico_componente cbc
where cbc.id_curriculo_basico = 35502048;

select turmacompo1_.id_turma as col_0_0_, turmacompo1_.data_inicio as col_1_0_, turmacompo1_.data_fim as col_2_0_, turmacompo1_.ano as col_3_0_, turmacompo1_.periodo as col_4_0_, turmacompo1_.codigo as col_5_0_, componente6_.id_componente_curricular as col_6_0_, componente6_.codigo as col_7_0_, componente6_.nivel as col_8_0_, componente6_.nome as col_9_0_, horarios8_.id_horario_turma as col_10_0_, horarios8_.dia as col_11_0_, horarios8_.hora_inicio as col_12_0_, horarios8_.hora_fim as col_13_0_, horarios8_.data_inicio as col_14_0_, horarios8_.data_fim as col_15_0_, horarios8_.tipo as col_16_0_, horarios8_.ativo as col_17_0_, horario9_.id_horario as col_18_0_, horario9_.inicio as col_19_0_, horario9_.fim as col_20_0_, horario9_.ordem as col_21_0_, horario9_.tipo as col_22_0_, horario9_.ativo as col_23_0_, horario9_.nivel as col_24_0_, docentestu5_.id_docente_turma as col_25_0_, docentestu5_.ch_dedicada_periodo as col_26_0_, servidor10_.id_servidor as col_27_0_, pessoa11_.id_pessoa as col_28_0_, pessoa11_.nome as col_29_0_, pessoa11_.cpf_cnpj as col_30_0_, docenteext12_.id_docente_externo as col_31_0_, pessoa13_.id_pessoa as col_32_0_, pessoa13_.nome as col_33_0_, pessoa13_.cpf_cnpj as col_34_0_, horarios14_.id_horario_turma as col_35_0_, horarios14_.dia as col_36_0_, horarios14_.data_inicio as col_37_0_, horarios14_.data_fim as col_38_0_, horarios14_.tipo as col_39_0_, horario15_.id_horario as col_40_0_, horario15_.inicio as col_41_0_, horario15_.fim as col_42_0_, horario15_.ordem as col_43_0_, horario15_.tipo as col_44_0_, horario15_.ativo as col_45_0_, horario15_.nivel as col_46_0_, escola3_.nome as col_47_0_
from ensino.docente_turma docentetur0_
inner join ensino.turma turmacompo1_ on
docentetur0_.id_turma = turmacompo1_.id_turma
inner join basico.turma_serie turmaserie2_ on
turmacompo1_.id_turma_serie = turmaserie2_.id_turma_serie
inner join escola.escola escola3_ on
turmaserie2_.id_escola = escola3_.id_escola
inner join ensino.docente_turma docentestu5_ on
turmacompo1_.id_turma = docentestu5_.id_turma
left outer join rh.servidor servidor10_ on
docentestu5_.id_docente = servidor10_.id_servidor
left outer join comum.pessoa pessoa11_ on
servidor10_.id_pessoa = pessoa11_.id_pessoa
left outer join ensino.docente_externo docenteext12_ on
docentestu5_.id_docente_externo = docenteext12_.id_docente_externo
left outer join comum.pessoa pessoa13_ on
docenteext12_.id_pessoa = pessoa13_.id_pessoa
inner join ensino.componente_curricular componente6_ on
turmacompo1_.id_disciplina = componente6_.id_componente_curricular
inner join ensino.situacao_turma situacaotu7_ on
turmacompo1_.id_situacao_turma = situacaotu7_.id_situacao_turma
left outer join ensino.horario_turma horarios8_ on
turmacompo1_.id_turma = horarios8_.id_turma
left outer join ensino.Horario horario9_ on
horarios8_.id_horario = horario9_.id_horario
left outer join ensino.horario_turma horarios14_ on
turmacompo1_.id_turma = horarios14_.id_turma
left outer join ensino.Horario horario15_ on
horarios14_.id_horario = horario15_.id_horario
inner join rh.servidor servidor4_ on
docentetur0_.id_docente = servidor4_.id_servidor
where turmacompo1_.ano = 2026
and servidor4_.id_servidor = 300
and (situacaotu7_.id_situacao_turma in (1 , 2 , 3 , 7))
and docentetur0_.ativo = true
and docentetur0_.data_fim>?
and horarios8_.ativo = true
order by turmacompo1_.id_turma, horarios8_.id_horario_turma, horario9_.id_horario, docentestu5_.id_docente_turma, servidor10_.id_servidor, docenteext12_.id_docente_externo, horarios14_.id_horario_turma, horario15_.id_horario
