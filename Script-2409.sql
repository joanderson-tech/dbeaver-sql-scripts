WITH dados_base AS ( SELECT h.*, CASE WHEN h.id_etapa_ensino = 1 THEN 1
WHEN h.id_etapa_ensino IS NULL THEN 2
ELSE 3 END AS prioridade_etapa
FROM ensino.horario h
WHERE h.ativo
AND (h.id_etapa_ensino = 1
	OR h.id_etapa_ensino IS NULL )
AND h.tipo = 524350830 ), unidade_escolhida AS ( SELECT CASE WHEN EXISTS (SELECT 1
FROM dados_base
WHERE id_unidade = 5847) THEN 5847
ELSE 605 END AS id_unidade ), dados AS ( SELECT db.*
FROM dados_base db
JOIN unidade_escolhida ue ON
db.id_unidade = ue.id_unidade
WHERE db.prioridade_etapa IN (1, 2) ), melhor_ano AS ( SELECT ano_entrada_vigor
FROM dados
GROUP BY ano_entrada_vigor
ORDER BY ano_entrada_vigor DESC NULLS LAST
LIMIT 1 ), melhor_etapa AS ( SELECT MIN(d.prioridade_etapa) AS prioridade
FROM dados d
JOIN melhor_ano ma ON
d.ano_entrada_vigor IS NOT DISTINCT
FROM ma.ano_entrada_vigor ) 
SELECT d.id_horario, d.inicio, d.fim, d.ano_entrada_vigor, d.tipo, d.ordem, d.ativo, u.id_unidade, u.nome, ee.id_etapa_ensino, ee.denominacao, t.descricao
FROM dados d
JOIN comum.unidade u ON
u.id_unidade = d.id_unidade
JOIN ensino.turno t ON
t.id_turno = d.tipo
LEFT JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = d.id_etapa_ensino
JOIN melhor_ano ma ON
d.ano_entrada_vigor IS NOT DISTINCT
FROM ma.ano_entrada_vigor
JOIN melhor_etapa me ON
d.prioridade_etapa = me.prioridade
ORDER BY d.inicio, d.fim, d.prioridade_etapa;

SELECT *
FROM basico.turma_serie ts
WHERE ts.ano ;

SELECT DISTINCT horario.id_horario AS id_horario, horario.ano_entrada_vigor AS ano, horario.ativo AS ativo, horario.id_etapa_ensino AS id_etapa_ensino, horario.fim AS fim, horario.inicio AS inicio, horario.nivel AS nivel, horario.ordem AS ordem, horario.tipo AS tipo, horario.id_unidade AS id
FROM ensino.horario_turma horarioturno
INNER JOIN ensino.turma turmacompo ON
horarioturno.id_turma = turmacompo.id_turma
INNER JOIN basico.turma_serie turmaserie ON
turmacompo.id_turma_serie = turmaserie.id_turma_serie
INNER JOIN ensino.Horario horario ON
horarioturno.id_horario = horario.id_horario
WHERE turmaserie.id_turma_serie = 52563983
AND horarioturno.ativo = TRUE
AND horario.ativo = TRUE;
AND horario.tipo IN ( )
LIMIT ?