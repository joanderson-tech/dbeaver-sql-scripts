select dt.data_fim, *  from ensino.docente_turma dt where dt.id_turma = 717261;

56522522
56153317


-- Auto-generated SQL script #202507281420
UPDATE ensino.docente_turma SET data_fim='2025-12-19 00:00:00.000 -0300' WHERE id_docente_turma=56522522;
DELETE FROM ensino.docente_turma WHERE id_docente_turma=56523215;


-- Auto-generated SQL script #202507251623
UPDATE ensino.docente_turma
	SET ativo=true
	WHERE id_docente_turma=56153317;
UPDATE ensino.docente_turma
	SET ativo=false
	WHERE id_docente_turma=56522522;


-- Auto-generated SQL script #202507251645
UPDATE ensino.docente_turma
	SET data_fim='2025-12-10 00:00:00.000 -0300'
	WHERE id_docente_turma=56522522;



select
	ht.*
from
	ensino.horario_turma ht
join ensino.horario h on
	(h.id_horario = ht.id_horario
		and h.ativo = trueValue())
join ensino.docente_turma dt on
	(ht.id_turma = dt.id_turma
		--and dt.ativo = trueValue()
		and dt.finalizada = falseValue())
join ensino.turma t on
	( t.id_turma = dt.id_turma
		 )
join basico.turma_serie ts on
	(t.id_turma_serie = ts.id_turma_serie)
where
	ht.ativo = trueValue()
	and t.id_situacao_turma <> 4
	and dt.id_docente = 77827
	and t.id_turma = 717261
	and dt.data_fim > current_date;