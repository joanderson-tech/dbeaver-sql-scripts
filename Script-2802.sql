SELECT e.nome AS Escola, d.matricula, p.nome AS nome_completo_aluno, t.codigo AS Nome_turma, t.nome_professor AS Professor_alocado
FROM educacao_especial.atendimento_educacao_especial_estudante aeee
join educacao_especial.atendimento_educacao_especial_horario aeeh ON aeee.id_atendimento_educacao_especial_horario = aeeh.id_atendimento_educacao_especial_horario
join educacao_especial.atendimento_educacao_especial_turma aeet ON aeeh.id_atendimento_educacao_especial_turma = aeet.id_atendimento_educacao_especial_turma
join ensino.turma t ON aeet.id_turma = t.id_turma
join public.discente d ON aeee.id_estudante = d.id_discente
join comum.pessoa p ON d.id_pessoa = p.id_pessoa
join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie
join escola.escola e ON e.id_escola = ts.id_escola
join basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente and mes.ano_calendario = t.ano 
WHERE aeee.ativo
AND aeet.ativo
AND t.id_situacao_turma <> 4
AND t.ano = 2026
AND mes.ano_calendario = 2026
AND mes.id_situacao_matricula_serie = 1
ORDER BY e.nome, t.codigo, p.nome ASC;


select
     aeet.* --t.nome_professor, t.codigo, t.id_turma, t.id_disciplina 
FROM educacao_especial.atendimento_educacao_especial_estudante aeee
LEFT join educacao_especial.atendimento_educacao_especial_horario aeeh ON aeee.id_atendimento_educacao_especial_horario = aeeh.id_atendimento_educacao_especial_horario
LEFT join educacao_especial.atendimento_educacao_especial_turma aeet ON aeeh.id_atendimento_educacao_especial_turma = aeet.id_atendimento_educacao_especial_turma
LEFT join ensino.turma t ON aeet.id_turma = t.id_turma
LEFT join public.discente d ON aeee.id_estudante = d.id_discente
LEFT join comum.pessoa p ON d.id_pessoa = p.id_pessoa
LEFT join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie
LEFT join escola.escola e ON e.id_escola = ts.id_escola
LEFT join basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente and mes.ano_calendario = t.ano 
where
    aeee.ativo
    and aeet.ativo
--    and t.tipo = 4
    and t.id_situacao_turma <> 4
    and t.ano = 2026
    and mes.id_situacao_matricula_serie = 1
    AND mes.ano_calendario = 2026
order by e.nome, p.nome asc;