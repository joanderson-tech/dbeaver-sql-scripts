SELECT 
    cbc_novo.id_curriculo_basico,
    cbc_novo.id_componente_curricular
FROM basico.curriculo_basico_componente cbc_novo
WHERE cbc_novo.id_curriculo_basico IN (51880834)
AND NOT EXISTS (
    -- Verifica se esse componente já existia nos currículos antigos
    SELECT 1 
    FROM basico.curriculo_basico_componente cbc_antigo
    WHERE cbc_antigo.id_curriculo_basico IN ( 51895209)
    AND cbc_antigo.id_componente_curricular = cbc_novo.id_componente_curricular
);
 
SELECT * FROM basico.curriculo_basico_componente WHERE id_curriculo_basico  = 51895174;

SELECT *
FROM ensino.turma t
WHERE t.id_turma_serie = 51887638;

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo IN ('EFAF6INTE', 'EFAF7INTE', 'EFAF8INTE' , 'EFAF9INTE');

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo IN ('EFAF6INT', 'EFAF7INT', 'EFAF8INT' , 'EFAF9INT');

--antigo
SELECT *
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio IN (51880851, 51880867, 51880817, 51880834)
ORDER BY id_curriculo_medio ASC;

--novo 
SELECT *
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio IN (51895174, 51895190, 51895209, 51895225)
ORDER BY id_curriculo_medio ASC;

ROLLBACK;

BEGIN;

--tabelas temporárias 01
SELECT 
    id_turma_serie,  -- Chave primária para identificar a linha
    id_curriculo_medio AS id_antigo, -- O valor atual que está no banco
    tipo_diario, 
    CASE 
        WHEN id_curriculo_medio = 51880851 THEN 51895174
        WHEN id_curriculo_medio = 51880867 THEN 51895190
        WHEN id_curriculo_medio = 51880817 THEN 51895209
        WHEN id_curriculo_medio = 51880834 THEN 51895225
    END AS id_novo_simulado  -- Como o valor ficará após o UPDATE
    INTO TEMP curriculo_novo
FROM basico.turma_serie
WHERE id_curriculo_medio IN (51880851, 51880867, 51880817, 51880834)
ORDER BY id_curriculo_medio ASC;

--tabelas temporárias 02
SELECT 
    t.id_turma, 
    t.id_situacao_turma 
INTO TEMP mudarStatusTurma
FROM ensino.turma t
WHERE t.id_turma_serie IN (SELECT id_turma_serie FROM curriculo_novo)
AND t.id_disciplina IN (518, 520);

--tabelas temporárias 03
SELECT 
	mc.id_matricula_componente,
	mc.id_situacao_matricula
INTO TEMP mudarStatusComponente
FROM ensino.matricula_componente mc 
INNER JOIN mudarStatusTurma nt ON nt.id_turma = mc.id_turma
WHERE mc.id_situacao_matricula <> 7;

-- 01 BACKUP 
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || id_situacao_matricula || 
       ' WHERE id_matricula_componente = ' || id_matricula_componente || ';' AS backup
FROM mudarStatusComponente;

-- 01 SOLUÇÃO DIRETA (Executa a alteração)
UPDATE ensino.matricula_componente mc
SET id_situacao_matricula = 7
FROM mudarStatusComponente msc
WHERE mc.id_matricula_componente = msc.id_matricula_componente;

-- 02 BACKUP 
SELECT 'UPDATE ensino.turma SET id_situacao_turma = ' || id_situacao_turma || 
       ' WHERE id_turma = ' || id_turma || ';' AS backup
FROM mudarStatusTurma;

-- 02 SOLUÇÃO DIRETA (Executa a alteração)
UPDATE ensino.turma t
SET id_situacao_turma = 4 
FROM mudarStatusTurma mst
WHERE t.id_turma = mst.id_turma;

-- 03 BACKUP 
SELECT 'UPDATE basico.turma_serie SET id_curriculo_medio = ' || id_antigo || 
       ', tipo_diario = ' || tipo_diario || 
       ' WHERE id_turma_serie = ' || id_turma_serie || ';' AS backup
FROM curriculo_novo;

-- 03 SOLUÇÃO DIRETA (Executa a alteração)
UPDATE basico.turma_serie ts
SET id_curriculo_medio = cn.id_novo_simulado,
    tipo_diario = 10
FROM curriculo_novo cn
WHERE ts.id_turma_serie = cn.id_turma_serie;


COMMIT;





/*SELECT 'UPDATE ensino.matricula_componente 	SET id_situacao_matricula = 7 WHERE id_matricula_componente ='|| id_matricula_componente || ';' AS solucao,
			 'UPDATE ensino.matricula_componente 	SET id_situacao_matricula = ' || id_situacao_matricula || ' WHERE id_matricula_componente ='|| id_matricula_componente || ';' AS backup
FROM mudarStatusComponente;

SELECT 'UPDATE ensino.turma	SET id_situacao_turma= ' || id_situacao_turma || ' WHERE id_turma ='|| id_turma || ';' AS solucao,
			 'UPDATE ensino.turma SET id_situacao_turma= ' || id_situacao_turma || ' WHERE id_turma ='|| id_turma || ';' AS backup
FROM mudarStatusTurma;

SELECT 'UPDATE basico.turma_serie SET id_curriculo_medio = ' || id_novo_simulado || ', tipo_diario = 10 WHERE id_turma_serie = ' || id_turma_serie || ';' AS solucao, 
  	   'UPDATE basico.turma_serie SET id_curriculo_medio = ' || id_antigo || ', tipo_diario = '|| tipo_diario || ' WHERE id_turma_serie = ' || id_turma_serie || ';'  AS BACKUP
FROM curriculo_novo;*/

ROLLBACK;

UPDATE basico.turma_serie SET id_curriculo_medio = 51895209, tipo_diario = 10 WHERE id_turma_serie = 51887732;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895209, tipo_diario = 10 WHERE id_turma_serie = 51895036;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895209, tipo_diario = 10 WHERE id_turma_serie = 51895023;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895209, tipo_diario = 10 WHERE id_turma_serie = 51887733;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895225, tipo_diario = 10 WHERE id_turma_serie = 51895170;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895225, tipo_diario = 10 WHERE id_turma_serie = 51887734;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895225, tipo_diario = 10 WHERE id_turma_serie = 51887735;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895225, tipo_diario = 10 WHERE id_turma_serie = 51895150;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895174, tipo_diario = 10 WHERE id_turma_serie = 51887638;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895174, tipo_diario = 10 WHERE id_turma_serie = 51894949;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895174, tipo_diario = 10 WHERE id_turma_serie = 51894924;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895174, tipo_diario = 10 WHERE id_turma_serie = 51894937;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895174, tipo_diario = 10 WHERE id_turma_serie = 51894960;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895174, tipo_diario = 10 WHERE id_turma_serie = 51887688;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895190, tipo_diario = 10 WHERE id_turma_serie = 51894983;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895190, tipo_diario = 10 WHERE id_turma_serie = 51895002;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895190, tipo_diario = 10 WHERE id_turma_serie = 51887731;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895190, tipo_diario = 10 WHERE id_turma_serie = 51887730;
UPDATE basico.turma_serie SET id_curriculo_medio = 51895190, tipo_diario = 10 WHERE id_turma_serie = 51894973;
--====
UPDATE basico.turma_serie SET id_curriculo_medio = 51880817, tipo_diario = 0 WHERE id_turma_serie = 51887732;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880817, tipo_diario = 0 WHERE id_turma_serie = 51895036;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880817, tipo_diario = 0 WHERE id_turma_serie = 51895023;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880817, tipo_diario = 0 WHERE id_turma_serie = 51887733;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880834, tipo_diario = 0 WHERE id_turma_serie = 51895170;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880834, tipo_diario = 0 WHERE id_turma_serie = 51887734;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880834, tipo_diario = 0 WHERE id_turma_serie = 51887735;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880834, tipo_diario = 0 WHERE id_turma_serie = 51895150;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880851, tipo_diario = 10 WHERE id_turma_serie = 51887638;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880851, tipo_diario = 10 WHERE id_turma_serie = 51894949;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880851, tipo_diario = 10 WHERE id_turma_serie = 51894924;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880851, tipo_diario = 10 WHERE id_turma_serie = 51894937;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880851, tipo_diario = 10 WHERE id_turma_serie = 51894960;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880851, tipo_diario = 10 WHERE id_turma_serie = 51887688;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880867, tipo_diario = 10 WHERE id_turma_serie = 51894983;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880867, tipo_diario = 10 WHERE id_turma_serie = 51895002;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880867, tipo_diario = 10 WHERE id_turma_serie = 51887731;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880867, tipo_diario = 10 WHERE id_turma_serie = 51887730;
UPDATE basico.turma_serie SET id_curriculo_medio = 51880867, tipo_diario = 10 WHERE id_turma_serie = 51894973;