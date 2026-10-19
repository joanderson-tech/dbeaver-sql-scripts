select *
from comum.pessoa p
where p.cpf_cnpj = '02138648516';

with faltas as ( select fa.id_discente, ts.id_turma_serie, coalesce(sum(case when fa.abonada then fa.atual else fa.frequencia end), 0) as faltas
from ensino.frequencia_aluno fa
join ensino.turma t on
t.id_turma = fa.id_turma
and t.ano = 2026
and t.id_situacao_turma <> 4
join basico.turma_serie ts on
ts.id_turma_serie = t.id_turma_serie
and ts.ativo
where fa.frequencia > 0
and fa.ativo
group by fa.id_discente, ts.id_turma_serie), periodo as (select max(periodo) as periodo
from basico.turma_serie
where ano = 2026
and ativo) select e.codigo_inep, ts.nome as nome_turma,( case when ee.periodicidade_etapa = 'ANUAL' then 0
when ee.periodicidade_etapa = 'SEMESTRAL'
	and ts.periodo = 1 then 1
	when ee.periodicidade_etapa = 'SEMESTRAL'
	and ts.periodo = 2 then 2 end ) as periodo,( case when trn.descricao ilike 'MATUTINO%' then 1
when trn.descricao ilike 'VESPERTINO%' then 2
when trn.descricao ilike 'NOTURNO%' then 3
when trn.descricao ilike 'INTEGRAL%' then 4 end ) as turno, sts.codigo as idSerie,( case when ee.id_modalidade <> 2
	and ee.id_nivel_etapa = 51918782 then 1
	when ee.id_modalidade <> 2
	and ee.id_nivel_etapa in (1, 2) then 2
	when ee.id_modalidade <> 2
		and ee.id_nivel_etapa = 3 then 3
		when ee.id_modalidade = 2 then 4 end ) as modalidade, d.matricula, to_char(coalesce(mes.data_matricula_turma, mes.data_cadastro), 'YYYY-MM-DD') as data_matricula,(select f.faltas
from faltas f
where f.id_discente = d.id_discente
and f.id_turma_serie = ts.id_turma_serie) as faltas,(mes.id_situacao_matricula_serie = 2) as aprovado, p.cpf_cnpj, cast(p.data_nascimento as varchar) as data_nascimento, p.nome,((select count(*)
from comum.pessoa_necessidade_especial pne
where pne.id_pessoa = p.id_pessoa) > 0) as pessoa_com_ne,( case when p.sexo = 'M' then 1
when p.sexo = 'F' then 2
else 3 end ) as sexo,(cast(ht.dia as int)-1) as dia_semana, cast(h.inicio as varchar) as hora_inicio, cc.nome as disciplina, p_prof.cpf_cnpj as cpf_cnpj_professor,(t.id_situacao_turma = 3) as turma_finalizada, false as multisseriada,(select COUNT(*)
from ambiente.ambiente_unidade_escolar aue2
where aue2.id_escola = e.id_escola) as qtdSalas, aue.nome_numero
from escola.escola e
join comum.unidade u on
u.id_unidade = e.id_unidade_escola
join basico.turma_serie ts on
ts.id_escola = e.id_escola
join ensino.turma t on
t.id_turma_serie = ts.id_turma_serie
join basico.serie s on
s.id_serie = ts.id_serie
join basico.mapeamento_series_tce_se mssts on
mssts.id_serie = ts.id_serie
join basico.series_tce_se sts on
sts.id = mssts.id_serie_tce
and sts.ativo
join basico.etapa_ensino ee on
ee.id_etapa_ensino = s.id_etapa_ensino
join periodo pe on
(ts.periodo = pe.periodo
	or ee.periodicidade_etapa = 'ANUAL')
join ensino.turno trn on
trn.id_turno = ts.id_turno
join basico.matricula_estudante_serie mes on
mes.id_turma_serie = ts.id_turma_serie
and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
join basico.estudante est on
est.id_estudante = mes.id_estudante
join discente d on
d.id_discente = est.id_estudante
join comum.pessoa p on
p.id_pessoa = d.id_pessoa
join ensino.horario_turma ht on
ht.id_turma = t.id_turma
join ensino.horario h on
h.id_horario = ht.id_horario
join ensino.componente_curricular cc on
cc.id_componente_curricular = t.id_disciplina
join ensino.docente_turma dt on
dt.id_turma = t.id_turma
join rh.servidor serv on
serv.id_servidor = dt.id_docente
join comum.pessoa p_prof on
p_prof.id_pessoa = serv.id_pessoa
left join ambiente.ambiente_unidade_escolar aue on
aue.id_escola = e.id_escola
where u.ativo
and ts.ativo
and ht.ativo
and dt.ativo
and p.data_nascimento <= '2024-08-30'
and t.id_situacao_turma <> 4
and mes.ano_calendario = 2026
and coalesce(mes.data_matricula_turma, mes.data_cadastro) <= cast(date_trunc('month', cast('2026-02-01' as date)) + interval '1 month - 1 day' as date)
group by e.id_escola, e.codigo_inep, ee.periodicidade_etapa, ts.periodo, ts.nome, trn.descricao, sts.codigo, ee.id_modalidade, ee.id_nivel_etapa, d.matricula, mes.data_matricula_turma, mes.id_situacao_matricula_serie, p.cpf_cnpj, p.data_nascimento, p.nome, p.id_pessoa, ht.dia, cc.nome, p_prof.cpf_cnpj, mes.data_cadastro, t.id_turma, d.id_discente, h.inicio, ts.id_turma_serie, aue.id_ambiente_unidade_escolar, aue.nome_numero
order by e.codigo_inep, periodo, ts.nome, turno, d.matricula, dia_semana, hora_inicio