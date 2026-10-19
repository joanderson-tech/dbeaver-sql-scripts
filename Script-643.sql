select * from comum.pessoa p where p.nome = 'RAQUEL MEDEIROS DA SILVA';

select * from rh.servidor s where s.id_pessoa = 747241;

select * from comum.registro_entrada re where re.host = 'Joanderson';

select * from comum.usuario u where u.id_pessoa = 747241;

select * from ensino.docente_turma dt where dt.id_docente = 254;

select * from comum.registro_entrada re where re.id_entrada = 5724612;

select * from comum.usuario u where u.id_usuario = 105108;

--MARCIA MARIA DA SILVA   51869850

select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo  AND p.nome ILIKE '%RAQUEL MEDEIROS DA SILVA%'

