

SELECT
	autenticacao_id,
    data_hora,
    url, 
    e.endereco,
    "method",
    params,
    duration,
    error, usuario_id,
    autenticacao_id
FROM
    public.log_request lr
    left JOIN endpoint e ON e.id = lr.endpoint_id 
WHERE 
   data_hora >= '2025-01-01 00:00:00' 
   AND data_hora <= '2025-06-18 10:20:28.000' 
   AND params ILIKE '%[721922]%'
   AND (e.endereco ILIKE '%TopicoAula/gerenciarEmLote.js%' OR lr.url ILIKE '%TopicoAula/gerenciarEmLote.js%')
   AND usuario_id = 105061
ORDER BY 
    data_hora ASC;

SELECT
	autenticacao_id,
    data_hora,
    url, 
    e.endereco,
    "method",
    params,
    duration,
    error, usuario_id,
    autenticacao_id
FROM
    public.log_request lr
    left JOIN endpoint e ON e.id = lr.endpoint_id 
WHERE 
   data_hora >= '2025-01-01 00:00:00' 
   AND data_hora <= '2025-06-18 10:20:28.000' 
   AND params ILIKE '%[721922]%' 
   AND (e.endereco ILIKE '%/diario_classe/conteudo_ministrado/lista_topicos.js%' OR lr.url ILIKE '%/diario_classe/conteudo_ministrado/lista_topicos.js%')
   AND usuario_id = 105061
ORDER BY 
    data_hora ASC;
   
SELECT
	autenticacao_id,
    data_hora,
    url, 
    e.endereco,
    "method",
    params,
    duration,
    error, usuario_id,
    autenticacao_id
FROM
    public.log_request lr
    INNER JOIN endpoint e ON e.id = lr.endpoint_id 
WHERE 
   autenticacao_id IN (5959502)--2024-06-07 13:33:01.796
ORDER BY 
    data_hora asc;
   
SELECT
	autenticacao_id,
    data_hora,
    url, 
    "method",
    params,
    duration,
    error, usuario_id,
    autenticacao_id
FROM
    public.log_request lr
WHERE 
   autenticacao_id IN (5974624)
ORDER BY 
    data_hora asc;


SELECT
	autenticacao_id,
    data_hora,
    url, 
    "method",
    params,
    duration,
    error, usuario_id,
    autenticacao_id
FROM
    public.log_request lr
WHERE 
   data_hora >= '2024-06-07 00:00:00' 
   AND data_hora <= '2024-06-07 23:59:59' 
   AND (params ILIKE '%699756%' OR params ILIKE '%700076%')
ORDER BY 
    data_hora asc;

   --ver esse cenario
SELECT
	re.ip,
	re.ip_interno_nat,
	autenticacao_id,
    data_hora,
    url, 
    "method",
    params,
    duration,
    error, usuario_id,
    autenticacao_id
FROM
    public.log_request lr
    INNER JOIN registro_entrada re ON re.id_entrada = lr.autenticacao_id 
WHERE 
   autenticacao_id IN (   5780193,
5780194)
ORDER BY 
    data_hora asc;









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
    AND params LIKE '%[699756]%'                                                          
    AND data_hora >= '2024-01-01'
    AND usuario_id NOT IN (104941) --2024-06-07 13:33:01.796
    --AND usuario_id IN (104941)       --2024-06-07 08:04:17.543
ORDER BY 
    data_hora desc;

--   
--2024-06-07 08:06:53.944
--2024-05-04 16:18:52.674
--2024-05-04 14:34:05.909
--
--2024-03-22 16:34:04.538
--2024-03-22 16:34:04.535
--
--2024-06-07 13:33:01.796
--2024-06-07 08:14:48.819
--2024-04-11 18:40:03.347
--2024-04-08 12:27:08.098
--2024-04-08 12:24:24.459
--2024-04-08 12:16:07.746
   
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
    AND (params LIKE '%[699756]%' 
    or params LIKE '%[700076]%')                                                             
    AND data_hora >= '2024-01-01'
    AND usuario_id = 105504
ORDER BY 
    data_hora desc;
   
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
    AND (params LIKE '%[699756]%'     
    OR params LIKE '%[699813]%')                                                             
    AND data_hora >= '2024-01-01'
    AND usuario_id = 105513
ORDER BY 
    data_hora desc;
   
   
   
   
   
   
   
    
   
SELECT
	id_entrada,
	id_usuario,
	"data",
	ip,
	id_sistema,
	host,
	user_agent,
	data_saida,
	resolucao,
	passaporte,
	canal,
	ip_interno_nat,
	versao,
	versao_app
FROM
	public.registro_entrada WHERE id_entrada IN (5780194, 5780122, 5780115, 5780108) ORDER BY "data" ASC ;


SELECT
	id_entrada,
	id_usuario,
	"data",
	ip,
	id_sistema,
	host,
	user_agent,
	data_saida,
	resolucao,
	passaporte,
	canal,
	ip_interno_nat,
	versao,
	versao_app
FROM
	public.registro_entrada WHERE id_usuario  IN (104941) AND "data" >= '2024-06-07 00:00:00' AND "data" <= '2024-06-07 23:59:59' ORDER BY 
    data desc;
   
SELECT
	autenticacao_id,
    data_hora,
    url, 
    "method",
    params,
    duration,
    error, usuario_id,
    autenticacao_id
FROM
    public.log_request lr
WHERE 
   autenticacao_id IN (5780193, 5780120, 5780115)
ORDER BY 
    data_hora asc;


SELECT
	id_usuario, ip 
FROM
	public.registro_entrada WHERE ip_interno_nat  = '206.42.39.10' GROUP BY ip, id_usuario;