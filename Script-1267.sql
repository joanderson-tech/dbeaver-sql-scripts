SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo = 'EIP5';

ROLLBACK;


SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 51895123;51895123

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_componente_curricular = 293;

SELECT DISTINCT t.* FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
WHERE ts.id_curriculo_medio = 51895123 AND t.id_situacao_turma <> 4;


/*CMPEX02 - CORPO, GESTOS E MOVIMENTOS / 200h  /	5h  -- 507
CMPEX03 - TRAÇOS, SONS, CORES E FORMAS	/ 150h	/ 5h  --508
CMPEX01 - O EU, O OUTRO E O NÓS / 150h	/ 5h		--506
CMPEX04 - ESCUTA, FALA, PENSAMENTO E IMAGINAÇÃO	/ 150h / 5h -- 509
CMPEX05 - ESPAÇOS, TEMPOS, QUANTIDADES, RELAÇÕES E TRANSFORMAÇÕES / 150h / 5h -- 510
Atividade polivalente B / 800h / 20h*/


SELECT * FROM ensino.turma t WHERE t.id_disciplina = 293;



BEGIN;

--solução
UPDATE basico.curriculo_basico_componente SET ch_ano=200 WHERE id_curriculo_basico_componente=51913149;
UPDATE basico.curriculo_basico_componente SET ch_ano=150 WHERE id_curriculo_basico_componente IN (51913150,51913151,51913152,51913153);

INSERT INTO basico.curriculo_basico_componente
(id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)
VALUES(nextval('hibernate_sequence'), 51895123, 293, 800, NULL, NULL, now(), TRUE, NULL, 200, NULL, 5, FALSE, NULL, FALSE, 1, FALSE, FALSE);

ROLLBACK;

--backup
UPDATE basico.curriculo_basico_componente SET ch_ano=400 WHERE id_curriculo_basico_componente=51913149;
UPDATE basico.curriculo_basico_componente SET ch_ano=300 WHERE id_curriculo_basico_componente IN (51913150,51913151,51913152,51913153);

DELETE
FROM basico.curriculo_basico_componente
WHERE id_curriculo_basico_componente = (
    SELECT cbc.id_curriculo_basico_componente
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_componente_curricular = 293
AND cbc.id_curriculo_basico = 51895123
);



BEGIN;

 WITH novos_curriculos AS(
   SELECT id_curriculo_basico,
   id_serie,
   id_turno,
   tipo_diario,
   id_escola 
   FROM 
  basico.curriculo_basico cb 
  WHERE  cb.ano_entrada_vigor = 2025
  AND cb.id_curriculo_basico IN (51895123)
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
 WHERE  ts.ano = 2025
 AND ts.id_turma_serie_agrupadora IS NULL 
 AND ts.ativo;
 
 SELECT * FROM turmas_alteracao_matriz_curricular;

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
FROM basico.turma_serie tsa  -- tsa: Turma Serie Adicionar
join basico.curriculo_basico_componente cbc on cbc.id_curriculo_basico = tsa.id_curriculo_medio
AND cbc.id_curriculo_basico = 51895123;

SELECT * FROM tc_para_adicionar;

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