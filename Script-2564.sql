SELECT DISTINCT crc.*
FROM ensino_infantil.relatorio_avaliativo_componente rac
JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = rac.id_configuracao_relatorio_componente 
WHERE rac.id_relatorio_avaliativo = 150818;

SELECT distinct rac.*  
FROM   ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
WHERE ra.id_matricula_discente_serie = 1655363;




SELECT *
FROM ensino.matricula_componente mc
WHERE mc.id_matricula_estudante_serie = 1652102
AND mc.id_situacao_matricula = 2;



SELECT DISTINCT t.codigo , mc.*
FROM basico.matricula_estudante_serie mes
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie 
JOIN ensino.turma t ON t.id_turma = mc.id_turma 
WHERE mes.id_estudante   = 1388821
AND t.ano IN (2026);




SELECT DISTINCT t.codigo , mc.*
FROM basico.matricula_estudante_serie mes
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
--JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_matricula_componente = mc.id_matricula_componente 
JOIN ensino.turma t ON t.id_turma = mc.id_turma 
WHERE mes.id_estudante   = 1388821
AND t.ano = 2026
AND mc.id_matricula_componente = 20564414;

AND mc.id_situacao_matricula = 2;

SELECT rac.*  
FROM   ensino_infantil.relatorio_avaliativo ra
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
WHERE ra.id_matricula_discente_serie   = 20564414;




