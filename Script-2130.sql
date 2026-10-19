SELECT s.id_serie
FROM basico.serie s
WHERE s.ativo
AND s.exige_carga_horaria_por_componente ;

SELECT *
--SUM(cbc.ch_ano ) 
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico = 52369693
AND cbc.optativa;

SELECT *
FROM basico.curriculo_basico
WHERE codigo = 'INT-I'


SELECT *
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio = 52369693;

SELECT *
FROM comum.pessoa
WHERE cpf_cnpj = '70933518404';

SELECT mes.id_matricula_discente_serie, mes.ano_calendario , mes.id_situacao_matricula_serie, ts.id_turma_serie, s.id_serie, s.descricao
FROM discente d
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN basico.turma_serie ts ON
ts.id_turma_serie = mes.id_turma_serie
JOIN basico.serie s ON
s.id_serie = ts.id_serie
WHERE d.id_pessoa = 746681;

SELECT t.id_disciplina, cc.nome
FROM ensino.turma t
JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = t.id_disciplina
WHERE t.id_turma_serie = 52370211
AND t.id_situacao_turma = 3;
1317359


SELECT * FROM basico.serie s WHERE s.id_serie = 15289982;

SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_turma_serie = 52370211;

SELECT * FROM ensino.matricula_componente mc WHERE mc.id_matricula_estudante_serie IN (1324789,1324812 ) ORDER BY mc.id_matricula_estudante_serie, mc.id_componente_curricular 



-- Auto-generated SQL script #202604061052
UPDATE ensino.matricula_componente
	SET id_situacao_matricula=2
	WHERE id_matricula_componente IN (17111106, 17110236, 17110237, 17110239, 17110235);



229	Arte
223	Ciências
238	Educação Física
230	Ensino Religioso
225	Geografia

224	História
221	Língua Portuguesa
222	Matemática


546	Futsal e vôlei
227	Língua Inglesa
471	Recreação
554	Reforço de Língua Portuguesa





