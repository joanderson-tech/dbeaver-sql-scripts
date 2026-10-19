SELECT mes.*
FROM discente d
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
WHERE p.id_pessoa = 52785061
AND mes.ano_calendario = 2026;


SELECT p.*
FROM discente d
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
WHERE p.nome ILIKE '%IANE GABRIELE CAMPOS DA SILVA%';

SELECT * FROM basico.calendario_escolar ce 

SELECT * FROM comum.usuario u WHERE u.id_usuario = 105017; MARIA LUCIA DE ALENCAR GONZAGA

SELECT cm.ano, cm.vigente, cm.ativo, * FROM matricula.calendario_matricula  cm;

WHERE id_calendario_matricula IN (71558970,60968982);


SELECT *
FROM  basico.matricula_estudante_serie 
WHERE ano_calendario = 2026; AND id_situacao_matricula_serie = 5;



SELECT *
FROM  basico.matricula_estudante_serie 
WHERE id_estudante IN (1366253,1442827);