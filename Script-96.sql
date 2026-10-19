select
	*
from
	(
	select
		ei.id_estudante_inscrito,
		ei.numero_inscricao,
		ei.nome as nome_estudante,
		to_char(ei.data_nascimento,
		'DD/MM/YYYY') as data_nascimento,
		ei.nome_mae,
		e.id_escola,
		e.nome as nome_escola,
		ee.id_etapa_ensino,
		ee.denominacao,
		s.id_serie,
		s.descricao,
		to_char(ei."data",
		'DD/MM/YYYY HH24:MI:SS') as data_hora,
		exists (
		select
			1
		from
			basico.matricula_estudante_serie mes
		join public.discente d on
			d.id_discente = mes.id_estudante
		join comum.pessoa p on
			p.id_pessoa = d.id_pessoa
		where
			mes.ano_calendario = cm.ano
			and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10, 13,-1 )
			and ( ( p.cpf_cnpj is not null
				and ei.cpf is not null
				and p.cpf_cnpj = ei.cpf )
			or ( trim(upper(retira_acentuacao(p.nome))) = ei.nome
				and trim(upper(retira_acentuacao(p.nome_mae))) = ei.nome_mae
					and p.data_nascimento = ei.data_nascimento ) ) ) as possui_matricula_rede,
		ei.convocado,
		exists (
		select
			1
		from
			matricula.historico_convocacao_cadastro_reserva hccr
		where
			hccr.tipo_convocacao = 2
			and hccr.id_estudante_inscrito = ei.id_estudante_inscrito ) as convocacao_nao_efetivada
	from
		matricula.estudante_inscrito ei
	join matricula.estudante_inscrito_opcao_escola eioe on
		eioe.id_estudante_inscrito = ei.id_estudante_inscrito
	join escola.escola e on
		e.id_escola = eioe.id_escola
	join matricula.vaga_serie vs on
		vs.id_vaga_serie = eioe.id_vaga_serie
	join basico.serie s on
		s.id_serie = vs.id_serie
	join basico.etapa_ensino ee on
		ee.id_etapa_ensino = s.id_etapa_ensino
	join matricula.calendario_matricula cm on
		cm.id_calendario_matricula = ei.id_calendario_matricula
	where
		ei.id_status = 11
		and cm.ano = 2024 ) as sq
where
	1 = 1
	and not sq.convocado
order by
	numero_inscricao;
	
select
	*
from
	(
	select
		ei.id_estudante_inscrito,
		ei.numero_inscricao,
		ei.nome as nome_estudante,
		to_char(ei.data_nascimento,
		'DD/MM/YYYY') as data_nascimento,
		ei.nome_mae,
		e.id_escola,
		e.nome as nome_escola,
		ee.id_etapa_ensino,
		ee.denominacao,
		s.id_serie,
		s.descricao,
		to_char(ei."data",
		'DD/MM/YYYY HH24:MI:SS') as data_hora,
		exists (
		select
			1
		from
			basico.matricula_estudante_serie mes
		join public.discente d on
			d.id_discente = mes.id_estudante
		join comum.pessoa p on
			p.id_pessoa = d.id_pessoa
		where
			mes.ano_calendario = cm.ano
			and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10, 13,-1 )
			and ( ( p.cpf_cnpj is not null
				and ei.cpf is not null
				and p.cpf_cnpj = ei.cpf )
			or ( trim(upper(retira_acentuacao(p.nome))) = ei.nome
				and trim(upper(retira_acentuacao(p.nome_mae))) = ei.nome_mae
					and p.data_nascimento = ei.data_nascimento ) ) ) as possui_matricula_rede,
		ei.convocado,
		exists (
		select
			1
		from
			matricula.historico_convocacao_cadastro_reserva hccr
		where
			hccr.tipo_convocacao = 2
			and hccr.id_estudante_inscrito = ei.id_estudante_inscrito ) as convocacao_nao_efetivada
	from
		matricula.estudante_inscrito ei
	join matricula.estudante_inscrito_opcao_escola eioe on
		eioe.id_estudante_inscrito = ei.id_estudante_inscrito
	join escola.escola e on
		e.id_escola = eioe.id_escola
	join matricula.vaga_serie vs on
		vs.id_vaga_serie = eioe.id_vaga_serie
	join basico.serie s on
		s.id_serie = vs.id_serie
	join basico.etapa_ensino ee on
		ee.id_etapa_ensino = s.id_etapa_ensino
	join matricula.calendario_matricula cm on
		cm.id_calendario_matricula = ei.id_calendario_matricula
	where
		ei.id_status = 11
		and cm.ano = 2024
		and ei.nome ilike '%CARLOS ANTONIO%' ) as sq
where
	1 = 1
	and not sq.convocado
order by
	numero_inscricao;
	select
	*
from
	(
	select
		ei.id_estudante_inscrito,
		ei.numero_inscricao,
		ei.nome as nome_estudante,
		to_char(ei.data_nascimento,
		'DD/MM/YYYY') as data_nascimento,
		ei.nome_mae,
		e.id_escola,
		e.nome as nome_escola,
		ee.id_etapa_ensino,
		ee.denominacao,
		s.id_serie,
		s.descricao,
		to_char(ei."data",
		'DD/MM/YYYY HH24:MI:SS') as data_hora,
		exists (
		select
			1
		from
			basico.matricula_estudante_serie mes
		join public.discente d on
			d.id_discente = mes.id_estudante
		join comum.pessoa p on
			p.id_pessoa = d.id_pessoa
		where
			mes.ano_calendario = cm.ano
			and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10, 13,-1 )
			and ( ( p.cpf_cnpj is not null
				and ei.cpf is not null
				and p.cpf_cnpj = ei.cpf )
			or ( trim(upper(retira_acentuacao(p.nome))) = ei.nome
				and trim(upper(retira_acentuacao(p.nome_mae))) = ei.nome_mae
					and p.data_nascimento = ei.data_nascimento ) ) ) as possui_matricula_rede,
		ei.convocado,
		exists (
		select
			1
		from
			matricula.historico_convocacao_cadastro_reserva hccr
		where
			hccr.tipo_convocacao = 2
			and hccr.id_estudante_inscrito = ei.id_estudante_inscrito ) as convocacao_nao_efetivada
	from
		matricula.estudante_inscrito ei
	join matricula.estudante_inscrito_opcao_escola eioe on
		eioe.id_estudante_inscrito = ei.id_estudante_inscrito
	join escola.escola e on
		e.id_escola = eioe.id_escola
	join matricula.vaga_serie vs on
		vs.id_vaga_serie = eioe.id_vaga_serie
	join basico.serie s on
		s.id_serie = vs.id_serie
	join basico.etapa_ensino ee on
		ee.id_etapa_ensino = s.id_etapa_ensino
	join matricula.calendario_matricula cm on
		cm.id_calendario_matricula = ei.id_calendario_matricula
	where
		ei.id_status = 11
		and cm.ano = 2024 ) as sq
where
	1 = 1
	and sq.convocacao_nao_efetivada
order by
	numero_inscricao;