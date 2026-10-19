select *
from ensino_infantil.parecer_descritivo_individual pdi 
where pdi.id_matricula_discente_serie = 1475835;

SELECT x.* FROM public.discente x
WHERE matricula  = '202130003000'

982643

SELECT x.* FROM basico.matricula_estudante_serie x
WHERE id_estudante  = 1050970



select * from diario.competencia_habilidades_aluno cha 
where cha.id_discente =977878;

select 
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo;


