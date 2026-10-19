 with ultimaMatriculaEscola as (
select
	mes.*
from
	basico.matricula_estudante_serie mes
join escola.escola_etapa_ensino_serie ee on
	ee.id_escola_etapa_ensino_serie = mes.id_serie_escola
where
	mes.id_estudante in (974925)
	and ee.id_escola = 2322
	and mes.id_situacao_matricula_serie not in ( 5, 9 )
order by
	mes.ano_calendario desc,
	mes.data_cadastro desc,
	mes.id_situacao_matricula_serie desc
limit 1 )
select
	*
from
	(
	select
		et.denominacao as etapa,
		et.id_nivel_etapa,
		s.id_serie,
		s.descricao as serie,
		mes.ano_calendario as ano,
		escola.id_escola,
		escola.nome as escola,
		mun.nome as municipio,
		uf.sigla as uf,
		mee.id_tipo_sol_transferencia,
		sms.id_situacao_matricula_serie,
		sms.descricao as situacao,
		p.nome as estudante,
		s.final_etapa,
		case
			when s.final_etapa
				and sms.id_situacao_matricula_serie in ( 2, 7 ) then true
				else false
			end as aprovado,
			mes.id_serie_multisseriado,
			sm.descricao as serie_multisseriado,
			TO_CHAR(mee.data,
			'DD/MM/YYYY') as data_transferencia,
			t.descricao as turno
		from
			basico.matricula_estudante_serie mes
		join escola.escola_etapa_ensino_serie eees on
			eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
		join basico.situacao_matricula_serie sms on
			sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
		left join escola.escola escola on
			escola.id_escola = eees.id_escola
		left join comum.municipio mun on
			mun.id_municipio = escola.id_municipio
		left join comum.unidade_federativa uf on
			uf.id_unidade_federativa = mun.id_unidade_federativa
		left join basico.serie s on
			s.id_serie = eees.id_serie
		left join basico.etapa_ensino et
				using (id_etapa_ensino)
		left join discente d on
			d.id_discente = mes.id_estudante
		left join comum.pessoa p on
			p.id_pessoa = d.id_pessoa
		left join basico.serie sm on
			sm.id_serie = mes.id_serie_multisseriado
		left join ensino.turno t on
			t.id_turno = mes.id_turno
		left join (
			select
				mee.id_matricula_estudante_serie,
				mee.id_tipo_sol_transferencia,
				MAX(mee.data) as data
			from
				matricula.movimentacao_estudante_escola mee
			join basico.matricula_estudante_serie mes on
				mes.id_matricula_discente_serie = mee.id_matricula_estudante_serie
			where
				mes.id_situacao_matricula_serie = 6
			group by
				mee.id_matricula_estudante_serie,
				mee.id_tipo_sol_transferencia ) mee on
			mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		where
			mes.id_estudante in (974925)
				and sms.id_situacao_matricula_serie not in ( 5, 9 )
					and mes.ano_calendario <= 2024
					and (
					select
						case
							when coalesce(mes.data_matricula_turma,
							mes.data_cadastro) is null
								or coalesce(ume.data_matricula_turma,
								ume.data_cadastro) is null then mes.ano_calendario <= ume.ano_calendario
								else coalesce(mes.data_matricula_turma,
								mes.data_cadastro) <= coalesce(ume.data_matricula_turma,
								ume.data_cadastro)
							end
						from
							ultimaMatriculaEscola ume)
					and not exists (
					select
						1
					from
						diario.historico_implantado hi2
					where
						hi2.id_estudante = mes.id_estudante
						and hi2.ano = mes.ano_calendario
						and hi2.id_situacao_matricula <> 5
						and hi2.id_serie = eees.id_serie )
			union
				select
					et.denominacao,
					et.id_nivel_etapa,
					s.id_serie,
					s.descricao as serie,
					hi.ano,
					case
						when escola.id_escola is null then hi.id_escola
						else escola.id_escola
					end,
					case
						when escola.nome is null then hi.nome_escola
						else escola.nome
					end,
					case
						when mun.nome is null then hi.nome_municipio
						else mun.nome
					end,
					case
						when uf.sigla is null then hi.nome_uf
						else uf.sigla
					end,
					null,
					sms.id_situacao_matricula_serie,
					sms.descricao,
					p.nome as estudante ,
					s.final_etapa,
					case
						when s.final_etapa
						and sms.id_situacao_matricula_serie in ( 2, 7 ) then true
						else false
					end as aprovado,
					hi.id_serie_multisseriado,
					sm.descricao as serie_multisseriado,
					null as data_transferencia,
					tn.descricao as turno
				from
					diario.historico_implantado hi
				join basico.situacao_matricula_serie sms on
					sms.id_situacao_matricula_serie = hi.id_situacao_matricula
				left join escola.escola escola on
					escola.id_escola = hi.id_escola
				left join comum.municipio mun on
					mun.id_municipio = escola.id_municipio
				left join comum.unidade_federativa uf on
					uf.id_unidade_federativa = mun.id_unidade_federativa
				left join basico.serie s on
					s.id_serie = hi.id_serie
				left join basico.etapa_ensino et
						using (id_etapa_ensino)
				left join discente d on
					d.id_discente = hi.id_estudante
				left join comum.pessoa p on
					p.id_pessoa = d.id_pessoa
				left join basico.serie sm on
					sm.id_serie = hi.id_serie_multisseriado
				left join ensino.turno tn on
					tn.id_turno = hi.id_turno
				where
					hi.id_estudante in (974925)
						and hi.id_situacao_matricula in ( 2, 3, 1, 7, 8, 10,-1, 12 ) ) as registros
order by
	registros.ano,
	data_transferencia::date