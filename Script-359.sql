select
	*
from
	(
	select
		distinct on
		(ei.id_estudante_inscrito,
		ei.numero_inscricao,
		e.nome,
		serie.descricao,
		turno.descricao) ei.id_estudante_inscrito as idSolicitacao,
		ei.numero_inscricao as numSolicitacao,
		ei.nome as nomeSolicitante,
		ei.nome_mae as nomeMaeSolicitante,
		ei.cpf as cpfSolicitante,
		cast(ei.cpf_responsavel as text) as cpfResponsavel,
		ei.nee as nee,
		s.denominacao as descricaoSituacao,
		ei.motivo_cancelamento as motivoCancelamento,
		e.nome as escola,
		serie.descricao as serie,
		etapa.denominacao as etapa,
		turno.descricao as turno,
		l.id_tipo_ocupacao_vaga as idTipoOcupacaoVaga,
		tov.denominacao as tipoOcupacaoVaga,
		case
			when (eip.id_opcao_escola = eio.id_estudante_inscrito_opcao_escola
				and eip.id_status not in (5, 8)) then 'SELECIONADO'
			when eip.id_estudante_inscrito_processamento is null then case
				when s.id_status_estudante_inscrito not in (2, 5, 8) then 'AGUARDANDO PROCESSAMENTO'
				else 'NÃO SELECIONADO'
			end
			else 'NÃO SELECIONADO'
		end as descricaoSituacaoOpcao,
		'Matrícula' as tipo,
		case
			when (eip.id_opcao_escola = eio.id_estudante_inscrito_opcao_escola
				and eip.id_status not in (5, 8)) then true
			else false
		end as selecionada,
		eio.ordem
	from
		matricula.estudante_inscrito ei
	left join matricula.estudante_inscrito_processamento eip on
		eip.id_estudante_inscrito = ei.id_estudante_inscrito
		and (ei.id_status <> 7
			or (ei.id_status = 7
				and eip.id_status = 4))
	left join matricula.listagem_processamento_matricula l
			using (id_listagem_processamento_matricula)
	left join matricula.tipo_ocupacao_vaga tov
			using (id_tipo_ocupacao_vaga)
	join matricula.calendario_matricula cm on
		cm.id_calendario_matricula = ei.id_calendario_matricula
	join matricula.estudante_inscrito_opcao_escola eio on
		eio.id_estudante_inscrito = ei.id_estudante_inscrito
		and coalesce(eio.prioridade_pre_matricula,
		eio.ordem) = 1
	join escola.escola e on
		e.id_escola = eio.id_escola
	join matricula.vaga_serie vg
			using (id_vaga_serie)
	join basico.serie serie
			using (id_serie)
	join basico.etapa_ensino etapa
			using (id_etapa_ensino)
	join ensino.turno turno
			using (id_turno)
	join matricula.status_estudante_inscrito s on
		s.id_status_estudante_inscrito = ei.id_status
	join comum.unidade u on
		u.id_unidade = e.id_regional_ensino
	left join comum.municipio m on
		u.id_municipio = m.id_municipio
	join matricula.status_estudante_inscrito sei on
		sei.id_status_estudante_inscrito = ei.id_status
	where
		1 = 1
		and cm.ano = 2025
	order by
		ei.id_estudante_inscrito,
		ei.numero_inscricao,
		e.nome,
		serie.descricao,
		turno.descricao,
		(eip.id_opcao_escola = eio.id_estudante_inscrito_opcao_escola
			and eip.id_status not in (5, 8)) desc,
		eio.ordem ) as matriculas
union
select
	*
from
	(
	select
		distinct on
		(st.id_solicitacao_transferencia,
		st.numero,
		e.nome,
		serie.descricao,
		turno.descricao) st.id_solicitacao_transferencia as idSolicitacao,
		st.numero as numSolicitacao,
		p.nome as nomeSolicitante,
		p.nome_mae as nomeMaeSolicitante,
		p.cpf_cnpj as cpfSolicitante,
		p.numero_documento_responsavel_matricula as cpfResponsavel,
		(
		select
			COUNT(*)
		from
			comum.pessoa_necessidade_especial
		where
			id_pessoa = p.id_pessoa) > 0 as nee,
		s.denominacao as descricaoSituacao,
		st.observacoes_analise as motivoCancelamento,
		e.nome as escola,
		serie.descricao as serie,
		etapa.denominacao as etapa,
		turno.descricao as turno,
		l.id_tipo_ocupacao_vaga as idTipoOcupacaoVaga,
		tov.denominacao as tipoOcupacaoVaga,
		case
			when stp.id_opcao_escola = sto.id_solicitacao_transferencia_opcao_escola then 'SELECIONADA'
			when stp.id_solicitacao_transferencia_processamento is null then case
				when s.id_status_solicitacao_transferencia not in (3, 6, 7) then 'AGUARDANDO PROCESSAMENTO'
				else 'NÃO SELECIONADO'
			end
			else 'NÃO SELECIONADO'
		end as descricaoSituacaoOpcao,
		'Transferência' as tipo,
		case
			when (stp.id_opcao_escola = sto.id_solicitacao_transferencia_opcao_escola) then true
			else false
		end as selecionada,
		sto.ordem
	from
		matricula.solicitacao_transferencia st
	left join matricula.solicitacao_transferencia_processamento stp on
		stp.id_solicitacao_transferencia = st.id_solicitacao_transferencia
	left join matricula.listagem_solicitacao_transferencia_processamento l
			using (id_listagem_solicitacao_transferencia_processamento)
	left join matricula.tipo_ocupacao_vaga tov
			using (id_tipo_ocupacao_vaga)
	join matricula.calendario_matricula cm on
		cm.id_calendario_matricula = st.id_calendario_matricula
	join matricula.solicitacao_transferencia_opcao_escola sto on
		sto.id_solicitacao = st.id_solicitacao_transferencia
	join escola.escola e on
		e.id_escola = sto.id_escola
	join basico.serie serie
			using (id_serie)
	join basico.etapa_ensino etapa
			using (id_etapa_ensino)
	join ensino.turno turno
			using (id_turno)
	join basico.matricula_estudante_serie mes
			using (id_matricula_discente_serie)
	join discente d on
		d.id_discente = mes.id_estudante
	join comum.pessoa p
			using (id_pessoa)
	join matricula.status_solicitacao_transferencia s on
		s.id_status_solicitacao_transferencia = st.id_status
	join comum.unidade u on
		u.id_unidade = e.id_regional_ensino
	left join comum.municipio m on
		u.id_municipio = m.id_municipio
	where
		1 = 1
		and 1 <> 1
		and cm.ano = 2025
	group by
		idSolicitacao,
		numSolicitacao,
		nomeSolicitante,
		nomeMaeSolicitante,
		cpfSolicitante,
		cpfResponsavel,
		nee,
		descricaoSituacao,
		motivoCancelamento,
		escola,
		serie,
		etapa,
		turno,
		idTipoOcupacaoVaga,
		tipoOcupacaoVaga,
		descricaoSituacaoOpcao,
		stp.id_opcao_escola,
		sto.id_solicitacao_transferencia_opcao_escola
	order by
		st.id_solicitacao_transferencia,
		st.numero,
		e.nome,
		serie.descricao,
		turno.descricao,
		case
			when (stp.id_opcao_escola = sto.id_solicitacao_transferencia_opcao_escola) then true
			else false
		end desc,
		sto.ordem ) as transferencias
union
select
	*
from
	(
	select
		distinct on
		(rm.id_renovacao_matricula,
		rm.numero_renovacao,
		e.nome,
		serie.descricao,
		turno.descricao) rm.id_renovacao_matricula as idSolicitacao,
		rm.numero_renovacao as numSolicitacao,
		p.nome as nomeSolicitante,
		p.nome_mae as nomeMaeSolicitante,
		p.cpf_cnpj as cpfSolicitante,
		p.numero_documento_responsavel_matricula as cpfResponsavel,
		rm.nee as nee,
		case
			when id_registro_cancelamento is not null then 'CANCELADA'
			when rmr.id_vaga_serie_concedida is not null then 'EFETIVADA'
			when rmr.id_renovacao_matricula_resultado is not null then 'PROCESSADA'
			else 'AGUARDANDO PROCESSAMENTO'
		end as descricaoSituacao,
		'' as motivoCancelamento,
		e.nome as escola,
		serie.descricao as serie,
		etapa.denominacao as etapa,
		turno.descricao as turno,
		l.id_tipo_ocupacao_vaga as idTipoOcupacaoVaga,
		tov.denominacao as tipoOcupacaoVaga,
		case
			when rmr.id_vaga_serie_concedida is not null then 'SELECIONADO'
			when rmr.id_renovacao_matricula_resultado is null then 'AGUARDANDO PROCESSAMENTO'
			else 'NÃO SELECIONADO'
		end as descricaoSituacaoOpcao,
		'Renovação' as tipo,
		case
			when rmr.id_vaga_serie_concedida is not null then true
			else false
		end as selecionada,
		1 as ordem
	from
		matricula.renovacao_matricula rm
	left join matricula.renovacao_matricula_resultado rmr on
		rmr.id_renovacao_matricula = rm.id_renovacao_matricula
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
	where
		1 = 1
		and 1 <> 1
		and cm.ano = 2025
	order by
		rm.id_renovacao_matricula,
		rm.numero_renovacao,
		e.nome,
		serie.descricao,
		turno.descricao,
		case
			when rmr.id_vaga_serie_concedida is not null then true
			else false
		end desc,
		1 ) as renovacoes
order by
	idSolicitacao,
	numSolicitacao,
	nomeSolicitante,
	nomeMaeSolicitante,
	cpfSolicitante,
	cpfResponsavel,
	nee,
	descricaoSituacao,
	motivoCancelamento,
	escola,
	serie,
	etapa,
	turno,
	idTipoOcupacaoVaga,
	tipoOcupacaoVaga,
	descricaoSituacaoOpcao,
	tipo,
	ordem
