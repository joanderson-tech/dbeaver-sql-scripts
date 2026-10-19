SELECT itens2_.texto
FROM matricula.calendario_matricula calendario0_
INNER JOIN matricula.orientacao_matricula orientacao1_ ON
calendario0_.id_orientacao_matricula = orientacao1_.id_orientacao_matricula
INNER JOIN matricula.item_orientacao_matricula itens2_ ON
orientacao1_.id_orientacao_matricula = itens2_.id_orientacao_matricula
WHERE calendario0_.id_calendario_matricula =51883356
AND itens2_.id_tipo_ocupacao_vaga =4
AND itens2_.destino_informacao = 'F'