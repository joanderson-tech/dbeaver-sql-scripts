ROLLBACK ;
DROP TABLE tc_apagar;
SELECT * FROM basico.turma_serie ts 
WHERE ts.id_curriculo_medio IN (52472041, 52472047, 51899742, 51899750)
AND ts.ativo 
AND ts.ano = 2026
AND ts.id_escola = 51877802;
SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico IN (52472041, 52472047, 51899742, 51899750);

SELECT cr.id_configuracao_relatorio, cr.codigo  
FROM ensino_infantil.configuracao_relatorio cr 
WHERE cr.id_configuracao_relatorio IN (5,6,1,4);


BEGIN;
-- 1. Criação da tabela TEMP tc_apagar
SELECT  t.id_turma , t.id_situacao_turma
INTO TEMP tc_apagar
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio IN ( 52472041, 52472047, 51899742, 51899750)
AND ts.ativo
AND t.id_disciplina IN (293)
AND t.id_situacao_turma <> 4;

-- Backup Turma
SELECT COUNT(t.id_turma) AS quantidade_registros, 
'UPDATE ensino.turma SET id_situacao_turma = ' || t.id_situacao_turma || 
' WHERE id_turma IN ( ' || string_agg(t.id_turma::TEXT, ', ') || ');' AS backup
FROM tc_apagar t
GROUP BY t.id_situacao_turma;

SELECT * FROM  ensino.turma  WHERE id_turma IN ( 683992, 683999, 684242, 684534);

-- 2. SOLUÇÃO Execução do UPDATE Turma
UPDATE ensino.turma SET id_situacao_turma = 4 
FROM ( SELECT DISTINCT id_turma FROM tc_apagar ) AS fo 
WHERE ensino.turma.id_turma = fo.id_turma;

--3. Criação da tabela TEMP mc_apagar 
--OBS TALVEZ NÃO TEM MATRICULA COPONENTE.
SELECT mc.id_matricula_componente , mc.id_situacao_matricula 
INTO TEMP mc_apagar
FROM basico.turma_serie ts 
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON  mes.id_matricula_discente_serie = mc.id_matricula_estudante_serie 
WHERE ts.id_curriculo_medio IN ( 52472041, 52472047, 51899742, 51899750)
AND ts.ativo 
AND mc.id_componente_curricular IN (273)
AND mc.id_situacao_matricula <> 7;

-- Backup Matrícula Componente
SELECT  COUNT(mc.id_matricula_componente) AS quantidade_registros, 
'UPDATE ensino.matricula_componente SET id_situacao_matricula =' || mc.id_situacao_matricula || 
' WHERE IN ( ' || string_agg(mc.id_matricula_componente::TEXT, ', ') || ');' AS backup
FROM mc_apagar mc
GROUP BY mc.id_situacao_matricula ;

-- 4. SOLUÇÃO Execução do UPDATE Matrícula Componente
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 FROM(
SELECT DISTINCT mc.id_matricula_componente FROM mc_apagar mc) AS fo
WHERE ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;

-- 5. Criação da tabela TEMP cbc_apagar
SELECT *
INTO TEMP cbc_apagar
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico IN ( 52472041, 52472047, 51899742, 51899750)
AND cbc.id_componente_curricular IN (293);

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
DELETE FROM basico.curriculo_basico_componente 
WHERE id_curriculo_basico_componente IN (SELECT DISTINCT id_curriculo_basico_componente FROM cbc_apagar);

--7. Criação da tabela TEMP crc_apagar
SELECT crc.id_configuracao_relatorio_componente
INTO TEMP crc_apagar
FROM ensino_infantil.configuracao_relatorio cr
JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
WHERE cr.id_curriculo_basico IN ( 52472041, 52472047, 51899742, 51899750)
AND crc.id_componente_curricular IN (293);

-- Backup Configuração Relatório Componente
SELECT  COUNT(id_configuracao_relatorio_componente) AS quantidade_registros, 
'UPDATE ensino_infantil.configuracao_relatorio_componente SET ativo=true 
WHERE id_configuracao_relatorio_componente IN ( ' || string_agg(id_configuracao_relatorio_componente::TEXT, ', ') || ');' AS backup
FROM crc_apagar;

-- 8. SOLUÇÃO Execução do UPDATE Configuração Relatório Componente
UPDATE ensino_infantil.configuracao_relatorio_componente    SET ativo=FALSE FROM(
SELECT DISTINCT crc.id_configuracao_relatorio_componente FROM crc_apagar crc ) AS fo
WHERE ensino_infantil.configuracao_relatorio_componente.id_configuracao_relatorio_componente = fo.id_configuracao_relatorio_componente;

--ROLLBACK;

COMMIT;





