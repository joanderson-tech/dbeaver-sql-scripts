select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo
    AND t.ano = 2026
    AND t.id_turma_serie = 51956346;

    AND p.nome ILIKE 'MARIANA MEDEIROS'
    
and u.login = '%m.graca251@outlook.com%'


ALTER TABLE rh.cargo ADD COLUMN IF NOT EXISTS acesso_reduzido_portal_professor BOOLEAN DEFAULT FALSE NOT NULL;


SELECT t.id_turma_serie, T.codigo  FROM ensino.turma t WHERE t.ano = 2026 AND t.id_disciplina = 225 AND t.id_situacao_turma <>3;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 51956346;

SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_turma_serie =  51956346;


SELECT * FROM ensino.frequencia_aluno fa WHERE fa.id_discente = 974147;


SELECT * FROM basico.motivo_baixa_frequencia mbf WHERE mbf.id_motivo_baixa_frequencia = 183490;



UPDATE ensino.frequencia_aluno SET "data"='2026-02-10', frequencia=1, horarios=1, id_turma=688136, id_discente=974147, data_cadastro='2026-05-12 08:56:38.127', 
id_registro_cadastro=NULL, data_atualizacao='2026-05-12 09:13:37.846', id_registro_atualizacao=NULL, ativo=true, atual=0, id_motivo_baixa_frequencia=183490, 
abonada=true, id_event_log=NULL, id_motivo_inativacao=NULL, abonada_escola=NULL, via_reconhecimento_facial=NULL WHERE id_frequencia=136940897;



UPDATE ensino.frequencia_aluno SET "data"='2026-02-03', frequencia=1, horarios=1, id_turma=688136, id_discente=974147, data_cadastro='2026-07-08 15:05:31.051', id_registro_cadastro=6016841, data_atualizacao=NULL, id_registro_atualizacao=NULL, ativo=true, atual=0, id_motivo_baixa_frequencia=NULL, abonada=false, id_event_log=NULL, id_motivo_inativacao=NULL, abonada_escola=NULL, via_reconhecimento_facial=false WHERE id_frequencia=136940896;
UPDATE ensino.frequencia_aluno SET "data"='2026-02-10', frequencia=1, horarios=1, id_turma=688136, id_discente=974147, data_cadastro='2026-07-08 15:06:24.187', id_registro_cadastro=6016841, data_atualizacao=NULL, id_registro_atualizacao=NULL, ativo=true, atual=0, id_motivo_baixa_frequencia=NULL, abonada=false, id_event_log=NULL, id_motivo_inativacao=NULL, abonada_escola=NULL, via_reconhecimento_facial=false WHERE id_frequencia=136940897;




SELECT freq.id_frequencia, freq.data, freq.frequencia, freq.id_turma, t.id_disciplina, cc.nome, freq.id_discente, d.id_pessoa, p.nome, mbf.codigo, freq.ativo, freq.horarios, freq.id_motivo_baixa_frequencia
FROM ensino.frequencia_aluno freq
INNER JOIN ensino.turma t ON
freq.id_turma = t.id_turma
INNER JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = t.id_disciplina
INNER JOIN public.discente d ON
d.id_discente = freq.id_discente
INNER JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
LEFT JOIN basico.motivo_baixa_frequencia mbf ON mbf.id_motivo_baixa_frequencia = freq.id_motivo_baixa_frequencia
WHERE freq.id_discente = 974147
AND t.ano = 2026
AND freq.ativo
AND (freq.abonada = FALSE OR freq.abonada IS NULL)
AND freq.frequencia > 0
AND t.id_turma_serie = 51956346
--AND mbf.ativo
ORDER BY freq.data, cc.nome;
