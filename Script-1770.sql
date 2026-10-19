--JOAO GUILHERME DA SILVA SOUZA - 184.530.364-46 
--PEDRO LUCAS DA SILVA SOUZA - 184.530.504-30


SELECT DISTINCT ei.numero_inscricao AS numInscricao, ei.id_estudante_inscrito AS idInscricao, ei.id_estudante_inscrito, u.nome AS unidade, 
m.nome AS municipio, e.nome AS escola, ei.nome AS estudante, ei.estudante_pre_matricula AS estudantePreMatricula, 
COUNT(DISTINCT ei.id_estudante_inscrito) AS idContnumInscricao, MAX(COALESCE(eioe.prioridade_pre_matricula, eioe.ordem)) AS ordem, 
sei.denominacao AS status, MAX(CASE WHEN ei.nee THEN 1 ELSE 0 END) AS nee, MAX(ei.data) AS DATA, MAX(ei.id_status) AS idStatus,
eip.id_status AS idStatusOpcao, MAX(vs.id_vaga_serie) AS idVagaSerie, MAX(eioe.id_estudante_inscrito_opcao_escola) AS idOpcao, 
CASE WHEN MAX(eip.id_opcao_escola) = MAX(eioe.id_estudante_inscrito_opcao_escola)
AND MAX(eip.id_status) NOT IN (5, 8) THEN 'SELECIONADA'
ELSE 'EM ESPERA' END AS selecionada, COUNT(*) AS totalGeral
FROM matricula.estudante_inscrito ei
JOIN matricula.estudante_inscrito_opcao_escola eioe ON
ei.id_estudante_inscrito = eioe.id_estudante_inscrito
LEFT JOIN matricula.estudante_inscrito_processamento eip ON
eip.id_opcao_escola = eioe.id_estudante_inscrito_opcao_escola
JOIN escola.escola e
	USING(id_escola)
JOIN comum.unidade u ON
u.id_unidade = e.id_regional_ensino
JOIN comum.municipio m ON
m.id_municipio = e.id_municipio
JOIN matricula.calendario_matricula cm
	USING(id_calendario_matricula)
JOIN matricula.vaga_serie vs
	USING(id_vaga_serie)
JOIN basico.serie s
	USING(id_serie)
JOIN basico.etapa_ensino ee
	USING(id_etapa_ensino)
JOIN ensino.turno tu ON
tu.id_turno = vs.id_turno
JOIN matricula.status_estudante_inscrito sei ON
sei.id_status_estudante_inscrito = ei.id_status
WHERE 1 = 1
AND ei.id_status NOT IN (99, 11)
AND cm.ano = 2026
AND ei.cpf in(18453036446,18453050430 ) 
GROUP BY u.nome, m.nome, e.nome, ei.nome, ei.numero_inscricao , sei.denominacao, eip.id_status, ei.id_estudante_inscrito
ORDER BY numInscricao DESC, ordem;


SELECT ei.id_status, ei.* FROM matricula.estudante_inscrito ei 
JOIN matricula.estudante_inscrito_opcao_escola eioe ON
ei.id_estudante_inscrito = eioe.id_estudante_inscrito
WHERE ei.id_calendario_matricula = 83879888
AND ei.cpf in(18453036446,18453050430 ) ;


ei.cpf = 18453036446 ;



SELECT p.nome, d.matricula, e.nome 
FROM basico.matricula_estudante_serie mes2025
JOIN basico.turma_serie ts ON ts.id_turma_serie = mes2025.id_turma_serie 
JOIN escola.escola e ON e.id_escola = ts.id_escola 
JOIN discente d ON d.id_discente = mes2025.id_estudante 
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
WHERE mes2025.ano_calendario = 2025
AND mes2025.id_situacao_matricula_serie = 2
  AND NOT EXISTS (
      SELECT 1
      FROM basico.matricula_estudante_serie mes2026
      WHERE mes2026.id_estudante = mes2025.id_estudante
        AND mes2026.ano_calendario = 2026
  );