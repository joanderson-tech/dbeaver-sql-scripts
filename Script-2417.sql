SELECT *
FROM basico.turma_serie ts
WHERE ts.nome = 'EICRINTG2G3A'
AND ts.ano = 2026
AND ts.id_escola = 83788293;

SELECT ts.nome, ts.id_turma_serie, ts.id_curriculo_medio, t.id_disciplina  
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
WHERE ts.id_turma_serie IN (84777071,84777072, 84777073);


SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 87271650;


SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie = 84777071 OR ts.id_turma_serie_agrupadora = 84777071
AND ts.ano = 2026
AND ts.id_escola = 83788293;

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 87271650;


select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and  t.id_turma_serie IN (84777071,84777072, 84777073);

SELECT mc.* 
FROM ensino.turma t
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie IN (84777071,84777072, 84777073);

SELECT t.id_disciplina, * --mc.* 
FROM ensino.turma t
--JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie IN (84777072);

SELECT mc.*
FROM ensino.turma t
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie = 84777071;

518 283

SELECT *
FROM ensino.matricula_componente mc
WHERE mc.id_turma IN(829258,829257);

SELECT *
FROM ensino.matricula_componente mc
WHERE mc.id_turma IN(826285);


SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 87271650;



SELECT DISTINCT mc.*
FROM ensino.turma t
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie = 84777068
AND mc.id_situacao_matricula = 2
ORDER BY id_componente_curricular ;



SELECT 
    ts.id_turma_serie,
    ts.nome AS nome_turma_serie,
    cbc.id_curriculo_basico,
    cbc.id_componente_curricular AS id_disciplina_em_falta
FROM basico.curriculo_basico_componente cbc
-- 1. Unimos a turma_serie baseando-se na regra de negócio que ajustámos antes
JOIN basico.turma_serie ts ON (
    (cbc.id_curriculo_basico = 51876318 AND ts.id_turma_serie = 84777071) OR
    (cbc.id_curriculo_basico = 87271650 AND ts.id_turma_serie = 84777072) OR
    (cbc.id_curriculo_basico = 51876684 AND ts.id_turma_serie = 84777073)
)
-- 2. Tentamos trazer a turma existente para essa série e essa disciplina
LEFT JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
                        AND t.id_disciplina = cbc.id_componente_curricular
                        AND t.id_situacao_turma <> 4 -- Ignora turmas canceladas
-- 3. O TRUQUE: Filtrar apenas onde a turma NÃO EXISTE
WHERE t.id_turma IS NULL
ORDER BY ts.id_turma_serie, cbc.id_componente_curricular;


SELECT 
    ts.id_turma_serie,
    ts.nome AS nome_turma_serie, 
    cbc.id_componente_curricular AS id_disciplina, 
    CASE 
        WHEN t.id_turma IS NULL THEN 'EM FALTA' 
        ELSE 'OK' 
    END AS status
FROM basico.curriculo_basico_componente cbc
-- 1. Unimos a turma_serie baseando-se na regra de negócio
JOIN basico.turma_serie ts ON (
    (cbc.id_curriculo_basico = 51876318 AND ts.id_turma_serie = 84777071) OR
    (cbc.id_curriculo_basico = 87271650 AND ts.id_turma_serie = 84777072) OR
    (cbc.id_curriculo_basico = 51876684 AND ts.id_turma_serie = 84777073)
)
-- 2. Tentamos trazer a turma existente para essa série e essa disciplina
LEFT JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
                        AND t.id_disciplina = cbc.id_componente_curricular
                        AND t.id_situacao_turma <> 4 -- Ignora turmas canceladas
-- 3. Ordenação para facilitar a leitura
ORDER BY ts.id_turma_serie, cbc.id_componente_curricular;