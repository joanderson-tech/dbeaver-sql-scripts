select  rac.id_relatorio_avaliativo_componente,  
    mc.id_matricula_componente as matricula_ativa, 
    mc2.id_matricula_componente AS matricula_excluida
from basico.matricula_estudante_serie mes
join ensino_infantil.relatorio_avaliativo ra on ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
and ra.ativo = false
join ensino.turma t on t.id_turma_serie = mes.id_turma_serie
join  ensino.matricula_componente mc on mc.id_discente  = mes.id_estudante
   and mc.id_situacao_matricula = 2
   and mc.id_turma = t.id_turma
join ensino.matricula_componente mc2  on mc2.id_discente = mc.id_discente 
   and mc2.id_turma = mc.id_turma 
   and mc2.id_situacao_matricula = 7
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
and mc2.id_matricula_componente = rac.id_matricula_componente
where mes.id_turma_serie in (53037900);


select t.codigo as Turma, p.nome as Estudante, rac.avaliacao_descritiva as Avaliação
FROM ensino_infantil.relatorio_avaliativo_componente  rac
join ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
join ensino.turma t on t.id_turma = mc.id_turma
join basico.matricula_estudante_serie mes on mes.id_matricula_discente_serie = mc.id_matricula_estudante_serie
join discente d on d.id_discente = mes.id_estudante
join comum.pessoa p on p.id_pessoa = d.id_pessoa 
where mes.id_turma_serie  in (53037900, 53037901, 53037902)
and mc.id_situacao_matricula = 2
AND rac.avaliacao_descritiva IS NOT NULL
AND TRIM(rac.avaliacao_descritiva) <> ''
order by p.nome;


SELECT   
    p.nome,  
    ecc.nome,  
    CASE rahr.id_opcao_grupo_avaliacao_relatorio
        WHEN 35 THEN 'PI'
        WHEN 36 THEN 'PA'
        WHEN 37 THEN 'PC'
        WHEN 38 THEN 'NT'
        ELSE rahr.id_opcao_grupo_avaliacao_relatorio::text
    END AS BOLINHA,  
    rahr.periodo as BIMESTRE,  
    hc.descricao AS habilidade_descricao
FROM ensino_infantil.relatorio_avaliativo_componente  rac
join ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
join basico.matricula_estudante_serie mes on mes.id_matricula_discente_serie = mc.id_matricula_estudante_serie
join ensino_infantil.relatorio_avaliativo_habilidade  rah on rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
left join ensino_infantil.configuracao_relatorio_componente_habilidade crch on
	crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
left join ensino_infantil.habilidade_competencia hc on
	hc.id_habilidade_competencia = crch.id_habilidade_competencia
join ensino.turma t on t.id_turma = mc.id_turma
join ensino.componente_curricular ecc on ecc.id_componente_curricular = t.id_disciplina 
join discente d on d.id_discente = mes.id_estudante
join comum.pessoa p on p.id_pessoa = d.id_pessoa 
where rac.id_relatorio_avaliativo in (4280, 4279, 4284, 4313, 4378, 4311, 4310, 4266, 4312, 4275, 4344, 4379, 4282)
and rahr.id_opcao_grupo_avaliacao_relatorio is not null
order by p.nome, rahr.periodo,ecc.nome, hc.descricao;





select  rac.id_relatorio_avaliativo_componente,  ra.id_relatorio_avaliativo,
    mc.id_matricula_componente as matricula_ativa, 
    mc2.id_matricula_componente AS matricula_excluida
from basico.matricula_estudante_serie mes
join ensino_infantil.relatorio_avaliativo ra on ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
and ra.ativo = false
join ensino.turma t on t.id_turma_serie = mes.id_turma_serie
join  ensino.matricula_componente mc on mc.id_discente  = mes.id_estudante
   and mc.id_situacao_matricula = 2
   and mc.id_turma = t.id_turma
join ensino.matricula_componente mc2  on mc2.id_discente = mc.id_discente 
   and mc2.id_componente_curricular = mc.id_componente_curricular 
   and mc2.id_situacao_matricula = 7
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
and mc2.id_matricula_componente = rac.id_matricula_componente
where mes.id_turma_serie in (53037902)
and mes.id_situacao_matricula_serie = 1;

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
where mes.id_turma_serie in (53037902)
and mes.id_situacao_matricula_serie = 1;

