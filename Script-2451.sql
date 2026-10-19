SELECT sum(ch_semana) AS ch_total_turma, ch_alocada, sum(ch_semana) , ch_alocada ch_disponivel
FROM( SELECT id_turma_serie, id_curriculo_medio, sum(ch_dedicada_periodo) ch_alocada
FROM ensino.docente_turma dt
JOIN ensino.turma t 	USING(id_turma)
JOIN basico.turma_serie ts 	USING(id_turma_serie)
WHERE ts.id_turma_serie = 51929981
AND (dt.id_docente <> NULL 	OR NULL IS NULL)
AND ts.ativo IS TRUE
AND t.id_situacao_turma NOT IN(4, 8)
AND dt.ativo IS TRUE
AND NOT dt.finalizada
AND dt.auxiliar IS NOT TRUE
AND now() BETWEEN dt.data_inicio AND dt.data_fim
AND dt.data_fim > now()
GROUP BY id_turma_serie, id_curriculo_medio ) alocada
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = alocada.id_curriculo_medio
GROUP BY id_curriculo_medio, ch_alocada;

SELECT sum(ch_semana) AS ch_total_turma, ch_alocada, sum(ch_semana) - ch_alocada ch_disponivel
FROM( SELECT id_turma_serie, id_curriculo_medio, sum(ch_dedicada_periodo) ch_alocada
FROM ensino.docente_turma dt
JOIN ensino.turma t
	USING(id_turma)
JOIN basico.turma_serie ts
	USING(id_turma_serie)
WHERE ts.id_turma_serie = 51929981
AND (dt.id_docente <> NULL
	OR NULL IS NULL)
AND ts.ativo IS TRUE
AND t.id_situacao_turma NOT IN(4, 8)
AND dt.ativo IS TRUE
AND NOT dt.finalizada
AND dt.auxiliar IS NOT TRUE
AND now() BETWEEN dt.data_inicio AND dt.data_fim
AND dt.data_fim > now()
GROUP BY id_turma_serie, id_curriculo_medio ) alocada
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = alocada.id_curriculo_medio
GROUP BY id_curriculo_medio, ch_alocada;
 


SELECT DISTINCT  dt.*
FROM ensino.docente_turma dt
JOIN ensino.turma t 	USING(id_turma)
JOIN basico.turma_serie ts 	USING(id_turma_serie)
WHERE ts.id_turma_serie = 51929981
AND (dt.id_docente <> NULL 	OR NULL IS NULL)
AND ts.ativo IS TRUE
AND t.id_situacao_turma NOT IN(4, 8)
AND dt.ativo IS TRUE
AND NOT dt.finalizada
AND dt.auxiliar IS NOT TRUE
AND now() BETWEEN dt.data_inicio AND dt.data_fim
AND dt.data_fim > now();
GROUP BY id_turma_serie, id_curriculo_medio,dt


SELECT ht.* FROM ensino.turma t 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 51929981
AND ativo;


SELECT p.nome, * FROM rh.servidor s 
JOIN comum.pessoa p ON  p.id_pessoa = s.id_pessoa 
WHERE s.id_servidor IN (30, 30, 61, 61, 61, 76, 76, 76);




UPDATE ensino.docente_turma
	SET ativo=false
	WHERE id_docente_turma IN (51933853, 51933855, 51933856, 51933858, 51933860, 51933859, 51933857, 51933854);
