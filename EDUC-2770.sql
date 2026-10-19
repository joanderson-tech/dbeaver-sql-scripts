SELECT ei.id_status, ei.* FROM matricula.estudante_inscrito ei 
JOIN matricula.estudante_inscrito_opcao_escola eioe ON
ei.id_estudante_inscrito = eioe.id_estudante_inscrito
WHERE ei.id_calendario_matricula = 83879888
AND ei.cpf in(18453036446,18453050430 ) ;