SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo IN ('EMEITIB2', 'EMEITIM1', 'EMEITIM2', 'EMEITIP1', 'EMEITIP2');


BEGIN;

CREATE TEMP TABLE temp_escolas AS SELECT * FROM( VALUES (52232943),(70107728),(52232997)) AS t(id_escola);

SELECT nextval('basico.escola_curriculo_sequence') AS id_insert, cb.id_curriculo_basico, te.id_escola
INTO TEMP curriculo_estruturas
FROM basico.curriculo_basico cb
CROSS JOIN temp_escolas te
-- Isso faz cada currículo repetir para cada escola
WHERE cb.codigo IN ('EMEITIB2', 'EMEITIM1', 'EMEITIM2', 'EMEITIP1', 'EMEITIP2');

-- 3. Geramos os comandos de INSERT e DELETE (Backup)
SELECT 'INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) ' ||
    'VALUES (' || id_insert || ', true, ' || id_curriculo_basico || ', ' || id_escola || ', ''' || now() || ''');' AS SOLUCAO, 
    'DELETE FROM basico.escola_curriculo WHERE id = ' || id_insert || ';' AS BACKUP
FROM curriculo_estruturas;

--############

--Grupo 1
SELECT ts.id_turma_serie, ts.id_curriculo_medio 
INTO TEMP turma_serie_novaG1
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio in (51876300)
AND ts.ano = 2026
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ativo 
AND ts.id_serie = 51869716;

SELECT
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61640186 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO
FROM turma_serie_novaG1;

--############

--Grupo 2
SELECT ts.id_turma_serie, ts.id_curriculo_medio 
INTO TEMP turma_serie_novaG2
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio in (51876318)
AND ts.ano = 2026
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ativo 
AND ts.id_serie = 51869713;

SELECT
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61639524 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO
FROM turma_serie_novaG2;

--############

--Grupo 3
SELECT ts.id_turma_serie, ts.id_curriculo_medio 
INTO TEMP turma_serie_novaG3
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio in (51876684)
AND ts.ano = 2026
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ativo 
AND ts.id_serie = 51876116;

SELECT
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61639553 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO
FROM turma_serie_novaG3;

--############

--Grupo 4 
SELECT ts.id_turma_serie, ts.id_curriculo_medio 
INTO TEMP turma_serie_novaG4 
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio in (51876342,72766316,51876342)
AND ts.ano = 2026
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ativo 
AND ts.id_serie = 51869714;

SELECT
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS BACKUP
FROM turma_serie_novaG4;

--############

--Grupo 5
SELECT ts.id_turma_serie, ts.id_curriculo_medio 
INTO TEMP turma_serie_novaG5
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio in (72759255,51876354, 72759255)
AND ts.ano = 2026
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ativo 
AND ts.id_serie = 51869715;

SELECT
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS BACKUP
FROM turma_serie_novaG5;

--ROLLBACK;

COMMIT;


WITH ultima_data_movimentacao AS ( SELECT mee.id_matricula_estudante_serie, max(mee.data_cadastro) AS ultima_data, mes.id_estudante
FROM matricula.movimentacao_estudante_escola mee
JOIN basico.matricula_estudante_serie mes ON
mes.id_matricula_discente_serie = mee.id_matricula_estudante_serie
JOIN basico.turma_serie ts ON
ts.id_turma_serie = mes.id_turma_serie
WHERE mee.ativo
AND ts.ativo
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ano = 2026
AND mee.id_tipo_sol_transferencia IN (1, 3, 5)
AND mee.data <= '2026-02-27'
GROUP BY mes.id_estudante, mee.id_matricula_estudante_serie ), estudantes_por_turma AS ( SELECT mes.id_turma_serie, COUNT(mes.id_matricula_discente_serie) AS total_estudantes
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON
ts.id_turma_serie = mes.id_turma_serie
AND ts.id_escola IN (52232943,70107728,52232997)
WHERE mes.ano_calendario = 2026
AND mes.id_turma_serie IS NOT NULL
AND COALESCE(mes.data_matricula_turma::date, mes.data_cadastro::date) <= '2026-02-27'
	AND ( mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
		OR ( mes.id_situacao_matricula_serie = 6
			AND EXISTS ( SELECT 1
		FROM ultima_data_movimentacao udm
		WHERE udm.id_matricula_estudante_serie = mes.id_matricula_discente_serie
			AND udm.ultima_data >= '2026-02-27') ) )
GROUP BY mes.id_turma_serie ) SELECT DISTINCT u.id_unidade AS id_dired, u.nome AS dired, tue.descricao AS tipo_unidade_escolar, e.nome AS escola, e.codigo_inep AS codigo_inep, tue.id_tipo_unidade_escolar, e.id_escola, m.id_municipio, m.nome AS municipio, ee.id_etapa_ensino, ee.denominacao AS etapa, se.descricao AS serie, se.id_serie , tu.descricao AS turno, s.siape, s.digito_siape, s.siape || '/' || COALESCE(s.digito_siape, '') AS identificador, s.id_ativo, COALESCE(p.nome, 'NÃO INFORMADO') AS docente, ts.id_turma_serie, ts.nome AS turma_serie, mo.id_modulo, mo.denominacao AS modulo, me.denominacao AS modalidade, ne.denominacao AS nivel, t.id_turma, t.codigo AS turma, cc.nome AS componente, dt.ch_dedicada_periodo, t.grupo, ts.capacidade_aluno, COALESCE(ept.total_estudantes, 0) AS estudantes, COALESCE(cb_turma_serie.codigo, 'NÃO INFORMADO') AS codigo_curriculo
FROM ensino.turma t
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
AND ts.data_cadastro::date <= '2026-02-27'
JOIN basico.serie se ON
se.id_serie = ts.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = se.id_etapa_ensino
JOIN ensino.turno tu ON
tu.id_turno = ts.id_turno
JOIN escola.escola e ON
e.id_escola = ts.id_escola
LEFT JOIN escola.tipo_unidade_escolar tue ON
e.id_tipo_unidade_escolar = tue.id_tipo_unidade_escolar
JOIN basico.modalidade_ensino_basico me ON
me.id_modalidade_ensino_basico = ee.id_modalidade
JOIN basico.nivel_etapa_ensino ne ON
ne.id_nivel_etapa_ensino = ee.id_nivel_etapa
LEFT JOIN comum.municipio m ON
m.id_municipio = e.id_municipio
LEFT JOIN basico.curriculo_basico cb_turma_serie ON
cb_turma_serie.id_curriculo_basico = ts.id_curriculo_medio
JOIN comum.unidade u ON
u.id_unidade = e.id_regional_ensino
LEFT JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = t.id_disciplina
LEFT JOIN basico.curriculo_basico cb_turno ON
cb_turno.id_serie = se.id_serie
AND cb_turno.ativo IS TRUE
AND cb_turno.id_turno = ts.id_turno
LEFT JOIN basico.curriculo_basico cb_geral ON
cb_geral.id_serie = se.id_serie
AND cb_geral.ativo IS TRUE
AND cb_geral.id_turno IS NULL
LEFT JOIN basico.curriculo_basico_componente cbc ON
cbc.id_componente_curricular = t.id_disciplina
AND COALESCE(cb_turno.id_curriculo_basico, cb_geral.id_curriculo_basico) = cbc.id_curriculo_basico
AND CASE WHEN t.id_modulo IS NULL THEN cbc.id_modulo IS NULL
ELSE cbc.id_modulo = t.id_modulo END
LEFT JOIN basico.modulo mo ON
mo.id_modulo = cbc.id_modulo
LEFT JOIN ensino.docente_turma dt ON
dt.id_turma = t.id_turma
AND dt.ativo = TRUE
AND dt.data_fim >= '27/02/2026'
LEFT JOIN rh.servidor s ON
s.id_servidor = dt.id_docente
LEFT JOIN comum.pessoa p ON
p.id_pessoa = s.id_pessoa
LEFT JOIN estudantes_por_turma ept ON
ept.id_turma_serie = ts.id_turma_serie
WHERE t.id_situacao_turma IN(2, 3, 1, 7, 8, 10,-1)
AND t.tipo <> 4
AND ts.ativo = TRUE
AND ts.progressao_parcial = FALSE
AND ts.ano = 2026
AND ts.id_tipo_turma_serie IN ( 1, 3, 5, 4 )
AND e.id_escola IN (52232943,70107728,52232997)
AND COALESCE(COALESCE(cb_turno.tipo_diario, cb_geral.tipo_diario) NOT IN ( 1, 2, 4, 9, 11, 21, 22, 26, 20, 24, 25, 29, 31, 34, 35, 38, 39, 42, 44, 45, 50, 53, 54, 57, 58, 61, 62, 63, 65 ) OR cc.id_tipo_componente <> 2 OR cbc.permite_alocacao_adjunto, FALSE)
ORDER BY  t.grupo


