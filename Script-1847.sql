SELECT *
FROM discente
WHERE matricula = '202330006580';

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante = 979352
AND mes.ano_calendario = 2025;

SELECT mc.*
FROM basico.matricula_estudante_serie mes
JOIN ensino.matricula_componente mc ON
mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
WHERE mes.id_turma_serie = 55659431
AND mc.id_componente_curricular = 230;


SELECT 'UPDATE ensino.matricula_componente SET media_final = NULL WHERE id_matricula_componente =  ' || id_matricula_componente || ';' AS SOLUÇÃO,
 				'UPDATE ensino.matricula_componente SET media_final = ' || media_final || ' WHERE id_matricula_componente =  ' || id_matricula_componente || ';' AS BACKUP
FROM ensino.matricula_componente 
WHERE id_matricula_componente IN (17158788,17158770,17158779,17158797,17158806,17158815,17158824,17158833,17158842,17158851,17158860,17158869,17158878,17160050,17160059);


-- Auto-generated SQL script #202602240945
UPDATE ensino.matricula_componente SET media_final = NULL WHERE id_matricula_componente IN (17158788,17158770,17158779,17158797,17158806,17158815,17158824,17158833,17158842,17158851,17158860,17158869,17158878,17160050,17160059)
