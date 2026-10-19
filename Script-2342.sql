


--Atualiza a estrutura
SELECT 
    'UPDATE basico.curriculo_basico_componente SET id_categoria_componente = 1 WHERE id_curriculo_basico_componente = ' || cbc.id_curriculo_basico_componente || ';' AS solucao, 
    'UPDATE basico.curriculo_basico_componente SET id_categoria_componente = ' || cbc.id_categoria_componente || ' WHERE id_curriculo_basico_componente = ' || cbc.id_curriculo_basico_componente || ';' AS backup
FROM basico.curriculo_basico_componente cbc 
WHERE 
    (cbc.id_curriculo_basico IN (51895209, 51895225) AND cbc.id_componente_curricular = 519)
    OR 
    (cbc.id_curriculo_basico IN (51895174, 51895190) AND cbc.id_componente_curricular = 516)
ORDER BY cbc.id_curriculo_basico;

--Atualiza a Turma 
SELECT  
    'UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = ' || t.id_turma || ';' AS solucao, 
    'UPDATE ensino.turma SET id_categoria_componente = ' || t.id_categoria_componente || ' WHERE id_turma = ' || t.id_turma || ';' AS backup
FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
WHERE 
    ts.ativo = TRUE 
    AND t.ano = 2026
    AND (
        (ts.id_curriculo_medio IN (51895174, 51895190) AND t.id_disciplina = 516)
        OR 
        (ts.id_curriculo_medio IN (51895209, 51895225) AND t.id_disciplina = 519)
    )
ORDER BY ts.id_curriculo_medio;
    



UPDATE basico.curriculo_basico_componente SET id_categoria_componente = 1 WHERE id_curriculo_basico_componente = 51895187;
UPDATE basico.curriculo_basico_componente SET id_categoria_componente = 1 WHERE id_curriculo_basico_componente = 51895203;
UPDATE basico.curriculo_basico_componente SET id_categoria_componente = 1 WHERE id_curriculo_basico_componente = 51895223;
UPDATE basico.curriculo_basico_componente SET id_categoria_componente = 1 WHERE id_curriculo_basico_componente = 51895239;

UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 683660;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 684990;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 684960;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 683626;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 684975;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 684945;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 683729;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 683744;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 685005;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 685035;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 685020;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 685075;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 685059;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 683778;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 683762;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 685091;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 685120;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 683810;
UPDATE ensino.turma SET id_categoria_componente = 1 WHERE id_turma = 683794;




BEGIN;

COMMIT ;

UPDATE basico.curriculo_basico_componente SET id_categoria_componente = 2 WHERE id_curriculo_basico_componente = 51895187;
UPDATE basico.curriculo_basico_componente SET id_categoria_componente = 2 WHERE id_curriculo_basico_componente = 51895203;
UPDATE basico.curriculo_basico_componente SET id_categoria_componente = 1 WHERE id_curriculo_basico_componente = 51895223;
UPDATE basico.curriculo_basico_componente SET id_categoria_componente = 1 WHERE id_curriculo_basico_componente = 51895239;


UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 683660;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 684990;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 684960;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 683626;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 684975;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 684945;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 683729;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 683744;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 685005;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 685035;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 685020;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 685075;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 685059;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 683778;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 683762;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 685091;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 685120;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 683810;
UPDATE ensino.turma SET id_categoria_componente = 2 WHERE id_turma = 683794;

