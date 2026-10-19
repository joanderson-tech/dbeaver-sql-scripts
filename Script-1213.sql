select mes.* from basico.matricula_estudante_serie mes 
join discente d on d.id_discente = mes.id_estudante 
join comum.pessoa p on p.id_pessoa = d.id_pessoa 
where p.id_pessoa = 753679; --p.nome ilike 'JEMYSON WESLEY MELO DOS SANTOS';


-- IdPessoa recente Atualizado 753679
-- antigo 752084

select SUM(fa.frequencia) from ensino.frequencia_aluno fa
join ensino.turma t on t.id_turma = fa.id_turma 
where fa.id_discente = 980526 
and fa."data" >= '2025-04-01' AND fa."data" <= '2025-04-30'
and fa.frequencia >=1
and t.id_disciplina = 220;

--53521914 ok
53233270
