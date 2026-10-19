select * from ensino.turma t where t.id_turma  = 688730; 52231366 

select * from ensino.docente_turma dt; where dt.id_turma = 688730;

select
	dt
from ensino.docente_turma dt 
join ensino.turma t on ( t.id_turma = dt.id_turma )
join basico.turma_serie ts on (t.id_turma_serie = ts.id_turma_serie)
where
	t.id_turma_serie = 52231366
	and t.id_situacao_turma <> 4
	and dt.ativo ;

update ensino.docente_turma dt where dt.atis


select
	*
from ensino.docente_turma dt where dt.id_docente_turma in (52279805,52279806,52279807,52279810);

-- Auto-generated SQL script #202507301430
UPDATE ensino.docente_turma SET ativo=false WHERE id_docente_turma in (52279805,52279806,52279807,52279810);
