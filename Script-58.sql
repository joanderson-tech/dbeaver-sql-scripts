select
	ei.id_estudante_inscrito as idSolicitacao,
	ei.numero_inscricao as numSolicitacao,
	null as idEstudanteSolicitante,
	ei.nome_mae as nomeMaeSolicitante,
	ei.cpf as cpfSolicitante,
	eioe.id_escola as idEscola,
	e.nome as escola,
	ee.id_etapa_ensino as idEtapa,
	s.id_serie as id_serie,
	tov.id_tipo_ocupacao_vaga as idTipoOcupacao,
	sei.id_status_estudante_inscrito as situacaoSolicitacao,
	sei.denominacao as descricaoSituacao,
	ei.id_estudante as idEstudanteNovoGerado,
	ei.motivo_cancelamento as motivoCancelamento,
	ee.denominacao as etapa_ensino,
	s.descricao as serie,
	t.descricao as turno,
	ei.numero_inscricao as num_solicitacao,
	tov.denominacao as ocupacao,
	ei.nome as estudante,
	nee,
	vs.vagas_validadas as vagas_ofertadas,
	cm.data_inicio_remanescentes,
	case
		when ei.id_status = 7 then prazo_validade_vaga_remanescente_concedida
		else prazo_validade_vaga_concedida
	end as prazo_validade_vaga_concedida,
	'NÃO' as efetivado ,
	vs.id_vaga_serie,
	vs.id_turno,
	false as efetivadoNaEscola,
	vs.periodo as periodo_matricula,
	ee.periodicidade_etapa,
	null as idTipoTransferencia,
	null as denominacaoTipoTransferencia
from
	matricula.estudante_inscrito_processamento eip
join 
    matricula.listagem_processamento_matricula lpm on
	lpm.id_listagem_processamento_matricula = eip.id_listagem_processamento_matricula
join 
    matricula.tipo_ocupacao_vaga tov on
	tov.id_tipo_ocupacao_vaga = lpm.id_tipo_ocupacao_vaga
join 
    matricula.calendario_matricula cm on
	cm.id_calendario_matricula = lpm.id_calendario_matricula
join 
    matricula.estudante_inscrito ei on
	ei.id_estudante_inscrito = eip.id_estudante_inscrito
join 
    matricula.estudante_inscrito_opcao_escola eioe on
	eioe.id_estudante_inscrito_opcao_escola = eip.id_opcao_escola
join 
    matricula.status_estudante_inscrito sei on
	sei.id_status_estudante_inscrito = ei.id_status
join 
    escola.escola e on
	e.id_escola = eioe.id_escola
join 
    matricula.vaga_serie vs on
	vs.id_vaga_serie = eioe.id_vaga_serie
join 
    basico.serie s on
	s.id_serie = vs.id_serie
join 
    basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
join 
    ensino.turno t on
	t.id_turno = vs.id_turno
where
	1 = 1
	and (ei.id_estudante is null
		or ei.id_estudante = 0)
	and cm.ano = ano
	and ei.id_status not in (5, 8, 10)
	and eip.id_status not in (5, 8, 10)
	

	select *
	from matricula.tipo_ocupacao_vaga tov
	join matricula.listagem_processamento_matricula lpm ON lpm.id_tipo_ocupacao_vaga = tov.id_tipo_ocupacao_vaga
	LEFT JOIN matricula.tipo_ocupacao_vaga tov ON tov.id_tipo_ocupacao_vaga = lstp.id_tipo_ocupacao_vaga
	where tov.id_tipo_ocupacao_vaga = 8;
	

SELECT d.matricula, * 
FROM ensino.observacao_discente od 
LEFT JOIN basico.movimentacao_estudante me ON me.id_movimentacao_estudante  = id_observacao_discente 
join public.discente d on d.id_discente = od.id_discente 
WHERE od .ativo = true 
    AND (me.id_movimentacao_estudante IS NULL OR me.ativo = true)
ORDER BY od .data ASC;














