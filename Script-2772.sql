
SELECT * FROM ensino_infantil.configuracao_relatorio cr 
WHERE cr.id_curriculo_basico  IN (51905241);

SELECT * FROM ensino_infantil.configuracao_relatorio cr 
WHERE cr.id_curriculo_basico  IN (52393539, 52393578);

SELECT * FROM ensino_infantil.configuracao_relatorio cr 
WHERE cr.id_curriculo_basico  IN (52197488,52357089);

SELECT * FROM ensino_infantil.configuracao_relatorio_componente WHERE id_configuracao_relatorio IN (10,11);

SELECT *
FROM basico.turma_serie ts
WHERE ts.ano = 2026
AND ts.id_turma_serie IN (51919094) ;

OR ts.id_turma_serie_agrupadora IN (52382898,52382894)
AND ts.ativo = false
ORDER BY ts.nome;



SELECT t.idturma* FROM ensino.turma t WHERE t.id_turma = 686114;