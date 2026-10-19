begin;

--PASSO 1: GERAR BACKUP
SELECT 'UPDATE ensino.docente_turma dt SET finalizada = v.finalizada::boolean, '
    || 'id_registro_atualizacao = v.id_reg, data_alteracao = v.data_alt::timestamp FROM (VALUES '
    || string_agg(format('(%s, %L, %s, %L)', dt.id_docente_turma, dt.finalizada, coalesce(dt.id_registro_atualizacao::text, 'NULL::int'), dt.data_alteracao), ', ')
    || ') AS v(id, finalizada, id_reg, data_alt) WHERE dt.id_docente_turma = v.id;' AS backup
FROM ensino.docente_turma dt
WHERE dt.id_docente_turma IN (52516371, 52516372, 52516373, 52516374);

-- PASSO 2: GUARDE O DELETE (SERVIRÁ COMO BACKUP)
WITH ins AS (
    INSERT INTO ensino.docente_turma_alteracao
           (id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
    SELECT dt.id_docente_turma, dt.data_inicio, dt.data_fim, 1, now()
    FROM ensino.docente_turma dt
    WHERE dt.id_docente_turma IN (52516371, 52516372, 52516373, 52516374)
      AND dt.ativo
      AND NOT dt.finalizada
    RETURNING id_docente_turma_alteracao
)
SELECT 'DELETE FROM ensino.docente_turma_alteracao WHERE id_docente_turma_alteracao IN ('
    || string_agg(id_docente_turma_alteracao::text, ', ' ORDER BY id_docente_turma_alteracao)
    || ');' AS reversao_historico,
       count(*) AS qtd
FROM ins;

-- PASSO 3: FINALIZAR ALOCAÇÃO
UPDATE ensino.docente_turma
   SET finalizada     = true,
       data_alteracao = now()
 WHERE id_docente_turma IN (52516371, 52516372, 52516373, 52516374)
   AND ativo
   AND NOT finalizada;


commit;




UPDATE ensino.docente_turma dt SET finalizada = v.finalizada::boolean, id_registro_atualizacao = v.id_reg, data_alteracao = v.data_alt::timestamp FROM (VALUES (52516371, 'f', 5701662, '2026-09-23 17:31:14.892'), (52516372, 'f', 5701662, '2026-09-23 17:31:26.931'), (52516373, 'f', 5701662, '2026-09-23 17:31:49.637'), (52516374, 'f', 5701662, '2026-09-23 17:31:41.379')) AS v(id, finalizada, id_reg, data_alt) WHERE dt.id_docente_turma = v.id;

DELETE FROM ensino.docente_turma_alteracao WHERE id_docente_turma_alteracao IN (6, 7, 8, 9);