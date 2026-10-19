SELECT ts.nome AS nome_etapa, s.id_serie, s.descricao AS serie, ee.id_etapa_ensino, ee.denominacao, mes.num_chamada, p.nome, p.data_nascimento, d.matricula, tr.descricao AS turno, cc.sigla, mes.id_situacao_matricula_serie, sms.descricao AS situacao_matricula, t.grupo, p.bairro, sm.id_serie AS id_serie_mult, sm.descricao AS serie_mult, eem.id_etapa_ensino AS id_etapa_ensino_mult, ee.denominacao AS etapa_serie_mult
FROM basico.matricula_estudante_serie mes
INNER JOIN discente d ON
d.id_discente = mes.id_estudante
INNER JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
INNER JOIN escola.escola_etapa_ensino_serie ees ON
ees.id_escola_etapa_ensino_serie = mes.id_serie_escola
INNER JOIN basico.turma_serie ts ON
ts.id_escola = ees.id_escola
INNER JOIN ensino.matricula_componente mc ON
mc.id_discente = d.id_discente
INNER JOIN ensino.turma t ON
mc.id_turma = t.id_turma
INNER JOIN basico.turma_serie ts_mat_comp ON
t.id_turma_serie = ts_mat_comp.id_turma_serie
INNER JOIN ensino.componente_curricular cc ON
mc.id_componente_curricular = cc.id_componente_curricular
INNER JOIN basico.serie s ON
s.id_serie = ts.id_serie
INNER JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
INNER JOIN basico.nivel_etapa_ensino nee ON
nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
INNER JOIN ensino.turno tr ON
tr.id_turno = ts.id_turno
INNER JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
LEFT JOIN basico.serie sm ON
sm.id_serie = mes.id_serie_multisseriado
LEFT JOIN basico.etapa_ensino eem ON
eem.id_etapa_ensino = sm.id_etapa_ensino
WHERE ts.ativo = TRUE
AND ts.id_turma_serie = 52346560
AND mes.id_turma_serie = ts.id_turma_serie
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1, 6 )
AND mc.id_situacao_matricula <> 7
AND ts_mat_comp.ativo = trueValue()
ORDER BY tr.id_turno, ee.denominacao, s.descricao, ts.nome, mes.id_situacao_matricula_serie, p.nome, cc.nome;



SELECT DISTINCT
    -- 1. Dados da Turma / Etapa Extracurricular
    ts.nome                              AS nome_etapa,
    s.id_serie,
    s.descricao                          AS serie,
    ee.id_etapa_ensino,
    ee.denominacao                       AS denominacao_etapa,
    tr.descricao                         AS turno,
    t.grupo                              AS grupo_turma,
    -- 2. Dados Pessoais do Discente
    d.matricula                          AS matricula_estudante,
    p.nome                               AS nome_estudante,
    p.data_nascimento,
    p.bairro,
    mes.num_chamada,
    -- 3. Dados da Matrícula / Componente
    cc.sigla                             AS sigla_componente,
    COALESCE(mes.id_situacao_matricula_serie, mc.id_situacao_matricula) AS id_situacao_matricula,
    COALESCE(sms.descricao, 'CURSANDO COMPLEMENTAR')                    AS situacao_matricula,
    -- 4. Dados da Série Multisseriada (se houver)
    sm.id_serie                          AS id_serie_mult,
    sm.descricao                         AS serie_mult,
    eem.id_etapa_ensino                  AS id_etapa_ensino_mult,
    eem.denominacao                      AS etapa_serie_mult
FROM ensino.turma t
-- VÍNCULO DA TURMA DA ATIVIDADE COMPLEMENTAR
INNER JOIN basico.turma_serie ts               ON t.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.serie s                     ON s.id_serie = ts.id_serie
INNER JOIN basico.etapa_ensino ee             ON ee.id_etapa_ensino = s.id_etapa_ensino
INNER JOIN basico.nivel_etapa_ensino nee      ON nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
INNER JOIN ensino.turno tr                    ON tr.id_turno = ts.id_turno
-- ALOCAÇÃO DOS ESTUDANTES NA TURMA COMPLEMENTAR (VIA COMPONENTES)
INNER JOIN ensino.matricula_componente mc      ON mc.id_turma = t.id_turma
INNER JOIN ensino.componente_curricular cc     ON mc.id_componente_curricular = cc.id_componente_curricular
INNER JOIN discente d                         ON d.id_discente = mc.id_discente
INNER JOIN comum.pessoa p                     ON p.id_pessoa = d.id_pessoa
-- MATRÍCULA REGULAR DO ESTUDANTE (LEFT JOIN para não filtrar alunos sem mes na turma complementar)
LEFT JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente
LEFT JOIN escola.escola_etapa_ensino_serie ees ON ees.id_escola_etapa_ensino_serie = mes.id_serie_escola
LEFT JOIN basico.situacao_matricula_serie sms  ON sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
LEFT JOIN basico.serie sm                      ON sm.id_serie = mes.id_serie_multisseriado
LEFT JOIN basico.etapa_ensino eem              ON eem.id_etapa_ensino = sm.id_etapa_ensino
-- FILTROS DE EXECUÇÃO
WHERE ts.ativo = TRUE
  AND ts.id_turma_serie = 52346560  -- Sustitua pelo ID da TurmaSerie desejada
  AND mc.id_situacao_matricula <> 7 -- Exclui matrículas canceladas do componente
-- ORDENAÇÃO DOS RESULTADOS
ORDER BY tr.descricao,ee.denominacao,s.descricao,ts.nome,p.nome,cc.sigla;