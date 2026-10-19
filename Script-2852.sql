select * 
from basico.turma_serie ts 
where ts.nome = 'EFAIINT3B'
and ts.ano = 2026
and ts.id_turma_serie in (51877789);



SELECT * 
from ensino.turma t 
join ensino.horario_turma ht on ht.id_turma = t.id_turma 
where t.id_turma_serie in (51877789);

SELECT distinct   mes.* from comum.pessoa p 
join discente d on d.id_pessoa = p.id_pessoa 
join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente 
where p.nome ilike '%Elâyne Nascimento dos Santos%'
and mes.ano_calendario = 2026;


select * from ensino.turma t where t.id_turma_serie  in (54869466); --714173




select * from ensino.matricula_componente mc 
where mc.id_discente in (974813)
and mc.id_turma = 714173
and mc.id_matricula_estudante_serie in (1364146);


select * from ensino.nota_unidade nu where nu.id_matricula_componente in (17735067);

SELECT re.* FROM comum.registro_entrada AS re
WHERE id_entrada in (6392548, 6392779, 6392548);

select * from comum.usuario 
where id_usuario = 105319;

RAQUELINE AMARO DE OLIVEIRA

datas 

'2026-10-15 22:33:42.000', '2026-10-16 09:50:18.000', '2026-10-15 22:33:42.000'

PATRICIA JANIELY ANTUNES BEZERRA DA SILVA