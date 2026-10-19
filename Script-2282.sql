SELECT * FROM comum.pessoa p WHERE p.nome ILIKE 'Maria Hellena Miranda da Silva'


SELECT DISTINCT  p.nome, mc.media_final  FROM discente d 
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
JOIN basico.matricula_estudante_serie mes ON d.id_discente = mes.id_estudante 
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie  
WHERE d.id_pessoa = 754445;


SELECT * FROM ensino.matricula_componente mc WHERE mc.id_matricula_estudante_serie = 1343366;

