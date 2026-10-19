-- BANCO DE LOGS
SELECT * FROM registro_entrada re WHERE id_usuario = 104883

--usuario    104883

-- BANCO DE LOGS
 SELECT
	ldb.id_log_db,
	ldb.entity_id,
	ldb.entity_name,
	ldb."type",
	ldb.properties,
	ldb.old_properties,
	ldb.log_request_id,
	lr.data_hora 
FROM
	public.log_db ldb 
	INNER JOIN public.log_request lr ON lr.log_request_id = ldb.log_request_id 
WHERE 
	entity_id = '52248159' 
ORDER BY 
	lr.data_hora 
ASC;
	
SELECT
	ldb.id_log_db,
	ldb.entity_id,
	ldb.entity_name,
	ldb."type",
	ldb.properties,
	ldb.old_properties,
	ldb.log_request_id,
	lr.data_hora,
	lr.usuario_id
FROM
	public.log_db ldb 
	INNER JOIN public.log_request lr ON lr.log_request_id = ldb.log_request_id 
WHERE 
	ldb.entity_name = 'DocenteTurma' AND 
 	ldb.properties ilike '%turma=685730%'
ORDER BY 
	lr.data_hora 
ASC;

SELECT
	ldb.id_log_db,
	ldb.entity_id,
	ldb.entity_name,
	ldb."type",
	ldb.properties,
	ldb.old_properties,
	ldb.log_request_id,
	lr.data_hora 
FROM
	public.log_db ldb 
	INNER JOIN public.log_request lr ON lr.log_request_id = ldb.log_request_id 
WHERE 
	ldb.entity_name = 'DocenteTurma' AND 
 	ldb.properties ilike '%docente=429%'
ORDER BY 
	lr.data_hora 
ASC;

SELECT * FROM public.usuario u WHERE id_usuario = 105289;

SELECT
	autenticacao_id,
    data_hora,
    lr.url , 
    "method",
    params,
    duration,
    error, usuario_id,
    autenticacao_id
FROM
    public.log_request lr
WHERE 
    url ILIKE '%/diario_classe/conteudo_ministrado/lista_topicos.js%'
    --AND params ILIKE '%idTurma  : [685730]%'
	AND lr.usuario_id  = 104883
ORDER BY 
    data_hora asc;
