SELECT mes.*
FROM discente d
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente
--JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
WHERE mes.ano_calendario = 2026
AND mes.id_estudante = 973495;



SELECT d.*
FROM discente d
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN ensino.matricula_componente mc ON
mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
WHERE d.id_discente = 980805--980805
AND mes.ano_calendario = 2026;

SELECT *
FROM matricula.solicitacao_transferencia st
WHERE st.id_matricula_discente_serie IN (1342548, 1342030, 1342575);

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie  IN (53234798, 53234799, 53234800, 53234801, 53234802, 53234803, 53234804, 53234805, 53265011, 53265012);

SELECT DISTINCT d.*
FROM basico.matricula_estudante_serie mes
join discente d ON d.id_discente = mes.id_estudante 
WHERE mes.id_estudante    IN (977761,979045) AND mes.ano_calendario = 2026;

SELECT * FROM ensino.matricula_componente mc WHERE mc.id_matricula_estudante_serie = 1343366;

SELECT * FROM escola.escola e WHERE e.nome ILIKE '%EM MONSENHOR JOSe TIBuRCIO%'



SELECT DISTINCT ts FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
WHERE ts.id_escola = 1840 AND ts.ano = 2026 
AND ts.ativo = FALSE
AND t.id_situacao_turma = 4;


--1338839

SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 53236466;


