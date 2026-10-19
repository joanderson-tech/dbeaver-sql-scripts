begin;

-- PASSO 1 (gerar backup)
SELECT 'UPDATE ensino.docente_turma dt SET finalizada = v.finalizada::boolean, '
    || 'id_registro_atualizacao = v.id_reg, data_alteracao = v.data_alt::timestamp FROM (VALUES '
    || string_agg(format('(%s, %L, %s, %L)',
                         dt.id_docente_turma, dt.finalizada,
                         coalesce(dt.id_registro_atualizacao::text, 'NULL::int'), dt.data_alteracao), ', ')
    || ') AS v(id, finalizada, id_reg, data_alt) WHERE dt.id_docente_turma = v.id;' AS backup
FROM ensino.docente_turma dt
WHERE dt.id_docente_turma IN (51974546, 51974547, 51974548);

-- PASSO 2 (guardar id_docente_turma_alteracao para usar em possível backup)
INSERT INTO ensino.docente_turma_alteracao
       (id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
SELECT dt.id_docente_turma, dt.data_inicio, dt.data_fim, 1, now()
FROM ensino.docente_turma dt
WHERE dt.id_docente_turma IN (51974546, 51974547, 51974548)
  AND dt.ativo
  AND NOT dt.finalizada
RETURNING id_docente_turma_alteracao, id_docente_turma;

-- PASSO 3 (registar os ids que retornaram no ultimo script e guardar caso precise de backup)
DELETE FROM ensino.docente_turma_alteracao WHERE id_docente_turma_alteracao IN (51974546, 51974547, 51974548);

-- PASSO 4 (finalizar alocação)
UPDATE ensino.docente_turma
   SET finalizada     = true,
       data_alteracao = now()
 WHERE id_docente_turma IN (51974546, 51974547, 51974548)
   AND ativo
   AND NOT finalizada;


rollback;


commit;


UPDATE ensino.docente_turma dt SET finalizada = v.finalizada::boolean, id_registro_atualizacao = v.id_reg, data_alteracao = v.data_alt::timestamp FROM (VALUES (51974546, 'f', 5640024, '2026-09-30 16:42:48.456'), (51974547, 'f', 5640024, '2026-09-30 16:43:02.097'), (51974548, 'f', 5640024, '2026-09-30 16:43:25.344')) AS v(id, finalizada, id_reg, data_alt) WHERE dt.id_docente_turma = v.id;

id_docente_turma_alteracao, id_docente_turma 
	6 ,						51974546
	7 ,						51974547
	8 ,						51974548

