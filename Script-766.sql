
WITH TurmasComConflito AS (
    -- Identifica as turmas nos currículos especificados que têm mais de um docente
    select  from (
			SELECT
	        t.id_turma_serie , dt.id_docente
	    FROM
	        basico.turma_serie ts
	    JOIN
	        ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
	    JOIN
	        ensino.docente_turma dt ON dt.id_turma = t.id_turma
	    WHERE
	        ts.id_curriculo_medio  in (52224881,52224887) -- << AJUSTE AQUI SEUS IDS DE CURRÍCULO
	        AND dt.id_docente IS NOT NULL -- Importante: Só conta docentes que realmente estão alocados
	    ) fo group by fo.id_turma_serie , fo.id_docente
	    HAVING
	        COUNT( fo.id_docente) > 1;
),
DocentePrincipalPorTurma AS (
    -- Para cada turma com conflito, identifica o docente com mais alocações.
    -- Em caso de empate, escolhe o de menor id_docente (para consistência).
    SELECT DISTINCT ON (dt.id_turma)
        dt.id_turma,
        dt.id_docente
    FROM
        ensino.docente_turma dt
    WHERE
        dt.id_turma IN (SELECT id_turma FROM TurmasComConflito)
    GROUP BY
        dt.id_turma, dt.id_docente
    ORDER BY
        dt.id_turma, COUNT(dt.id_docente_turma) DESC, dt.id_docente ASC
),
AlocacaoAlvo AS (
    -- Seleciona a ID da alocação que será modificada para cada DocentePrincipalPorTurma
    -- Prioriza o menor id_docente_turma para ser o "alvo" de modificação
    SELECT DISTINCT ON (dppt.id_turma)
        dt.id_docente_turma,
        dt.id_turma,
        dt.id_docente
    FROM
        ensino.docente_turma dt
    JOIN
        DocentePrincipalPorTurma dppt ON dt.id_turma = dppt.id_turma AND dt.id_docente = dppt.id_docente
    ORDER BY
        dppt.id_turma, dt.id_docente_turma ASC
)
select * from AlocacaoAlvo;


-- UPDATE principal: Modifica a disciplina e CH dedicado da alocação alvo
UPDATE ensino.docente_turma dt_main
SET
    id_disciplina = 220, -- << AJUSTE AQUI O ID DA DISCIPLINA ALVO
    ch_dedicado_periodo = dt_main.ch_dedicado_periodo + 40 -- << AJUSTE AQUI O VALOR A SER SOMADO
FROM
    AlocacaoAlvo aa
WHERE
    dt_main.id_docente_turma = aa.id_docente_turma;



select * from (
SELECT
        t.id_turma_serie , dt.id_docente
    FROM
        basico.turma_serie ts
    JOIN
        ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
    JOIN
        ensino.docente_turma dt ON dt.id_turma = t.id_turma
    WHERE
        ts.id_curriculo_medio  in (52224881,52224887) -- << AJUSTE AQUI SEUS IDS DE CURRÍCULO
        AND dt.id_docente IS NOT NULL -- Importante: Só conta docentes que realmente estão alocados
    ) fo group by fo.id_turma_serie , fo.id_docente
    HAVING
        COUNT( fo.id_docente) > 1;






WITH TurmasComMultiplosDocentes AS (
    -- Esta CTE garante que só estamos considerando turmas com mais de um docente
    SELECT
        t.id_turma,
        COUNT(DISTINCT dt.id_docente) AS num_docentes
    FROM
        basico.turma_serie ts
    JOIN
        ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
    JOIN
        ensino.docente_turma dt ON dt.id_turma = t.id_turma
    WHERE
        ts.id_curriculo_medio IN (52224881, 52224887) -- << AJUSTE AQUI SEUS IDS DE CURRÍCULO
    GROUP BY
        t.id_turma
    HAVING
        COUNT(DISTINCT dt.id_docente) > 1
),
DocentePrincipalPorTurma AS (
    -- Para cada turma identificada com múltiplos docentes, escolhe o principal.
    -- Usa DISTINCT ON para garantir uma única linha por id_turma.
    -- Ordena por contagem de alocações (desc) e id_docente_turma (asc) para desempate.
    SELECT DISTINCT ON (dt.id_turma)
        dt.id_turma,
        dt.id_docente,
        dt.id_docente_turma -- Inclui para desempate e futura seleção
    FROM
        ensino.docente_turma dt
    JOIN
        TurmasComMultiplosDocentes tcmd ON dt.id_turma = tcmd.id_turma
    GROUP BY
        dt.id_turma, dt.id_docente, dt.id_docente_turma -- Agrupa por id_docente_turma para a contagem
    ORDER BY
        dt.id_turma, COUNT(dt.id_docente_turma) DESC, dt.id_docente_turma ASC
)
-- UPDATE principal: Modifica a disciplina e CH dedicado da alocação alvo
UPDATE ensino.docente_turma dt_main
SET
    id_disciplina = 220, -- << AJUSTE AQUI O ID DA DISCIPLINA ALVO
    ch_dedicado_periodo = dt_main.ch_dedicado_periodo + 40 -- << AJUSTE AQUI O VALOR A SER SOMADO
FROM
    DocentePrincipalPorTurma dppt
WHERE
    dt_main.id_docente_turma = dppt.id_docente_turma; -- Usa o id_docente_turma selecionado como principal