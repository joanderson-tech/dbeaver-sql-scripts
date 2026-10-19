WITH notas AS (
    SELECT nu.nota, mc.id_discente, t.id_turma_serie
    FROM ensino.nota_unidade nu
    JOIN ensino.matricula_componente mc ON mc.id_matricula_componente = nu.id_matricula_componente
    JOIN ensino.turma t ON t.id_turma = mc.id_turma
    WHERE nu.unidade = 1
       AND nu.ativo
       AND (nu.id_descricao_nota IN (4, 6, 21) OR nu.id_descricao_nota IS NULL)
       AND mc.ano = 2023
),
levantamento AS (
    SELECT
       e.nome AS unidade,
       ee.denominacao AS etapa_Ensino,
       s.descricao AS serie,
       t.descricao AS turno,
       cc.nome AS componente_Curricular,
       count(DISTINCT n.id_discente) FILTER (WHERE n.nota >= 7) AS total_alunos_acima_media,
       count(DISTINCT mes.id_matricula_discente_serie) AS total_alunos
    FROM escola.escola e
    JOIN basico.turma_serie ts ON ts.id_escola = e.id_escola
    JOIN basico.serie s ON s.id_serie = ts.id_serie
    JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
    JOIN ensino.turno t ON t.id_turno = ts.id_turno
    JOIN ensino.turma t2 ON t2.id_turma_serie = ts.id_turma_serie
    JOIN ensino.matricula_componente mc ON mc.id_turma = t2.id_turma
    JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = mc.id_componente_curricular
      AND cc.codigo != '1'
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie
    LEFT JOIN notas n
       ON n.id_discente = mes.id_estudante
       AND n.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
    WHERE ts.ano = 2023
    GROUP BY e.nome, ee.denominacao, s.descricao, t.descricao, cc.nome
    ORDER BY e.nome
)
SELECT *,  ROUND((CAST(total_alunos_acima_media AS NUMERIC) * 100 / total_alunos), 2) AS percent_alunos_acima_media
FROM levantamento;

JOIN ensino.nota_unidade nu ON mc.id_matricula_componente = nu.id_matricula_componente

