

select * --string_agg(id_matricula_componente :: varchar , ', ')  
from ensino.matricula_componente mc where mc.id_matricula_estudante_serie =1327733 and id_situacao_matricula = 2;

select *
from basico.matricula_estudante_serie mes 
where mes.id_estudante   = 974333 
and ano_calendario = 2025;

select *
from ensino.turma t 
where t.id_turma_serie = 53037902;
53037901

select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma = 688765;

edilma.maria
rosa.celestina

select distinct d.id_discente, p.nome, mes.id_matricula_discente_serie
from discente d 
join comum.pessoa p on p.id_pessoa = d.id_pessoa 
join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente
where mes.id_estudante  in (980084)
and mes.ano_calendario = 2025;


/*GUILHERME LUCINARIO GOMES DOS SANTOS
MARIA GABRIELLY DO NASCIMENTO FIRMINO
não tinha dado preenchido na avaliacao_descritiva */

--53037900, 53037901, 53037902
select *
from basico.matricula_estudante_serie mes 
where mes.id_turma_serie in (53037902) and mes.id_situacao_matricula_serie = 1;

SELECT rahr.* FROM ensino_infantil.relatorio_avaliativo_componente  rac
join ensino_infantil.relatorio_avaliativo_habilidade  rah on rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
where rac.id_relatorio_avaliativo in (4280, 4279, 4284, 4313, 4378, 4311, 4310, 4266, 4312, 4275, 4344, 4379, 4282);

select * FROM ensino_infantil.relatorio_avaliativo_componente  rac
where rac.id_matricula_componente  in (17146720, 17146721, 17146722, 17146723, 17146724, 17146725, 17146726, 17146729, 17146728, 17146727);

select * from ensino_infantil.relatorio_avaliativo ra
where ra.id_relatorio_avaliativo in(2468,3054,3055,3056,3057,3064,3068,3361,3424,3428,3430,3431,3436,3442,3445,3446,3447,3449,3581,3582,3656)

select * from ensino_infantil.relatorio_avaliativo ra
where ra.id_matricula_discente_serie= 1327729;

(id_matricula_discente_serie, ativo)=(1327733, t)

select * FROM ensino_infantil.relatorio_avaliativo_componente  rac
where rac.id_relatorio_avaliativo in(2468,3054,3055,3056,3057,3064,3068,3361,3424,3428,3430,3431,3436,3442,3445,3446,3447,3449,3581,3582,3656)
and rac.avaliacao_descritiva is not null;

