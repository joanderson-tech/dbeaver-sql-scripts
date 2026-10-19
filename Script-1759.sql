SELECT tipo
FROM matricula.estudante_inscrito
WHERE estudante_cadastro_reserva ;

SELECT *
FROM matricula.listagem_processamento_matricula;

SELECT  *
FROM matricula.solicitacao_transferencia st ;

SELECT tov.*
FROM matricula.tipo_ocupacao_vaga AS tov;
WHERE id_tipo_ocupacao_vaga = 5

SELECT st.*
FROM matricula.solicitacao_transferencia st
LEFT JOIN matricula.solicitacao_transferencia_processamento stp 	USING (id_solicitacao_transferencia) 
LEFT JOIN matricula.listagem_solicitacao_transferencia_processamento l 	USING (id_listagem_solicitacao_transferencia_processamento)
LEFT JOIN matricula.tipo_ocupacao_vaga tov	USING (id_tipo_ocupacao_vaga);