INSERT INTO ensino.matricula_componente (id_situacao_matricula, id_discente, id_matricula_componente, id_turma, id_registro_cadastro, data_cadastro, ano, id_componente_curricular, id_matricula_estudante_serie, periodo) SELECT 2, mat.id_estudante, nextval('ensino.matricula_componente_seq'), t.id_turma, NULL, now(), ano, t.id_disciplina, mat.id_matricula_discente_serie, t.periodo
FROM basico.matricula_estudante_serie mat, ensino.turma t
INNER JOIN ensino.componente_curricular c ON
c.id_componente_curricular = t.id_disciplina
WHERE t.id_turma_serie = 84521932
AND id_matricula_discente_serie IN ( 1589238, 1598037, 1654364, 1623256, 1615434, 1603460, 1599165, 1614453, 1620798, 1620508, 1611525, 1614163, 1630107, 1598161, 1598050, 1604094, 1598129, 1614143, 1640847, 1599885 )
AND c.id_tipo_componente != 6
AND t.id_situacao_turma <> 4
AND NOT EXISTS( SELECT * FROM ensino.matricula_componente WHERE mat.id_estudante = id_discente AND id_situacao_matricula IN ( 5, 6, 2, 8 ) AND id_turma = t.id_turma );

BEGIN;

ROLLBACK;

UPDATE basico.matricula_estudante_serie
SET
id_turma_serie = 84521932, id_situacao_matricula_serie = 1, id_curriculo_medio = 51876684
WHERE id_matricula_discente_serie IN ( 1589238, 1598037, 1654364, 1623256, 1615434, 1603460, 1599165, 1614453, 1620798, 1620508, 1611525, 1614163, 1630107, 1598161, 1598050, 1604094, 1598129, 1614143, 1640847, 1599885 ) ;

UPDATE ensino.frequencia_aluno fa_origem
SET
ativo = FALSE, id_registro_atualizacao = 8638353, data_atualizacao = now()
FROM ensino.turma turma_origem, basico.matricula_estudante_serie matricula_origem, basico.matricula_estudante_serie matricula_destino
WHERE matricula_destino.id_matricula_discente_serie IN ( 1589238, 1598037, 1654364, 1623256, 1615434, 1603460, 1599165, 1614453, 1620798, 1620508, 1611525, 1614163, 1630107, 1598161, 1598050, 1604094, 1598129, 1614143, 1640847, 1599885)
AND matricula_origem.id_estudante = matricula_destino.id_estudante
AND matricula_origem.ano_calendario = matricula_destino.ano_calendario
AND matricula_origem.id_situacao_matricula_serie = 6
AND COALESCE(matricula_origem.id_turma_serie_multisseriado, matricula_origem.id_turma_serie) <> COALESCE(matricula_destino.id_turma_serie_multisseriado, matricula_destino.id_turma_serie)
AND turma_origem.id_turma_serie = COALESCE(matricula_origem.id_turma_serie_multisseriado, matricula_origem.id_turma_serie)
AND turma_origem.id_turma = fa_origem.id_turma
AND fa_origem.id_discente = matricula_destino.id_estudante
AND fa_origem.ativo
AND EXISTS (SELECT 1
FROM ensino.frequencia_aluno fa_destino
WHERE fa_destino.id_turma = (SELECT max(turma_destino.id_turma)
FROM ensino.matricula_componente mc_destino
JOIN ensino.turma turma_destino ON
turma_destino.id_turma = mc_destino.id_turma
WHERE mc_destino.id_discente = matricula_destino.id_estudante
AND mc_destino.id_situacao_matricula = 2
AND turma_destino.id_turma_serie = COALESCE(matricula_destino.id_turma_serie_multisseriado, matricula_destino.id_turma_serie)
    AND turma_destino.id_disciplina = turma_origem.id_disciplina)
AND fa_destino.id_discente = fa_origem.id_discente
AND fa_destino.data = fa_origem.data
AND fa_destino.ativo);

UPDATE ensino.frequencia_aluno fa_origem
SET
id_turma = (SELECT max(turma_destino.id_turma)
FROM ensino.matricula_componente mc_destino
JOIN ensino.turma turma_destino ON
turma_destino.id_turma = mc_destino.id_turma
WHERE mc_destino.id_discente = matricula_destino.id_estudante
AND mc_destino.id_situacao_matricula = 2
AND turma_destino.id_turma_serie = COALESCE(matricula_destino.id_turma_serie_multisseriado, matricula_destino.id_turma_serie)
    AND turma_destino.id_disciplina = turma_origem.id_disciplina), id_registro_atualizacao = 8638353, data_atualizacao = now()
FROM ensino.turma turma_origem, basico.matricula_estudante_serie matricula_origem, basico.matricula_estudante_serie matricula_destino
WHERE matricula_destino.id_matricula_discente_serie IN ( 1589238, 1598037, 1654364, 1623256, 1615434, 1603460, 1599165, 1614453, 1620798, 1620508, 1611525, 1614163, 1630107, 1598161, 1598050, 1604094, 1598129, 1614143, 1640847, 1599885)
AND matricula_origem.id_estudante = matricula_destino.id_estudante
AND matricula_origem.ano_calendario = matricula_destino.ano_calendario
AND matricula_origem.id_situacao_matricula_serie = 6
AND COALESCE(matricula_origem.id_turma_serie_multisseriado, matricula_origem.id_turma_serie) <> COALESCE(matricula_destino.id_turma_serie_multisseriado, matricula_destino.id_turma_serie)
AND turma_origem.id_turma_serie = COALESCE(matricula_origem.id_turma_serie_multisseriado, matricula_origem.id_turma_serie)
AND turma_origem.id_turma = fa_origem.id_turma
AND fa_origem.id_discente = matricula_destino.id_estudante
AND EXISTS (SELECT 1
FROM ensino.matricula_componente mc_destino
JOIN ensino.turma turma_destino ON
turma_destino.id_turma = mc_destino.id_turma
WHERE mc_destino.id_discente = matricula_destino.id_estudante
AND mc_destino.id_situacao_matricula = 2
AND turma_destino.id_turma_serie = COALESCE(matricula_destino.id_turma_serie_multisseriado, matricula_destino.id_turma_serie)
    AND turma_destino.id_disciplina = turma_origem.id_disciplina);