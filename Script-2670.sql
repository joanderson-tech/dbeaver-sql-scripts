SELECT ta.* FROM ava.topico_aula ta 
JOIN ensino.turma t ON t.id_turma = ta.id_turma 
WHERE t.id_turma_serie = 51899408
--AND ta.ativo 
AND ta.id_usuario = 105497
ORDER BY ta."data" ;