SELECT * FROM comum.pessoa p WHERE p.nome = 'CLAUDIA DE JESUS MENDES'

SELECT * FROM rh.servidor s WHERE s.id_pessoa = 51875744;

SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente = 26;


SELECT DISTINCT mes.id_turma_serie, * FROM basico.matricula_estudante_serie mes WHERE mes.ano_calendario = 2026;

SELECT * FROM ensino.turma t
JOIN ensino.docente_turma dt ON dt.id_turma = t.id_turma
WHERE t.id_turma_serie  = 52398818;
 
SELECT DISTINCT t.*
FROM escola.escola e
JOIN comum.unidade u ON u.id_unidade = e.id_unidade_escola
JOIN basico.turma_serie ts ON ts.id_escola = e.id_escola
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
JOIN basico.serie s ON s.id_serie = ts.id_serie
JOIN basico.mapeamento_series_tce_se mssts ON mssts.id_serie = ts.id_serie
JOIN basico.series_tce_se sts ON sts.id = mssts.id_serie_tce AND sts.ativo
JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
--JOIN periodo pe ON (ts.periodo = pe.periodo 	OR ee.periodicidade_etapa = 'ANUAL')
JOIN ensino.turno trn ON trn.id_turno = ts.id_turno
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie --AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
JOIN basico.estudante est ON est.id_estudante = mes.id_estudante
JOIN discente d ON d.id_discente = est.id_estudante
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma
JOIN ensino.horario h ON h.id_horario = ht.id_horario
JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina
 JOIN ensino.docente_turma dt ON dt.id_turma = t.id_turma
JOIN rh.servidor serv ON serv.id_servidor = dt.id_docente
JOIN comum.pessoa p_prof ON p_prof.id_pessoa = serv.id_pessoa
WHERE u.ativo
--AND ts.ativo
--AND ht.ativo
--AND dt.ativo
--AND p.data_nascimento <= '2024-08-30'
--AND t.id_situacao_turma <> 4
AND mes.ano_calendario = 2026;


SELECT * FROM ensino.docente_turma dt WHERE dt.data_inicio >= '2026-01-01 00:00:00.000 -0300';
