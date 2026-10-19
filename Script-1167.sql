
BEGIN WORK;

rollback;

-- rollback
--Updated Rows	47
SELECT 
 nextval('ensino_infantil.configuracao_relatorio_seq') id_configuracao_relatorio ,
cb.id_curriculo_basico ,
4 id_periodicidade_relatorio ,
5 id_grupo_avaliacao_relatorio ,
TRUE possui_parecer_descritivo, 
 cb.ativo ,
 cb.data_cadastro,
 cb.codigo 
 INTO TEMP nova_configuracao_relatorio
FROM basico.curriculo_basico cb 
WHERE cb.id_curriculo_basico IN (54687091,54687102,54687114,54687127,54687140,54687153,54687166,54687192,54687205,54687218,54687231,54687244,54687257,54687270,54687283,54687296,54687309,54687322,54687335,54687374,54687387,54687400,54687413,54687426,54687439,54687452,54687465,54687479,54687591,54687612,54687628,54687641,54687654,54687667,54687680,54687695,54687713,54687726,54687739,54687752,54687765,54687778,54687791,54687804,54687829,54687855,54687868)
AND NOT EXISTS ( 
SELECT 1 FROM ensino_infantil.configuracao_relatorio cr 
WHERE cr.id_curriculo_basico = cb.id_curriculo_basico);

--Updated Rows	47
INSERT
	INTO
	ensino_infantil.configuracao_relatorio (
		id_configuracao_relatorio,
		id_curriculo_basico,
		id_periodicidade_relatorio,
		id_grupo_avaliacao_relatorio,
		possui_parecer_descritivo,
		ativo,
		data_cadastro,
		codigo
	)
SELECT
	*
FROM
	nova_configuracao_relatorio;

-- backup
 
	SELECT 'DELETE FROM ensino_infantil.configuracao_relatorio where id_configuracao_relatorio IN ('
	|| string_agg(id_configuracao_relatorio::TEXT,',') || ');' 
	FROM nova_configuracao_relatorio;

--Updated Rows	560
	INSERT INTO ensino_infantil.configuracao_relatorio_componente (
		id_configuracao_relatorio_componente,
		id_configuracao_relatorio,
		id_componente_curricular,
		id_tipo_avaliacao_componente_relatorio,
		maximo_caracteres_relatorio,
		ativo,
		data_cadastro,
		possui_parecer_final_descritivo
	)
SELECT
        nextval('ensino_infantil.configuracao_relatorio_componente_seq') id_configuracao_relatorio_componente,
		ncr.id_configuracao_relatorio,
		cbc.id_componente_curricular,
		1 id_tipo_avaliacao_componente_relatorio,
		5000 maximo_caracteres_relatorio,
		TRUE ativo,
		ncr.data_cadastro,
		TRUE possui_parecer_final_descritivo
FROM nova_configuracao_relatorio ncr
JOIN basico.curriculo_basico_componente cbc ON cbc.id_curriculo_basico = ncr.id_curriculo_basico
AND NOT EXISTS ( SELECT 1 FROM ensino_infantil.configuracao_relatorio_componente crc
WHERE crc.id_configuracao_relatorio = ncr.id_configuracao_relatorio
AND crc.id_componente_curricular = cbc.id_componente_curricular);

SELECT 'DELETE FROM ensino_infantil.configuracao_relatorio_componente where id_configuracao_relatorio IN ('
	|| string_agg(id_configuracao_relatorio::TEXT,',') || ');' 
	FROM nova_configuracao_relatorio;



 --Updated Rows	38
 WITH novos_curriculos AS(
   SELECT id_curriculo_basico,
   id_serie,
   id_turno,
   tipo_diario,
   id_escola 
   FROM 
  basico.curriculo_basico cb 
  WHERE  cb.ano_entrada_vigor = 2025
  AND cb.id_curriculo_basico IN (54687842,54687091,54687102,54687114,54687127,54687140,54687153,54687166,54687192,54687205,54687218,54687231,54687244,54687257,54687270,54687283,54687296,54687309,54687322,54687335,54687374,54687387,54687400,54687413,54687426,54687439,54687452,54687465,54687479,54687591,54687612,54687628,54687641,54687654,54687667,54687680,54687695,54687713,54687726,54687739,54687752,54687765,54687778,54687791,54687804,54687829,54687855,54687868)
  AND cb.ativo
  )
select DISTINCT ON(ts.id_turma_serie)
	ts.id_turma_serie,
	ts.id_serie,
	ts.id_curriculo_medio id_curriculo_antigo,
	ncb.tipo_diario,
	ts.id_turno,
	ts.tipo_diario tipo_diario_antigo,
	ts.id_escola,
	ncb.id_turno id_turno_novo,
	case 
	 when ts.id_serie = ncb.id_serie AND ts.id_escola = ncb.id_escola then ncb.id_curriculo_basico 
	 when ts.id_serie = ncb.id_serie then ncb.id_curriculo_basico 
	 ELSE  ts.id_curriculo_medio
	end as id_curriculo_correto
	INTO TEMP turmas_alteracao_matriz_curricular
	FROM basico.turma_serie ts 
 JOIN novos_curriculos ncb ON ncb.id_serie = ts.id_serie
  AND ts.id_curriculo_medio <> ncb.id_curriculo_basico
 WHERE  ts.id_escola IN (1040,1041,1042,1043,1052,1054,1254,2496,2916,3341)
 AND ts.ano = 2025
 AND ts.id_turma_serie_agrupadora IS NULL 
 AND ts.ativo;

--- nomenclatura 
--Updated Rows	36
WITH  turmas_para_atualizar_dados AS (
    SELECT DISTINCT
        ts.id_turma_serie,
        ts.id_serie,
        ts.id_escola,
        ts.nome AS nome_turma_original,
        CASE
            WHEN LENGTH(ts.nome) >= 3 THEN
                LEFT(ts.nome, LENGTH(ts.nome) - 3) || 'INT' || RIGHT(ts.nome, 2)
            ELSE
                ts.nome
        END AS nome_turma_potencial_base
    FROM
        basico.turma_serie ts
    JOIN turmas_alteracao_matriz_curricular turmas ON turmas.id_turma_serie = ts.id_turma_serie
WHERE ts.id_turno <> 1
    )
    SELECT
        tud.id_turma_serie,
        nome_turma_original,
        CASE
            -- Verifica se o nome potencial base já existe para outra turma na mesma escola e série
            WHEN EXISTS (
                SELECT 1
                FROM basico.turma_serie ts_existente
                WHERE ts_existente.nome = tud.nome_turma_potencial_base
                  AND ts_existente.id_escola = tud.id_escola
                  AND ts_existente.id_serie = tud.id_serie
                  AND ts_existente.id_turma_serie <> tud.id_turma_serie
            ) THEN
                -- Se colidir, tenta adicionar '2'
                -- *Atenção*: Se nome_turma_potencial_base || '2' também colidir, este script NÃO irá gerar 3, 4, etc.
                tud.nome_turma_potencial_base || '2'
            ELSE
                tud.nome_turma_potencial_base
        END AS nome_turma_final
        INTO TEMP  nomes_turma_finais
    FROM
        turmas_para_atualizar_dados tud;

select *  from turmas_para_atualizar_dados tud;

       -- backup nome turma serie
       SELECT 'UPDATE basico.turma_serie Set nome = ''' || ntf.nome_turma_original || ''' WHERE id_turma_serie = ' || ntf.id_turma_serie ||';'
      FROM nomes_turma_finais ntf;
       
--Updated Rows	36       
-- ajusta o nome da turma serie
UPDATE basico.turma_serie
SET
    nome = ntf.nome_turma_final
FROM
    nomes_turma_finais ntf
WHERE
    basico.turma_serie.id_turma_serie = ntf.id_turma_serie;
    
   -- beckup ensino turma
   SELECT 'UPDATE ensino.turma Set codigo = ''' || t.codigo || ''' WHERE id_turma_serie IN ( ' || string_agg(ntf.id_turma_serie::TEXT,',') ||');'
         FROM  nomes_turma_finais ntf 
         JOIN ensino.turma t ON ntf.id_turma_serie = t.id_turma_serie 
         WHERE t.id_situacao_turma <> 4
         GROUP BY t.codigo
 
         
 --Updated Rows	318        
  -- update codigo ensino turma
   UPDATE ensino.turma
SET
    codigo = ntf.nome_turma_final
FROM  nomes_turma_finais ntf 
JOIN ensino.turma t ON ntf.id_turma_serie = t.id_turma_serie 
WHERE
    ensino.turma.id_turma_serie = ntf.id_turma_serie
   AND t.id_situacao_turma <> 4;
  
----- ==== SCRIPTS DAS ALTERAÇÕES ====
-- #1 Backup de matricula_componente 
 --rollback;

-- #1 Backup de matricula_componente 

--Updated Rows	5329
SELECT 
	  mc.id_matricula_componente, mc.id_discente, mc.id_turma, mc.id_componente_curricular, id_situacao_matricula
INTO TEMP mc_apagar
from 
	turmas_alteracao_matriz_curricular turmas
	join ensino.turma t on t.id_turma_serie = turmas.id_turma_serie 
	join ensino.matricula_componente mc on mc.id_turma = t.id_turma
where id_situacao_matricula not in (7, 5)
AND t.id_disciplina <> 220
order by mc.id_discente;

-- #1 ATUALIZAR SITUAÇÃO DAS MATR CULAS COMPONENTES PARA EXCLUÍDA 
update ensino.matricula_componente set id_situacao_matricula = 7 from (
	select 
		mc.id_matricula_componente
	from 
	mc_apagar mc
) as fo
where ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;

--rollback;
 
--Updated Rows	306
-- #2.0- Backup das turma_componentes:
SELECT 
	 t.id_situacao_turma,
	 t.id_disciplina ,
	 t.id_turma ,
	 t.id_turma_serie ,
	 CASE 
	 	WHEN t.descricao_horario IS NOT NULL THEN t.descricao_horario
	 END descricao_horario 
	INTO TEMP tc_apagar
	FROM 
	turmas_alteracao_matriz_curricular turmas
	join ensino.turma t on t.id_turma_serie = turmas.id_turma_serie 
where t.id_situacao_turma <> 4
AND t.id_disciplina <> 220
order by t.id_turma_serie;

--Updated Rows	306
-- #2 ATUALIZAR SITUAÇÃO DAS TURMA_COMPONENTE PARA EXCLUÍDA 4
update ensino.turma set id_situacao_turma = 4 from (
	select distinct 
		id_turma 
	from 
		tc_apagar 
) as fo
where ensino.turma.id_turma = fo.id_turma;

--rollback;


-- #3.1 atulizar o curriculo turma serie
UPDATE basico.turma_serie SET tipo_diario = fo.tipo_diario, id_curriculo_medio = fo.id_curriculo_correto, id_turno = fo.id_turno_novo FROM(
	select * from turmas_alteracao_matriz_curricular
) fo
WHERE basico.turma_serie.id_turma_serie = fo.id_turma_serie ;



-- #4 ATUALIZAR MATRICULA ESTUDANTE SERIE 
-- atualizar as MES ´s

-- desabilitar trigge temporiariamente 
ALTER TABLE basico.matricula_estudante_serie DISABLE TRIGGER trigger_verifica_vagas_matricula_estudante_serie;

--Updated Rows	706
UPDATE basico.matricula_estudante_serie set id_curriculo_medio = fo.id_curriculo_correto, id_turno = fo.id_turno_novo FROM(
    select distinct 
        mes.id_matricula_discente_serie, turmas.id_curriculo_correto, turmas.id_turno_novo
    from 
        turmas_alteracao_matriz_curricular turmas 
        join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
            and mes.ano_calendario = 2025
) fo
WHERE basico.matricula_estudante_serie.id_matricula_discente_serie = fo.id_matricula_discente_serie ;

-- Reativar a trigge
ALTER TABLE basico.matricula_estudante_serie ENABLE  TRIGGER trigger_verifica_vagas_matricula_estudante_serie;

--rollback;


----- ============================================
----- CRIAÇÃO DE TURMA COMPONENTE
----- ============================================

--drop table tc_para_adicionar;
--Updated Rows	450
-- #5.1 select das turmas para adicionar turma -
SELECT DISTINCT 
	nextval('ensino.turma_seq') id_turma, 
	tsa.ano,
	tsa.periodo,
	1 id_situacao_turma, -- ABERTA
	tsa.capacidade_aluno,
	cbc.id_componente_curricular id_disciplina,
	tsa.nome codigo,
	1 observacao,
	1 tipo,
	tsa.data_cadastro,
	tsa.id_turma_serie,
	cbc.ordem,
	cbc.id_categoria_componente
into temp tc_para_adicionar
FROM
turmas_alteracao_matriz_curricular turmas 
join basico.turma_serie tsa on tsa.id_turma_serie = turmas.id_turma_serie -- tsa: Turma Serie Adicionar
join basico.curriculo_basico_componente cbc on cbc.id_curriculo_basico = tsa.id_curriculo_medio;

--Updated Rows	450
-- #5.2 insert das turmas 
INSERT INTO ensino.turma (
	id_turma,
	ano,
	periodo,
	id_situacao_turma,
	capacidade_aluno,
	id_disciplina,
	codigo,
	observacao,
	tipo,
	data_cadastro,
	id_turma_serie,
	ordem,
	id_categoria_componente 
)
SELECT
	id_turma,
	ano,
	periodo,
	id_situacao_turma,
	capacidade_aluno,
	id_disciplina,
	codigo,
	observacao,
	tipo,
	data_cadastro::timestamp,
	id_turma_serie,
	ordem,
	id_categoria_componente 
FROM tc_para_adicionar;

--Updated Rows	310
---
-- ## Atualização de `id_turma_agrupadora` para as Novas Turmas
---
-- #7.0 Atualizar id_turma_agrupadora
-- Encontra o id_turma da disciplina 220 existente para cada turma_serie afetada
WITH turma_agrupadora_existente AS (
    SELECT
        t.id_turma_serie,
        t.id_turma AS turma_agrupadora_id
    FROM
        ensino.turma t
    JOIN
        turmas_alteracao_matriz_curricular tamc ON t.id_turma_serie = tamc.id_turma_serie
    WHERE
        t.id_disciplina = 220
        AND t.agrupadora
        AND t.id_situacao_turma <> 4 
        AND t.ano = 2025 
)
UPDATE ensino.turma AS t_main
SET id_turma_agrupadora = tai.turma_agrupadora_id
FROM
    turma_agrupadora_existente tai
WHERE
    t_main.id_turma_serie = tai.id_turma_serie
    AND t_main.id_disciplina <> 220 
    AND t_main.id_categoria_componente <> 2
    AND t_main.id_turma IN (SELECT id_turma FROM tc_para_adicionar); 

--Updated Rows	8372
-- ## Criação de Novas Matrículas Componentes

   WITH criar_MC AS (
 SELECT nextval('ensino.matricula_componente_seq') AS id_matricula_componente,
           CASE 
               WHEN mes.id_situacao_matricula_serie = 1 THEN 2 
               WHEN mes.id_situacao_matricula_serie = 2 THEN 5
               WHEN mes.id_situacao_matricula_serie = 3 THEN 6
               WHEN mes.id_situacao_matricula_serie = 4 OR mes.id_situacao_matricula_serie = 9 THEN 4
               WHEN mes.id_situacao_matricula_serie = 5 THEN 3
               WHEN mes.id_situacao_matricula_serie = 6 THEN 9
               ELSE 2
           END AS id_situacao_matricula,
           ts.id_turma, 
           ts.id_disciplina AS id_componente_curricular,
           mes.id_estudante AS id_discente,
           ts.ano,
           ts.periodo,
           ts.id_turma_serie,
           mes.id_matricula_discente_serie id_matricula_estudante_serie
    FROM tc_para_adicionar ts
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
    WHERE 1 = 1
    AND ts.id_situacao_turma <> 4)
    SELECT DISTINCT *
    INTO TEMP novas_mc
    FROM criar_MC tm 
    WHERE NOT EXISTS (
    SELECT 1 
    FROM ensino.matricula_componente mc 
    WHERE mc.id_turma = tm.id_turma 
      AND mc.ano = tm.ano 
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);

--Updated Rows	8372
 INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo,id_matricula_estudante_serie)
SELECT tm.id_matricula_componente, tm.id_situacao_matricula, tm.id_turma, tm.id_componente_curricular, tm.id_discente, tm.ano, tm.periodo, id_matricula_estudante_serie
FROM novas_mc tm
WHERE NOT EXISTS (
    SELECT 1 
    FROM ensino.matricula_componente mc 
    WHERE mc.id_turma = tm.id_turma 
      AND mc.ano = tm.ano 
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);


-- ATUALIZAR FREQUENCIA ALUNO 


--Updated Rows	302
SELECT ta.id_turma AS id_turma_antiga,
       tn.id_turma AS id_turma_nova,
       ta.descricao_horario
INTO TEMP turmas_ajuste
FROM tc_apagar ta
JOIN tc_para_adicionar tn ON tn.id_turma_serie = ta.id_turma_serie
AND ta.id_disciplina = tn.id_disciplina;

-- Backup frequencia
SELECT 
'UPDATE ensino.frequencia_aluno SET id_turma = ' || fa.id_turma || ' WHERE id_frequencia = ' || fa.id_frequencia  || ';' backup
FROM ensino.frequencia_aluno fa
JOIN turmas_ajuste ta ON ta.id_turma_antiga= fa.id_turma ;

--Updated Rows	5971
UPDATE ensino.frequencia_aluno fa_main 
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste ta 
WHERE fa_main.id_turma = ta.id_turma_antiga;



-- ATUALIZAÇÃO
-- PROFESSOR 
SELECT 'UPDATE ensino.docente_turma SET id_turma = ' || dt.id_turma|| ' WHERE id_docente_turma = ' || dt.id_docente_turma || ';' backup
FROM ensino.docente_turma dt 
JOIN turmas_ajuste ta ON ta.id_turma_antiga = dt.id_turma ;

--Updated Rows	95
UPDATE ensino.docente_turma dt_main -- Alias para a tabela principal do UPDATE
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste ta -- Tabela para buscar o novo id_turma
WHERE dt_main.id_turma = ta.id_turma_antiga;

-- HORÁRIOS

-- BACKUP 
SELECT 'UPDATE ensino.horario_turma SET id_turma = ' || ht.id_turma || '  WHERE id_horario_turma = ' || ht.id_horario_turma || ';'
FROM ensino.horario_turma ht 
JOIN turmas_ajuste ta ON ta.id_turma_antiga =  ht.id_turma;

-- ATUALIZAR
--Updated Rows	182
UPDATE ensino.horario_turma dt_main -- Alias para a tabela principal do UPDATE
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste ta -- Tabela para buscar o novo id_turma
WHERE dt_main.id_turma = ta.id_turma_antiga;

--Updated Rows	302
UPDATE ensino.turma t_main -- Alias para a tabela principal do UPDATE
SET descricao_horario = ta.descricao_horario 
FROM turmas_ajuste ta -- Tabela para buscar o novo id_turma
WHERE t_main.id_turma = ta.id_turma_antiga;


-- CONTEUÚDO MINISTRADO
SELECT 
'UPDATE ava.topico_aula SET id_turma = ' || fa.id_turma || ' WHERE id_topico_aula = ' || fa.id_topico_aula  || ';' backup
FROM ava.topico_aula  fa
JOIN turmas_ajuste ta ON ta.id_turma_antiga = fa.id_turma;

-- ATUALIZAR
UPDATE ava.topico_aula dt_main -- Alias para a tabela principal do UPDATE
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste ta -- Tabela para buscar o novo id_turma
WHERE dt_main.id_turma = ta.id_turma_antiga;

-- AULA EXTRA
SELECT 
'UPDATE ava.aula_extra SET id_turma = ' || fa.id_turma || ' WHERE id = ' || fa.id  || ';' backup
FROM ava.aula_extra  fa
JOIN turmas_ajuste ta ON ta.id_turma_antiga= fa.id_turma ;

-- atualizar 
--Updated Rows	312
UPDATE ava.aula_extra dt_main -- Alias para a tabela principal do UPDATE
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste ta -- Tabela para buscar o novo id_turma
WHERE dt_main.id_turma = ta.id_turma_antiga;

-- Atualizar a faxa de horário do integral 

--Updated Rows	582
SELECT
    ht.id_horario_turma,
    ht.id_horario AS id_horario_antigo,
    ht.hora_inicio,
    ht.hora_fim,
    ht.dia ,
    h.inicio,
    h.fim,
    h.id_horario AS id_horario_novo
INTO TEMP novo_horario_int
FROM ensino.turma t
JOIN turmas_alteracao_matriz_curricular ts ON ts.id_turma_serie = t.id_turma_serie
JOIN basico.serie s ON s.id_serie = ts.id_serie
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma
JOIN ensino.horario ha ON ha.id_horario = ht.id_horario 
JOIN ensino.horario h ON h.inicio = ht.hora_inicio 
WHERE t.id_situacao_turma = 1
AND ht.ativo
AND h.tipo = 1
 AND ha.tipo <> 1;

SELECT 
'UPDATE ensino.horario_turma SET id_horario = ' || nhi.id_horario_antigo || ' WHERE id_horario_turma =' || nhi.id_horario_turma || ';' 
FROM novo_horario_int nhi;

--Updated Rows	582
 UPDATE ensino.horario_turma ht
SET id_horario = nhi.id_horario_novo
FROM novo_horario_int nhi
WHERE ht.id_horario_turma = nhi.id_horario_turma
  AND ht.id_horario <> nhi.id_horario_novo;

-- Atualizar MC


--Updated Rows	19248
SELECT DISTINCT 
    mc.id_matricula_componente AS id_matricula_antigo,
    mcn.id_matricula_componente AS id_matricula_novo,
    nu.id_nota_unidade
   INTO TEMP notas_atualizar
FROM turmas_ajuste ta
JOIN mc_apagar mc ON mc.id_turma = ta.id_turma_antiga
JOIN  ensino.matricula_componente mcn ON mcn.id_turma = ta.id_turma_nova
    AND mc.id_componente_curricular = mcn.id_componente_curricular 
    AND mc.id_discente = mcn.id_discente 
 JOIN  ensino.nota_unidade nu ON nu.id_matricula_componente = mc.id_matricula_componente;


-- bacup 
SELECT 'UPDATE ensino.nota_unidade SET id_matricula_componente = ' || id_matricula_antigo || ' WHERE id_nota_unidade = '|| id_nota_unidade || ';'
FROM  notas_atualizar;

--Updated Rows	19180
-- atualizar
UPDATE ensino.nota_unidade nu_main
SET id_matricula_componente = na.id_matricula_novo
FROM notas_atualizar na
WHERE nu_main.id_nota_unidade = na.id_nota_unidade
  AND na.id_matricula_novo IS NOT NULL; -- Importante: Apenas atualiza se encontrou um id_matricula_novo correspondente
  
  --DROP TABLE turmas_alteracao_matriz_curricular;
  
  -- =============== GERAÇÃO DOS BACKUPS turmas e MC ===================================
  
  -- #3.0 - backup que retorna a matriz na turma_serie 
SELECT distinct 
	'UPDATE basico.turma_serie set id_curriculo_medio = ' || ts.id_curriculo_medio  || ', tipo_diario = ' || ts.tipo_diario || ', id_turno = ' || ts.id_turno || ' WHERE id_turma_serie = ' || ts.id_turma_serie  || ';'
from 
turmas_alteracao_matriz_curricular turmas 
join basico.turma_serie ts on ts.id_turma_serie = turmas.id_turma_serie;

-- #4.0: Backup de MATRICULA_ESTUDANTE_SERIE
SELECT distinct 
	'UPDATE basico.matricula_estudante_serie set id_curriculo_medio = ' ||  mes.id_curriculo_medio || ', id_turno = ' || mes.id_turno || 
	' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie  || ';'
from 
	turmas_alteracao_matriz_curricular turmas 
	join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
		and mes.ano_calendario = 2025;
	
-- #5.1.0 backup para deletar as turmas componentes criadas
SELECT 
	'UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = ' ||id_turma  || ';' 
FROM tc_para_adicionar;

-- backup turmas ANTIGAS
SELECT 
	'UPDATE ensino.turma SET id_situacao_turma = ' || t.id_situacao_turma || ' ,descricao_horario = ' || COALESCE(t.descricao_horario,'NULL') || ' WHERE id_turma = ' ||t.id_turma  || '; -- id_turma_serie: ' || t.id_turma_serie 
from tc_apagar t


SELECT 
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = ' || mc.id_matricula_componente  || ';' 
  FROM novas_mc mc;

SELECT 
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || mc.id_situacao_matricula || ' WHERE id_matricula_componente = ' || mc.id_matricula_componente  || '; -- id_discente' || mc.id_discente 
from  mc_apagar mc;



--- ===========================================================================
--- #0.0 - Identifica os Currículos Associados das Turmas Agrupadoras
  
  
WITH turmas_e_curriculos_associados AS (
    SELECT
        tamc.id_turma_serie AS id_turma_serie_agrupadora,
        tamc.id_curriculo_correto AS id_curriculo_agrupador,
        cb.id_curriculo_basico AS id_curriculo_medio_associado,
        cb.tipo_diario AS tipo_diario_associado,
        tamc.id_turno AS id_turno_turma_agrupadora,
        tamc.id_turno_novo AS id_turno_turma_agrupadora_novo, 
        cb.id_serie AS id_serie_associada,
        ts.nome AS nome_turma_agrupadora,
        ts.ano AS ano_turma_agrupadora,
        ts.id_escola AS id_escola_turma_agrupadora,
        ts.capacidade_aluno AS capacidade_aluno_agrupadora,
        ts.data_cadastro AS data_cadastro_agrupadora,
        ts.descricao_horario AS descricao_horario_agrupadora,
        ts.numero_estudantes AS numero_estudantes_agrupadora,
        ts.regra_nao AS regra_nao_agrupadora
    FROM basico.turma_serie ts
    JOIN turmas_alteracao_matriz_curricular tamc ON tamc.id_turma_serie = ts.id_turma_serie 
    JOIN basico.curriculo_basico_serie_multisseriada cbsm ON cbsm.id_curriculo_basico = tamc.id_curriculo_correto
    JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cbsm.id_curriculo_basico_serie_associada
)
SELECT *
 INTO TEMP turmas_agrupadora_e_associadas_sub
FROM turmas_e_curriculos_associados;




--Updated Rows	17
-- #1.0.1 - Seleciona as sub-turmas a serem inativadas (basico.turma_serie)
SELECT
    ts.id_turma_serie,
    ts.id_curriculo_medio AS id_curriculo_antigo,
    ts.ativo AS ativo_antigo
INTO TEMP ts_inativar_sub
FROM
    basico.turma_serie ts
JOIN
    turmas_agrupadora_e_associadas_sub taa ON ts.id_turma_serie_agrupadora = taa.id_turma_serie_agrupadora
WHERE
    ts.ativo IS TRUE
    AND ts.id_turma_serie_agrupadora IS NOT NULL
    AND ts.id_curriculo_medio <> taa.id_curriculo_medio_associado;

-- Geração de script SQL para backup dos UPDATEs de basico.turma_serie (inativação)
SELECT
    'UPDATE basico.turma_serie SET ativo = ' || ts.ativo_antigo || ' WHERE id_turma_serie IN ( ' || string_agg(ts.id_turma_serie::TEXT,',') || ');' backup
FROM ts_inativar_sub ts
GROUP BY ts.ativo_antigo;

-- #1.0.2 - Inativar basico.turma_serie
UPDATE basico.turma_serie SET ativo = FALSE
FROM ts_inativar_sub fo
WHERE basico.turma_serie.id_turma_serie = fo.id_turma_serie;


-- #1.0.3 - Seleciona as ensino.turma_componente associadas para inativar
SELECT
    t.id_turma,
    t.id_disciplina,
    t.id_turma_serie,
    t.id_situacao_turma AS situacao_antiga,
    t.descricao_horario
INTO TEMP tc_inativar_sub
FROM
    ensino.turma t
JOIN
    ts_inativar_sub ts ON t.id_turma_serie = ts.id_turma_serie
WHERE
    t.id_situacao_turma <> 4; 

-- Geração de script SQL para backup dos UPDATEs de ensino.turma (inativação)
SELECT
    'UPDATE ensino.turma SET id_situacao_turma = ' || t.situacao_antiga || ' ,descricao_horario = ' || COALESCE(t.descricao_horario, 'NULL') || ' WHERE id_turma = ' || t.id_turma || ';'
FROM tc_inativar_sub t;

-- #1.0.4 - Inativar ensino.turma_componente
UPDATE ensino.turma SET id_situacao_turma = 4
FROM tc_inativar_sub fo
WHERE ensino.turma.id_turma = fo.id_turma;


-- #1.0.5 - Seleciona as ensino.matricula_componente associadas para inativar
SELECT
    mc.id_matricula_componente,
    mc.id_situacao_matricula AS situacao_antiga
INTO TEMP mc_inativar_sub
FROM
    ensino.matricula_componente mc
JOIN
    tc_inativar_sub t ON mc.id_turma = t.id_turma
WHERE
    mc.id_situacao_matricula NOT IN (7, 5); 
   
-- Geração de script SQL para backup dos UPDATEs de ensino.matricula_componente (inativação)
SELECT
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || mc.situacao_antiga || ' WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' backup
FROM mc_inativar_sub mc
GROUP BY mc.situacao_antiga;

-- #1.0.6 - Inativar ensino.matricula_componente
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7
FROM mc_inativar_sub fo
WHERE ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;


-- Cria a sequência de nomes para as sub-turmas
WITH sub_turmas_a_criar AS (
    SELECT
        taa.id_turma_serie_agrupadora,
        taa.id_curriculo_medio_associado,
        taa.tipo_diario_associado,
        taa.id_turno_turma_agrupadora_novo AS id_turno_novo, 
        taa.id_escola_turma_agrupadora,
        taa.id_serie_associada,
        taa.ano_turma_agrupadora,
        taa.capacidade_aluno_agrupadora,
        taa.data_cadastro_agrupadora,
        taa.descricao_horario_agrupadora,
        taa.numero_estudantes_agrupadora,
        taa.regra_nao_agrupadora,
        taa.nome_turma_agrupadora, 
        ROW_NUMBER() OVER (PARTITION BY taa.id_turma_serie_agrupadora ORDER BY taa.id_curriculo_medio_associado) - 1 AS sequencial_nome
    FROM
        turmas_agrupadora_e_associadas_sub taa
    LEFT JOIN
        basico.turma_serie ts_existente ON ts_existente.id_turma_serie_agrupadora = taa.id_turma_serie_agrupadora
                                       AND ts_existente.id_curriculo_medio = taa.id_curriculo_medio_associado
                                       AND ts_existente.ativo IS TRUE
    WHERE
        ts_existente.id_turma_serie IS NULL 
)
SELECT
    nextval('hibernate_sequence') AS id_turma_serie, 
    stac.ano_turma_agrupadora AS ano,
    stac.id_serie_associada AS id_serie,
    stac.id_turno_novo AS id_turno, 
    stac.id_escola_turma_agrupadora AS id_escola,
    stac.id_curriculo_medio_associado AS id_curriculo_medio,
    stac.id_turma_serie_agrupadora,
    stac.tipo_diario_associado AS tipo_diario,
    stac.nome_turma_agrupadora || '-M' || stac.sequencial_nome AS nome, 
    TRUE AS ativo,
    stac.capacidade_aluno_agrupadora AS capacidade_aluno,
    stac.data_cadastro_agrupadora AS data_cadastro,
    stac.descricao_horario_agrupadora AS descricao_horario,
    stac.numero_estudantes_agrupadora AS numero_estudantes,
    stac.regra_nao_agrupadora AS regra_nao,
    2 AS id_tipo_turma_serie 
INTO TEMP novas_turmas_serie_sub
FROM sub_turmas_a_criar stac;

-- Geração de script SQL para backup dos DELETEs das novas turmas_serie
SELECT
    'DELETE FROM basico.turma_serie WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' backup
FROM novas_turmas_serie_sub;

-- #2.1 - Insert das novas basico.turma_serie
INSERT INTO basico.turma_serie (
    id_turma_serie, ano, id_serie, id_turno, id_escola, id_curriculo_medio,
    id_turma_serie_agrupadora, tipo_diario, nome, ativo, capacidade_aluno,
    data_cadastro, descricao_horario, numero_estudantes, regra_nao, id_tipo_turma_serie
)
SELECT
    id_turma_serie, ano, id_serie, id_turno, id_escola, id_curriculo_medio,
    id_turma_serie_agrupadora, tipo_diario, nome, ativo, capacidade_aluno,
    data_cadastro, descricao_horario, numero_estudantes, regra_nao, id_tipo_turma_serie
FROM novas_turmas_serie_sub;

--- ===========================================================================
--- #3.0 - Unifica todas as Turmas Serie de Sub-Turmas que estarão ativas
--- (existentes + novas) para as próximas etapas.
--- ===========================================================================
SELECT
    ts.id_turma_serie,
    ts.id_serie,
    ts.id_curriculo_medio,
    ts.tipo_diario,
    ts.id_turno,
    ts.id_escola,
    ts.id_turma_serie_agrupadora,
    ts.ano,
    ts.nome,
    ts.capacidade_aluno,
    ts.data_cadastro,
    ts.periodo
INTO TEMP turmas_serie_ativas_sub
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IS NOT NULL
  AND ts.ativo IS TRUE
  AND ts.ano = (SELECT DISTINCT ano_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub) 
  AND ts.id_escola IN (SELECT DISTINCT id_escola_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub);


----- ============================================
----- CRIAÇÃO/GERENCIAMENTO DE TURMA COMPONENTE PARA SUB-TURMAS
----- ============================================

-- drop table tc_para_adicionar_sub; -- Use com cautela!

-- #5.1 select das turmas para adicionar turma (para as sub-turmas ativas)
-- Inclui também a turma polivalente (disciplina 220)
SELECT DISTINCT
    nextval('ensino.turma_seq') id_turma,
    tss.ano,
     tss.periodo, 
    1 AS id_situacao_turma, -- ABERTA
    tss.capacidade_aluno,
    cbc.id_componente_curricular AS id_disciplina,
    tss.nome AS codigo, -- Nome da turma_serie como código
    1 AS observacao,
    1 AS tipo,
    tss.data_cadastro,
    tss.id_turma_serie,
    cbc.ordem,
    cbc.id_categoria_componente,
    FALSE AS is_polivalente -- Marcador para a turma polivalente
INTO TEMP tc_para_adicionar_sub
FROM
    turmas_serie_ativas_sub tss
JOIN
    basico.curriculo_basico_componente cbc ON cbc.id_curriculo_basico = tss.id_curriculo_medio
WHERE
    NOT EXISTS (
        SELECT 1 FROM ensino.turma t
        WHERE t.id_turma_serie = tss.id_turma_serie
          AND t.id_disciplina = cbc.id_componente_curricular
          AND t.id_situacao_turma <> 4 -- Já existe e não está inativa
    )
UNION ALL
-- Adiciona a turma Polivalente (id_disciplina = 220) para cada sub-turma com tipo_diario específico
SELECT DISTINCT
    nextval('ensino.turma_seq') id_turma,
    tss.ano,
    tss.periodo,
    1 AS id_situacao_turma,
    tss.capacidade_aluno,
    220 AS id_disciplina, -- Disciplina Polivalente
    tss.nome AS codigo, -- Apenas o nome da turma_serie como código, sem '-POLIVALENTE'
    1 AS observacao,
    1 AS tipo,
    tss.data_cadastro,
    tss.id_turma_serie,
    0 AS ordem, -- Ordem 0 para polivalente
    1 AS id_categoria_componente,
    TRUE AS is_polivalente
FROM
    turmas_serie_ativas_sub tss
WHERE
     EXISTS (SELECT 1 
    				FROM ensino.turma t3
    				WHERE t3.id_turma_serie = tss.id_turma_serie_agrupadora
    				AND t3.id_disciplina = 220
                    AND t3.id_situacao_turma <> 4
    				)
    AND NOT EXISTS (
        SELECT 1 FROM ensino.turma t
        WHERE t.id_turma_serie = tss.id_turma_serie
          AND t.id_disciplina = 220
          AND t.id_situacao_turma <> 4 -- Já existe e não está inativa
    );


-- #5.1.0 backup para deletar as turmas componentes criadas (sub-turmas)
SELECT
    'DELETE FROM ensino.turma WHERE id_turma IN ( ' || string_agg(id_turma::TEXT,',') || ');' backup
FROM tc_para_adicionar_sub;


-- #5.2 insert das turmas componentes (sub-turmas)
INSERT INTO ensino.turma (
    id_turma,
    ano,
    periodo,
    id_situacao_turma,
    capacidade_aluno,
    id_disciplina,
    codigo,
    observacao,
    tipo,
    data_cadastro,
    id_turma_serie,
    ordem,
    id_categoria_componente,
    agrupadora -- Polivalente geralmente é agrupadora
)
SELECT
    id_turma,
    ano,
    periodo,
    id_situacao_turma,
    capacidade_aluno,
    id_disciplina,
    codigo,
    observacao,
    tipo,
    data_cadastro::timestamp,
    id_turma_serie,
    ordem,
    id_categoria_componente,
    is_polivalente -- Define como agrupadora se for polivalente
FROM tc_para_adicionar_sub;


-- #7.0 Atualizar id_turma_agrupadora para turmas componentes das sub-turmas
WITH turma_agrupadora_sub_existente AS (
    SELECT
        t.id_turma_serie,
        t.id_turma AS turma_agrupadora_id
    FROM
        ensino.turma t
    JOIN
        turmas_serie_ativas_sub tss ON t.id_turma_serie = tss.id_turma_serie
    WHERE
        t.id_disciplina = 220 -- A turma Polivalente da própria sub-turma
        AND t.agrupadora IS TRUE
        AND t.id_situacao_turma <> 4
        AND t.ano = (SELECT DISTINCT ano FROM tc_para_adicionar_sub LIMIT 1)
)
UPDATE ensino.turma AS t_main
SET id_turma_agrupadora = tais.turma_agrupadora_id
FROM
    turma_agrupadora_sub_existente tais
WHERE
    t_main.id_turma_serie = tais.id_turma_serie
    AND t_main.id_categoria_componente <> 2
    AND t_main.id_disciplina <> 220 -- Apenas para as turmas componentes, não a Polivalente
    AND t_main.id_turma IN (SELECT id_turma FROM tc_para_adicionar_sub WHERE is_polivalente IS FALSE);
   
   --- ===========================================================================
-- #7.1 - Seleciona as matrículas e seus novos id_turma_serie_multisseriado

   SELECT DISTINCT
    mes.id_matricula_discente_serie,
    tss.id_turma_serie AS novo_id_turma_serie_multisseriado,
    mes.id_turma_serie_multisseriado AS id_turma_serie_multisseriado_antigo -- Para backup
INTO TEMP mes_atualizar_subturma_id
FROM
    basico.matricula_estudante_serie mes
JOIN
    turmas_agrupadora_e_associadas_sub taa ON mes.id_turma_serie = taa.id_turma_serie_agrupadora -- Vincula pela turma agrupadora
JOIN
    turmas_serie_ativas_sub tss ON tss.id_turma_serie_agrupadora = mes.id_turma_serie -- Conecta a sub-turma ativa com a agrupadora da MES
                                AND tss.id_serie = mes.id_serie_multisseriado -- Confere a série da sub-turma com a multisseriada da MES
JOIN
    ts_inativar_sub tis ON mes.id_turma_serie_multisseriado = tis.id_turma_serie -- **APENAS SE A SUB-TURMA DA MES FOI INATIVADA**
WHERE
    mes.id_turma_serie_multisseriado IS DISTINCT FROM tss.id_turma_serie; -- Apenas se for diferente do valor atual

-- Geração de script SQL para backup dos UPDATEs de basico.matricula_estudante_serie
SELECT
    'UPDATE basico.matricula_estudante_serie SET id_turma_serie_multisseriado = ' || COALESCE(mes.id_turma_serie_multisseriado_antigo::TEXT, 'NULL') || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';'
FROM mes_atualizar_subturma_id mes;


-- #- Atualizar basico.matricula_estudante_serie
UPDATE basico.matricula_estudante_serie
SET id_turma_serie_multisseriado = fo.novo_id_turma_serie_multisseriado
FROM mes_atualizar_subturma_id fo
WHERE basico.matricula_estudante_serie.id_matricula_discente_serie = fo.id_matricula_discente_serie;
 

--- ## Criação de Novas Matrículas Componentes para Sub-Turmas Ativas

-- #8.0 - Select para Novas Matrículas Componentes (sub-turmas)
SELECT nextval('ensino.matricula_componente_seq') AS id_matricula_componente,
       CASE
           WHEN mes.id_situacao_matricula_serie = 1 THEN 2
           WHEN mes.id_situacao_matricula_serie = 2 THEN 5
           WHEN mes.id_situacao_matricula_serie = 3 THEN 6
           WHEN mes.id_situacao_matricula_serie = 4 OR mes.id_situacao_matricula_serie = 9 THEN 4
           WHEN mes.id_situacao_matricula_serie = 5 THEN 3
           WHEN mes.id_situacao_matricula_serie = 6 THEN 9
           ELSE 2
       END AS id_situacao_matricula,
       t.id_turma,
       t.id_disciplina AS id_componente_curricular,
       mes.id_estudante AS id_discente,
       tss.ano,
       1 AS periodo, -- Assumindo período 1
       tss.id_curriculo_medio AS id_curriculo_basico, -- Currículo da sub-turma
       tss.id_turma_serie
INTO TEMP novas_mc_sub
FROM turmas_serie_ativas_sub tss
JOIN ensino.turma t ON t.id_turma_serie = tss.id_turma_serie AND t.id_situacao_turma <> 4
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie_multisseriado = tss.id_turma_serie -- MES da turma agrupadora
                                            AND mes.ano_calendario = tss.ano AND mes.id_serie_multisseriado = tss.id_serie;

                                           
                                           
-- Geração de script SQL para backup dos DELETEs das novas matrículas componentes (sub-turmas)
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');'
FROM novas_mc_sub;

-- #8.1 - Insere Novas Matrículas Componentes (sub-turmas)
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo)
SELECT tm.id_matricula_componente, tm.id_situacao_matricula, tm.id_turma, tm.id_componente_curricular, tm.id_discente, tm.ano, tm.periodo
FROM novas_mc_sub tm
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.matricula_componente mc
    WHERE mc.id_turma = tm.id_turma
      AND mc.ano = tm.ano
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);
-- rollback;


-- =============================================================================
-- ATUALIZAÇÃO DE REFERÊNCIAS EXISTENTES PARA AS NOVAS/MANTIDAS SUB-TURMAS
-- =============================================================================

-- Tabela de mapeamento de turmas antigas (inativadas) para novas (criadas/mantidas)
-- Isso ajuda a migrar dados de frequência, notas, etc.
SELECT
    t_antiga.id_turma AS id_turma_antiga,
    t_nova.id_turma AS id_turma_nova,
    t_antiga.descricao_horario -- Pode ser útil para restaurar horários
INTO TEMP turmas_ajuste_sub
FROM
    tc_inativar_sub t_antiga -- Turmas componentes antigas (inativadas)
JOIN
    turmas_agrupadora_e_associadas_sub taa ON taa.id_turma_serie_agrupadora = (SELECT id_turma_serie_agrupadora FROM basico.turma_serie WHERE id_turma_serie = t_antiga.id_turma_serie)
JOIN
    ensino.turma t_nova ON t_nova.id_turma_serie = taa.id_turma_serie_agrupadora -- Buscar a turma_serie agrupadora
                        AND t_nova.id_disciplina = t_antiga.id_disciplina -- Mesma disciplina
                        AND t_nova.id_situacao_turma <> 4 -- Turma nova ativa
WHERE t_nova.id_turma_serie IN (SELECT id_turma_serie FROM turmas_serie_ativas_sub);


-- #9.0 - ATUALIZAR FREQUENCIA ALUNO para sub-turmas

-- Backup
SELECT
    'UPDATE ensino.frequencia_aluno SET id_turma = ' || fa.id_turma || ' WHERE id_frequencia IN  ( ' || string_agg(fa.id_frequencia::TEXT,',') || ');' backup
FROM ensino.frequencia_aluno fa
JOIN turmas_ajuste_sub ta ON ta.id_turma_antiga = fa.id_turma
GROUP BY fa.id_turma;

-- Atualização
UPDATE ensino.frequencia_aluno fa_main
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste_sub ta
WHERE fa_main.id_turma = ta.id_turma_antiga;

-- #10.0 - PROFESSOR (ensino.docente_turma) para sub-turmas

-- Backup
SELECT 'UPDATE ensino.docente_turma SET id_turma = ' || dt.id_turma || ' WHERE id_docente_turma IN ( ' || string_agg(id_docente_turma ::TEXT,',') || ');' backup
FROM ensino.docente_turma dt
JOIN turmas_ajuste_sub ta ON ta.id_turma_antiga = dt.id_turma
GROUP BY dt.id_turma;

-- Atualização
UPDATE ensino.docente_turma dt_main
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste_sub ta
WHERE dt_main.id_turma = ta.id_turma_antiga;

-- #11.0 - HORÁRIOS (ensino.horario_turma) para sub-turmas

-- Backup
SELECT 'UPDATE ensino.horario_turma SET id_turma = ' || ht.id_turma || '  WHERE id_horario_turma IN ( ' || string_agg(ht.id_horario_turma::TEXT,',') || ');' backup
FROM ensino.horario_turma ht
JOIN turmas_ajuste_sub ta ON ta.id_turma_antiga =  ht.id_turma
GROUP BY ht.id_turma;

-- Atualização
UPDATE ensino.horario_turma dt_main
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste_sub ta
WHERE dt_main.id_turma = ta.id_turma_antiga;

-- Atualização da descrição do horário (se necessário, do backup da turma antiga)
UPDATE ensino.turma t_main
SET descricao_horario = ta.descricao_horario
FROM turmas_ajuste_sub ta
WHERE t_main.id_turma = ta.id_turma_antiga;

-- #12.0 - CONTEÚDO MINISTRADO (ava.topico_aula) para sub-turmas

-- Backup
SELECT
    'UPDATE ava.topico_aula SET id_turma = ' || fa.id_turma || ' WHERE id_topico_aula = ' || fa.id_topico_aula || ';' backup
FROM ava.topico_aula fa
JOIN turmas_ajuste_sub ta ON ta.id_turma_antiga = fa.id_turma;

-- Atualização
UPDATE ava.topico_aula dt_main
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste_sub ta
WHERE dt_main.id_turma = ta.id_turma_antiga;

-- #13.0 - AULA EXTRA (ava.aula_extra) para sub-turmas

-- Backup
SELECT
    'UPDATE ava.aula_extra SET id_turma = ' || fa.id_turma || ' WHERE id IN ( ' || string_agg(fa.id::TEXT,',') || ');' backup
FROM ava.aula_extra fa
JOIN turmas_ajuste_sub ta ON ta.id_turma_antiga = fa.id_turma
GROUP fa.id_turma;

-- Atualização
UPDATE ava.aula_extra dt_main
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste_sub ta
WHERE dt_main.id_turma = ta.id_turma_antiga;

-- #14.0 - ATUALIZAR MC (Matricula Componente) para Notas (ensino.nota_unidade)

SELECT DISTINCT
    mc_antiga.id_matricula_componente AS id_matricula_antigo,
    mc_nova.id_matricula_componente AS id_matricula_novo,
    nu.id_nota_unidade
INTO TEMP notas_atualizar_sub
FROM
    tc_inativar_sub t_antiga -- Turmas componentes que foram inativadas
JOIN
    ensino.matricula_componente mc_antiga ON mc_antiga.id_turma = t_antiga.id_turma
JOIN
    ensino.nota_unidade nu ON nu.id_matricula_componente = mc_antiga.id_matricula_componente
JOIN
    tc_para_adicionar_sub t_nova_criada ON t_nova_criada.id_turma_serie = (SELECT id_turma_serie FROM ensino.turma WHERE id_turma = mc_antiga.id_turma)
                                     AND t_nova_criada.id_disciplina = mc_antiga.id_componente_curricular
JOIN
    ensino.matricula_componente mc_nova ON mc_nova.id_turma = t_nova_criada.id_turma
                                      AND mc_nova.id_discente = mc_antiga.id_discente
                                      AND mc_nova.id_componente_curricular = mc_antiga.id_componente_curricular
                                      AND mc_nova.ano = mc_antiga.ano
WHERE mc_nova.id_situacao_matricula <> 7; -- Garante que a nova MC não esteja inativada


-- Backup
SELECT 'UPDATE ensino.nota_unidade SET id_matricula_componente = ' || id_matricula_antigo || ' WHERE id_nota_unidade = '|| id_nota_unidade || ';'
FROM notas_atualizar_sub;

-- Atualizar
UPDATE ensino.nota_unidade nu_main
SET id_matricula_componente = na.id_matricula_novo
FROM notas_atualizar_sub na
WHERE nu_main.id_nota_unidade = na.id_nota_unidade
  AND na.id_matricula_novo IS NOT NULL;


-- #15 ajusta polivalente sub
 UPDATE ensino.turma SET id_categoria_componente = NULL
 WHERE id_turma IN (SELECT id_turma FROM tc_para_adicionar_sub
WHERE id_categoria_componente = 1
AND is_polivalente);


-- ROLLBACK; -- Descomente para reverter as alterações (use com cautela!)

-- # Ajustar número vagas


  
WITH vagas_calculadas AS (
    SELECT
        vs.id_vaga_serie,
        (
            SELECT
                COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa )),
                    0
                )
            FROM
                matricula.renovacao_matricula r
            JOIN public.discente d ON
                d.id_discente = r.id_discente
            WHERE
                r.id_vaga_serie = vs.id_vaga_serie
                AND r.data_cancelamento IS NULL
                AND r.id_nova_serie IS NULL
        ) + (
            SELECT
                COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa )),
                    0
                )
            FROM
                matricula.solicitacao_transferencia st
            INNER JOIN matricula.solicitacao_transferencia_opcao_escola topcao ON
                topcao.id_solicitacao = st.id_solicitacao_transferencia
            JOIN basico.matricula_estudante_serie mes ON
                mes.id_matricula_discente_serie = st.id_matricula_discente_serie
            JOIN public.discente d ON
                d.id_discente = mes.id_estudante
            WHERE
                st.id_status IN (
                    2, 4, 8
                )
                    AND topcao.ordem = 1
                    AND st.id_calendario_matricula = vs.id_calendario_matricula
                    AND topcao.id_escola = vs.id_escola
                    AND topcao.id_serie = vs.id_serie
                    AND topcao.id_turno = vs.id_turno
                    AND st.id_matricula_discente_serie_gerado IS NULL
        ) + (
            SELECT
                COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM matricula.estudante_inscrito_necessidade_especial eine JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = eine.id_tipo_necessidade WHERE eine.id_estudante_inscrito = ei.id_estudante_inscrito )),
                    0
                )
            FROM
                matricula.estudante_inscrito ei
            INNER JOIN matricula.estudante_inscrito_opcao_escola iopcao ON
                iopcao.id_estudante_inscrito = ei.id_estudante_inscrito
            INNER JOIN matricula.estudante_inscrito_processamento eip ON
                eip.id_estudante_inscrito = ei.id_estudante_inscrito
                AND eip.id_opcao_escola = iopcao.id_estudante_inscrito_opcao_escola
            WHERE
                iopcao.id_vaga_serie = vs.id_vaga_serie
                AND iopcao.ordem = 1
                AND (
                    ei.id_estudante = 0
                        OR ei.id_estudante IS NULL
                )
                AND ei.id_status IN (
                    1, 4, 6, 7
                )
                    AND eip.id_status IN (
                        1, 4, 6, 7
                    )
        ) + (
            SELECT
                COALESCE(
                    sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa)),
                    0
                )
            FROM
                basico.matricula_estudante_serie mes
            INNER JOIN escola.escola_etapa_ensino_serie eees ON
                eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
            JOIN public.discente d ON
                d.id_discente = mes.id_estudante
            WHERE
                mes.id_situacao_matricula_serie NOT IN (
                    4, 5, 6, 9, 10, 11, 12
                )
                    AND mes.id_turno = vs.id_turno
                    AND eees.id_escola = vs.id_escola
                    AND eees.id_serie = vs.id_serie
                    AND mes.ano_calendario = 2025 -- Observação: A variável cm.ano precisa ser definida
                    AND mes.periodo = vs.periodo
        ) AS vagas_atualizadas,
        vs.vagas_ocupadas,
        vs.vagas_validadas,
        vs.vagas_efetivadas 
    FROM
        matricula.vaga_serie AS vs
    WHERE
        vs.removida = FALSE 
        AND vs.id_registro_validacao IS NOT NULL 
        AND vs.ano_letivo = 2025
        AND vs.vagas_validadas > 0
)
SELECT *
INTO TEMP vaga_atualizacao
FROM vagas_calculadas
WHERE vagas_atualizadas <> vagas_ocupadas;

SELECT 
'UPDATE matricula.vaga_serie SET vagas_ocupadas = ' || vagas_atualizadas ||
CASE 
	WHEN vagas_atualizadas = 0 THEN ', vagas_efetivadas = 0 ' ELSE ' '
END ||
' WHERE id_vaga_serie = ' || id_vaga_serie || ';' solucao,
'UPDATE matricula.vaga_serie SET vagas_ocupadas = ' || vagas_ocupadas || ',vagas_efetivadas = ' || vagas_efetivadas || ' WHERE id_vaga_serie = ' || id_vaga_serie || ';' backup 
FROM vaga_atualizacao
WHERE vagas_atualizadas <>  vagas_ocupadas;

COMMIT;
