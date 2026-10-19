BEGIN;

ROLLBACK;
--Mudando a carga Horaria
UPDATE basico.curriculo_basico_componente	SET ch_semana=2,ch_ano=80	WHERE id_curriculo_basico_componente IN (51901596,51901607,51901617,51901627,51901637,35499478,35500368,35497192,35498942,35501109);

-- 1. Criação da tabela TEMP tc_apagar
SELECT  t.id_turma , t.id_situacao_turma
INTO TEMP tc_apagar
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio IN ( 35497185,35498937,35499472,35500365,35501103,51901594,51901605,51901615,51901625,51901635)
AND ts.ativo
AND t.id_disciplina IN (230)
AND t.id_situacao_turma <> 4;

-- Backup Turma
SELECT 'UPDATE ensino.turma SET id_situacao_turma = ' || t.id_situacao_turma ||  ' WHERE id_turma = ' || t.id_turma || '; '
FROM tc_apagar t;

-- 2. SOLUÇÃO Execução do UPDATE Turma
UPDATE ensino.turma SET id_situacao_turma = 4 FROM ( SELECT DISTINCT id_turma FROM tc_apagar ) AS fo WHERE ensino.turma.id_turma = fo.id_turma;

--3. Criação da tabela TEMP mc_apagar
SELECT mc.id_matricula_componente , mc.id_situacao_matricula 
INTO TEMP mc_apagar
FROM basico.turma_serie ts 
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON  mes.id_matricula_discente_serie = mc.id_matricula_estudante_serie 
WHERE ts.id_curriculo_medio IN (35497185,35498937,35499472,35500365,35501103,51901594,51901605,51901615,51901625,51901635)
AND ts.ativo 
AND mc.id_componente_curricular IN (230)
AND mc.id_situacao_matricula <> 7;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || mc.id_situacao_matricula || ' WHERE id_matricula_componente = ' || mc.id_matricula_componente || ';'
FROM mc_apagar mc;

-- 4. SOLUÇÃO Execução do UPDATE Matrícula Componente
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 FROM(
SELECT DISTINCT mc.id_matricula_componente FROM mc_apagar mc) AS fo
WHERE ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;

-- 5. Criação da tabela TEMP cbc_apagar
SELECT *
INTO TEMP cbc_apagar
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico IN ( 35497185,35498937,35499472,35500365,35501103,51901594,51901605,51901615,51901625,51901635)
AND cbc.id_componente_curricular IN (230);

-- Backup  Curriculo Básico Componente
SELECT 'INSERT INTO basico.curriculo_basico_componente ' ||
    '(id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)' ||
    ' VALUES (' ||
        id_curriculo_basico_componente || ', ' ||
        id_curriculo_basico || ', ' ||
        id_componente_curricular || ', ' ||
        COALESCE(ch_ano::text, 'NULL') || ', ' ||
        COALESCE(programa::text, 'NULL') || ', ' ||
        COALESCE(id_registro_entrada::text, 'NULL') || ', ' ||
        quote_literal(data_cadastro) || ', ' ||
        COALESCE(obrigatoria::text, 'NULL') || ', ' ||
        COALESCE(codigo_rh::text, 'NULL') || ', ' ||
        COALESCE(ch_semana::text, 'NULL') || ', ' ||
        COALESCE(id_modulo::text, 'NULL') || ', ' ||
        COALESCE(ordem::text, 'NULL') || ', ' ||
        COALESCE(permite_alocacao_adjunto::text, 'NULL') || ', ' ||
        COALESCE(permite_contraturno::text, 'NULL') || ', ' ||
        COALESCE(componente_eletivo::text, 'NULL') || ', ' ||
        COALESCE(id_categoria_componente::text, 'NULL') || ', ' ||
        COALESCE(optativa::text, 'NULL') || ', ' ||
        COALESCE(permite_multiplos_professores::text, 'NULL') ||
    ');' AS Backup
FROM cbc_apagar;

-- 6. SOLUÇÃO Execução do DELETE Curriculo Básico Componente
DELETE FROM basico.curriculo_basico_componente WHERE id_curriculo_basico_componente IN (SELECT DISTINCT id_curriculo_basico_componente FROM cbc_apagar);

--ROLLBACK;

COMMIT;


--backup
UPDATE basico.curriculo_basico_componente	SET ch_semana=1,ch_ano=4	WHERE id_curriculo_basico_componente IN (51901596,51901607,51901617,51901627,51901637,35499478,35500368,35497192,35498942,35501109);




SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo IN ('AI1')


 SELECT * --string_agg(id_curriculo_basico_componente :: varchar , ',')
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico_componente IN (51901596,51901607,51901617,51901627,51901637,35499478,35500368,35497192,35498942,35501109)
AND cbc.id_componente_curricular = 229
