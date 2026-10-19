//Questão 2

SELECT p.nome, s.id_servidor, vh.id_vaga_historico, vh.data_inicio, vh.data_fim 
FROM comum.pessoa p
JOIN rh.servidor s on p.id_pessoa = s.id_pessoa
JOIN pessoas.vaga_historico vh ON s.id_servidor = vh.id_servidor 
where p.nome = 'RONIS SILVA DE MACEDO'and s.id_ativo =1;



//Questão 2

SELECT *
FROM escola.escola e 
JOIN ensino.turno t on



SELECT *
FROM ensino.turma t 


SELECT *
FROM ensino.turno t 

SELECT *
FROM escola.escola e 