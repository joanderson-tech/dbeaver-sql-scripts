select dt -- string_agg(dt.id_turma  ::varchar, ', ')
from basico.turma_serie ts
join basico.serie s2 on s2.id_serie = ts.id_serie 
join ensino.turma t on t.id_turma_serie = ts.id_turma_serie
left join ensino.docente_turma dt on dt.id_turma = t.id_turma 
join escola.escola e on e.id_escola  = ts.id_escola
left join rh.servidor s on s.id_servidor = dt.id_docente
 join comum.pessoa p on p.id_pessoa = s.id_pessoa 
where ts.id_curriculo_medio  in (52224881,52224887);
--and dt.ch_dedicada_periodo  is not null;
order by e.nome, t.codigo;


select 
' UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = ' || dt.id_docente_turma|| ' ;' as Solução,
' UPDATE ensino.docente_turma SET ativo=true WHERE  id_docente_turma  = ' || dt.id_docente_turma|| ' ;' as Backup
from ensino.docente_turma dt where dt.id_turma in (687189, 687190, 687194, 687199, 687191, 687192, 688723, 687591, 688238, 688239, 688232, 688233, 688234, 688235, 688236, 688237, 687595, 687592, 687593, 687594, 688240, 688241);

