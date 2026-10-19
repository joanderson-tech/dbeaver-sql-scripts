SELECT ei.nome, e.nome
FROM matricula.estudante_inscrito ei
--JOIN matricula.estudante_inscrito_processamento eip ON eip.id_estudante_inscrito = ei.id_estudante_inscrito 
join matricula.estudante_inscrito_opcao_escola eioe ON eioe.id_estudante_inscrito = ei.id_estudante_inscrito 
JOIN escola.escola e ON e.id_escola = eioe.id_escola 
WHERE ei.possui_irmao_gemeo
AND ei.id_calendario_matricula = 83879888;
AND e.nome = 'CRECHE NOSSA INFANCIA PROFESSORA ISABEL CRISTINA DE OLIVEIRA';


SELECT *
FROM matricula.estudante_inscrito ei
WHERE ei.nome ILIKE '%ana julia silva%'
AND ei.id_calendario_matricula = 83879888;