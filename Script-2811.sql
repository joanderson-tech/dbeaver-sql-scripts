SELECT 
    -- 1. IDENTIFICAÇÃO DA TURMA E SÉRIE
    ts.id_turma_serie                        AS idTurmaSerie,
    ts.nome                                  AS nomeTurmaSerie,
    ts.tipo_diario                           AS tipoDiario,
    ts.ano                                   AS ano,
    ts.periodo                               AS periodo,
    ts.id_curriculo_medio                    AS idCurriculoMedio,
    curriculob3_.multisseriado               AS multisseriado,
    ts.id_tipo_turma_serie                   AS idTipoTurmaSerie,
    tts.descricao                            AS descricaoTipoTurmaSerie,
    -- 2. CÁLCULO DE CAPACIDADE MÁXIMA
    CASE 
        WHEN COALESCE(ts.capacidade_aluno, 0) > 0 THEN ts.capacidade_aluno
        WHEN COALESCE(s.capacidade_maxima, 0) > 0 THEN (s.capacidade_maxima + COALESCE(s.capacidade_excesso, 0))
        ELSE (ee.capacidade_maxima + COALESCE(ee.capacidade_excesso, 0)) 
    END                                      AS capacidade,
    -- 3. REGRAS E HORÁRIOS DA TURMA
    ts.regra_nao                             AS regraNao,
    ts.justificativa_regra_nao               AS justificativaRegraNao,
    ts.id_turno                              AS idTurno,
    turno5_.descricao                        AS descricaoTurno,
    turno5_.hora_inicio                      AS horaInicio,
    turno5_.hora_fim                         AS horaFim,
    -- 4. DADOS DA ESCOLA E ETAPA DE ENSINO
    ts.id_escola                             AS idEscola,
    escola8_.nome                            AS nomeEscola,
    ts.id_serie                              AS idSerie,
    s.descricao                        AS descricaoSerie,
    s.sigla                            AS siglaSerie,
    s.multisseriada                    AS multisseriada,
    s.id_etapa_ensino                  AS idEtapaEnsino,
    ee.denominacao                         AS denominacao,
    ee.periodicidade_etapa                 AS periodicidadeEtapa,
    -- 5. CONTAGEM DE ALUNOS MATRICULADOS (Subconsulta Dinâmica)
    CASE 
        WHEN ee.id_etapa_ensino = 16 THEN (
            SELECT COUNT(mc.id_matricula_componente)
            FROM ensino.matricula_componente mc
            INNER JOIN ensino.turma t ON mc.id_turma = t.id_turma AND t.id_turma_serie = ts.id_turma_serie
            JOIN basico.turma_serie ts2 ON ts2.id_turma_serie = t.id_turma_serie 
            WHERE mc.id_situacao_matricula IN (2, 5, 6, 8)
            AND ts2.id_escola = 51877805
        )
        ELSE (
            SELECT COUNT(*)
            FROM basico.matricula_estudante_serie
            WHERE id_turma_serie = ts.id_turma_serie
              AND id_situacao_matricula_serie NOT IN (4, 5, 6, 9, 12)
        ) + (
            SELECT COUNT(DISTINCT eea.id_estudante)
            FROM educacao_especial.atendimento_educacao_especial_horario eeh
            INNER JOIN educacao_especial.atendimento_educacao_especial_turma eet ON eet.id_atendimento_educacao_especial_turma = eeh.id_atendimento_educacao_especial_turma
            INNER JOIN educacao_especial.atendimento_educacao_especial_estudante eea ON eea.id_atendimento_educacao_especial_horario = eeh.id_atendimento_educacao_especial_horario
            INNER JOIN ensino.turma t ON t.id_turma = eet.id_turma
            WHERE t.id_turma_serie = ts.id_turma_serie
              AND eea.ativo = TRUE
        ) 
    END                                      AS qtdMatriculados,
    -- 6. CONTAGEM DE ALUNOS COM NECESSIDADES EDUCATIVAS ESPECIAIS (NEE)
    CASE 
        WHEN ee.id_etapa_ensino <> 14 THEN (
            SELECT COUNT(DISTINCT id_discente)
            FROM basico.matricula_estudante_serie mes
            JOIN discente d ON d.id_discente = mes.id_estudante
            JOIN comum.pessoa_necessidade_especial pne ON d.id_pessoa = pne.id_pessoa
            WHERE mes.id_turma_serie = ts.id_turma_serie
              AND mes.id_situacao_matricula_serie NOT IN (4, 5, 6, 9, 12)
        )
        ELSE (
            SELECT COUNT(DISTINCT eea.id_estudante)
            FROM educacao_especial.atendimento_educacao_especial_horario eeh
            INNER JOIN educacao_especial.atendimento_educacao_especial_turma eet ON eet.id_atendimento_educacao_especial_turma = eeh.id_atendimento_educacao_especial_turma
            INNER JOIN educacao_especial.atendimento_educacao_especial_estudante eea ON eea.id_atendimento_educacao_especial_horario = eeh.id_atendimento_educacao_especial_horario
            INNER JOIN ensino.turma t ON t.id_turma = eet.id_turma
            WHERE t.id_turma_serie = ts.id_turma_serie
              AND eea.ativo = TRUE
        ) 
    END                                      AS qtdMatriculadosNEE,
    -- 7. CONTAGEM DE PROFESSORES ATIVOS
    (
        SELECT COUNT(*)
        FROM ensino.docente_turma dt
        INNER JOIN ensino.turma t ON dt.id_turma = t.id_turma
        INNER JOIN basico.turma_serie ts_sub ON t.id_turma_serie = ts_sub.id_turma_serie
        WHERE t.id_turma_serie = ts.id_turma_serie
          AND dt.ativo = TRUE
    )                                        AS qtdProfessores,
    -- 8. INFORMAÇÕES ADICIONAIS DA UNIDADE E AMBIENTE ESCOLAR
    escola8_.id_unidade_escola,
    aue.id_ambiente_unidade_escolar,
    aue.nome_numero,
    escola8_.habilita_ambientes,
    curriculob3_.habilita_relatorio_final_polivalente,
    curriculob3_.habilita_relatorio_final_paee
-- ORIGEM DOS DADOS E JUNÇÕES (JOINS)
FROM ensino.turma tc
INNER JOIN basico.turma_serie ts               ON tc.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.curriculo_basico curriculob3_ ON ts.id_curriculo_medio = curriculob3_.id_curriculo_basico
INNER JOIN ensino.turno turno5_                ON ts.id_turno = turno5_.id_turno
INNER JOIN escola.escola escola8_               ON ts.id_escola = escola8_.id_escola
INNER JOIN basico.serie s                ON ts.id_serie = s.id_serie
INNER JOIN basico.etapa_ensino ee            ON s.id_etapa_ensino = ee.id_etapa_ensino
LEFT OUTER JOIN ambiente.ambiente_unidade_escolar aue ON aue.id_ambiente_unidade_escolar = ts.id_ambiente_unidade_escolar
LEFT OUTER JOIN basico.tipo_turma_serie tts           ON ts.id_tipo_turma_serie = tts.id_tipo_turma_serie
-- FILTROS
WHERE ts.ativo = :ativo
  AND tts.id_tipo_turma_serie IN (1, 3, 4, 5)
  AND tc.tipo NOT IN (5, 8, 10, 11, 15)
  AND ts.id_escola = 51877805
  AND ts.ano = 2026
  AND s.id_etapa_ensino = 16
-- AGRUPAMENTO
GROUP BY 
    ts.id_turma_serie, ts.nome, ts.tipo_diario, ts.ano, ts.periodo, 
    ts.id_curriculo_medio, curriculob3_.multisseriado, ts.id_tipo_turma_serie, 
    tts.descricao, ts.capacidade_aluno, ts.regra_nao, ts.justificativa_regra_nao, 
    ts.id_turno, turno5_.descricao, turno5_.hora_inicio, turno5_.hora_fim, 
    ts.id_escola, escola8_.nome, ts.id_serie, s.descricao, 
    s.multisseriada, s.id_etapa_ensino, s.capacidade_maxima, 
    s.capacidade_excesso, ee.denominacao, ee.periodicidade_etapa, 
    ee.id_etapa_ensino, ee.capacidade_maxima, ee.capacidade_excesso, 
    escola8_.id_unidade_escola, aue.id_ambiente_unidade_escolar, aue.nome_numero, 
    escola8_.habilita_ambientes, curriculob3_.habilita_relatorio_final_polivalente, 
    s.sigla, curriculob3_.habilita_relatorio_final_paee
-- ORDENAÇÃO
ORDER BY 
    s.descricao, 
    ts.nome;

SELECT s.* 
FROM basico.turma_serie ts 
INNER JOIN basico.serie s ON ts.id_serie = s.id_serie
INNER JOIN basico.etapa_ensino ee ON s.id_etapa_ensino = ee.id_etapa_ensino
WHERE ts.id_turma_serie = 52370519
AND s.id_etapa_ensino = 16;


SELECT ee.* FROM basico.etapa_ensino AS ee


