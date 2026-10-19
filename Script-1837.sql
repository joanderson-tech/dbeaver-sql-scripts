SELECT *
FROM comum.pessoa p
WHERE p.id_pessoa IN (51881931, 756724);

SELECT * FROM discente d WHERE d.matricula = '202430020878';

SELECT *
FROM discente d
WHERE d.id_pessoa IN (51881931, 756724);

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante IN (975797, 988862);


UPDATE comum.pessoa SET codigo_sus = '', codigo_nis = '23810740280', nome = 'MANUELLA CRUZ BATISTA', nome_ascii = 'MANUELLA CRUZ BATISTA', cpf_cnpj = 13369126427, data_nascimento = '2015-06-21'
WHERE id_pessoa = 51881931;


--backup
UPDATE comum.pessoa SET codigo_sus = '704504318042610', codigo_nis = '21356612387',
nome = 'MARCELLA CRUZ BATISTA', nome_ascii = 'MARCELLA CRUZ BATISTA',
cpf_cnpj = 17965481464, 
data_nascimento = '2021-12-15'
WHERE id_pessoa = 51881931;

/*Matrícula: 202430020878
Série: 1º Ano
CPF: 179.654.814-64
Aluno: MARCELLA CRUZ BATISTA
Data de Nascimento: 15/12/2021

Matrícula: 202251881931
Série: 5º Ano
CPF: 133.691.264-27
Aluno: MANUELLA CRUZ BATISTA
Data de Nascimento: 21/06/2015*/
---id_discente 975797 matricula 202251881931 pessoa 51881931 MANUELLA CRUZ BATISTA cpf diferente  data nascimento diferente 