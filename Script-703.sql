-
   
-- 2# migrar topico aula 
   
   WITH nova_turma AS (
    SELECT
        id_turma,
        id_turma_serie,
        id_disciplina
    FROM
        ensino.turma t
    WHERE
        t.id_turma_serie = 52288647
)
   SELECT 'UPDATE ava.topico_aula SET id_turma = ' || nt.id_turma||' WHERE id_topico_aula = ' || ta.id_topico_aula || ';',
          'UPDATE ava.topico_aula SET id_turma = ' || t.id_turma||' WHERE id_topico_aula = ' || ta.id_topico_aula || ';' 
   FROM ensino.turma t
   JOIN nova_turma nt ON nt.id_disciplina = t.id_disciplina 
   JOIN ava.topico_aula ta ON ta.id_turma = t.id_turma 
   WHERE t.id_turma_serie = 52282192
   AND NOT EXISTS (
   SELECT 1 FROM ava.topico_aula ta2
   WHERE ta2.id_turma = nt.id_turma
   AND ta2.data = ta.data
   );742111