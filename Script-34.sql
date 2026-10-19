select *
from ensino_infantil.parecer_descritivo_individual pdi 
where pdi.id_matricula_discente_serie in (1331732,
1334784,
1338675,
1343757,
1350683,
1354127)

BEGIN;

commit;

ROLLBACK;

c

select 
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo;