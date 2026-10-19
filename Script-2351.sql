SELECT COALESCE(sum(fa.frequencia), 0) AS faltasTotais,   COALESCE(sum(abonos.quantidade_faltas_abonadas), 0) AS apenasAbono,
COALESCE(sum(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0) AS faltasSemAbono
FROM ensino.frequencia_aluno fa
LEFT JOIN LATERAL ( SELECT iaf.id_frequencia, sum(iaf.quantidade_faltas_abonadas) AS quantidade_faltas_abonadas
FROM ensino.item_abono_frequencia iaf
JOIN ensino.abono_frequencia af ON
af.id_abono_frequencia = iaf.id_abono_frequencia
WHERE af.ativo
AND iaf.id_frequencia = fa.id_frequencia
GROUP BY iaf.id_frequencia ) abonos ON
TRUE
JOIN ensino.turma t ON t.id_turma = fa.id_turma
JOIN ensino.componente_curricular cc ON cc .id_componente_curricular = t.id_disciplina 
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
WHERE fa.ativo
AND fa.id_discente = 980242
AND t.id_turma_serie = 52335469
AND NOT EXISTS (SELECT 1
FROM ensino.interrupcao_escola ie
WHERE ie.id_escola = ts.id_escola
AND fa."data" BETWEEN ie.inicio AND ie.fim
AND ie.ativo)
GROUP BY t.id_turma, cc.codigo;
