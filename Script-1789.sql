SELECT DISTINCT ei.numero_inscricao AS numInscricao, ei.id_estudante_inscrito AS idInscricao, ei.id_estudante_inscrito, u.nome AS unidade, m.nome AS municipio, e.nome AS escola, ei.nome AS estudante, ei.estudante_pre_matricula AS estudantePreMatricula, COUNT(DISTINCT ei.id_estudante_inscrito) AS idContnumInscricao, MAX(COALESCE(eioe.prioridade_pre_matricula, eioe.ordem)) AS ordem, sei.denominacao AS status, MAX(CASE WHEN ei.nee THEN 1 ELSE 0 END) AS nee, MAX(ei.data) AS DATA, MAX(ei.id_status) AS idStatus, eip.id_status AS idStatusOpcao, MAX(vs.id_vaga_serie) AS idVagaSerie, MAX(eioe.id_estudante_inscrito_opcao_escola) AS idOpcao, CASE WHEN MAX(eip.id_opcao_escola) = MAX(eioe.id_estudante_inscrito_opcao_escola)
AND MAX(eip.id_status) NOT IN (5, 8) THEN 'SELECIONADA'
ELSE 'EM ESPERA' END AS selecionada, COUNT(*) AS totalGeral
FROM matricula.estudante_inscrito ei
JOIN matricula.estudante_inscrito_opcao_escola eioe ON ei.id_estudante_inscrito = eioe.id_estudante_inscrito
LEFT JOIN matricula.estudante_inscrito_processamento eip ON eip.id_opcao_escola = eioe.id_estudante_inscrito_opcao_escola
JOIN escola.escola e 	USING(id_escola)
JOIN comum.unidade u ON u.id_unidade = e.id_regional_ensino
JOIN comum.municipio m ON m.id_municipio = e.id_municipio
JOIN matricula.calendario_matricula cm 	USING(id_calendario_matricula)
JOIN matricula.vaga_serie vs 	USING(id_vaga_serie)
JOIN basico.serie s 	USING(id_serie)
JOIN basico.etapa_ensino ee 	USING(id_etapa_ensino)
JOIN ensino.turno tu ON tu.id_turno = vs.id_turno
JOIN matricula.status_estudante_inscrito sei ON sei.id_status_estudante_inscrito = ei.id_status
WHERE 1 = 1
AND ei.id_status NOT IN (99, 11)
AND cm.ano = 2026
AND ei.cpf = 18453050430
GROUP BY u.nome, m.nome, e.nome, ei.nome, ei.numero_inscricao , sei.denominacao, eip.id_status, ei.id_estudante_inscrito
ORDER BY numInscricao DESC, ordem;

SELECT ei.nome, eioe.id_estudante_inscrito_opcao_escola, ei.id_estudante_inscrito, ei.id_status 
FROM matricula.estudante_inscrito ei
JOIN matricula.estudante_inscrito_opcao_escola eioe ON ei.id_estudante_inscrito = eioe.id_estudante_inscrito
WHERE ei.cpf in (18453050430, 18453036446);

SELECT * FROM comum.pessoa p WHERE p.cpf_cnpj = '08789931424'


-- Auto-generated SQL script #202602111035
UPDATE matricula.estudante_inscrito
	SET id_status=11
	WHERE id_estudante_inscrito=84524921;



 