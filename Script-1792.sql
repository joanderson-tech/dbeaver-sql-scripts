SELECT mc.*
FROM ensino.turma t
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma
WHERE t.id_turma_serie = 51899508;
AND t.id_situacao_turma = 3;

SELECT *
FROM basico.turma_serie ts
WHERE ts.nome = 'EIPREMEIP5A'
AND ts.id_escola = 51877831;

SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%Manuel Chaves%'


SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie = 51899508;

SELECT count(*)
FROM ensino.docente_turma dt
JOIN ensino.turma t
	USING (id_turma)
JOIN basico.turma_serie ts
	USING (id_turma_serie)
WHERE t.id_turma_serie = ?
AND dt.ativo
AND dt.finalizada = FALSE 

SELECT t.id_turma, t.capacidade_aluno, t.tipo, t.agrupadora, t.ano, cc.nome, cc.id_componente_curricular, cc.id_tipo_componente,( SELECT COUNT(DISTINCT(id_discente))
FROM ensino.matricula_componente
WHERE id_situacao_matricula = 2
AND id_turma = t.id_turma ) AS matriculados, t.codigo, t.periodo AS periodo_turma, ts.id_turma_serie, s.id_serie , s.multisseriada
FROM ensino.turma t
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
JOIN basico.serie s ON
s.id_serie = ts.id_serie
JOIN ensino.componente_curricular cc ON
( cc.id_componente_curricular = t.id_disciplina )
WHERE t.id_situacao_turma IN (3)
AND t.id_turma_serie = 51899508;

SELECT t.id_turma, t.capacidade_aluno, t.tipo, t.agrupadora, t.ano, cc.nome, cc.id_componente_curricular, cc.id_tipo_componente,( SELECT COUNT(DISTINCT(id_discente))
FROM ensino.matricula_componente
WHERE id_situacao_matricula = 2
AND id_turma = t.id_turma ) AS matriculados, t.codigo, t.periodo AS periodo_turma, ts.id_turma_serie, s.id_serie , s.multisseriada
FROM ensino.turma t
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
JOIN basico.serie s ON
s.id_serie = ts.id_serie
JOIN ensino.componente_curricular cc ON
( cc.id_componente_curricular = t.id_disciplina )
WHERE t.id_situacao_turma IN (3)
AND t.id_turma_serie = 51899508
AND t.tipo != 14;

SELECT *
FROM comum.usuario u
WHERE u.id_usuario = 104937;
--JANAINA DE LIMA BARROS 20/01/2026 22:15:03
