---##SOLUÇÃO

BEGIN;

---##TABELA 01
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
WHERE ts.id_turma_serie IN (51895877, 51896191, 51896192, 51896072, 51896087, 51896075, 51896487, 51895876, 51895878, 51895804, 51896082, 51896488, 51896489, 51896490, 51896491, 51896492, 51896507, 51896524, 51896595, 51896637, 51896648)
AND ts.ativo IS TRUE;

-- ---##TABELA 02 Adiciona a turma Polivalente 
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
    INTO TEMP tc_para_adicionar_sub
FROM
    turmas_serie_ativas_sub tss
WHERE 1=1 
    AND NOT EXISTS (
        SELECT 1 FROM ensino.turma t
        WHERE t.id_turma_serie = tss.id_turma_serie
          AND t.id_disciplina = 220
          AND t.id_situacao_turma <> 4 -- Já existe e não está inativa
    );


---##02 backup para deletar as turmas componentes criadas 
SELECT 'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';' FROM tc_para_adicionar_sub;

---##02 Solução insert das turmas componentes 
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

---##03 Atualizar id_turma_agrupadora para turmas componentes 
WITH turma_agrupadora_sub_existente AS (
    SELECT
        t.id_turma_serie,
        t.id_turma AS turma_agrupadora_id
    FROM ensino.turma t
    JOIN turmas_serie_ativas_sub tss ON t.id_turma_serie = tss.id_turma_serie
    WHERE
        t.id_disciplina = 220 
        AND t.agrupadora IS TRUE
        AND t.id_situacao_turma <> 4
        AND t.ano = (SELECT DISTINCT ano FROM tc_para_adicionar_sub)
)
SELECT 
    -- SOLUCAO:
    'UPDATE ensino.turma SET id_turma_agrupadora = ' || tais.turma_agrupadora_id || ' WHERE id_turma = ' || t_main.id_turma || ';' AS SOLUCAO,
    --  BACKUP: 
    'UPDATE ensino.turma SET id_turma_agrupadora = ' || COALESCE(t_main.id_turma_agrupadora::text, 'NULL') || ' WHERE id_turma = ' || t_main.id_turma || ';' AS BACKUP
FROM 
    ensino.turma AS t_main
JOIN turma_agrupadora_sub_existente tais ON t_main.id_turma_serie = tais.id_turma_serie
WHERE t_main.id_categoria_componente <> 2
AND t_main.id_disciplina <> 220;


UPDATE ensino.turma SET id_turma_agrupadora = 683955 WHERE id_turma = 682422;
UPDATE ensino.turma SET id_turma_agrupadora = 683955 WHERE id_turma = 682423;
UPDATE ensino.turma SET id_turma_agrupadora = 683955 WHERE id_turma = 682424;
UPDATE ensino.turma SET id_turma_agrupadora = 683955 WHERE id_turma = 682425;
UPDATE ensino.turma SET id_turma_agrupadora = 683955 WHERE id_turma = 682426;
UPDATE ensino.turma SET id_turma_agrupadora = 683955 WHERE id_turma = 682427;
UPDATE ensino.turma SET id_turma_agrupadora = 683955 WHERE id_turma = 682428;
UPDATE ensino.turma SET id_turma_agrupadora = 683955 WHERE id_turma = 682429;
UPDATE ensino.turma SET id_turma_agrupadora = 683956 WHERE id_turma = 682481;
UPDATE ensino.turma SET id_turma_agrupadora = 683956 WHERE id_turma = 682482;
UPDATE ensino.turma SET id_turma_agrupadora = 683956 WHERE id_turma = 682483;
UPDATE ensino.turma SET id_turma_agrupadora = 683956 WHERE id_turma = 682484;
UPDATE ensino.turma SET id_turma_agrupadora = 683956 WHERE id_turma = 682485;
UPDATE ensino.turma SET id_turma_agrupadora = 683956 WHERE id_turma = 682486;
UPDATE ensino.turma SET id_turma_agrupadora = 683956 WHERE id_turma = 682487;
UPDATE ensino.turma SET id_turma_agrupadora = 683956 WHERE id_turma = 682488;
UPDATE ensino.turma SET id_turma_agrupadora = 683957 WHERE id_turma = 682489;
UPDATE ensino.turma SET id_turma_agrupadora = 683957 WHERE id_turma = 682490;
UPDATE ensino.turma SET id_turma_agrupadora = 683957 WHERE id_turma = 682491;
UPDATE ensino.turma SET id_turma_agrupadora = 683957 WHERE id_turma = 682492;
UPDATE ensino.turma SET id_turma_agrupadora = 683957 WHERE id_turma = 682493;
UPDATE ensino.turma SET id_turma_agrupadora = 683957 WHERE id_turma = 682494;
UPDATE ensino.turma SET id_turma_agrupadora = 683957 WHERE id_turma = 682495;
UPDATE ensino.turma SET id_turma_agrupadora = 683957 WHERE id_turma = 682496;
UPDATE ensino.turma SET id_turma_agrupadora = 683958 WHERE id_turma = 682498;
UPDATE ensino.turma SET id_turma_agrupadora = 683958 WHERE id_turma = 682499;
UPDATE ensino.turma SET id_turma_agrupadora = 683958 WHERE id_turma = 682500;
UPDATE ensino.turma SET id_turma_agrupadora = 683958 WHERE id_turma = 682501;
UPDATE ensino.turma SET id_turma_agrupadora = 683958 WHERE id_turma = 682502;
UPDATE ensino.turma SET id_turma_agrupadora = 683958 WHERE id_turma = 682503;
UPDATE ensino.turma SET id_turma_agrupadora = 683958 WHERE id_turma = 682504;
UPDATE ensino.turma SET id_turma_agrupadora = 683958 WHERE id_turma = 682497;
UPDATE ensino.turma SET id_turma_agrupadora = 683959 WHERE id_turma = 682642;
UPDATE ensino.turma SET id_turma_agrupadora = 683959 WHERE id_turma = 682643;
UPDATE ensino.turma SET id_turma_agrupadora = 683959 WHERE id_turma = 682644;
UPDATE ensino.turma SET id_turma_agrupadora = 683959 WHERE id_turma = 682645;
UPDATE ensino.turma SET id_turma_agrupadora = 683959 WHERE id_turma = 682646;
UPDATE ensino.turma SET id_turma_agrupadora = 683959 WHERE id_turma = 682640;
UPDATE ensino.turma SET id_turma_agrupadora = 683959 WHERE id_turma = 682641;
UPDATE ensino.turma SET id_turma_agrupadora = 683959 WHERE id_turma = 682647;
UPDATE ensino.turma SET id_turma_agrupadora = 683960 WHERE id_turma = 682648;
UPDATE ensino.turma SET id_turma_agrupadora = 683960 WHERE id_turma = 682649;
UPDATE ensino.turma SET id_turma_agrupadora = 683960 WHERE id_turma = 682650;
UPDATE ensino.turma SET id_turma_agrupadora = 683960 WHERE id_turma = 682651;
UPDATE ensino.turma SET id_turma_agrupadora = 683960 WHERE id_turma = 682652;
UPDATE ensino.turma SET id_turma_agrupadora = 683960 WHERE id_turma = 682653;
UPDATE ensino.turma SET id_turma_agrupadora = 683960 WHERE id_turma = 682654;
UPDATE ensino.turma SET id_turma_agrupadora = 683960 WHERE id_turma = 682655;
UPDATE ensino.turma SET id_turma_agrupadora = 683961 WHERE id_turma = 682656;
UPDATE ensino.turma SET id_turma_agrupadora = 683961 WHERE id_turma = 682657;
UPDATE ensino.turma SET id_turma_agrupadora = 683961 WHERE id_turma = 682658;
UPDATE ensino.turma SET id_turma_agrupadora = 683961 WHERE id_turma = 682659;
UPDATE ensino.turma SET id_turma_agrupadora = 683961 WHERE id_turma = 682660;
UPDATE ensino.turma SET id_turma_agrupadora = 683961 WHERE id_turma = 682661;
UPDATE ensino.turma SET id_turma_agrupadora = 683961 WHERE id_turma = 682662;
UPDATE ensino.turma SET id_turma_agrupadora = 683961 WHERE id_turma = 682663;
UPDATE ensino.turma SET id_turma_agrupadora = 683962 WHERE id_turma = 682671;
UPDATE ensino.turma SET id_turma_agrupadora = 683962 WHERE id_turma = 682664;
UPDATE ensino.turma SET id_turma_agrupadora = 683962 WHERE id_turma = 682665;
UPDATE ensino.turma SET id_turma_agrupadora = 683962 WHERE id_turma = 682666;
UPDATE ensino.turma SET id_turma_agrupadora = 683962 WHERE id_turma = 682667;
UPDATE ensino.turma SET id_turma_agrupadora = 683962 WHERE id_turma = 682668;
UPDATE ensino.turma SET id_turma_agrupadora = 683962 WHERE id_turma = 682669;
UPDATE ensino.turma SET id_turma_agrupadora = 683962 WHERE id_turma = 682670;
UPDATE ensino.turma SET id_turma_agrupadora = 683963 WHERE id_turma = 683049;
UPDATE ensino.turma SET id_turma_agrupadora = 683963 WHERE id_turma = 683050;
UPDATE ensino.turma SET id_turma_agrupadora = 683963 WHERE id_turma = 683051;
UPDATE ensino.turma SET id_turma_agrupadora = 683963 WHERE id_turma = 683052;
UPDATE ensino.turma SET id_turma_agrupadora = 683963 WHERE id_turma = 683053;
UPDATE ensino.turma SET id_turma_agrupadora = 683963 WHERE id_turma = 683054;
UPDATE ensino.turma SET id_turma_agrupadora = 683963 WHERE id_turma = 683055;
UPDATE ensino.turma SET id_turma_agrupadora = 683963 WHERE id_turma = 683056;
UPDATE ensino.turma SET id_turma_agrupadora = 683964 WHERE id_turma = 683057;
UPDATE ensino.turma SET id_turma_agrupadora = 683964 WHERE id_turma = 683058;
UPDATE ensino.turma SET id_turma_agrupadora = 683964 WHERE id_turma = 683059;
UPDATE ensino.turma SET id_turma_agrupadora = 683964 WHERE id_turma = 683060;
UPDATE ensino.turma SET id_turma_agrupadora = 683964 WHERE id_turma = 683061;
UPDATE ensino.turma SET id_turma_agrupadora = 683964 WHERE id_turma = 683062;
UPDATE ensino.turma SET id_turma_agrupadora = 683964 WHERE id_turma = 683063;
UPDATE ensino.turma SET id_turma_agrupadora = 683964 WHERE id_turma = 683064;
UPDATE ensino.turma SET id_turma_agrupadora = 683965 WHERE id_turma = 683065;
UPDATE ensino.turma SET id_turma_agrupadora = 683965 WHERE id_turma = 683066;
UPDATE ensino.turma SET id_turma_agrupadora = 683965 WHERE id_turma = 683067;
UPDATE ensino.turma SET id_turma_agrupadora = 683965 WHERE id_turma = 683068;
UPDATE ensino.turma SET id_turma_agrupadora = 683965 WHERE id_turma = 683069;
UPDATE ensino.turma SET id_turma_agrupadora = 683965 WHERE id_turma = 683070;
UPDATE ensino.turma SET id_turma_agrupadora = 683965 WHERE id_turma = 683071;
UPDATE ensino.turma SET id_turma_agrupadora = 683965 WHERE id_turma = 683072;
UPDATE ensino.turma SET id_turma_agrupadora = 683966 WHERE id_turma = 683073;
UPDATE ensino.turma SET id_turma_agrupadora = 683966 WHERE id_turma = 683074;
UPDATE ensino.turma SET id_turma_agrupadora = 683966 WHERE id_turma = 683075;
UPDATE ensino.turma SET id_turma_agrupadora = 683966 WHERE id_turma = 683076;
UPDATE ensino.turma SET id_turma_agrupadora = 683966 WHERE id_turma = 683077;
UPDATE ensino.turma SET id_turma_agrupadora = 683966 WHERE id_turma = 683078;
UPDATE ensino.turma SET id_turma_agrupadora = 683966 WHERE id_turma = 683079;
UPDATE ensino.turma SET id_turma_agrupadora = 683966 WHERE id_turma = 683080;
UPDATE ensino.turma SET id_turma_agrupadora = 683967 WHERE id_turma = 683081;
UPDATE ensino.turma SET id_turma_agrupadora = 683967 WHERE id_turma = 683082;
UPDATE ensino.turma SET id_turma_agrupadora = 683967 WHERE id_turma = 683083;
UPDATE ensino.turma SET id_turma_agrupadora = 683967 WHERE id_turma = 683084;
UPDATE ensino.turma SET id_turma_agrupadora = 683967 WHERE id_turma = 683085;
UPDATE ensino.turma SET id_turma_agrupadora = 683967 WHERE id_turma = 683086;
UPDATE ensino.turma SET id_turma_agrupadora = 683967 WHERE id_turma = 683087;
UPDATE ensino.turma SET id_turma_agrupadora = 683967 WHERE id_turma = 683088;
UPDATE ensino.turma SET id_turma_agrupadora = 683968 WHERE id_turma = 683089;
UPDATE ensino.turma SET id_turma_agrupadora = 683968 WHERE id_turma = 683090;
UPDATE ensino.turma SET id_turma_agrupadora = 683968 WHERE id_turma = 683091;
UPDATE ensino.turma SET id_turma_agrupadora = 683968 WHERE id_turma = 683092;
UPDATE ensino.turma SET id_turma_agrupadora = 683968 WHERE id_turma = 683093;
UPDATE ensino.turma SET id_turma_agrupadora = 683968 WHERE id_turma = 683094;
UPDATE ensino.turma SET id_turma_agrupadora = 683968 WHERE id_turma = 683095;
UPDATE ensino.turma SET id_turma_agrupadora = 683968 WHERE id_turma = 683096;
UPDATE ensino.turma SET id_turma_agrupadora = 683969 WHERE id_turma = 683097;
UPDATE ensino.turma SET id_turma_agrupadora = 683969 WHERE id_turma = 683098;
UPDATE ensino.turma SET id_turma_agrupadora = 683969 WHERE id_turma = 683099;
UPDATE ensino.turma SET id_turma_agrupadora = 683969 WHERE id_turma = 683100;
UPDATE ensino.turma SET id_turma_agrupadora = 683969 WHERE id_turma = 683101;
UPDATE ensino.turma SET id_turma_agrupadora = 683969 WHERE id_turma = 683102;
UPDATE ensino.turma SET id_turma_agrupadora = 683969 WHERE id_turma = 683103;
UPDATE ensino.turma SET id_turma_agrupadora = 683969 WHERE id_turma = 683104;
UPDATE ensino.turma SET id_turma_agrupadora = 683970 WHERE id_turma = 683114;
UPDATE ensino.turma SET id_turma_agrupadora = 683970 WHERE id_turma = 683115;
UPDATE ensino.turma SET id_turma_agrupadora = 683970 WHERE id_turma = 683116;
UPDATE ensino.turma SET id_turma_agrupadora = 683970 WHERE id_turma = 683117;
UPDATE ensino.turma SET id_turma_agrupadora = 683970 WHERE id_turma = 683118;
UPDATE ensino.turma SET id_turma_agrupadora = 683970 WHERE id_turma = 683119;
UPDATE ensino.turma SET id_turma_agrupadora = 683970 WHERE id_turma = 683120;
UPDATE ensino.turma SET id_turma_agrupadora = 683970 WHERE id_turma = 683121;
UPDATE ensino.turma SET id_turma_agrupadora = 683971 WHERE id_turma = 683159;
UPDATE ensino.turma SET id_turma_agrupadora = 683971 WHERE id_turma = 683160;
UPDATE ensino.turma SET id_turma_agrupadora = 683971 WHERE id_turma = 683161;
UPDATE ensino.turma SET id_turma_agrupadora = 683971 WHERE id_turma = 683162;
UPDATE ensino.turma SET id_turma_agrupadora = 683971 WHERE id_turma = 683163;
UPDATE ensino.turma SET id_turma_agrupadora = 683971 WHERE id_turma = 683164;
UPDATE ensino.turma SET id_turma_agrupadora = 683971 WHERE id_turma = 683165;
UPDATE ensino.turma SET id_turma_agrupadora = 683971 WHERE id_turma = 683166;
UPDATE ensino.turma SET id_turma_agrupadora = 683972 WHERE id_turma = 683239;
UPDATE ensino.turma SET id_turma_agrupadora = 683972 WHERE id_turma = 683240;
UPDATE ensino.turma SET id_turma_agrupadora = 683972 WHERE id_turma = 683241;
UPDATE ensino.turma SET id_turma_agrupadora = 683972 WHERE id_turma = 683242;
UPDATE ensino.turma SET id_turma_agrupadora = 683972 WHERE id_turma = 683243;
UPDATE ensino.turma SET id_turma_agrupadora = 683972 WHERE id_turma = 683244;
UPDATE ensino.turma SET id_turma_agrupadora = 683972 WHERE id_turma = 683245;
UPDATE ensino.turma SET id_turma_agrupadora = 683972 WHERE id_turma = 683246;
UPDATE ensino.turma SET id_turma_agrupadora = 683973 WHERE id_turma = 683278;
UPDATE ensino.turma SET id_turma_agrupadora = 683973 WHERE id_turma = 683279;
UPDATE ensino.turma SET id_turma_agrupadora = 683973 WHERE id_turma = 683280;
UPDATE ensino.turma SET id_turma_agrupadora = 683973 WHERE id_turma = 683281;
UPDATE ensino.turma SET id_turma_agrupadora = 683973 WHERE id_turma = 683282;
UPDATE ensino.turma SET id_turma_agrupadora = 683973 WHERE id_turma = 683283;
UPDATE ensino.turma SET id_turma_agrupadora = 683973 WHERE id_turma = 683284;
UPDATE ensino.turma SET id_turma_agrupadora = 683973 WHERE id_turma = 683285;
UPDATE ensino.turma SET id_turma_agrupadora = 682778 WHERE id_turma = 682779;
UPDATE ensino.turma SET id_turma_agrupadora = 682778 WHERE id_turma = 682780;
UPDATE ensino.turma SET id_turma_agrupadora = 682778 WHERE id_turma = 682781;
UPDATE ensino.turma SET id_turma_agrupadora = 682778 WHERE id_turma = 682782;
UPDATE ensino.turma SET id_turma_agrupadora = 682778 WHERE id_turma = 682783;
UPDATE ensino.turma SET id_turma_agrupadora = 682778 WHERE id_turma = 682784;
UPDATE ensino.turma SET id_turma_agrupadora = 682778 WHERE id_turma = 682785;
UPDATE ensino.turma SET id_turma_agrupadora = 682778 WHERE id_turma = 682786;
UPDATE ensino.turma SET id_turma_agrupadora = 682787 WHERE id_turma = 682788;
UPDATE ensino.turma SET id_turma_agrupadora = 682787 WHERE id_turma = 682789;
UPDATE ensino.turma SET id_turma_agrupadora = 682787 WHERE id_turma = 682790;
UPDATE ensino.turma SET id_turma_agrupadora = 682787 WHERE id_turma = 682791;
UPDATE ensino.turma SET id_turma_agrupadora = 682787 WHERE id_turma = 682792;
UPDATE ensino.turma SET id_turma_agrupadora = 682787 WHERE id_turma = 682793;
UPDATE ensino.turma SET id_turma_agrupadora = 682787 WHERE id_turma = 682794;
UPDATE ensino.turma SET id_turma_agrupadora = 682787 WHERE id_turma = 682795;





---##04 - Select para Novas Matrículas Componentes
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
JOIN ensino.turma t ON t.id_turma_serie = tss.id_turma_serie
AND t.id_situacao_turma <> 4
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = tss.id_turma_serie
AND mes.ano_calendario = tss.ano;

---##04 Geração de script SQL para backup dos DELETEs das novas matrículas componentes 
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');'
FROM novas_mc_sub sub where sub.id_componente_curricular IN (220);


---##04 - Insere Novas Matrículas Componentes
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

COMMIT;