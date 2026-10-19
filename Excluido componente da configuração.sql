BEGIN;

ROLLBACK;
--Mudando a carga Horaria
UPDATE basico.curriculo_basico 	SET carga_horaria=1400	WHERE id_curriculo_basico in (52164777,52165043,52165064);
UPDATE basico.curriculo_basico_componente	SET ch_semana=2,ch_ano=80	WHERE id_curriculo_basico_componente=52164847;


-- 1. Criação da tabela TEMP tc_apagar
SELECT  t.id_turma , t.id_situacao_turma
INTO TEMP tc_apagar
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246)
AND ts.ativo
AND t.id_disciplina IN (279, 272)
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
WHERE ts.id_curriculo_medio IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246)
AND ts.ativo 
AND mc.id_componente_curricular IN (279, 272)
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
WHERE cbc.id_curriculo_basico IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246)
AND cbc.id_componente_curricular IN (279, 272);

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

--7. Criação da tabela TEMP crc_apagar
SELECT crc.id_configuracao_relatorio_componente
INTO TEMP crc_apagar
FROM ensino_infantil.configuracao_relatorio cr
JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
WHERE cr.id_curriculo_basico IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246)
AND crc.id_componente_curricular IN (279, 272);

-- Backup Configuração Relatório Componente
SELECT 'UPDATE ensino_infantil.configuracao_relatorio_componente 	SET ativo=FALSE 	WHERE id_configuracao_relatorio_componente IN ( ' || id_configuracao_relatorio_componente || ' );'
FROM crc_apagar;

-- 8. SOLUÇÃO Execução do UPDATE Configuração Relatório Componente
UPDATE ensino_infantil.configuracao_relatorio_componente 	SET ativo=FALSE FROM(
SELECT DISTINCT crc.id_configuracao_relatorio_componente FROM crc_apagar crc ) AS fo
WHERE ensino_infantil.configuracao_relatorio_componente.id_configuracao_relatorio_componente = fo.id_configuracao_relatorio_componente;

--ROLLBACK;

COMMIT;






--backup

UPDATE basico.curriculo_basico 	SET carga_horaria=1480	WHERE id_curriculo_basico in (52164777,52165043,52165064);
UPDATE basico.curriculo_basico_componente	SET ch_semana=2,ch_ano=80	WHERE id_curriculo_basico_componente=52164847;


SELECT * FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246) AND cb.carga_horaria <> 1400;

-- Auto-generated SQL script #202512120832
UPDATE basico.curriculo_basico SET carga_horaria=1400	WHERE id_curriculo_basico=52165189;


SELECT 
    'UPDATE basico.curriculo_basico SET carga_horaria= 1400	WHERE id_curriculo_basico IN (' || STRING_AGG(cb.id_curriculo_basico::text, ', ') || ');' AS script,
    'UPDATE basico.curriculo_basico SET carga_horaria= ' || cb.carga_horaria || ' WHERE id_curriculo_basico IN (' || STRING_AGG(cb.id_curriculo_basico::text, ', ') || ');' AS backup
FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246) AND cb.carga_horaria <> 1400
GROUP BY  cb.id_curriculo_basico;


UPDATE basico.curriculo_basico SET carga_horaria= 1400	WHERE id_curriculo_basico IN (52165227);
UPDATE basico.curriculo_basico SET carga_horaria= 1400	WHERE id_curriculo_basico IN (52165151);
UPDATE basico.curriculo_basico SET carga_horaria= 1400	WHERE id_curriculo_basico IN (52165133);
UPDATE basico.curriculo_basico SET carga_horaria= 1400	WHERE id_curriculo_basico IN (52165189);
UPDATE basico.curriculo_basico SET carga_horaria= 1400	WHERE id_curriculo_basico IN (52165246);
UPDATE basico.curriculo_basico SET carga_horaria= 1400	WHERE id_curriculo_basico IN (52165208);
