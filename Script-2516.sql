SELECT DISTINCT ht.*
FROM basico.turma_serie ts
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
JOIN ensino.frequencia_aluno fa ON
fa.id_turma = t.id_turma
JOIN ensino.horario_turma ht ON
ht.id_turma = t.id_turma
WHERE ts.id_escola = 1094;

ts.nome = 'EIPREMEIP4A'
AND ts.ano = 2026
AND ts.id_escola = 1094;

SELECT *
FROM ensino.docente_turma dt
WHERE dt.id_turma = 704129
AND dt.ativo ;


SELECT * FROM basico.turma_serie ts WHERE ts.tipo_diario = 31;


-- Auto-generated SQL script #202607071526
UPDATE ensino.docente_turma
    SET data_inicio='2026-05-20 00:00:00.000 -0300'
    WHERE id_docente_turma=53442515;


SELECT p.nome,*
FROM rh.servidor s
JOIN comum.pessoa p ON
p.id_pessoa = s.id_pessoa
WHERE s.id_servidor IN (294, 405, 405);


-- Auto-generated SQL script #202607071010
UPDATE ensino.docente_turma
SET
ativo = TRUE
WHERE id_docente_turma = 53255756;

SELECT DISTINCT rfp
FROM ensino.registro_falta_professor rfp
JOIN ensino.docente_turma dt ON
dt.id_docente_turma = rfp.id_docente_turma
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
WHERE t.id_turma = 704129
AND rfp.id_professor_substituto = 405
AND rfp.ativo = TRUE
AND rfp.id_professor_substituto IS NOT NULL
AND rfp.data_aula BETWEEN '026-02-23' AND '2026-12-21';

SELECT CASE WHEN COUNT(rfp.id_professor_substituto ) > 0 THEN true ELSE false END
        FROM ensino.registro_falta_professor rfp
        WHERE rfp.id_docente_turma = 53255756
            AND rfp.id_professor_substituto  = 405
            AND rfp.ativo = TRUE;

SELECT ta1_0.id_topico_aula, ta1_0.ativo, ta1_0.aula_cancelada, ta1_0.id_aula_extra, ta1_0.bimestral, ta1_0.bimestre, ta1_0.conteudo, ta1_0.conteudo_ministrado, ta1_0.data, ta1_0.data_cadastro, ta1_0.descricao, ta1_0.fim, h1_0.id_topico_aula, h1_1.id_habilidade_competencia, ac1_0.id_area_conhecimento, ac1_0.descricao, h1_1.ativo, h1_1.data_cadastro, h1_1.descricao, e1_0.id_eixo, e1_0.id_area_conhecimento, e1_0.ativo, e1_0.descricao, h1_1.habilitado_para_conteudo_ministrado, ta1_0.metodologia, ta1_0.necessita_correcao, ta1_0.observacoes, ta1_0.programado, ta1_0.quantidade_aulas, ta1_0.replica_conteudo, ta1_0.id_topico_pai, ta1_0.id_turma, ta1_0.id_usuario, ta1_0.visivel
FROM ava.topico_aula ta1_0
LEFT JOIN (ava.topico_aula_habilidade h1_0
JOIN ensino_infantil.habilidade_competencia h1_1 ON
h1_1.id_habilidade_competencia = h1_0.id_habilidade_competencia) ON
ta1_0.id_topico_aula = h1_0.id_topico_aula
AND ( h1_1.ativo = TRUE)
AND ( h1_1.ativo = TRUE)
LEFT JOIN ensino_infantil.area_conhecimento ac1_0 ON
ac1_0.id_area_conhecimento = h1_1.id_area_conhecimento
LEFT JOIN ensino_infantil.eixo e1_0 ON
e1_0.id_eixo = h1_1.id_eixo
WHERE ta1_0.id_turma = 704129;
AND ta1_0.programado = FALSE
AND ta1_0.ativo = TRUE
