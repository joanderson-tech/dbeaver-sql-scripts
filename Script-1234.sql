SELECT p -- mes.id_matricula_discente_serie, mes.ano_calendario, mes.id_situacao_matricula_serie, s.descricao, e.nome   
FROM comum.pessoa p 
JOIN discente d ON d.id_pessoa = p.id_pessoa 
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente
JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie 
JOIN escola.escola e ON e.id_escola = ts.id_escola 
JOIN basico.serie s ON s.id_serie = ts.id_serie
WHERE p.nome ILIKE '%DAVI LUIZ MARTINS DE QUEIROZ%'
ORDER BY mes.id_matricula_discente_serie ;

--DAVI LUIZ MARTINS DE QUEIROZ id_estudante 974024

