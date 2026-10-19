SELECT t.id_turma, ee.denominacao, t.codigo, tur.hora_inicio, tur.hora_fim, t.capacidade_aluno, CASE
        WHEN ee.id_etapa_ensino <> 14 THEN (
        SELECT count(DISTINCT(id_discente))
FROM ensino.matricula_componente
WHERE id_situacao_matricula = 2
AND id_turma = t.id_turma )
ELSE (
        SELECT count(DISTINCT eea.id_estudante)
FROM educacao_especial.atendimento_educacao_especial_horario eeh
INNER JOIN educacao_especial.atendimento_educacao_especial_turma eet ON
            (eet.id_atendimento_educacao_especial_turma = eeh.id_atendimento_educacao_especial_turma)
INNER JOIN educacao_especial.atendimento_educacao_especial_estudante eea ON
            (eea.id_atendimento_educacao_especial_horario = eeh.id_atendimento_educacao_especial_horario)
INNER JOIN ensino.turma t2 ON
            (t2.id_turma = eet.id_turma)
INNER JOIN basico.turma_serie ts2 ON
            (ts2.id_turma_serie = t.id_turma_serie)
WHERE ts2.progressao_parcial IS FALSE
AND t2.id_turma = t.id_turma
AND ts2.ativo = TRUE
AND eet.ativo = TRUE
AND eea.ativo = TRUE )
    END AS matriculados, cc.nome, ts.id_turma_serie, e.id_escola, e.nome, e.id_unidade_escola, t.id_categoria_componente, ts.nome AS nomeTurmaSerie, ee.id_etapa_ensino
FROM ensino.turma t
JOIN basico.turma_serie ts
	USING (id_turma_serie)
JOIN escola.escola e
	USING (id_escola)
JOIN basico.serie s
	USING (id_serie)
JOIN basico.etapa_ensino ee
	USING (id_etapa_ensino)
JOIN ensino.componente_curricular cc ON
( t.id_disciplina = cc.id_componente_curricular )
JOIN basico.nivel_etapa_ensino nee ON
( nee.id_nivel_etapa_ensino = ee.id_nivel_etapa )
JOIN ensino.turno tur ON
( ts.id_turno = tur.id_turno )
JOIN ensino.docente_turma dt ON
dt.id_turma = t.id_turma
AND NOT dt.auxiliar
AND dt.ativo
AND NOT dt.finalizada
--AND dt.data_fim >= current_date
WHERE ts.id_tipo_turma_serie <> 2
AND t.id_situacao_turma != 4
AND ts.ano = 2025
AND ts.id_escola = 76171128
ORDER BY ee.denominacao, t.codigo, tur.hora_inicio, t.capacidade_aluno;