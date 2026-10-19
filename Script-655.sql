select * from  basico.curriculo_basico_componente cbc where cbc.id_componente_curricular = 222 and id_curriculo_basico  = 53590989;

select * from ensino.horario_turma ht  where ht.id_turma in (691555, 691556, 691557, 691558, 691559, 691560, 691561, 691562, 691554);

select string_agg(id_turma  ::varchar, ', ')   from ensino.turma t  where t.id_turma_serie = 53608393;


-- Auto-generated SQL script #202506100826
UPDATE basico.curriculo_basico_componente SET ch_semana=5 WHERE id_curriculo_basico_componente=53590991;


UPDATE basico.curriculo_basico_componente SET ch_semana=4 WHERE id_curriculo_basico_componente=53590991;


begin;

rollback;

WITH novo_horario AS (
    SELECT nextval('ensino.horario_turma_seq') AS id_horario_turma
), 
script_horario_turma AS (
    SELECT 
        'INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, alteracao_horario, id_registro_entrada) VALUES (' 
        || id_horario_turma || ', 691554, 1, 127248, ''6'', ''10:42:00'', ''11:30:00'', ''2025-02-05'', ''2025-12-22'', NULL, NULL, NULL, true, NULL, NULL, NULL, 5694683);' AS solucao,
        
        'DELETE FROM ensino.horario_turma WHERE id_horario_turma = ' || id_horario_turma || ';' AS backup
    FROM novo_horario
)
SELECT solucao AS "Script de Inserção", 
       backup AS "Script de Remoção" 
FROM script_horario_turma;

