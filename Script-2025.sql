select ht.*
from ensino.horario_turma ht
join ensino.horario h on
(h.id_horario = ht.id_horario
	and h.ativo = trueValue())
join ensino.docente_turma dt on
(ht.id_turma = dt.id_turma
	and dt.ativo = trueValue()
	and dt.finalizada = falseValue())
join ensino.turma t on
( t.id_turma = dt.id_turma
	and dt.ativo = trueValue() )
join basico.turma_serie ts on
(t.id_turma_serie = ts.id_turma_serie)
where ht.ativo = trueValue()
and t.id_situacao_turma <> 4
and dt.id_docente = 54
and t.id_turma = 689610
and dt.data_fim > current_date;


select * from basico.curriculo_basico cb where cb.codigo = '1ANORC'

select * from basico.curriculo_basico_componente cbc where cbc.id_curriculo_basico = 52213959;