SELECT cb.id_curriculo_basico, cb.codigo,*
FROM basico.curriculo_basico cb
WHERE cb.ano_entrada_vigor = 2026;


SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 52591883;

SELECT * FROM ensino_infantil.configuracao_relatorio cr 
JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
WHERE cr.id_curriculo_basico IN (52591865, 52591883, 52591898);

/*

52591865   1INT-26 
52591883   2INT-26
52591898   3INT-26

*/;

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio IN (52591865, 52591883, 52591898);

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_serie IN (1005218, 1005219, 1005220) AND ts.ano = 2026
AND ts.ativo ;


SELECT *
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio  IN (52347956,52347971, 52347986) AND ts.ano = 2026
AND ts.ativo ;


SELECT * FROM basico.turma_serie ts WHERE ts.tipo_diario = 31 AND ts.ano = 2026 AND ts.ativo ;


SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 52554409;



SELECT cb.id_curriculo_basico, cb.codigo, cb.ano_entrada_vigor, *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (52347956,52347971, 52347986);


SELECT * FROM basico.turma_serie ts WHERE ts.tipo_diario = 31;