select sum(ch_semana) as ch_total_turma, ch_alocada, sum(ch_semana) - ch_alocada ch_disponivel
from( select dt.* --id_turma_serie, id_curriculo_medio, sum(ch_dedicada_periodo) ch_alocada
from ensino.docente_turma dt
join ensino.turma t
	using(id_turma)
join basico.turma_serie ts
	using(id_turma_serie)
where ts.id_turma_serie = 53174268
and (dt.id_docente <> null
	or null is null)
and ts.ativo is true
and t.id_situacao_turma not in(4, 8)
and dt.ativo is true
and not dt.finalizada
and dt.auxiliar is not true
and now() between dt.data_inicio and dt.data_fim
and dt.data_fim > now()
group by id_turma_serie, id_curriculo_medio ) alocada
join basico.curriculo_basico_componente cbc on
cbc.id_curriculo_basico = alocada.id_curriculo_medio
group by id_curriculo_medio, ch_alocada;



 select dt.* --id_turma_serie, id_curriculo_medio, sum(ch_dedicada_periodo) ch_alocada
from ensino.docente_turma dt
join ensino.turma t
	using(id_turma)
join basico.turma_serie ts
	using(id_turma_serie)
where ts.id_turma_serie = 53174268
and (dt.id_docente <> null
	or null is null)
and ts.ativo is true
and t.id_situacao_turma not in(4, 8)
and dt.ativo is true
and not dt.finalizada
and dt.auxiliar is not true
and now() between dt.data_inicio and dt.data_fim
and dt.data_fim > now();
group by id_turma_serie, id_curriculo_medio;