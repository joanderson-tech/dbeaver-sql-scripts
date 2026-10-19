select
	mes.id_matricula_discente_serie,
    d.matricula,
    p.nome,
    p.cpf_cnpj,
    ts.nome AS nomeTurma,
    COALESCE(mee.data_solicitacao,  mee.data) AS data_solicitacao,
    mee.data AS data_transferencia,
    tst.denominacao
FROM
    basico.matricula_estudante_serie mes
join discente d ON d.id_discente = mes.id_estudante
join comum.pessoa p ON p.id_pessoa = d.id_pessoa
join matricula.movimentacao_estudante_escola mee ON mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
join matricula.tipo_solicitacao_transferencia tst ON tst.id_tipo_solicitacao_transferencia = mee.id_tipo_sol_transferencia
INNER JOIN basico.situacao_matricula_serie sms ON sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
INNER JOIN basico.situacao_matricula_serie sms_mee ON sms_mee.id_situacao_matricula_serie = mee.id_situacao_matricula_serie
join escola.escola_etapa_ensino_serie es ON es.id_escola_etapa_ensino_serie = mes.id_serie_escola
join escola.escola e ON e.id_escola = es.id_escola
left join basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie
WHERE
    mes.id_situacao_matricula_serie = 6
    AND e.id_escola = 52232914 
    AND mes.ano_calendario= 2023
  	ORDER BY p.nome;

  


SELECT *
FROM escola.escola e
WHERE e.nome LIKE '%CENTRO MUNICIPAL DE EDUCACAO INFANTIL CAIC%';
;

select * 
from matricula.movimentacao_estudante_escola mee 
where mee.id_matricula_estudante_serie  = 1433136;

select 
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo;
