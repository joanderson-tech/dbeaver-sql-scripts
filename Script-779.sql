begin;

rollback;

drop table if exist turmas_serie_ativas_sub;

select
	ts2.ano, ts2.periodo, ts2.capacidade_aluno, ts2.nome, ts2.data_cadastro, ts2.id_turma_serie, ts2.tipo_diario, ts2.id_serie, ts2.id_curriculo_medio into temp turmas_serie_ativas_sub
from
	basico.turma_serie ts
join basico.turma_serie ts2 on
	ts2.id_turma_serie_agrupadora = ts.id_turma_serie
where
	ts.id_curriculo_medio in (53040502, 53040518, 53040532, 53040546, 53040560, 53040690, 53040705, 53040720, 53040735, 53040757, 53040772, 53040787)
	and ts.id_escola in (1116, 1100, 1105) and ts2.ativo = false;

-- #5.1 select das turmas para adicionar turma (para as sub-turmas ativas)
-- Inclui também a turma polivalente (disciplina 220)
SELECT DISTINCT
    t.id_turma,
    tss.ano,
     tss.periodo, 
    1 AS id_situacao_turma, -- ABERTA
    tss.capacidade_aluno,
    t.id_disciplina,
    tss.nome AS codigo, -- Nome da turma_serie como código
    1 AS observacao,
    1 AS tipo,
    tss.data_cadastro,
    tss.id_turma_serie,
    t.ordem,
    t.id_categoria_componente,
    FALSE AS is_polivalente -- Marcador para a turma polivalente
INTO TEMP tc_para_adicionar_sub
FROM
    turmas_serie_ativas_sub tss
join ensino.turma t on 
	t.id_turma_serie = tss.id_turma_serie    
WHERE
    t.id_situacao_turma <> 4
    and t.id_disciplina <> 220
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
    tss.tipo_diario IN (1) -- Restrição de tipo_diario
    AND NOT EXISTS (
        SELECT 1 FROM ensino.turma t
        WHERE t.id_turma_serie = tss.id_turma_serie
          AND t.id_disciplina = 220
          AND t.id_situacao_turma <> 4 -- Já existe e não está inativa
    );


-- #5.2 insert das turmas componentes (sub-turmas)
insert
	into
	ensino.turma (
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
	agrupadora
	-- Polivalente geralmente é agrupadora
)
select
	tc.id_turma,
	tc.ano,
	tc.periodo,
	tc.id_situacao_turma,
	tc.capacidade_aluno,
	tc.id_disciplina,
	tc.codigo,
	tc.observacao,
	tc.tipo,
	tc.data_cadastro::timestamp,
	tc.id_turma_serie,
	tc.ordem,
	tc.id_categoria_componente,
	tc.is_polivalente
	-- Define como agrupadora se for polivalente
from
	tc_para_adicionar_sub tc
where
	not exists(
		select 1 from ensino.turma t where t.id_turma_serie = tc.id_turma_serie and t.id_disciplina = tc.id_disciplina
);


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


-- backup 
                                           
-- Geração de script SQL para backup dos DELETEs das novas matrículas componentes (sub-turmas)
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente = ' || id_matricula_componente || ';'
FROM novas_mc_sub;

SELECT
    'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';'
FROM tc_para_adicionar_sub tc where tc.id_disciplina = 220;


-- Em tempo desenvolvimento não havia frequencias, mais deixamos aqui caso o usuário lance 

WITH nova_turma AS (
    SELECT
        id_turma,
        id_turma_serie,
        id_disciplina
    FROM
        ensino.turma t
    WHERE
        t.id_turma_serie IN (52874391,52879002,52879179,52883915,52884002,52886199)
        AND t.id_situacao_turma = 1
),
frequencia_ordenada AS (
    SELECT
        fa.id_frequencia,
        fa.id_discente,
        fa.id_turma AS turma_antiga_id,
        fa.data,
        fa.data_cadastro,
        fa.ativo,
        ROW_NUMBER() OVER (PARTITION BY fa.id_discente, fa.id_turma, fa.data, fa.ativo ORDER BY fa.data_cadastro DESC) AS rn
    FROM
        ensino.frequencia_aluno fa
    JOIN ensino.turma t ON fa.id_turma = t.id_turma
    WHERE
         t.id_turma_serie IN (52874391,52879002,52879179,52883915,52884002,52886199)
        AND t.id_situacao_turma = 4
        AND fa.ativo
),
frequencia_nova_turma_existente AS (
    SELECT
        fna.id_discente,
        fna.data,
        fna.id_turma
    FROM
        ensino.frequencia_aluno fna
    JOIN nova_turma nt_existente ON fna.id_turma = nt_existente.id_turma
    WHERE
        fna.ativo = true
),
matricula_nova_turma_existente AS (
    SELECT DISTINCT
        mc.id_discente,
        mc.id_turma,
        mc.id_situacao_matricula
    FROM
        ensino.matricula_componente mc
    JOIN nova_turma nt_mat ON mc.id_turma = nt_mat.id_turma
)
SELECT
 'UPDATE ensino.frequencia_aluno SET id_turma = ' || nt.id_turma || '  WHERE id_frequencia = ' || fo.id_frequencia || ';' AS solucao,
    'UPDATE ensino.frequencia_aluno SET id_turma = ' || fo.turma_antiga_id || '  WHERE id_frequencia = ' || fo.id_frequencia || ';' AS backup
FROM
    frequencia_ordenada fo
JOIN nova_turma nt ON nt.id_disciplina = (SELECT id_disciplina FROM ensino.turma WHERE id_turma = fo.turma_antiga_id)
LEFT JOIN frequencia_nova_turma_existente fnee ON
    fnee.id_discente = fo.id_discente AND
    fnee.data = fo.data AND
    fnee.id_turma = nt.id_turma
JOIN matricula_nova_turma_existente mnve ON
    mnve.id_discente = fo.id_discente AND
    mnve.id_turma = nt.id_turma 
    AND mnve.id_situacao_matricula = 2
WHERE
    fo.rn = 1
    AND fnee.id_discente IS NULL
   
-- 2# migrar topico aula 
   
   WITH nova_turma AS (
    SELECT
        id_turma,
        id_turma_serie,
        id_disciplina
    FROM
        ensino.turma t
    WHERE
        t.id_turma_serie IN (52874391,52879002,52879179,52883915,52884002,52886199)
        AND t.id_situacao_turma = 1
)
   SELECT 'UPDATE ava.topico_aula SET id_turma = ' || nt.id_turma||' WHERE id_topico_aula = ' || ta.id_topico_aula || ';',
          'UPDATE ava.topico_aula SET id_turma = ' || t.id_turma||' WHERE id_topico_aula = ' || ta.id_topico_aula || ';' 
   FROM ensino.turma t
   JOIN nova_turma nt ON nt.id_disciplina = t.id_disciplina 
   JOIN ava.topico_aula ta ON ta.id_turma = t.id_turma 
   WHERE  t.id_turma_serie IN (52874391,52879002,52879179,52883915,52884002,52886199)
   AND t.id_situacao_turma = 4
   AND NOT EXISTS (
   SELECT 1 FROM ava.topico_aula ta2
   WHERE ta2.id_turma = nt.id_turma
   AND ta2.data = ta.DATA
   AND ta2.ativo
   );

   commit;