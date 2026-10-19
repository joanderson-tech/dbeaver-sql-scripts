-- Solução

/*
UPDATE comum.alteracao_pessoa
	SET cpf_cnpj=13644514410,id_pessoa=748308
	WHERE id_alteracao_pessoa=523235710;
*/

/*UPDATE educacenso.educacenso_pessoa
	SET id_pessoa=748308
	WHERE id_educacenso_pessoa=99;*/

/*UPDATE basico.estudante_documento_pendente
	SET id_estudante=975324
	WHERE id_estudante_documento_pendente=51927064;*/

/*UPDATE basico.matricula_estudante_serie
	SET id_estudante=975324
	WHERE id_matricula_discente_serie=1319734;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=975324
	WHERE id_matricula_discente_serie=1321141;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=975324
	WHERE id_matricula_discente_serie=1323122;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=975324
	WHERE id_matricula_discente_serie=1325474;*/

/*UPDATE matricula.renovacao_matricula
	SET id_discente=975324
	WHERE id_renovacao_matricula=52255025;
UPDATE matricula.renovacao_matricula
	SET id_discente=975324
	WHERE id_renovacao_matricula=52027970;
UPDATE matricula.renovacao_matricula
	SET id_discente=975324
	WHERE id_renovacao_matricula=52121450;*/

/*UPDATE diario.competencia_habilidades_aluno
	SET id_discente=975324
	WHERE id=41210;
UPDATE diario.competencia_habilidades_aluno
	SET id_discente=975324
	WHERE id=41518;*/
WITH linhas_para_atualizar AS (
  SELECT * 
  FROM ensino.frequencia_aluno 
  WHERE id_discente = 976892
)
UPDATE ensino.frequencia_aluno
SET id_discente = 975324
FROM linhas_para_atualizar
WHERE ensino.frequencia_aluno.id_frequencia = linhas_para_atualizar.id_frequencia;
WITH matriculas_para_atualizar AS (
  SELECT * 
  FROM ensino.matricula_componente 
  WHERE id_discente = 976892
)
UPDATE ensino.matricula_componente
SET id_discente = 975324
FROM matriculas_para_atualizar
WHERE ensino.matricula_componente.id_matricula_componente = matriculas_para_atualizar.id_matricula_componente;

/*UPDATE basico.estudante
	SET escola_anterior='CMEI GERALDO CÂMARA',id_serie_ingresso=1005218
	WHERE id_estudante=975324;

UPDATE public.discente
	SET data_cadastro='2022-03-25 14:40:22.454',ano_ingresso=2022,matricula='202230001106',id_registro_entrada=5625857,id_foto=9012261
	WHERE id_discente=975324;*/


select * from basico.matricula_estudante_serie mes where mes.id_situacao_matricula_serie = 1;
