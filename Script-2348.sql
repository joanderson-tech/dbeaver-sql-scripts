/*Total de datas aulas 822
 * 200 em faltas totais 
*/

SELECT *
FROM comum.pessoa p
WHERE p.nome ILIKE '%Andriely Vitória Ribeiro Soares%';

SELECT mc.frequencia , * FROM ensino.matricula_componente mc WHERE mc.id_matricula_estudante_serie  = 1329186;

SELECT *
FROM discente d
WHERE d.id_pessoa = 748701;

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie = 52335469 --mes.id_estudante = 980242
AND mes.ano_calendario = 2024;

SELECT sum(fa.frequencia) AS faltas, sum(fa.horarios) as aulas
FROM ensino.turma t
JOIN ensino.frequencia_aluno fa ON
fa.id_turma = t.id_turma
WHERE t.id_turma = 701917-- = 52335469
AND fa.id_discente = 980242
AND fa.ativo ;
AND fa.horarios = 0;


SELECT mc.frequencia , * FROM ensino.matricula_componente mc WHERE mc.id_matricula_estudante_serie  = 1329186;
-- Auto-generated SQL script #202605181703
UPDATE ensino.matricula_componente
	SET frequencia=NULL
	WHERE id_matricula_componente=17157537;


75.7



-- Auto-generated SQL script #202605181531
UPDATE ensino.frequencia_aluno 	SET horarios=0	WHERE id_frequencia IN (52386085, 52386062, 52386183, 52386303, 52386361, 52387328, 52387574, 52387866, 52387913, 52388711, 52388734, 52389061, 52389885, 52389917, 52390132, 52397262, 52397283, 52397304, 52397325, 52397359, 52407895, 52408675, 52409924, 52409961, 52411153, 52412368, 52416142, 52416165, 52416186, 52417056, 52418097, 52418326, 52419836, 52419585, 52419811, 52421201, 52421224, 52421468);


SELECT COALESCE(sum(fa.frequencia), 0) AS faltasTotais, t.id_turma, t.id_disciplina, COALESCE(sum(abonos.quantidade_faltas_abonadas), 0) AS apenasAbono,
COALESCE(sum(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0) AS faltasSemAbono
FROM ensino.frequencia_aluno fa
LEFT JOIN LATERAL ( SELECT iaf.id_frequencia, sum(iaf.quantidade_faltas_abonadas) AS quantidade_faltas_abonadas
FROM ensino.item_abono_frequencia iaf
JOIN ensino.abono_frequencia af ON
af.id_abono_frequencia = iaf.id_abono_frequencia
WHERE af.ativo
AND iaf.id_frequencia = fa.id_frequencia
GROUP BY iaf.id_frequencia ) abonos ON
TRUE
JOIN ensino.turma t ON t.id_turma = fa.id_turma
JOIN ensino.componente_curricular cc ON cc .id_componente_curricular = t.id_disciplina 
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
WHERE fa.ativo
AND fa.id_discente = 980242
AND t.id_turma_serie = 52335469
AND NOT EXISTS (SELECT 1
FROM ensino.interrupcao_escola ie
WHERE ie.id_escola = ts.id_escola
AND fa."data" BETWEEN ie.inicio AND ie.fim
AND ie.ativo)
GROUP BY t.id_turma, cc.codigo;

SELECT COALESCE(sum(fa.frequencia), 0) AS faltasTotais, 
--COALESCE(sum(abonos.quantidade_faltas_abonadas), 0) AS apenasAbono, 
COALESCE(sum(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0) AS faltasSemAbono
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON t.id_turma = fa.id_turma
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
WHERE fa.ativo
AND fa.id_discente = 980242
AND t.id_turma_serie = 52335469
AND NOT EXISTS (SELECT 1
FROM ensino.interrupcao_escola ie
WHERE ie.id_escola = ts.id_escola
AND fa."data" BETWEEN ie.inicio AND ie.fim
AND ie.ativo);