SELECT  * FROM discente d WHERE d.matricula = '202530079789';

SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_turma_serie = 53548524; --  = 981461;



SELECT distinct rac FROM  ensino_infantil.relatorio_avaliativo ra 
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
LEFT JOIN ensino_infantil.parecer_descritivo_individual pdi ON
pdi.id_parecer_descritivo_individual = ra.id_parecer_descritivo_individual
WHERE ra.id_matricula_discente_serie  IN (1330603, 1345011, 1335978, 1332181, 1331527, 1330440, 1335004, 1335009, 1330256, 1342100, 1342424, 1335549, 1342043, 1337013, 1331444, 1329900, 1331430, 1335563, 1330533, 1336039, 1336399, 1330829, 1334560);




