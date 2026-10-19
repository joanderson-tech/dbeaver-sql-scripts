SELECT DISTINCT fa."data"
FROM ensino.frequencia_aluno fa
JOIN ( SELECT mes.id_estudante
FROM basico.matricula_estudante_serie mes
JOIN ensino.turma t ON
t.id_turma_serie = mes.id_turma_serie
WHERE t.id_situacao_turma <> 4
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
AND t.id_turma = 683743 ) AS mes ON
mes.id_estudante = fa.id_discente
WHERE fa.ativo
AND (fa.abonada IS NULL
	OR fa.abonada = FALSE)
AND fa.id_turma = 683743
ORDER BY fa."data";


A aula do dia Thu Aug 28 00:00:00 GFT 2025 não possui lançamento.


SELECT * FROM ensino.registro_falta_professor rfp  WHERE rfp.id_docente_turma = 51892405;



SELECT * FROM ensino.docente_turma dt WHERE dt.id_turma = 683743;

ALTER TABLE comum.pessoa ADD COLUMN IF NOT EXISTS quilombola bool DEFAULT false NULL;


ALTER TABLE comum.pessoa
    ADD COLUMN IF NOT EXISTS id_tipo_etnia int4 NULL;

ERROR: column pessoa2_.id_tipo_etnia does not exist