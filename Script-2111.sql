SELECT permite_multiplos_professores_polivalente, cbc.*
FROM basico.curriculo_basico c
JOIN basico.curriculo_basico_componente cbc ON cbc.id_curriculo_basico = c.id_curriculo_basico 
WHERE c.id_curriculo_basico IN (58381382, 58381388, 58381394);
