select t.id_turma, t.codigo,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo  AND u.login ILIKE '%adrianadealbuquerquesantos@gmail.com%'
    
select	*
from ensino.horario_turma ht
join ensino.turma t on t.id_turma = ht.id_turma
where t.id_turma_serie = 53849088;
    
    select t.id_turma_serie  from ensino.turma t where t.id_turma = 699825;