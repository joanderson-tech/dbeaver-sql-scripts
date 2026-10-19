SELECT tov.*
FROM matricula.tipo_ocupacao_vaga AS tov;

SELECT tov.*
FROM matricula.tipo_ocupacao_vaga AS tov
WHERE id_tipo_ocupacao_vaga <> 5

SELECT *
FROM matricula.listagem_processamento_matricula
WHERE id_tipo_ocupacao_vaga = 5;

SELECT *
FROM matricula.renovacao_matricula_resultado rmr
JOIN matricula.listagem_processamento_renovacao_matricula lpr ON lpr.id_listagem_processamento_renovacao_matricula = 
rmr.id_listagem_processamento_renovacao_matricula
JOIN matricula.tipo_ocupacao_vaga tov ON tov.id_tipo_ocupacao_vaga = lpr.id_tipo_ocupacao_vaga
WHERE tov.id_tipo_ocupacao_vaga = 2;

UNION ALL

SELECT e.nome AS escola, p.nome,  tst.denominacao 
FROM basico.matricula_estudante_serie mes 
JOIN matricula.movimentacao_estudante_escola mee ON mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie 
JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie 
JOIN escola.escola e ON e.id_escola = ts.id_escola 
JOIN discente d ON d.id_discente = mes.id_estudante 
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
JOIN matricula.tipo_solicitacao_transferencia tst ON tst.id_tipo_solicitacao_transferencia = mee.id_tipo_sol_transferencia 
--WHERE st.ano_escolar = 2025
--AND s.id_escola;


SELECT * FROM matricula.movimentacao_estudante_escola;
WHERE eip.id_status;


SELECT *
FROM matricula.solicitacao_transferencia st 
where st.id_tipo = 1;

SELECT * 









