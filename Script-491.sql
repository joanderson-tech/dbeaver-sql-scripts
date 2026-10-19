select * from basico.matricula_estudante_serie mes where mes.id_matricula_discente_serie = 1571803;

-- 1151876220

select * from ensino_infantil.relatorio_avaliativo where id_matricula_discente_serie = 1570078;


UPDATE ensino_infantil.relatorio_avaliativo
	SET ativo=false
	WHERE id_relatorio_avaliativo=74109;



UPDATE ensino_infantil.relatorio_avaliativo
	SET ativo=True
	WHERE id_relatorio_avaliativo=74109;

