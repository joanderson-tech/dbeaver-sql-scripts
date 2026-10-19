

select * from ensino.horario_turma ht 
where ht.id_turma =689181;

select * from ensino.docente_turma dt 
where dt.id_turma = 689181;

--Retorna a lista disciplinas turma
select * from ensino.turma t 
where t.id_turma_serie = 51914893
and t.codigo = 'EFAFV6B'
ORDER BY t.ordem ;


--Retorna a lista disciplinas turma  FRANCISCO FERREIRA FILHO DINIZ
select * from ensino.turma t 
where t.id_turma_serie = 51969025
and t.codigo = 'EFAIV1A'
ORDER BY t.ordem ;


select * from ensino.docente_turma dt 
where dt.id_turma = 694562;


select t.id_turma, ts.nome, cc.nome, p.nome, s.siape, dt.ch_dedicada_periodo, dt.data_inicio, dt.data_fim, dt.id_docente_turma,
       t.codigo, tr.descricao, s.id_servidor, t.id_disciplina, ser.id_etapa_ensino,  t.descricao_horario, dt.ativo 
from basico.turma_serie ts
join ensino.turma t using ( id_turma_serie )
join basico.serie ser using ( id_serie )
join ensino.componente_curricular cc on ( cc.id_componente_curricular = t.id_disciplina )
join ensino.turno tr on ( tr.id_turno = ts.id_turno )
join ensino.docente_turma dt on ( t.id_turma = dt.id_turma and dt.ativo = trueValue() and dt.data_fim > now() and dt.finalizada = falseValue() /* + sqlTipoDocenteTurma + */ )
join rh.servidor s on ( dt.id_docente = s.id_servidor )
join comum.pessoa p using ( id_pessoa )
left join ensino.docente_externo de on ( dt.id_docente_externo = de.id_docente_externo )
left join comum.pessoa pde on ( pde.id_pessoa = de.id_pessoa )
left join basico.modulo mod on t.id_modulo = mod.id_modulo
where ts.id_turma_serie = 51914893
order by t.grupo, t.id_modulo, (id_turma_agrupadora IS NULL) desc, t.ordem asc, cc.nome asc, dt.id_docente_turma asc;


--
INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(5, 455, 53669351, 689181, NULL, NULL, NULL, '2023-08-17 16:08:38.869', NULL, false, '2023-02-14 00:00:00.000', '2023-12-29 00:00:00.000', NULL, NULL, false, false, false, false, NULL, false, NULL, NULL, 5663892, NULL, NULL, NULL, NULL, NULL, false);

--
DELETE FROM ensino.docente_turma
WHERE id_docente_turma=53669351;

--Seleciona os Id duplicados 
with tabela as (
select dt.id_docente , dt.id_turma, array_agg(dt.id_docente_turma order by dt.data_cadastro) as id_dt, array_agg(dt.data_cadastro order by dt.data_cadastro) 
from ensino.docente_turma dt 
where dt.ativo and not dt.finalizada 
and now() between dt.data_inicio and dt.data_fim 
group by dt.id_docente, dt.id_turma
having count(dt.id_docente_turma) > 1
)
select string_agg(t.id_dt[2]::text, ',') 
from tabela t ;

select * 
from ensino.docente_turma dt
where dt.id_docente_turma in (52889902,53670329,53670331,53670330,53670337,52825157,53653556,53654486,53653558,53654488,53653519,53654492,53653288,53654484,53668655,53670283,53670284,53670285,53670282,53669464,53669479,53666815,53666847,53670334,53670291,53670290,53666838,53666817,53666849,52929244,53669337,53669373,53669417,53669458,53669409,53669443,53669473,53670338,53668915,53668972,53668880,53669336,53669457,53669472,53669343,53669407,53669423,53669370,53669415,53669456,53669462,53669477,53669484,53669491,53669722,53669371,53669416,53669408,53669442,53669340,53669404,53669367,53669412,53669342,53669406,53669463,53669369,53669414,53669478,53668653,53669481,53669488,53669719,53668909,53669480,53669487,53669718,53669341,53669405,53669421,53669368,53669413,53669454,53668890,53669422,53669455,53669374,53669418,53669459,53669410,53669444,53669474,53669482,53669489,53669720,53668886,53668888,53668893,53668654,53668891,53668923,53668913,53668884,53669292,53668916,53669485,53669716,53669723,53669420,53669461,53669453,53669476,53109906,52847937,52847949,53669486,53669717,53669724,53669334,53654491,53668912,52852320,53669483,53669490,53669721,53669338,53669339,53669375,53669419,53669460,53669361,53669411,53669452,53669475,53668999,53666816,53666848,53653520,53654493,53653560,53654487,53654485,53653557,53653555,53654489,53668892);


--Selecionar os Id duplicados
with tabela as (
select dt.id_docente , dt.id_turma, array_agg(dt.id_docente_turma order by dt.data_cadastro) as id_dt, array_agg(dt.data_cadastro order by dt.data_cadastro) 
from ensino.docente_turma dt 
where dt.ativo and not dt.finalizada 
and now() between dt.data_inicio and dt.data_fim 
group by dt.id_docente, dt.id_turma
having count(dt.id_docente_turma) > 1
)
select string_agg(t.id_dt[2]::text, ',') 
from tabela t ;

--solução 
update ensino.docente_turma dt set ativo = false 
where dt.id_docente_turma in(52889902,53670329,53670331,53670330,53670337,52825157,53653556,53654486,53653558,53654488,53653519,53654492,53653288,53654484,53668655,53670283,53670284,53670285,53670282,53669464,53669479,53666815,53666847,53670334,53670291,53670290,53666838,53666817,53666849,52929244,53669337,53669373,53669417,53669458,53669409,53669443,53669473,53670338,53668915,53668972,53668880,53669336,53669457,53669472,53669343,53669407,53669423,53669370,53669415,53669456,53669462,53669477,53669484,53669491,53669722,53669371,53669416,53669408,53669442,53669340,53669404,53669367,53669412,53669342,53669406,53669463,53669369,53669414,53669478,53668653,53669481,53669488,53669719,53668909,53669480,53669487,53669718,53669341,53669405,53669421,53669368,53669413,53669454,53668890,53669422,53669455,53669374,53669418,53669459,53669410,53669444,53669474,53669482,53669489,53669720,53668886,53668888,53668893,53668654,53668891,53668923,53668913,53668884,53669292,53668916,53669485,53669716,53669723,53669420,53669461,53669453,53669476,53109906,52847937,52847949,53669486,53669717,53669724,53669334,53654491,53668912,52852320,53669483,53669490,53669721,53669338,53669339,53669375,53669419,53669460,53669361,53669411,53669452,53669475,53668999,53666816,53666848,53653520,53654493,53653560,53654487,53654485,53653557,53653555,53654489,53668892);

--backup
update ensino.docente_turma dt set ativo = true 
where dt.id_docente_turma in(52889902,53670329,53670331,53670330,53670337,52825157,53653556,53654486,53653558,53654488,53653519,53654492,53653288,53654484,53668655,53670283,53670284,53670285,53670282,53669464,53669479,53666815,53666847,53670334,53670291,53670290,53666838,53666817,53666849,52929244,53669337,53669373,53669417,53669458,53669409,53669443,53669473,53670338,53668915,53668972,53668880,53669336,53669457,53669472,53669343,53669407,53669423,53669370,53669415,53669456,53669462,53669477,53669484,53669491,53669722,53669371,53669416,53669408,53669442,53669340,53669404,53669367,53669412,53669342,53669406,53669463,53669369,53669414,53669478,53668653,53669481,53669488,53669719,53668909,53669480,53669487,53669718,53669341,53669405,53669421,53669368,53669413,53669454,53668890,53669422,53669455,53669374,53669418,53669459,53669410,53669444,53669474,53669482,53669489,53669720,53668886,53668888,53668893,53668654,53668891,53668923,53668913,53668884,53669292,53668916,53669485,53669716,53669723,53669420,53669461,53669453,53669476,53109906,52847937,52847949,53669486,53669717,53669724,53669334,53654491,53668912,52852320,53669483,53669490,53669721,53669338,53669339,53669375,53669419,53669460,53669361,53669411,53669452,53669475,53668999,53666816,53666848,53653520,53654493,53653560,53654487,53654485,53653557,53653555,53654489,53668892);


select *
from ensino.docente_turma dt 
where dt.id_docente_turma in (53670329,52467928);

select * 
from rh.servidor s 
where s.id_pessoa = 51874724;

begin;

commit;

rollback;

---------------------------

select * 
from ensino.docente_turma dt
where dt.id_docente_turma in(53669352,53669351,53669353);
							 53669352,53669351,53669353

--solução 
update ensino.docente_turma dt set ativo = false 
where dt.id_docente_turma in(53669352,53669351,53669353);

--backup
update ensino.docente_turma dt set ativo = true 
where dt.id_docente_turma in(53669352,53669351,53669353);










select 
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo;