SELECT 
    m.id,
    discenteMedio.id,
    discenteMedio.discente_matricula,
    discenteMedio.discente_pessoa_id,
    discenteMedio.discente_pessoa_nome,
    discenteMedio.discente_pessoa_nomeMae,
    m_serie_etapa_ensino_nivelEtapa_id,
    m_serie_etapa_ensino_denominacao,
    m_serie_descricao,
    situacaoMatriculaSerie_id,
    situacaoMatriculaSerie_descricao,
    (
        SELECT COUNT(*)
        FROM RenovacaoMatricula rm
        WHERE rm.estudante_id = discenteMedio.id
            AND rm.registroCancelamento_id IS NULL
    ),
    (
        SELECT COUNT(sol.id)
        FROM SolicitacaoTransferencia sol
        WHERE sol.status_id != StatusSolicitacaoTransferencia.CANCELADA_VALUE
            AND sol.matricula_discenteMedio_id = discenteMedio.id
    )
FROM
    basico.matricula_estudante_serie mes  m
    INNER JOIN Serie ON m.serie_id = Serie.id
where  mes.ano = 2023;
