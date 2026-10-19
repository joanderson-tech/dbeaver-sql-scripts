select
    st.numero,
    p.nome,
    e2.nome,
    stoe.ordem,
    e.nome,
    tst.denominacao,
    m.nome,
    u.nome,
    sst.denominacao,
    st.visto_escola
from
    matricula.solicitacao_transferencia_opcao_escola stoe
join matricula.solicitacao_transferencia st on
    st.id_solicitacao_transferencia = stoe.id_solicitacao
join basico.matricula_estudante_serie mes on
    mes.id_matricula_discente_serie = st.id_matricula_discente_serie
join ensino.turno t on
    t.id_turno = mes.id_turno
left outer join escola.escola_etapa_ensino_serie eees on
    mes.id_serie_escola = eees.id_escola_etapa_ensino_serie
left outer join escola.escola e2 on
    eees.id_escola = e2.id_escola
join basico.serie s on
    s.id_serie = eees.id_serie
join basico.etapa_ensino ee on
    ee.id_etapa_ensino = s.id_etapa_ensino
join basico.modalidade_ensino_basico meb on
    meb.id_modalidade_ensino_basico = ee.id_modalidade
join discente d on
    d.id_discente = mes.id_estudante
join comum.pessoa p on
    p.id_pessoa = d.id_pessoa
join matricula.tipo_solicitacao_transferencia tst on
    tst.id_tipo_solicitacao_transferencia = st.id_tipo
join matricula.status_solicitacao_transferencia sst on
    sst.id_status_solicitacao_transferencia = st.id_status
join escola.escola e on
    e.id_escola = stoe.id_escola
join comum.municipio m on
    m.id_municipio = e.id_municipio
join comum.unidade u on
    u.id_unidade = e.id_regional_ensino
where
    1 = 1
    and st.ano_escolar = 2025;
    and e.nome Ilike '%ESCOLA MUNICIPAL DE EDUCACAO BASICA PROFESSORA SINHA BARBOSA%';