select t.id_turma, t.codigo 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and u.login = 'ana_aparecida1@hotmail.com' and t.ano = 2025;

select  rac.id_relatorio_avaliativo_componente,  ra.id_relatorio_avaliativo,
    mc.id_matricula_componente as matricula_ativa, 
    mc2.id_matricula_componente AS matricula_excluida
from basico.matricula_estudante_serie mes
join ensino_infantil.relatorio_avaliativo ra on ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
and ra.ativo = false
join basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie
join ensino.turma t on t.id_turma_serie = mes.id_turma_serie
join  ensino.matricula_componente mc on mc.id_discente  = mes.id_estudante
   and mc.id_situacao_matricula = 2
   and mc.id_turma = t.id_turma
join ensino.matricula_componente mc2  on mc2.id_discente = mc.id_discente 
   --and mc2.id_componente_curricular = mc.id_componente_curricular 
   and mc2.id_situacao_matricula = 7
   and  mc2.id_turma in ( 
   select t2.id_turma from ensino.turma t2
   join basico.turma_serie ts2 on ts2.id_turma_serie = t2.id_turma_serie and ts2.ativo
   where ts2.id_serie = ts.id_serie 
   and ts2.ano = ts.ano
   and t2.id_disciplina = t.id_disciplina)
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
and mc2.id_matricula_componente = rac.id_matricula_componente
where mes.id_turma_serie in (52280497)
and mes.id_situacao_matricula_serie = 1;


select *  from ensino.turma t where t.id_turma in (686538);




select mc
from basico.matricula_estudante_serie mes
join basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie
join ensino.turma t on t.id_turma_serie = mes.id_turma_serie
join  ensino.matricula_componente mc on mc.id_discente  = mes.id_estudante
where mes.id_turma_serie = 52280497;




select * from ava.topico_aula ta where ta.id_turma = 687186;


select * from basico.etapa_ensino;



select * from p