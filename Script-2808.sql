select p.nome,
        u.login
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and p.nome ilike '%EDJAKSON TADEU COSTA ALVES%';


select DISTINCT dt.id_turma, dt.* 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and p.nome ilike '%EDJAKSON TADEU COSTA ALVES%'
    AND t.ano = 2026;


SELECT ts.* 
FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
WHERE t.id_turma IN (683423, 683432, 683441, 683450, 683459, 683468, 683477, 683486, 683495, 683504)
AND t.id_turma_serie IN (51896905, 51896919 ,51896929, 51896941);

SELECT ts.* 
FROM basico.turma_serie ts 
WHERE ts.id_escola = 51877802;



SELECT DISTINCT ts.* 
FROM ensino.turma t 
JOIN ensino.horario_turma ht ON t.id_turma = ht.id_turma 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
WHERE t.id_turma_serie IN (51896941,51896929);



SELECT ta.* 
FROM ensino.turma t 
JOIN ava.topico_aula ta ON ta.id_turma = t.id_turma 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
WHERE t.id_turma_serie IN (51896905, 51896919 ,51896929, 51896941)
AND t.id_disciplina = 238;


SELECT * FROM basico.turma_serie ts
WHERE ts.nome = 'EFAFV7C'
AND ts.id_escola = 51877802;


SELECT DISTINCT (ta.id_topico_aula),
    t.id_turma,
    ts.id_turma_serie,
    ta.id_topico_aula,
    ta.data AS data_topico_aula,
    -- Converte a data do tópico para o número do dia da semana (Segunda = 2, Terça = 3, etc.)
    (EXTRACT(ISODOW FROM ta.data) + 1) AS dia_semana_topico,
    ht.dia AS dia_horario_turma,
    ht.hora_inicio,
    ht.hora_fim
FROM ensino.turma t 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
JOIN ensino.horario_turma ht ON t.id_turma = ht.id_turma 
JOIN ava.topico_aula ta ON ta.id_turma = t.id_turma 
WHERE t.id_turma_serie IN (51896905)
  -- Seleciona apenas os registros em que o dia do tópico é DIFERENTE do dia do horário
  AND (EXTRACT(ISODOW FROM ta.data) + 1) ::text <> ht.dia;
  
  
  SELECT 
    t.id_turma,
    ts.id_turma_serie,
    ta.id_topico_aula,
    ta.data AS data_topico_aula,
    -- Converte a data do tópico para o número do dia da semana (Segunda = 2, Terça = 3, etc.)
    (EXTRACT(ISODOW FROM ta.data) + 1) AS dia_semana_topico
FROM ensino.turma t 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
JOIN ava.topico_aula ta ON ta.id_turma = t.id_turma 
WHERE t.id_turma_serie IN (51896905)
  -- Verifica se o dia do tópico NÃO EXISTE em NENHUM horário daquela turma
  AND NOT EXISTS (
      SELECT 1 
      FROM ensino.horario_turma ht 
      WHERE ht.id_turma = t.id_turma 
        AND ht.dia = (EXTRACT(ISODOW FROM ta.data) + 1)::text
  );


