SELECT DISTINCT nu.*
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma
JOIN ensino.nota_unidade nu ON nu.id_matricula_componente = mc.id_matricula_componente 
WHERE ts.id_turma_serie = 53176723
AND mc.id_situacao_matricula = 2
AND t.id_disciplina = 221
AND nu.ativo 
AND t.id_situacao_turma <> 4
--AND mc.id_discente = 975657
AND nu.id_descricao_nota = 27
AND nu.unidade = 2
ORDER BY nu.unidade ;


SELECT *FROM ensino.data_aula_turma WHERE id_data_aula_turma  IN (122999,122109,122090);


SELECT * FROM ensino.turma t WHERE t.id_turma IN (687092, 686921, 686959);

--687073

SELECT * FROM comum.pessoa p WHERE p.nome=  'ANA CLARA DA SILVA';
SELECT * FROM discente d WHERE d.id_pessoa = 51883513;
SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_turma_serie = 53176723 ; --mes.id_estudante = 975657 AND mes.ano_calendario = 2026;
SELECT * FROM ensino.matricula_componente mc WHERE mc.id_matricula_estudante_serie = 1324336;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 53176723;

SELECT * FROM basico.turma_serie ts WHERE ts.nome = 'EFAFINT6G'
AND ts.id_escola = 51877790;

SELECT * FROM comum.usuario u WHERE u.id_usuario = 105389;

SELECT * FROM rh.servidor s WHERE s.id_pessoa =747276;
SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente = 612 AND ativo;

EFAFINT6F

975651
THIAGO RIBEIRO DE NOBREGA


--LARISSA LIMA MENDES
SELECT *
FROM ensino.nota_unidade nu ;

SELECT *
FROM