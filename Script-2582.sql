SELECT * FROM comum.pessoa p WHERE p.nome = 'ANA LUIZA NASCIMENTO BASTOS';


SELECT * FROM discente d WHERE d.id_pessoa = 768097;


SELECT distinct mes.*
FROM basico.matricula_estudante_serie mes
--JOIN ensino.matricula_componente mc on mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie 
WHERE mes.id_estudante = 1397446
AND mes.ano_calendario = 2026;

SELECT distinct mes.*
FROM basico.matricula_estudante_serie mes
WHERE mes.id_matricula_discente_serie IN (1490749,1584272);



-- Auto-generated SQL script #202607241448
UPDATE ensino.matricula_componente
    SET id_situacao_matricula=2
    WHERE id_matricula_componente IN (20481242, 20481243, 20481244, 20481245, 20481246, 20481247, 20481248, 20481249, 20481250);




-- Auto-generated SQL script #202607240941
UPDATE basico.matricula_estudante_serie
    SET id_situacao_matricula_serie=1
    WHERE id_matricula_discente_serie=1634002;
