select * from basico.matricula_estudante_serie mes where id_matricula_discente_serie = 1498717;

select * from matricula.solicitacao_transferencia st where id_matricula_discente_serie = 1498717;


select * from matricula.movimentacao_estudante_escola mee where mee.id_matricula_estudante_serie = 1498717;

1375795

















UPDATE basico.matricula_estudante_serie
	SET id_situacao_matricula_serie=6
	WHERE id_matricula_discente_serie=1498717;
	
70345191