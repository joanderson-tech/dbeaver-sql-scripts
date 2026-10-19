SELECT *
FROM escola.escola e
WHERE E.id_escola = 1643;

SELECT ee.* FROM basico.etapa_ensino AS ee
WHERE ee.denominacao ILIKE '%EDUCAÇÃO INFANTIL%'

SELECT * FROM basico.serie s ;

SELECT *
FROM ensino.horario h
WHERE h.ano_entrada_vigor = 2026
AND h.id_etapa_ensino = 2
AND h.id_unidade = 2641
AND h.ativo;

SELECT * FROM basico.turma_serie ts WHERE ts.id_escola = 1643
AND  ts.ano = 2026
AND ts.ativo ;


SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 52535980;



SELECT * FROM ensino.horario_turma ht   WHERE ht.id_turma IN (689746, 689747, 690136) ;


SELECT * FROM 


-- Auto-generated SQL script #202604141629
UPDATE ensino.horario 	SET ativo=false	WHERE id_horario IN (52535175, 52535176, 52544820, 52544822, 52544823, 52544824, 52544907)

