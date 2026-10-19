SELECT *
FROM basico.turma_serie ts
WHERE ts.id_escola IN (1037, 1040, 1041, 1042, 1043, 1048, 1052, 1054, 1055)
AND ts.ativo
AND ts.ano = 2025
AND ts.id_turno = 1
AND ts.ativo
AND EXISTS (SELECT 1
FROM matricula.vaga_serie vs
WHERE vs.id_serie = ts.id_serie
AND vs.id_escola = ts.id_escola
AND vs.id_turno = ts.id_turno);

SELECT DISTINCT *
FROM matricula.vaga_serie vs;

SELECT DISTINCT vs.id_vaga_serie, vs.id_serie, vs.numero_vagas, vs.vagas_efetivadas
FROM matricula.vaga_serie vs
--JOIN basico.turma_serie ts ON ts.id_serie = vs.id_serie
LEFT JOIN matricula.vaga_serie vs1 ON
vs1.id_serie = vs.id_serie
WHERE vs.id_escola IN (1037, 1040, 1041, 1042, 1043, 1048, 1052, 1054, 1055)
--AND ts.ativo
AND vs.ano_letivo = 2025
AND vs.id_turno = 1
AND vs.id_escola IN (1037, 1040, 1041, 1042, 1043, 1048, 1052, 1054, 1055)

SELECT *
FROM matricula.vaga_serie vs
JOIN basico.turma_serie ts ON
ts.id_serie = vs.id_serie
WHERE vs.id_serie = ts.id_serie
AND vs.id_escola = ts.id_escola
AND vs.id_turno = ts.id_turno
AND vs.id_turno = 1
AND vs.id_escola IN (1037, 1040, 1041, 1042, 1043, 1048, 1052, 1054, 1055)


SELECT vs.id_serie, vs.id_escola, vs.ano_letivo, vs.vagas_validadas, vs.id_turno, COUNT(*) AS total_duplicacoes
FROM matricula.vaga_serie vs
WHERE vs.id_turno = 1
AND vs.id_escola IN (1037, 1040, 1041, 1042, 1043, 1048, 1052, 1054, 1055)
-- AND vs.ano_letivo = 2025 -- Exemplo
GROUP BY
    vs.id_serie, vs.id_escola, vs.ano_letivo, vs.vagas_validadas, vs.id_turno
HAVING
    COUNT(*) > 1
ORDER BY
    vs.id_escola, vs.id_serie;
-- SQL para Listar TODAS as linhas de registros que são duplicados
SELECT vs.*
FROM matricula.vaga_serie vs
JOIN
    (
        SELECT id_serie, id_escola, ano_letivo, vagas_validadas, id_turno
FROM matricula.vaga_serie
WHERE id_turno = 1
AND id_escola IN (1037, 1040, 1041, 1042, 1043, 1048, 1052, 1054, 1055)
GROUP BY
            id_serie, id_escola, ano_letivo, vagas_validadas, id_turno
HAVING
            COUNT(*) > 1
    ) AS chaves_duplicadas
    ON
vs.id_serie = chaves_duplicadas.id_serie
AND vs.id_escola = chaves_duplicadas.id_escola
AND vs.ano_letivo = chaves_duplicadas.ano_letivo
AND vs.vagas_validadas = chaves_duplicadas.vagas_validadas
AND vs.id_turno = chaves_duplicadas.id_turno
ORDER BY
    vs.id_escola, vs.id_serie, vs.vagas_validadas, vs.id_vaga_serie;
-- Ajuda a agrupar visualmente as duplicações
-- SQL de TESTE: Mostra o ID_VAGA_SERIE das linhas que SERÃO DELETADAS
SELECT vs.id_vaga_serie
FROM matricula.vaga_serie vs
JOIN
    (
-- Subconsulta: Encontra o ID_VAGA_SERIE MINIMO (o que será MANTIDO)
        SELECT MIN(id_vaga_serie) AS id_vaga_serie_a_manter, id_serie, id_escola, ano_letivo, vagas_validadas, id_turno
FROM matricula.vaga_serie
WHERE id_turno = 1
AND id_escola IN (1037, 1040, 1041, 1042, 1043, 1048, 1052, 1054, 1055)
GROUP BY
            id_serie, id_escola, ano_letivo, vagas_validadas, id_turno
HAVING
            COUNT(*) > 1
-- Apenas os grupos com duplicação
    ) AS chaves_a_manter
    ON
        vs.id_serie = chaves_a_manter.id_serie
AND vs.id_escola = chaves_a_manter.id_escola
AND vs.ano_letivo = chaves_a_manter.ano_letivo
AND vs.vagas_validadas = chaves_a_manter.vagas_validadas
AND vs.id_turno = chaves_a_manter.id_turno
WHERE
-- A condição CRÍTICA: seleciona todos os IDs do grupo, EXCETO o MINIMO (o que será mantido)
vs.id_vaga_serie > chaves_a_manter.id_vaga_serie_a_manter;
-- Verifique se os IDs listados acima fazem sentido para a exclusão!
-- SQL de DELEÇÃO: Apaga as linhas duplicadas, mantendo a de menor id_vaga_serie (a "mais antiga")


SELECT *
    matricula.vaga_serie vs
WHERE vs.id_vaga_serie IN (
        SELECT id_vaga_serie_a_deletar
FROM(
                SELECT t1.id_vaga_serie AS id_vaga_serie_a_deletar, MIN(t2.id_vaga_serie) AS id_vaga_serie_a_manter
FROM matricula.vaga_serie t1
JOIN
                    matricula.vaga_serie t2 ON
                        t1.id_serie = t2.id_serie
AND t1.id_escola = t2.id_escola
AND t1.ano_letivo = t2.ano_letivo
AND t1.vagas_validadas = t2.vagas_validadas
AND t1.id_turno = t2.id_turno
WHERE t1.id_turno = 1
AND t1.id_escola IN (1037, 1040, 1041, 1042, 1043, 1048, 1052, 1054, 1055)
GROUP BY
                    t1.id_vaga_serie, t1.id_serie, t1.id_escola, t1.ano_letivo, t1.vagas_validadas, t1.id_turno
HAVING
                    COUNT(*) > 1
-- Apenas os grupos duplicados
            ) AS duplicacoes_identificadas
WHERE id_vaga_serie_a_deletar > id_vaga_serie_a_manter
    );

BEGIN;

ROLLBACK;

SELECT *
FROM vagas_serie_duplicada vs;
-- SQL para VISUALIZAR TODOS os registros que SERIAM DELETADOS

SELECT vs.*
INTO vagas_serie_duplicada
FROM matricula.vaga_serie vs
WHERE vs.id_vaga_serie IN (
        SELECT id_vaga_serie_a_deletar
FROM(
                SELECT t1.id_vaga_serie AS id_vaga_serie_a_deletar, MIN(t2.id_vaga_serie) AS id_vaga_serie_a_manter
FROM matricula.vaga_serie t1
JOIN
                    matricula.vaga_serie t2 ON
                        t1.id_serie = t2.id_serie
AND t1.id_escola = t2.id_escola
AND t1.ano_letivo = t2.ano_letivo
AND t1.vagas_validadas = t2.vagas_validadas
AND t1.id_turno = t2.id_turno
WHERE t1.id_turno = 1
AND t1.id_escola IN (1037, 1040, 1041, 1042, 1043, 1048, 1052, 1054, 1055)
GROUP BY
                    t1.id_vaga_serie, t1.id_serie, t1.id_escola, t1.ano_letivo, t1.vagas_validadas, t1.id_turno
HAVING
                    COUNT(*) > 1
-- Apenas os grupos duplicados
            ) AS duplicacoes_identificadas
WHERE id_vaga_serie_a_deletar > id_vaga_serie_a_manter
    );

SELECT 'DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  ' || id_vaga_serie || ';'
FROM vagas_serie_duplicada;




COMMIT;

--28 deletes

BEGIN;

DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730893;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730902;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730926;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730892;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730935;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730887;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730924;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730904;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730906;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730940;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730944;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730925;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730899;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730888;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730941;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730943;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730946;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730917;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730900;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730890;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730908;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730923;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730915;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730889;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730938;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730901;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730891;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie =  54730903;

COMMIT;







