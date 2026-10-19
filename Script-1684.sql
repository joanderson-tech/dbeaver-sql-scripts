SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_escola = 747
AND vs.ano_letivo = 2026;


SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%CRECHE MUNICIPAL DE CAMPINAS%'


SELECT vs_zero.id_vaga_serie, vs_zero.id_serie, vs_zero.id_turno, vs_zero.numero_vagas
FROM matricula.vaga_serie vs_zero
WHERE vs_zero.id_escola = 747 
  AND vs_zero.ano_letivo = 2026
  AND vs_zero.numero_vagas = 0
  -- A condição abaixo garante que existe um registro "bom" para não deixar a série sem nada
  AND EXISTS (
      SELECT 1 
      FROM matricula.vaga_serie vs_bom
      WHERE vs_bom.id_serie = vs_zero.id_serie
        AND vs_bom.id_turno = vs_zero.id_turno
        AND vs_bom.numero_vagas > 0
        AND vs_bom.id_escola = 747
  );

-- ETAPA 1: CRIAÇÃO DA TABELA DE BACKUP COM OS REGISTROS A SEREM DELETADOS
SELECT
    vs.*
--INTO    matricula.backup_vagas_serie_deletar_20251017 -- << Nome da sua nova tabela de backup
FROM
    matricula.vaga_serie vs
WHERE
    vs.id_vaga_serie IN (
        -- Subconsulta principal: lista os ID's que serão deletados
        SELECT
            id_vaga_serie_a_deletar
        FROM
            (
                -- Subconsulta para identificar o ID mínimo (a manter) e o ID de todas as linhas (para comparar)
                SELECT
                    t1.id_vaga_serie AS id_vaga_serie_a_deletar,
                    MIN(t2.id_vaga_serie) AS id_vaga_serie_a_manter
                FROM
                    matricula.vaga_serie t1
                JOIN
                    matricula.vaga_serie t2 ON
                        t1.id_serie = t2.id_serie
                        AND t1.id_escola = t2.id_escola
                        AND t1.ano_letivo = t2.ano_letivo
                        AND t1.vagas_validadas = t2.vagas_validadas
                        AND t1.id_turno = t2.id_turno
                        AND t1.removida 
                WHERE t1.id_escola IN (747)
                AND t1.ano_letivo = 2026
                GROUP BY
                    t1.id_vaga_serie, t1.id_serie, t1.id_escola, t1.ano_letivo, t1.vagas_validadas, t1.id_turno
                HAVING
                    COUNT(*) > 1 -- Apenas os grupos duplicados
            ) AS duplicacoes_identificadas
        
    );



