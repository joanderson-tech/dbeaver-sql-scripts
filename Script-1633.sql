BEGIN;

SELECT 'UPDATE basico.matricula_estudante_serie SET id_estudante = 980614 WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' AS Solucao, 'UPDATE basico.matricula_estudante_serie SET id_estudante = ' || mes.id_estudante || ' WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' bacupt
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante IN (979654, 977359)
GROUP BY mes.id_estudante;

UPDATE basico.matricula_estudante_serie SET id_estudante = 980614 WHERE id_matricula_discente_serie IN (1325193);
UPDATE basico.matricula_estudante_serie SET id_estudante = 980614 WHERE id_matricula_discente_serie IN (1335532, 1337658);

SELECT 'UPDATE ensino.matricula_componente SET id_discente = 980614 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao, 'UPDATE ensino.matricula_componente SET id_discente = ' || mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup, COUNT(mc.id_matricula_componente) AS quantidade_ids
FROM ensino.matricula_componente mc
WHERE mc.id_discente IN (979654, 977359)
GROUP BY mc.id_discente;

UPDATE basico.matricula_estudante_serie SET id_estudante = 980614 WHERE id_matricula_discente_serie IN (1325193);
UPDATE basico.matricula_estudante_serie SET id_estudante = 980614 WHERE id_matricula_discente_serie IN (1335532, 1337658);
UPDATE ensino.matricula_componente SET id_discente = 980614 WHERE id_matricula_componente IN (17060027, 17060029);
UPDATE ensino.matricula_componente SET id_discente = 980614 WHERE id_matricula_componente IN (17158975, 17158994, 17159001, 17159008, 17159021, 17159028, 17159035, 17159042, 17159058, 17170814, 17170819, 17170822, 17170818, 17170817, 17170815, 17170820, 17170816, 17170821);
UPDATE ensino.frequencia_aluno SET id_discente = 980614 WHERE id_frequencia IN (140497408, 140497409, 140497387, 140497389, 140497390, 140497391, 140497392, 140497394, 140497395, 140497396, 140497397, 140497399, 140497400, 140497401, 140497402, 140497404, 140497405, 140497406, 140497407, 140757470, 140757471, 140757472, 140757473, 140757474, 140757475, 140757476, 140757477, 140757478, 140757479, 140757480, 140757481, 140757482, 140757483, 140757484, 140757485, 140757486, 140757487, 140757760, 140757828, 140757829, 140757830, 140757831, 140757832, 140757833, 140757834, 140757835, 140757836, 140757837, 140757838, 140757839, 140757840, 140757841, 140757842, 140757843, 140757844, 140757845, 140757846, 140757847, 140757848, 140757849, 140757850, 140757851, 140757852, 140757853, 140497386, 140497388, 140497393, 140497398, 140497403, 140497410, 140758306, 140758307, 140758308, 140758309, 140758310, 140758311, 140758312, 140758313, 140758314, 140758315, 140758316, 140758317, 140758318, 140758319, 140758320, 140758321, 140758322, 140758323, 140758324, 140758325, 140758326, 140758327, 140758328, 140758329, 140758330, 140758331, 140758332, 140758333, 140758334, 140758335, 140758336);

SELECT 'UPDATE ensino.frequencia_aluno SET id_discente = 980614 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script, 'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup, COUNT(fa.id_frequencia) AS quantidade_ids
FROM ensino.frequencia_aluno fa
WHERE fa.id_discente IN (979654, 977359)
GROUP BY fa.id_discente;

--
UPDATE basico.matricula_estudante_serie SET id_estudante = 980614 WHERE id_matricula_discente_serie IN (1325193);
UPDATE basico.matricula_estudante_serie SET id_estudante = 980614 WHERE id_matricula_discente_serie IN (1335532, 1337658);
UPDATE ensino.matricula_componente SET id_discente = 980614 WHERE id_matricula_componente IN (17060027, 17060029);
UPDATE ensino.matricula_componente SET id_discente = 980614 WHERE id_matricula_componente IN (17158975, 17158994, 17159001, 17159008, 17159021, 17159028, 17159035, 17159042, 17159058, 17170814, 17170819, 17170822, 17170818, 17170817, 17170815, 17170820, 17170816, 17170821);
UPDATE ensino.frequencia_aluno SET id_discente = 980614 WHERE id_frequencia IN (140497408, 140497409, 140497387, 140497389, 140497390, 140497391, 140497392, 140497394, 140497395, 140497396, 140497397, 140497399, 140497400, 140497401, 140497402, 140497404, 140497405, 140497406, 140497407, 140757470, 140757471, 140757472, 140757473, 140757474, 140757475, 140757476, 140757477, 140757478, 140757479, 140757480, 140757481, 140757482, 140757483, 140757484, 140757485, 140757486, 140757487, 140757760, 140757828, 140757829, 140757830, 140757831, 140757832, 140757833, 140757834, 140757835, 140757836, 140757837, 140757838, 140757839, 140757840, 140757841, 140757842, 140757843, 140757844, 140757845, 140757846, 140757847, 140757848, 140757849, 140757850, 140757851, 140757852, 140757853, 140497386, 140497388, 140497393, 140497398, 140497403, 140497410, 140758306, 140758307, 140758308, 140758309, 140758310, 140758311, 140758312, 140758313, 140758314, 140758315, 140758316, 140758317, 140758318, 140758319, 140758320, 140758321, 140758322, 140758323, 140758324, 140758325, 140758326, 140758327, 140758328, 140758329, 140758330, 140758331, 140758332, 140758333, 140758334, 140758335, 140758336);

UPDATE matricula.renovacao_matricula SET id_discente = 980614 WHERE id_renovacao_matricula = 52487162;
UPDATE diario.competencia_habilidades_aluno SET id_discente = 980614 WHERE id IN (46468);
UPDATE ensino.observacao_discente SET id_discente = 980614 WHERE id_observacao_discente IN (52442680,1170);

UPDATE comum.pessoa 	SET nome='FABIO DE CARVALHO CAMILO', nome_ascii='FABIO DE CARVALHO CAMILO'	WHERE id_pessoa=351884;
UPDATE basico.estudante_documento_pendente SET id_estudante = 980614 WHERE id_estudante_documento_pendente IN (52030228);
UPDATE basico.movimentacao_estudante 	SET id_discente=980614 	WHERE id_movimentacao_estudante=69077;

DELETE FROM basico.estudante WHERE id_estudante=979654;
DELETE FROM basico.estudante WHERE id_estudante=977359;

DELETE FROM public.discente WHERE id_discente=979654;
DELETE FROM public.discente WHERE id_discente=977359;

DELETE FROM comum.pessoa WHERE id_pessoa=753173;
DELETE FROM comum.pessoa WHERE id_pessoa=750639;

COMMIT;