SELECT * FROM comum.pessoa p WHERE p.nome ILIKE '%SILVA DE OLIVEIRA%';


SELECT * FROM comum.pessoa p WHERE p.id_pessoa = 748113;


SELECT * FROM basico.turma_serie ts WHERE ts.nome = 'EFAIM3A' AND ts.id_escola = 51877842;

SELECT * FROM discente d WHERE d.matricula= '202630018202'

SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_estudante = 976969;


SELECT * FROM ensino.matricula_componente WHERE id_matricula_estudante_serie = 1320633;