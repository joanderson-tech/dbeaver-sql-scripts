SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie = 53548524;


SELECT * FROM basico.curriculo_basico cb WHERE id_curriculo_basico = 53598442;

SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo = 'AI1-26';


SELECT * FROM ensino_infantil.configuracao_relatorio cr WHERE cr.id_curriculo_basico = 53598442;

SELECT  * FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio = 53598442
AND ts.id_escola = 51877785;


-- Auto-generated SQL script #202609011643
UPDATE ensino_infantil.configuracao_relatorio_componente
    SET ativo=true
    WHERE id_configuracao_relatorio_componente IN (55544, 55548, 55550, 55552, 55554, 55556, 55558, 55560)





-- Auto-generated SQL script #202608311612
UPDATE ensino_infantil.configuracao_relatorio     SET ativo=true    WHERE id_configuracao_relatorio=1;


SELECT *
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio IN (1, 36)
AND id_tipo_avaliacao_componente_relatorio = 1;


UPDATE ensino_infantil.configuracao_relatorio_componente
    SET ativo=false
    WHERE id_configuracao_relatorio IN (1, 36)
    AND ativo
    AND id_tipo_avaliacao_componente_relatorio = 2;
    
UPDATE ensino_infantil.configuracao_relatorio SET ativo=false WHERE id_configuracao_relatorio=43;

UPDATE ensino_infantil.configuracao_relatorio SET ativo=true WHERE id_configuracao_relatorio=1;


SELECT * FROM escola.escola e WHERE e.nome = 'ESCOLA BOM JESUS DA LAPA'