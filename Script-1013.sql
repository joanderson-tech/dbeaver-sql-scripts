select aeeh.hora_inicio, aeeh.hora_fim, aeee.id_estudante, aeee.data_cadastro  from educacao_especial.atendimento_educacao_especial_estudante aeee  
join educacao_especial.atendimento_educacao_especial_horario aeeh  on aeeh.id_atendimento_educacao_especial_horario = aeee.id_atendimento_educacao_especial_horario 
where aeee.id_estudante = 991313;

select ah.dia, am
from educacao_especial.atendimento_educacao_especial_turma t
join educacao_especial.atendimento_educacao_especial_horario ah using(id_atendimento_educacao_especial_turma)
join educacao_especial.atendimento_educacao_especial_estudante am using(id_atendimento_educacao_especial_horario)
join educacao_especial.atendimento_educacao_especial a using (id_atendimento_educacao_especial)
join ensino.horario hh on hh.id_horario = ah.id_horario
join ensino.turma tt using (id_turma)
left join ensino.docente_turma dt on
	dt.ativo = true
	and dt.id_turma = t.id_turma
	and dt.data_fim > now()
	left join rh.servidor s on s.id_servidor = dt.id_docente
left join comum.pessoa professor on professor.id_pessoa = s.id_pessoa
join basico.turma_serie ts using (id_turma_serie)
join ensino.turno tr on (tr.id_turno = ts.id_turno)
left join escola.escola esc using (id_escola)
left join comum.municipio mun using (id_municipio)
left join comum.unidade dired on (dired.id_unidade = esc.id_regional_ensino )
join discente d on (am.id_estudante = d.id_discente)
join comum.pessoa p on (p.id_pessoa = d.id_pessoa)
join comum.pessoa_necessidade_especial pne on (pne.id_pessoa = p.id_pessoa)
where am.id_estudante = 991313
and am.ativo = true
and tt.ano = 2025
and p.id_pessoa = 764303
--and ts.id_escola = 1650

1650
1696
1696