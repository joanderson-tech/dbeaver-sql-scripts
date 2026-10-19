select 
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo
    
    
    with turma as (
select
	*
from
	ensino.turma t
where
	t.id_turma = 701030 )
select
	cbc.permite_alocacao_adjunto
from
	turma t
join basico.turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
join basico.curriculo_basico cb on
	cb.id_curriculo_basico = ts.id_curriculo_medio
join basico.curriculo_basico_componente cbc on
	cbc.id_curriculo_basico = cb.id_curriculo_basico
right join ensino.docente_turma dt on
	dt.id_turma = t.id_turma
where
	cbc.id_componente_curricular = t.id_disciplina
	and not dt.finalizada
	and dt.ativo 
;

select
	*
from
	ensino.turma t
where
	t.id_turma = 701030 ;
	

select * from ensino.matricula_componente mc where id_turma = 701030 ;