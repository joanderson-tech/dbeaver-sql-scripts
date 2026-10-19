select
	pes.codigo_inep as inep,
	pes.cpf_cnpj as cpf,
	pes.nome as nome_estudante,
	pes.data_nascimento as data_nascimento,
	tr.descricao as turno,
	ser.descricao as serie,
	ee.denominacao as etapa_ensino,
	e.data_base_censo,
	sms.descricao as situacao,
	ts.nome as turma,
	(case
		when mes.data_cadastro <= e.data_base_censo then true
		else false
	end ) as base_educacenso,
	nee.ensino_infantil,
	sms.id_situacao_matricula_serie
from
	basico.matricula_estudante_serie mes
join escola.escola_etapa_ensino_serie eees on
	mes.id_serie_escola = eees.id_escola_etapa_ensino_serie
join escola.escola esc on
	esc.id_escola = eees.id_escola
join basico.serie ser on
	ser.id_serie = eees.id_serie
join basico.etapa_ensino ee on
	ser.id_etapa_ensino = ee.id_etapa_ensino
join basico.nivel_etapa_ensino nee on
	nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
join basico.estudante est on
	mes.id_estudante = est.id_estudante
join discente dis on
	est.id_estudante = dis.id_discente
join comum.pessoa pes on
	dis.id_pessoa = pes.id_pessoa
join educacenso.educacenso e on
	e.ano = 2012
join ensino.turno tr on
	tr.id_turno = mes.id_turno
join basico.situacao_matricula_serie sms on
	sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
left join basico.turma_serie ts on
	ts.id_turma_serie = mes.id_turma_serie
where
	esc.id_escola = 51872685
	and mes.ano_calendario = 2014
group by
	ee.id_nivel_etapa,
	dis.id_discente,
	pes.codigo_inep,
	pes.cpf_cnpj,
	dis.matricula,
	pes.nome,
	pes.data_nascimento,
	ser.descricao,
	ee.denominacao,
	e.data_base_censo,
	mes.data_cadastro,
	tr.descricao,
	sms.descricao,
	ts.nome,
	nee.ensino_infantil,
	sms.id_situacao_matricula_serie
order by
	ee.denominacao,
	ser.descricao,
	tr.descricao,
	base_educacenso,
	ts.nome,
	pes.nome