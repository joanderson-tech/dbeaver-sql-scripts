SELECT *
FROM diario.limite_lancamento_notas;

SELECT p.nome, u.login, t.codigo, t.id_disciplina, e.nome
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
JOIN rh.servidor s ON
s.id_pessoa = p.id_pessoa
JOIN ensino.docente_turma dt ON
dt.id_docente = s.id_servidor
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
JOIN basico.turma_serie ts ON
TS.id_turma_serie = t.id_turma_serie
JOIN escola.escola e ON
e.id_escola = ts.id_escola
WHERE dt.ativo
AND t.ano = 2026
ORDER BY p.nome;

SELECT *
FROM diario.limite_lancamento_notas limitelanc0_
WHERE limitelanc0_.id_escola =-1;

INSERT INTO diario.limite_lancamento_notas (id_limite_lancamento_notas, ativo, bloquear_dias_futuros, 
data_limite, id_escola, permitir_modificacao, id_registro_entrada, unidade) SELECT nextval('hibernate_sequence'), 
FALSE, FALSE, NULL, e.id_escola, TRUE,:idRegistroEntrada, bimestres.unidade
FROM escola.escola e
JOIN comum.unidade ue ON
e.id_unidade_escola = ue.id_unidade
CROSS JOIN (SELECT 1 AS unidade
UNION SELECT 2
UNION SELECT 3
UNION SELECT 4) bimestres
WHERE ue.ativo = TRUE
AND NOT EXISTS ( SELECT 1
FROM diario.limite_lancamento_notas lln
WHERE lln.id_escola = e.id_escola )


SELECT * FROM escola.escola e WHERE e.id_escola = 51890129;



-- Auto-generated SQL script #202608061607
UPDATE diario.limite_lancamento_notas
    SET bloquear_dias_futuros=true,ativo=true
    WHERE id_limite_lancamento_notas IN (51917928, 51917929, 51917930, 51917931, 51917932, 51917933, 51917934, 51917935, 51917936, 51917937, 51917938, 51917939, 51917940, 51917941, 51917942, 51917943, 51917944, 51917945, 51917946, 51917947, 51917948, 51917949, 51917950, 51917951, 51917952, 51917953, 51917954, 51917955, 51917956, 51917957, 51917958, 51917959, 51917960, 51917961, 51917962, 51918024, 51918025, 51918026, 51918027, 51918028, 51918029, 51918030, 51918031, 51918032, 51918033, 51918034, 51918035, 51918036, 51918037, 51918038, 51918039, 51918040, 51918041, 51918042, 51918043, 51917963, 51917964, 51917965, 51917966, 51917967, 51917968, 51917969, 51917970, 51917971, 51917972, 51917973, 51917974, 51917975, 51917976, 51917977, 51917978, 51917979, 51917980, 51917981, 51917982, 51917983, 51917984, 51917985, 51917986, 51917987, 51917988, 51917989, 51917990, 51917991, 51917992, 51917993, 51917994, 51917995, 51917996, 51917997, 51917998, 51917999, 51918000, 51918001, 51918002, 51918003, 51918004, 51918005, 51918006, 51918007, 51918008, 51918009, 51918010, 51918011, 51918012, 51918013, 51918014, 51918015, 51918016, 51918017, 51918018, 51918019, 51918020, 51918021, 51918022, 51918023);
