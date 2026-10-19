


1373846-- 1513075  2025-06-09
1338947-- 1515401  2025-04-09

--Interna - CAMYLLA VITORIA GOMES DOS SANTOS - 09/06/2025
SELECT 'UPDATE ensino.frequencia_aluno 	SET ativo=false WHERE id_frequencia IN (' ||STRING_AGG(fa.id_frequencia::TEXT, ',')||  '); '  AS solucao,
			 'UPDATE ensino.frequencia_aluno 	SET ativo=true WHERE id_frequencia IN (' ||STRING_AGG(fa.id_frequencia::TEXT, ',')||  '); '  AS backup
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma IN ( 768318, 759518, 759519, 759521, 759522, 759520, 768313, 768314, 768315, 768317, 768316, 759524, 759523, 759525, 759517)
AND fa.id_discente = 1373846
AND fa."data" >= '2025-06-09'
AND fa.ativo;

--Externa -ANNA LUIZA BATISTA SOUZA - 09/04/2025
SELECT 'UPDATE ensino.frequencia_aluno 	SET ativo=false WHERE id_frequencia IN (' ||STRING_AGG(fa.id_frequencia::TEXT, ',')||  '); '  AS solucao,
			 'UPDATE ensino.frequencia_aluno 	SET ativo=true WHERE id_frequencia IN (' ||STRING_AGG(fa.id_frequencia::TEXT, ',')||  '); '  AS backup
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma IN ( 768318, 759518, 759519, 759521, 759522, 759520, 768313, 768314, 768315, 768317, 768316, 759524, 759523, 759525, 759517)
AND fa.id_discente = 1338947
AND fa."data" >= '2025-04-09'
AND fa.ativo;


