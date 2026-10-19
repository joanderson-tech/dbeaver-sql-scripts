
SELECT * FROM comum.pessoa p WHERE p.nome = 'JOSÉ HENRIQUE DA SILVA NEGREIROS';


SELECT * FROM discente d WHERE d.id_pessoa IN (755091,750066);

SELECT * FROM 

SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_estudante IN (976751, 981716) 
AND mes.ano_calendario = 2026;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 54285070;

SELECT  * --fa."data", fa.id_motivo_baixa_frequencia, fa.abonada  
FROM ensino.frequencia_aluno fa WHERE fa.id_discente = 981716 
AND fa.id_turma = 713695 AND fa."data" = '2026-05-12';


-- Auto-generated SQL script #202607131006
UPDATE ensino.frequencia_aluno
    SET abonada=false,id_motivo_baixa_frequencia=NULL
    WHERE id_frequencia=151573791;


UPDATE ensino.frequencia_aluno
    SET abonada=true,id_motivo_baixa_frequencia=183380
    WHERE id_frequencia=151573791;




select p.nome,u.id_usuario, 
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma = 713695; 
    


SELECT * FROM basico.motivo_baixa_frequencia mbf WHERE mbf.id_motivo_baixa_frequencia = 183380;



SELECT freq.id_frequencia, freq.data, freq.frequencia, freq.id_turma, t.id_disciplina, cc.nome, freq.id_discente, d.id_pessoa, p.nome, mbf.codigo, freq.ativo, mbf.ativo, freq.horarios, freq.id_motivo_baixa_frequencia
FROM ensino.frequencia_aluno freq
INNER JOIN ensino.turma t ON freq.id_turma = t.id_turma
INNER JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina
INNER JOIN public.discente d ON d.id_discente = freq.id_discente
INNER JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
LEFT JOIN basico.motivo_baixa_frequencia mbf ON mbf.id_motivo_baixa_frequencia = freq.id_motivo_baixa_frequencia
WHERE freq.id_discente = 981716
AND t.ano = 2026
AND freq.ativo
AND (freq.abonada = FALSE OR freq.abonada IS NULL)
AND freq.frequencia > 0
AND t.id_turma_serie = 54285070
--AND mbf.ativo
AND t.id_turma = 713695
ORDER BY freq.data, cc.nome;