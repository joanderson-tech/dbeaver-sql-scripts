SELECT ta.*
FROM ava.topico_aula ta
WHERE ta.conteudo_ministrado ILIKE '%) Compreender a ideia de igualdade para escrever%';

SELECT * FROM ensino.topico_aula_habilidade 


SELECT *
FROM ava.topico_aula_habilidade tah
WHERE tah.id_topico_aula = 53636811;

SELECT * FROM ava.topico_aula_habilidade tah
WHERE tah.id_topico_aula = 52817980;


SELECT hc.* FROM ensino_infantil.habilidade_competencia AS hc
WHERE hc.descricao ILIKE '%(CIÊNCIAS HUMANAS - GEOGRAFIA/EIXO 1: %';