WITH DadosEstudantesAEE AS (
    select distinct p.id_pessoa, 
        p.nome AS NomeEstudante,
        t.codigo AS Turma,
        e.nome AS Unidade,
        tn.descricao AS Turno,
        dt.id_docente -- Incluímos o id_docente aqui para usá-lo na próxima etapa
    FROM
        educacao_especial.atendimento_educacao_especial_estudante aee
    JOIN educacao_especial.atendimento_educacao_especial_horario aeeh ON
        aee.id_atendimento_educacao_especial_horario = aeeh.id_atendimento_educacao_especial_horario
    JOIN educacao_especial.atendimento_educacao_especial_turma aeet ON
        aeeh.id_atendimento_educacao_especial_turma = aeet.id_atendimento_educacao_especial_turma
    JOIN ensino.turma t ON
        aeet.id_turma = t.id_turma
    JOIN ensino.docente_turma dt ON
        t.id_turma = dt.id_turma
    JOIN basico.turma_serie ts ON
        t.id_turma_serie = ts.id_turma_serie
    JOIN discente d ON
        aee.id_estudante = d.id_discente
    JOIN basico.matricula_estudante_serie mes ON
        d.id_discente = mes.id_estudante
    JOIN comum.pessoa p ON
        d.id_pessoa = p.id_pessoa
    JOIN escola.escola e ON
        ts.id_escola = e.id_escola
    JOIN ensino.turno tn ON
        ts.id_turno = tn.id_turno
    WHERE
        aee.ativo
        AND aeet.ativo
        AND t.id_situacao_turma <> 4
        AND mes.ano_calendario = 2025
        AND t.ano = 2025
        AND mes.id_situacao_matricula_serie = 1
)
SELECT
    distinct dea.NomeEstudante AS Nome,
    dea.Turma,
    prof.nome AS "Professor",
    dea.Unidade,
    dea.Turno
FROM
    DadosEstudantesAEE dea
JOIN rh.servidor s ON
    dea.id_docente = s.id_servidor
JOIN comum.pessoa prof ON
    s.id_pessoa = prof.id_pessoa
ORDER BY
    dea.turma;

