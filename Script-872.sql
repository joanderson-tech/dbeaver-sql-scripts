BEGIN WORK;
  
  WITH novos_curriculos AS(
   SELECT id_curriculo_basico,
   id_serie,
   id_turno,
   tipo_diario,
   id_escola 
   FROM 
  basico.curriculo_basico cb 
  WHERE cb.id_serie IN (1005218,1005219,1005220,1005221,1005222)
  AND cb.id_curriculo_basico IN (52840465,52840478,52840901,52840914,52840926)
  AND cb.ativo
  )
select DISTINCT 
	ts.id_turma_serie,
	ts.id_serie,
	ts.id_curriculo_medio id_curriculo_antigo,
	ncb.tipo_diario,
	ts.id_turno,
	ts.id_escola,
	CASE 
	WHEN ncb.id_turno IS NOT NULL THEN ncb.id_turno ELSE ts.id_turno END id_turno_novo,
	ts.nome nome_turma_int,
	case 
	 when ts.id_serie = ncb.id_serie AND ncb.id_escola = ts.id_escola  then ncb.id_curriculo_basico 
	 when ts.id_serie = ncb.id_serie then ncb.id_curriculo_basico 
	 ELSE  ts.id_curriculo_medio
	end as id_curriculo_correto
	INTO TEMP turmas_alteracao_matriz_curricular
 FROM basico.turma_serie ts 
 JOIN novos_curriculos ncb ON ncb.id_serie = ts.id_serie
 WHERE ts.id_serie IN (1005218,1005219,1005220,1005221,1005222)
 AND ts.id_curriculo_medio <> ncb.id_curriculo_basico
 AND ts.ano = 2025
 AND ts.id_turma_serie_agrupadora IS NULL 
 AND ts.ativo
 AND ts.id_turno <> 1;
---- ==== SCRIPTS DAS ALTERAÇÕES ====

-- #1 Backup de matricula_componente 


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

SELECT 
    'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || mc.id_situacao_matricula || ' WHERE id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');' backup
from  mc_apagar mc
GROUP BY mc.id_situacao_matricula;


-- #1 ATUALIZAR SITUAÇÃO DAS MATR CULAS COMPONENTES PARA EXCLUÍDA 
update ensino.matricula_componente set id_situacao_matricula = 7 from (
	select 
		mc.id_matricula_componente
	from 
	mc_apagar mc
) as fo
where ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;

--rollback;
 

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

SELECT 
	'UPDATE ensino.turma SET id_situacao_turma = ' || t.id_situacao_turma || ' ,descricao_horario = ''' || COALESCE(t.descricao_horario,'NULL') || ''' WHERE id_turma = ' ||t.id_turma  || '; -- id_turma_serie: ' || t.id_turma_serie 
from tc_apagar t



-- #2 ATUALIZAR SITUAÇÃO DAS TURMA_COMPONENTE PARA EXCLUÍDA 4
update ensino.turma set id_situacao_turma = 4 from (
	select distinct 
		id_turma 
	from 
		tc_apagar 
) as fo
where ensino.turma.id_turma = fo.id_turma;

--rollback;

-- #3.0 - backup que retorna a matriz na turma_serie 
SELECT distinct 
	'UPDATE basico.turma_serie set id_curriculo_medio = ' || ts.id_curriculo_medio  || ',tipo_diario = ' || ts.tipo_diario || ', id_turno = ' || ts.id_turno || ' WHERE id_turma_serie = ' || ts.id_turma_serie  || ';'
from 
turmas_alteracao_matriz_curricular turmas 
join basico.turma_serie ts on ts.id_turma_serie = turmas.id_turma_serie;

-- #3.1 atulizar o curriculo turma serie
UPDATE basico.turma_serie SET tipo_diario = fo.tipo_diario, id_curriculo_medio = fo.id_curriculo_correto, id_turno = fo.id_turno_novo FROM(
	select * from turmas_alteracao_matriz_curricular
) fo
WHERE basico.turma_serie.id_turma_serie = fo.id_turma_serie ;

-- #4.0: Backup de MATRICULA_ESTUDANTE_SERIE
SELECT distinct 
	'UPDATE basico.matricula_estudante_serie set id_curriculo_medio = ' ||  mes.id_curriculo_medio || ', id_turno = ' || mes.id_turno || 
	' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie  || ';'
from 
	turmas_alteracao_matriz_curricular turmas 
	join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
		and mes.ano_calendario = 2025;
	
	

-- #4 ATUALIZAR MATRICULA ESTUDANTE SERIE 
-- atualizar as MES ´s
UPDATE basico.matricula_estudante_serie set id_curriculo_medio = fo.id_curriculo_correto, id_turno = fo.id_turno_novo FROM(
    select distinct 
        mes.id_matricula_discente_serie, turmas.id_curriculo_correto, turmas.id_turno_novo
    from 
        turmas_alteracao_matriz_curricular turmas 
        join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
            and mes.ano_calendario = 2025
) fo
WHERE basico.matricula_estudante_serie.id_matricula_discente_serie = fo.id_matricula_discente_serie ;


--rollback;

----- ============================================
----- CRIAÇÃO DE TURMA COMPONENTE
----- ============================================

--drop table tc_para_adicionar;

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

-- #5.1.0 backup para deletar as turmas componentes criadas
SELECT
	'DELETE FROM ensino.turma WHERE id_turma IN ( ' || string_agg(id_turma::TEXT,',') || ');' backup
FROM tc_para_adicionar;


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
           t.id_turma, 
           t.id_disciplina AS id_componente_curricular,
           mes.id_estudante AS id_discente,
           ts.ano,
           ts.periodo,
           ts.id_curriculo_medio AS id_curriculo_basico,
           ts.id_turma_serie,
           mes.id_matricula_discente_serie id_matricula_estudante_serie
    FROM  basico.turma_serie ts
    JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
    join tc_para_adicionar tc on tc.id_turma = t.id_turma
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
    WHERE 1 = 1
    AND ts.ativo
    AND ts.ano = 2025
    AND t.id_situacao_turma <> 4)
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
   
	    
 SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' ||string_agg(id_matricula_componente::TEXT,',') || '); ' backup
 FROM novas_mc;


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

SELECT ta.id_turma AS id_turma_antiga,
       tn.id_turma AS id_turma_nova,
       ta.descricao_horario
INTO TEMP turmas_ajuste
FROM tc_apagar ta
JOIN tc_para_adicionar tn ON tn.id_turma_serie = ta.id_turma_serie
AND ta.id_disciplina = tn.id_disciplina;

-- Backup 
SELECT 
'UPDATE ensino.frequencia_aluno SET id_turma = ' || fa.id_turma || ' WHERE id_frequencia IN ( ' || string_agg(fa.id_frequencia::TEXT,',') || ');' backup
FROM ensino.frequencia_aluno fa
JOIN turmas_ajuste ta ON ta.id_turma_antiga= fa.id_turma 
GROUP BY fa.id_turma;


UPDATE ensino.frequencia_aluno fa_main 
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste ta 
WHERE fa_main.id_turma = ta.id_turma_antiga;


-- PROFESSOR 
SELECT 'UPDATE ensino.docente_turma SET id_turma = ' || dt.id_turma|| ' WHERE id_docente_turma IN ( ' || string_agg(dt.id_docente_turma::TEXT,',') || ');' backup
FROM ensino.docente_turma dt 
JOIN turmas_ajuste ta ON ta.id_turma_antiga = dt.id_turma 
GROUP BY dt.id_turma;

-- ATUALIZAÇÃO

UPDATE ensino.docente_turma dt_main -- Alias para a tabela principal do UPDATE
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste ta -- Tabela para buscar o novo id_turma
WHERE dt_main.id_turma = ta.id_turma_antiga;

-- HORÁRIOS
-- BACKUP 
SELECT 'UPDATE ensino.horario_turma SET id_turma = ' || ht.id_turma || '  WHERE id_horario_turma IN ( ' || string_agg(ht.id_horario_turma::TEXT,',') || ');' backup
FROM ensino.horario_turma ht 
JOIN turmas_ajuste ta ON ta.id_turma_antiga =  ht.id_turma
GROUP BY ht.id_turma ;

-- ATUALIZAR

UPDATE ensino.horario_turma dt_main -- Alias para a tabela principal do UPDATE
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste ta -- Tabela para buscar o novo id_turma
WHERE dt_main.id_turma = ta.id_turma_antiga;

UPDATE ensino.turma t_main -- Alias para a tabela principal do UPDATE
SET descricao_horario = ta.descricao_horario 
FROM turmas_ajuste ta -- Tabela para buscar o novo id_turma
WHERE t_main.id_turma = ta.id_turma_antiga;


-- CONTEUÚDO MINISTRADO
SELECT 
'UPDATE ava.topico_aula SET id_turma = ' || fa.id_turma || ' WHERE id_topico_aula In ( ' || string_agg(fa.id_topico_aula::TEXT,',') || ');' backup
FROM ava.topico_aula  fa
JOIN turmas_ajuste ta ON ta.id_turma_antiga = fa.id_turma
GROUP BY fa.id_turma;

-- ATUALIZAR
UPDATE ava.topico_aula dt_main -- Alias para a tabela principal do UPDATE
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste ta -- Tabela para buscar o novo id_turma
WHERE dt_main.id_turma = ta.id_turma_antiga;

-- AULA EXTRA
SELECT 
'UPDATE ava.aula_extra SET id_turma = ' || fa.id_turma || ' WHERE id IN ( ' || string_agg(fa.id::TEXT,',') || ');' backup
FROM ava.aula_extra  fa
JOIN turmas_ajuste ta ON ta.id_turma_antiga= fa.id_turma
GROUP BY fa.id_turma ;

-- atualizar 

UPDATE ava.aula_extra dt_main -- Alias para a tabela principal do UPDATE
SET id_turma = ta.id_turma_nova
FROM turmas_ajuste ta -- Tabela para buscar o novo id_turma
WHERE dt_main.id_turma = ta.id_turma_antiga;
-- Atualizar MC


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
SELECT 'UPDATE ensino.nota_unidade SET id_matricula_componente = ' || id_matricula_antigo || ' WHERE id_nota_unidade IN ( ' || string_agg(id_nota_unidade::TEXT,',') || ');' backup
FROM  notas_atualizar
GROUP BY id_matricula_antigo;

-- atualizar
UPDATE ensino.nota_unidade nu_main
SET id_matricula_componente = na.id_matricula_novo
FROM notas_atualizar na
WHERE nu_main.id_nota_unidade = na.id_nota_unidade
  AND na.id_matricula_novo IS NOT NULL; -- Importante: Apenas atualiza se encontrou um id_matricula_novo correspondente
  COMMIT;