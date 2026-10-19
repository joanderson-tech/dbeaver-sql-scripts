--MARIA JÚLIA DOS SANTOS BARBOSA
--202230001830

SELECT * FROM matricula.calendario_matricula where ativo = trueValue()

SELECT * FROM basico.calendario_escolar where ativo = trueValue()


SELECT * FROM matricula.calendario_matricula where ativo = falseValue(); 
SELECT * FROM basico.calendario_escolar where ativo = trueValue();
SELECT * FROM matricula.calendario_matricula where ativo = falseValue();
SELECT ano FROM basico.calendario_escolar where ativo = trueValue()