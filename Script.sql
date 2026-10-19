SELECT e.nome AS nome_escola, COUNT(*) AS total_professores
FROM ensino.docente_turma dt
JOIN ensino.turma t ON dt.id_turma = t.id_turma
JOIN basico.turma_serie ts ON t.id_turma_serie = ts.id_turma_serie
JOIN escola.escola e ON ts.id_escola = e.id_escola
WHERE t.ano = 2023 
and t.id_situacao_turma  IN (1, 3)
AND CURRENT_DATE BETWEEN t.data_inicio AND t.data_fim
GROUP BY e.nome;

select *
FROM ensino.turma


select e.nome 
FROM ensino.docente_turma dt 
JOIN ensino.turma t on dt.id_turma = t.id_turma 
JOIN basico.turma_serie ts on t.id_turma_serie  = ts.id_turma_serie 
JOIN escola.escola e on ts.id_escola = e.id_escola 
WHERE t.ano = 2023;


//Questão 5


//rh.servidor só se relaciona com pessoa
//ensino.docente_turma só se relaciona com turma

select t.codigo , dt.id_docente_turma , t.id_turma , dt.data_inicio, dt.data_fim
FROM ensino.docente_turma dt
JOIN ensino.turma t ON dt.id_turma = t.id_turma
JOIN rh.servidor s ON dt.id_registro_cadastro = s.id_registro_cadastro
inner JOIN comum.pessoa p ON s.id_pessoa = p.id_pessoa
WHERE t.codigo = 'EIPREMPEVC';


//Esse código retorna 4 elementos

select t.codigo , dt.id_docente_turma , t.id_turma , dt.data_inicio, dt.data_fim
FROM ensino.docente_turma dt
JOIN ensino.turma t ON dt.id_turma = t.id_turma 
WHERE t.codigo = 'EIPREMPEVC';


select t.codigo , dt.id_docente_turma , t.id_turma , dt.data_inicio, dt.data_fim
FROM comum.pessoa p 
JOIN rh.servidor s on p.id_pessoa = s.id_pessoa 
JOIN ensino.docente_turma dt on s.id_registro_cadastro = dt.id_registro_cadastro 
JOIN ensino.turma t ON dt.id_turma = t.id_turma 
WHERE p.nome = 'ANGELA MARIA DANTAS CHIANCA' AND t.codigo = 'EIPREMPEVC';



