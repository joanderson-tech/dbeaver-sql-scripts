EFAII01 , EFAII02 , EFAII03 , EFAII04 , EFAII05 , EFAFI06 , EFAFI07 , EFAFI08 , EFAFI09
 SELECT * FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente IN (47,51); 



SELECT  DISTINCT 	ts.id_escola, ts.*
--INTO TEMP tc_apagar
FROM basico.turma_serie ts
JOIN basico.serie s  ON s.id_serie  = ts.id_serie 
WHERE ts.id_curriculo_medio IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246)
AND s.id_serie IN (1005218, 1005219, 1005220)

 
 SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo IN ('EFAII01' , 'EFAII02' , 'EFAII03' , 'EFAII04' , 'EFAII05' , 'EFAFI06' , 'EFAFI07' , 'EFAFI08' , 'EFAFI09')
cb.ativo;

52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246
 
SELECT *
--DISTINCT id_curriculo_basico
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico IN (52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246)
AND cbc.id_componente_curricular IN (381);

SELECT cc.* FROM ensino.componente_curricular cc WHERE cc.nome ILIKE '%Meio Ambiente e Qualidade de Vida%'

AND cbc.id_componente_curricular IN (381);

SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_curriculo_basico IN ( 52164777);--, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246);

SELECT crc.id_configuracao_relatorio_componente
--INTO TEMP crc_apagar
FROM ensino_infantil.configuracao_relatorio cr
JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
WHERE cr.id_curriculo_basico IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246)
AND crc.id_componente_curricular IN (279, 272);

SELECT * FROM ensino_infantil.relatorio_avaliativo_componente rac WHERE id_configuracao_relatorio_componente IN (47,51); 

--#1
SELECT  t.id_turma , t.id_situacao_turma
--INTO TEMP tc_apagar
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246)
AND ts.ativo
AND t.id_disciplina IN (279, 272)
AND t.id_situacao_turma <> 4;

-- Backup
SELECT 'UPDATE ensino.turma SET id_situacao_turma = ' || t.id_situacao_turma ||  ' WHERE id_turma = ' || t.id_turma || '; ';
FROM tc_apagar t

-- ATUALIZAR SITUAÇÃO DAS TURMA_COMPONENTE PARA EXCLUÍDA 4
UPDATE ensino.turma SET id_situacao_turma = 4 FROM ( SELECT DISTINCT id_turma FROM tc_apagar ) AS fo WHERE ensino.turma.id_turma = fo.id_turma;

--#2
SELECT mc.id_matricula_componente , mc.id_situacao_matricula 
--INTO TEMP mc_apagar
FROM basico.turma_serie ts 
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON  mes.id_matricula_discente_serie = mc.id_matricula_estudante_serie 
WHERE ts.id_curriculo_medio IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246)
AND ts.ativo 
AND mc.id_componente_curricular IN (279, 272)
AND mc.id_situacao_matricula <> 7;

-- Backup Matriculas Componente
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || mc.id_situacao_matricula || ' WHERE id_matricula_componente = ' || mc.id_matricula_componente || ';';
FROM mc_apagar mc

-- ATUALIZAR SITUAÇÃO DAS MATRICULAS COMPONENTES PARA EXCLUÍDA 
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 FROM(
SELECT DISTINCT mc.id_matricula_componente FROM mc_apagar mc) AS fo
WHERE ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;

--#3
SELECT *
--INTO TEMP cbc_apagar
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico IN ( 52164777, 52165043, 52165064, 52165189, 52165133, 52165151, 52165208, 52165227, 52165246)
AND cbc.id_componente_curricular IN (279, 272);

-- Backup  curriculo_basico_componente
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

--Solução curriculo_basico_componente
SELECT string_agg( 'DELETE FROM basico.curriculo_basico_componente WHERE id_curriculo_basico_componente = ' || id_curriculo_basico_componente || ';', E'\n')
FROM cbc_apagar;


BEGIN;

DELETE FROM basico.curriculo_basico_componente WHERE id_curriculo_basico_componente=52164848;
DELETE FROM basico.curriculo_basico_componente WHERE id_curriculo_basico_componente=52164846;

UPDATE ensino_infantil.configuracao_relatorio_componente 	SET ativo=FALSE 	WHERE id_configuracao_relatorio_componente IN (47,51);

COMMIT;

INSERT INTO basico.curriculo_basico_componente
(id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)
VALUES(52164848, 52164777, 279, 80, NULL, 90031124, '2025-02-04', true, NULL, 2, NULL, 18, true, NULL, false, 2, false, false);
INSERT INTO basico.curriculo_basico_componente
(id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)
VALUES(52164846, 52164777, 272, 40, NULL, 90031124, '2025-02-04', true, NULL, 1, NULL, 16, true, NULL, false, 2, false, false);


UPDATE ensino_infantil.configuracao_relatorio_componente 	SET ativo=true 	WHERE id_configuracao_relatorio_componente IN (47,51);
