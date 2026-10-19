DELETE FROM matricula.movimentacao_estudante_escola WHERE id_movimentacao_estudante_escola=70345191;


INSERT INTO matricula.movimentacao_estudante_escola (id_movimentacao_estudante_escola, id_escola_destino, id_tipo_sol_transferencia, id_solicitacao_transferencia, id_registro_entrada, "data", ativo, id_tipo_esfera_administrativa, id_matricula_estudante_serie, escola_municipal_privada, id_situacao_matricula_serie, data_cadastro, id_registro_cadastro, data_solicitacao) VALUES(70345191, 52232903, 3, NULL, 6440272, '2024-05-09', true, 1, 1498717, NULL, 6, '2024-05-09 15:24:59.099', 6440272, NULL);



-- Auto-generated SQL script #202504141507
UPDATE matricula.movimentacao_estudante_escola
	SET ativo=false
	WHERE id_movimentacao_estudante_escola=70345191;


select * from basico.matricula_estudante_serie mes where id_matricula_discente_serie = 1498717;

select * from matricula.solicitacao_transferencia st where id_matricula_discente_serie = 1498717;


select * from matricula.movimentacao_estudante_escola mee where mee.id_matricula_estudante_serie = 1498717;

1375795


UPDATE basico.matricula_estudante_serie
	SET id_situacao_matricula_serie=6
	WHERE id_matricula_discente_serie=1498717;
	
70345191