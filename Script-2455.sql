SELECT t.id, t.dataInicio, t.dataFim, t.ano, t.periodo, t.codigo, disciplina.id, disciplina.codigo, disciplina.nivel, disciplina.nome, ht.id, ht.dia, ht.horaInicio, ht.horaFim, ht.dataInicio, ht.dataFim, ht.tipo, ht.ativo, horario.id, horario.inicio, horario.fim, horario.ordem, horario.tipo, horario.ativo, horario.nivel, todosDocentesTurma.id, todosDocentesTurma.chDedicadaPeriodo, docente.id, pessoaInstituicao.id, pessoaInstituicao.nome, pessoaInstituicao.cpf_cnpj, docenteExterno.id, pessoaExterno.id, pessoaExterno.nome, pessoaExterno.cpf_cnpj, horarioDocente.id, horarioDocente.dia, horarioDocente.dataInicio, horarioDocente.dataFim, horarioDocente.tipo, hDoc.id, hDoc.inicio, hDoc.fim, hDoc.ordem, hDoc.tipo, hDoc.ativo, hDoc.nivel, e.nome
FROM DocenteTurma dts
INNER JOIN dts.turma t
INNER JOIN t.turmaSerie ts
INNER JOIN ts.escola e
INNER JOIN dts.docente doc
INNER JOIN t.docentesTurmas todosDocentesTurma
INNER JOIN t.disciplina disciplina
INNER JOIN t.situacaoTurma sit
LEFT JOIN t.horarios ht
LEFT JOIN ht.horario horario
LEFT JOIN todosDocentesTurma.docente docente
LEFT JOIN docente.pessoa pessoaInstituicao
LEFT JOIN todosDocentesTurma.docenteExterno docenteExterno
LEFT JOIN docenteExterno.pessoa pessoaExterno
LEFT JOIN t.horarios horarioDocente
LEFT JOIN horarioDocente.horario hDoc
WHERE t.ano = 2026
AND doc.id = 300
AND sit.id IN ( 1, 2, 3, 7 )
AND dts.ativo = TRUE
AND dts.dataFim > :DATA
AND ht.ativo = TRUE
ORDER BY t.id, ht.id, horario.id, todosDocentesTurma.id, docente.id, docenteExterno.id, horarioDocente.id, hDoc.id;

SELECT DISTINCT t.codigo, t.id_disciplina, dt.id_docente, h.*
FROM ensino.docente_turma docentetur0_
INNER JOIN ensino.turma t ON
docentetur0_.id_turma = t.id_turma
INNER JOIN basico.turma_serie turmaserie2_ ON
t.id_turma_serie = turmaserie2_.id_turma_serie
INNER JOIN escola.escola escola3_ ON
turmaserie2_.id_escola = escola3_.id_escola
INNER JOIN ensino.docente_turma dt ON
t.id_turma = dt.id_turma
LEFT OUTER JOIN rh.servidor servidor10_ ON
dt.id_docente = servidor10_.id_servidor
LEFT OUTER JOIN comum.pessoa pessoa11_ ON
servidor10_.id_pessoa = pessoa11_.id_pessoa
LEFT OUTER JOIN ensino.docente_externo docenteext12_ ON
dt.id_docente_externo = docenteext12_.id_docente_externo
LEFT OUTER JOIN comum.pessoa pessoa13_ ON
docenteext12_.id_pessoa = pessoa13_.id_pessoa
INNER JOIN ensino.componente_curricular componente6_ ON
t.id_disciplina = componente6_.id_componente_curricular
INNER JOIN ensino.situacao_turma situacaotu7_ ON
t.id_situacao_turma = situacaotu7_.id_situacao_turma
LEFT OUTER JOIN ensino.horario_turma h ON
t.id_turma = h.id_turma
LEFT OUTER JOIN ensino.Horario horario9_ ON
h.id_horario = horario9_.id_horario
LEFT OUTER JOIN ensino.horario_turma horarios14_ ON
t.id_turma = horarios14_.id_turma
LEFT OUTER JOIN ensino.Horario horario15_ ON
horarios14_.id_horario = horario15_.id_horario
INNER JOIN rh.servidor servidor4_ ON
docentetur0_.id_docente = servidor4_.id_servidor
WHERE t.ano = 2026
AND servidor4_.id_servidor = 300
AND (situacaotu7_.id_situacao_turma IN (1 , 2 , 3 , 7))
AND docentetur0_.ativo = TRUE
AND docentetur0_.data_fim> '2026-06-12'
AND h.ativo = TRUE
AND h.id_horario_turma = 1400193
AND t.id_turma in (682551,682618);
ORDER BY t.id_turma, h.id_horario_turma, horario9_.id_horario, dt.id_docente_turma, servidor10_.id_servidor, docenteext12_.id_docente_externo, horarios14_.id_horario_turma, horario15_.id_horario


682551 


SELECT t.*
FROM ensino.turma t
--WHERE t.id_turma in (682551,682618);
--JOIN ensino.docente_turma dt ON dt.id_turma = t.id_turma 
WHERE  t.id_turma in (682551,682618);