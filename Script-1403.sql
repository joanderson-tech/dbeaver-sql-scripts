-- solucao
BEGIN;

SELECT nextval('hibernate_sequence') AS id, id_turma, data_aula::date AS data_aula, current_date AS criado_em, 1 AS numero_aulas, 3 AS tipo, 'Sábado Letivo' AS descricao
INTO TEMP aulas_extra_para_adicionar
FROM(
	WITH datas (dia) AS (
VALUES 
		('2025-03-22'),('2025-04-05'),('2025-05-31'),('2025-06-07'),('2025-07-19'),('2025-08-09'),('2025-09-13'),('2025-10-18'),('2025-10-25'),('2025-11-08'),('2025-12-13')
	), aulas_comuns AS (
		SELECT CASE
				WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora
ELSE t.id_turma
			END AS id_turma, d.dia AS data_aula
FROM ensino.turma t, datas d
WHERE t.id_situacao_turma NOT IN (4, 9)
AND t.ano = 2025
AND NOT EXISTS (
			SELECT 1
FROM ava.aula_extra ae
WHERE ae.id_turma = CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora
ELSE t.id_turma END
AND ae.data_aula = d.dia::date
		)	
	), aulas_adjuntas AS (
		SELECT t.id_turma AS id_turma, d.dia AS data_aula
FROM ensino.turma t
JOIN basico.turma_serie ts ON
t.id_turma_serie = ts.id_turma_serie
JOIN basico.curriculo_basico cb ON
cb.id_curriculo_basico = ts.id_curriculo_medio
JOIN ensino.docente_turma dt ON
dt.id_turma = t.id_turma
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = ts.id_curriculo_medio
AND cbc.permite_alocacao_adjunto
AND cbc.id_componente_curricular = t.id_disciplina
CROSS JOIN datas d
WHERE dt.ativo
AND NOT dt.finalizada
AND (now() BETWEEN dt.data_inicio AND dt.data_fim)
	AND t.id_turma_agrupadora IS NOT NULL
	AND NOT EXISTS (
			SELECT 1
FROM ava.aula_extra ae
WHERE ae.id_turma = t.id_turma
	AND ae.data_aula = d.dia::date
		)
	)
	SELECT id_turma, data_aula
FROM aulas_comuns
UNION
	SELECT id_turma, data_aula
FROM aulas_adjuntas
) AS aulas_para_processar;

SELECT *
FROM aulas_extra_para_adicionar;

INSERT INTO ava.aula_extra (id, id_turma, data_aula, criado_em, numero_aulas, tipo, descricao)
SELECT id, id_turma, data_aula, criado_em, numero_aulas, tipo, descricao
FROM aulas_extra_para_adicionar;

--backup
SELECT 'delete from ava.aula_extra where id in (' || string_agg(id::text, ',') || ');'
FROM aulas_extra_para_adicionar;

COMMIT;

ROLLBACK;