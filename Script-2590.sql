SELECT d.* FROM comum.pessoa p 
JOIN discente d ON d.id_pessoa = p.id_pessoa 
WHERE p.nome ILIKE '%ADRIAN MESSIAS DA SILVA%';


SELECT * FROM ensino.abono_frequencia af
WHERE af.id_estudante =975668;


SELECT * FROM ensino.frequencia_aluno fa 
JOIN ensino.turma t ON t.id_turma = fa.id_turma 
WHERE fa.id_discente = 975668
AND t.id_turma_serie  =52328856
AND fa.abonada ;