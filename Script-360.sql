select
	*
from
	(
	select distinct on (id_solicitacao)
		ei.numero_inscricao as numero_solicitacao,
		ei.id_estudante as IDdiscente,
		ei.nome as estudante,
		ei.data_nascimento,
		case
			when ei.nee then 'SIM'
			else 'NÃO'
		end as nee,
		case
			when ei.participa_bolsa_familia then 'SIM'
			else 'NÃO'
		end as participa_bolsa_familia,
		case
			when ei.tem_irmao then 'SIM'
			else 'NÃO'
		end as possui_irmao_escola,
		e.nome as escola,
		'MATRÍCULA' as tipo,
		tov.denominacao as tipo_ocupacao_vaga,
		s.denominacao as descricao_solicitacao,
		ei.id_estudante_inscrito as id_solicitacao,
		ei.nome_mae as nome_mae_solicitante,
		ei.cpf as cpf_solicitante,
		cast(ei.cpf_responsavel as text) as cpf_responsavel,
		ei.motivo_cancelamento as motivo_cancelamento,
		serie.descricao as serie,
		etapa.denominacao as etapa,
		turno.descricao as turno,
		l.id_tipo_ocupacao_vaga as id_tipo_ocupacao_vaga,
		case
			when (eip.id_opcao_escola = eio.id_estudante_inscrito_opcao_escola
			and eip.id_status not in (5, 8)) then 'SELECIONADO'
			when eip.id_estudante_inscrito_processamento is null then case
				when s.id_status_estudante_inscrito not in (2, 5, 8) then 'AGUARDANDO PROCESSAMENTO'
				else 'NÃO SELECIONADO'
			end
			else 'NÃO SELECIONADO'
		end as descricao_situacao_opcao,
		(eip.id_opcao_escola = eio.id_estudante_inscrito_opcao_escola
		and eip.id_status not in (5, 8)) as selecionada,
		eio.ordem
	from
		matricula.estudante_inscrito ei
	left join matricula.estudante_inscrito_processamento eip on
		eip.id_estudante_inscrito = ei.id_estudante_inscrito
		and (ei.id_status <> 7
			or ei.id_status = 7
			and eip.id_status = 4)
	left join matricula.listagem_processamento_matricula l
			using(id_listagem_processamento_matricula)
	left join matricula.tipo_ocupacao_vaga tov
			using(id_tipo_ocupacao_vaga)
	join matricula.calendario_matricula cm on
		cm.id_calendario_matricula = ei.id_calendario_matricula
	join matricula.estudante_inscrito_opcao_escola eio on
		eio.id_estudante_inscrito = ei.id_estudante_inscrito
	join escola.escola e on
		e.id_escola = eio.id_escola
	join matricula.vaga_serie vg
			using(id_vaga_serie)
	join basico.serie serie
			using(id_serie)
	join basico.etapa_ensino etapa
			using(id_etapa_ensino)
	join ensino.turno turno
			using(id_turno)
	join matricula.status_estudante_inscrito s on
		s.id_status_estudante_inscrito = ei.id_status
	join comum.unidade u on
		u.id_unidade = e.id_regional_ensino
	left join comum.municipio m on
		u.id_municipio = m.id_municipio
	where
		1 = 1
		and cm.ano = 2025
		and upper(e.nome) like UPPER('%ESCOLA MUNICIPAL NOSSA SENHORA RAINHA DOS ANJOS -CAIC%')
		and s.denominacao = 'VAGA EXPIRADA POR NÃO EFETIVAÇÃO NO PRAZO'
union
	select distinct on (id_solicitacao)
		st.numero as numero_solicitacao,
		d.id_discente as IDdiscente,
		p.nome as estudante,
		p.data_nascimento,
		case
			when (
			select
				COUNT (*)
			from
				comum.pessoa_necessidade_especial
			where
				id_pessoa = p.id_pessoa) > 0 then 'SIM'
			else 'NÃO'
		end as nee,
		case
			when estudante.participa_bolsa_familia then 'SIM'
			else 'NÃO'
		end as participa_bolsa_familia,
		'-' as possui_irmao_escola,
		e.nome as escola,
		'TRANSFERÊNCIA' as tipo,
		tov.denominacao as tipo_ocupacao_vaga,
		s.denominacao as descricao_situacao,
		st.id_solicitacao_transferencia as id_solicitacao,
		p.nome_mae as nome_mae_solicitante,
		p.cpf_cnpj as cpf_solicitante,
		p.numero_documento_responsavel_matricula as cpf_responsavel,
		st.observacoes_analise as motivo_cancelamento,
		serie.descricao as serie,
		etapa.denominacao as etapa,
		turno.descricao as turno,
		l.id_tipo_ocupacao_vaga as id_tipo_ocupacaoVaga,
		case
			when stp.id_opcao_escola = sto.id_solicitacao_transferencia_opcao_escola then 'SELECIONADA'
			when stp.id_solicitacao_transferencia_processamento is null then case
				when s.id_status_solicitacao_transferencia not in (3, 6, 7) then 'AGUARDANDO PROCESSAMENTO'
				else 'NÃO SELECIONADO'
			end
			else 'NÃO SELECIONADO'
		end as descricao_situacao_opcao,
		stp.id_opcao_escola = sto.id_solicitacao_transferencia_opcao_escola as selecionada,
		sto.ordem
	from
		matricula.solicitacao_transferencia st
	left join matricula.solicitacao_transferencia_processamento stp
			using(id_solicitacao_transferencia)
	left join matricula.listagem_solicitacao_transferencia_processamento l
			using(id_listagem_solicitacao_transferencia_processamento)
	left join matricula.tipo_ocupacao_vaga tov
			using(id_tipo_ocupacao_vaga)
	join matricula.calendario_matricula cm on
		cm.id_calendario_matricula = st.id_calendario_matricula
	join matricula.solicitacao_transferencia_opcao_escola sto on
		sto.id_solicitacao = st.id_solicitacao_transferencia
	join escola.escola e on
		e.id_escola = sto.id_escola
	join basico.serie serie
			using(id_serie)
	join basico.etapa_ensino etapa
			using(id_etapa_ensino)
	join ensino.turno turno
			using(id_turno)
	join basico.matricula_estudante_serie mes
			using(id_matricula_discente_serie)
	join discente d on
		d.id_discente = mes.id_estudante
	join comum.pessoa p
			using(id_pessoa)
	join matricula.status_solicitacao_transferencia s on
		s.id_status_solicitacao_transferencia = st.id_status
	join comum.unidade u on
		u.id_unidade = e.id_regional_ensino
	left join comum.municipio m on
		u.id_municipio = m.id_municipio
	join basico.estudante estudante on
		estudante.id_estudante = d.id_discente
	where
		1 = 1
		and 1 <> 1
		and cm.ano = 2025
		and upper(e.nome) like UPPER('%ESCOLA MUNICIPAL NOSSA SENHORA RAINHA DOS ANJOS -CAIC%')
		and s.denominacao = 'VAGA EXPIRADA POR NÃO EFETIVAÇÃO NO PRAZO'
union
	select distinct on (id_solicitacao)
		rm.numero_renovacao as numero_solicitacao,
		d.id_discente as d,
		p.nome as estudante,
		p.data_nascimento,
		case
			when rm.nee then 'SIM'
			else 'NÃO'
		end as nee,
		case
			when estudante.participa_bolsa_familia then 'SIM'
			else 'NÃO'
		end as participa_bolsa_familia,
		'-' as possui_irmao_escola,
		e.nome as escola,
		'RENOVAÇÃO' as tipo,
		tov.denominacao as tipo_ocupacao_vaga,
		case
			when id_registro_cancelamento is not null then 'CANCELADA'
			when rmr.id_vaga_serie_concedida is not null then 'EFETIVADA'
			when rmr.id_renovacao_matricula_resultado is not null then 'PROCESSADA'
			else 'AGUARDANDO PROCESSAMENTO'
		end as descricao_situacao,
		rm.id_renovacao_matricula as id_solicitacao,
		p.nome_mae as nome_mae_solicitante,
		p.cpf_cnpj as cpf_solicitante,
		p.numero_documento_responsavel_matricula as cpf_responsavel,
		'' as motivo_cancelamento,
		serie.descricao as serie,
		etapa.denominacao as etapa,
		turno.descricao as turno,
		l.id_tipo_ocupacao_vaga as id_tipo_ocupacao_vaga,
		case
			when rmr.id_vaga_serie_concedida is not null then 'SELECIONADO'
			when rmr.id_renovacao_matricula_resultado is null then 'AGUARDANDO PROCESSAMENTO'
			else 'NÃO SELECIONADO'
		end as descricao_situacao_opcao,
		rmr.id_vaga_serie_concedida is not null as selecionada,
		1 as ordem
	from
		matricula.renovacao_matricula rm
	left join matricula.renovacao_matricula_resultado rmr
			using (id_renovacao_matricula)
	left join matricula.listagem_processamento_renovacao_matricula l
			using (id_listagem_processamento_renovacao_matricula)
	left join matricula.tipo_ocupacao_vaga tov
			using (id_tipo_ocupacao_vaga)
	join escola.escola e on
		e.id_escola = rm.id_escola
	join basico.serie serie
			using (id_serie)
	join basico.etapa_ensino etapa
			using (id_etapa_ensino)
	join matricula.vaga_serie vg
			using (id_vaga_serie)
	join ensino.turno turno
			using (id_turno)
	join matricula.calendario_matricula cm on
		cm.id_calendario_matricula = rm.id_calendario_matricula
	join discente d
			using (id_discente)
	join comum.pessoa p
			using (id_pessoa)
	join comum.unidade u on
		u.id_unidade = e.id_regional_ensino
	left join comum.municipio m on
		u.id_municipio = m.id_municipio
	join basico.estudante estudante on
		estudante.id_estudante = d.id_discente
	where
		1 = 1
		and 1 <> 1
		and cm.ano = 2025
		and upper(e.nome) like upper('%ESCOLA MUNICIPAL NOSSA SENHORA RAINHA DOS ANJOS -CAIC%')
			and (case
				when id_registro_cancelamento is not null then 'CANCELADA'
				when rmr.id_vaga_serie_concedida is not null then 'EFETIVADA'
				when rmr.id_renovacao_matricula_resultado is not null then 'PROCESSADA'
				else 'AGUARDANDO PROCESSAMENTO'
			end ) = 'VAGA EXPIRADA POR NÃO EFETIVAÇÃO NO PRAZO' ) s
order by
	s.ordem;
	
	
	
