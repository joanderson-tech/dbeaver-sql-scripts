SELECT DISTINCT d.id_discente
FROM escola.escola e
JOIN comum.unidade u ON
u.id_unidade = e.id_unidade_escola
JOIN basico.turma_serie ts ON
ts.id_escola = e.id_escola AND ts.periodo =  1
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
JOIN basico.serie s ON
s.id_serie = ts.id_serie
LEFT JOIN basico.mapeamento_series_tce_se mssts ON
mssts.id_serie = ts.id_serie
LEFT JOIN basico.series_tce_se sts ON
sts.id = mssts.id_serie_tce
AND sts.ativo
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
JOIN ensino.turno trn ON
trn.id_turno = ts.id_turno
JOIN basico.matricula_estudante_serie mes ON
mes.id_turma_serie = ts.id_turma_serie
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
JOIN basico.estudante est ON
est.id_estudante = mes.id_estudante
JOIN discente d ON
d.id_discente = est.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
LEFT JOIN ensino.horario_turma ht ON
ht.id_turma = t.id_turma
AND ht.ativo
LEFT JOIN ensino.horario h ON
h.id_horario = ht.id_horario
LEFT JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = t.id_disciplina
LEFT JOIN ensino.docente_turma dt ON
dt.id_turma = t.id_turma
LEFT JOIN rh.servidor serv ON
serv.id_servidor = dt.id_docente
LEFT JOIN comum.pessoa p_prof ON
p_prof.id_pessoa = serv.id_pessoa
LEFT JOIN ambiente.ambiente_unidade_escolar aue ON
aue.id_escola = e.id_escola
WHERE u.ativo
AND ts.ativo
AND p.data_nascimento <= '2024-08-30'
AND t.id_situacao_turma <> 4
AND mes.ano_calendario = 2026