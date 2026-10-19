SELECT *
FROM log_db ld
WHERE ld.entity_name IN ('nota_unidade');

SELECT *
FROM log_db ld
WHERE ld. = 8115571;

SELECT *
FROM log_request lr
WHERE autenticacao_id = 6225692

SELECT *
FROM registro_entrada re
WHERE re.id_usuario = 105207
AND re.id_entrada = 8115571
;

SELECT *
FROM log_db ld
WHERE ld.tabela = 'br.com.sigsoftware.sigeduc.basico.diario.dominio.NotaUnidade'
AND ld.id_elemento IN (237177615, 237177647, 237177679, 237177726, 239441495, 239441496, 239441497, 239441494, 234421181, 234421198, 234421215, 234421232, 238150458, 238150475, 238150492, 238150509, 235121904, 235121921, 235121938, 235121955, 230625355, 230625409, 230625373, 230625391, 234194848, 234194865, 234194882, 234194899, 235101883, 235101917, 235101934, 235101900, 235766727, 235766728, 235766729, 235766730)

SELECT to_char(lr.data_hora, 'DD/MM/YYYY hh24:MI:ss') AS data_hora, lr.autenticacao_id,
ld.*
FROM log_db ld
JOIN public.log_request lr ON lr.log_request_id = ld.log_request_id
JOIN registro_entrada re ON re.id_entrada = lr.autenticacao_id
WHERE TRUE
AND re.id_entrada = 8115571
AND lr.usuario_id = 105207
ORDER BY lr.data_hora;

SELECT lr.data_hora - (INTERVAL '1 second' * lr.duration / 1000) AS START, lr.data_hora, lr.autenticacao_id, COALESCE(lr.url, e.endereco) AS endereco, lr.params, lr.error, lr.instance_name, lr.duration, lr.method, lr.total_update, lr.total_insert
FROM log_request lr
LEFT JOIN endpoint e ON e.id = lr.endpoint_id
LEFT JOIN registro_entrada re ON re.id_entrada = lr.autenticacao_id
WHERE TRUE
AND re.id_usuario IN (105207)
AND (params ILIKE '%712131%')
AND (e.endereco ILIKE '%lancar_notas%'
	OR lr.url ILIKE '%lancar_notas%')
ORDER BY 1 ;
