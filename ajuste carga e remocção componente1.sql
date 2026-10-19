
begin;

UPDATE basico.curriculo_basico	SET carga_horaria=1560	WHERE id_curriculo_basico=52009607;

--## 01 Ajuste carga horaria no componente
select 
'UPDATE basico.curriculo_basico_componente SET ch_semana=2, ch_ano=80	WHERE id_curriculo_basico_componente = ' || id_curriculo_basico_componente || ';' as solucao,
'UPDATE basico.curriculo_basico_componente SET ch_semana= ' || cbc.ch_semana || ' , ch_ano=' || cbc.ch_ano || ' WHERE id_curriculo_basico_componente = ' || id_curriculo_basico_componente || ';' as backup
from basico.curriculo_basico_componente cbc
where cbc.id_curriculo_basico = 52009607
and cbc.id_componente_curricular in (513, 514 , 512);


--## 02 Criação da tabela TEMP da turma
SELECT  t.id_turma , t.id_situacao_turma
INTO TEMP tc_apagar
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio IN (52009607)
AND ts.ativo
AND t.id_disciplina IN (515)
AND t.id_situacao_turma <> 4;

--## 03 Backup Turma
SELECT 'UPDATE ensino.turma SET id_situacao_turma = ' || t.id_situacao_turma ||  ' WHERE id_turma = ' || t.id_turma || '; '
FROM tc_apagar t;

--## 04 SOLUÇÃO Execução do UPDATE Turma
UPDATE ensino.turma SET id_situacao_turma = 4 FROM ( SELECT DISTINCT id_turma FROM tc_apagar ) AS fo WHERE ensino.turma.id_turma = fo.id_turma;

--## 05 Criação da tabela TEMP matricula componente
SELECT mc.id_matricula_componente , mc.id_situacao_matricula 
INTO TEMP mc_apagar
FROM basico.turma_serie ts 
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON  mes.id_matricula_discente_serie = mc.id_matricula_estudante_serie 
WHERE ts.id_curriculo_medio IN (52009607)
AND ts.ativo 
AND mc.id_componente_curricular IN (515)
AND mc.id_situacao_matricula <> 7;

--## 06 Backup Matrícula Componente
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || mc.id_situacao_matricula || ' WHERE id_matricula_componente = ' || mc.id_matricula_componente || ';'
FROM mc_apagar mc;

--## 07 SOLUÇÃO Execução do UPDATE Matrícula Componente
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 FROM(
SELECT DISTINCT mc.id_matricula_componente FROM mc_apagar mc) AS fo
WHERE ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;

--## 08 Criação da tabela TEMP cbc_apagar
SELECT *
INTO TEMP cbc_apagar
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico IN (52009607)
AND cbc.id_componente_curricular IN (515);

--## 09 Backup  Curriculo Básico Componente
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

--## 10 SOLUÇÃO Execução do DELETE Curriculo Básico Componente
DELETE FROM basico.curriculo_basico_componente WHERE id_curriculo_basico_componente IN (SELECT DISTINCT id_curriculo_basico_componente FROM cbc_apagar);


COMMIT;
