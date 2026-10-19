select d.* from basico.matricula_estudante_serie mes 
join discente d on d.id_discente = mes.id_estudante 
join comum.pessoa p on p.id_pessoa = d.id_pessoa 
where p.id_pessoa in (752084, 753679); --p.nome ilike 'JEMYSON WESLEY MELO DOS SANTOS';


-- IdPessoa recente Atualizado 753679
-- antigo 752084

SELECT *
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
WHERE fa.id_discente = 980526
AND fa."data" >= '2025-08-01' AND fa."data" <= '2025-08-30'
AND fa.frequencia >= 1;
AND t.id_disciplina = 220;

SELECT TO_CHAR(fa."data", 'YYYY-MM') AS mes_referencia, SUM(fa.frequencia) AS frequencia_total_mes
FROM ensino.frequencia_aluno fa
JOIN
    ensino.turma t ON
t.id_turma = fa.id_turma
WHERE fa.id_discente = 980526
AND fa.frequencia >= 1
GROUP BY
    mes_referencia
ORDER BY
    mes_referencia;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie IN (53521914, 53233270) ;

--53521914 ok
53233270


select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma = 708670;

WITH docente_turma_view AS ( SELECT dt.id_docente, dt.id_turma, dt.ativo, ROW_NUMBER() OVER(ORDER BY dt.data_fim DESC) AS ordem
FROM ensino.docente_turma dt
WHERE dt.id_turma = ?
AND dt.ativo)SELECT DISTINCT ie.id_interrupcao_escola
FROM ensino.interrupcao_escola_professor iep
JOIN ensino.interrupcao_escola ie
	USING (id_interrupcao_escola)
JOIN docente_turma_view dtv ON
dtv.id_docente = iep.id_professor
AND dtv.ordem = 1
WHERE dtv.id_turma = ?
AND (ie.id_turno IS NULL
	OR ie.id_turno = ? )
AND dtv.ativo


SELECT fa.id_turma, CAST(fa."data" AS TEXT) AS data_aula, LEAST (COALESCE(sum(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0), COALESCE(ae.numero_aulas, fa.horarios)) AS faltas, COALESCE(ae.numero_aulas, fa.horarios) AS horarios
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
LEFT JOIN ava.aula_extra ae ON
ae.id_turma = t.id_turma
AND ae.data_aula = fa."data"
WHERE fa.ativo
AND fa.id_discente = 980526
AND t.id_turma_serie = 53521914
--AND t.id_situacao_turma != 4
GROUP BY fa.id_turma, fa."data", fa.frequencia, fa.horarios, ae.numero_aulas
ORDER BY data_aula;



[
[Fevereiro, 100, 0, 20],
[Março, 100, 0, 72],
[Abril, 98, 8, 80],
[Maio, 96, 4, 84],
[Junho, 100, 0, 52],
[Julho, 90, 8, 76],
[Agosto, 95, 2, 84],
[Setembro, 100, 0, 32]



SELECT CAST(EXTRACT(MONTH FROM fa."data") AS int) AS mes, CAST(sum(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END) AS int) AS faltas, CAST(sum(COALESCE(iaf.quantidade_faltas_abonadas, 0)) AS int) AS abonadas, CAST(count(fa.id_motivo_baixa_frequencia) AS int) AS justificadas
FROM ensino.frequencia_aluno fa
LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
JOIN ensino.turma t ON t.id_turma = fa.id_turma
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
WHERE fa.id_discente = 980526
AND (fa.ativo
	OR fa.abonada)
AND t.ano = 2025
AND ts.id_escola = 1820
AND t.id_situacao_turma <>4
GROUP BY 1
ORDER BY 1;
]