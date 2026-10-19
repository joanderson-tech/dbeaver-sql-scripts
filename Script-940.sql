select * from log_db ld where entity_id in ('17120405');

select * from log_request lr where autenticacao_id = 6225692

SELECT 
    to_char(lr.data_hora, 'DD/MM/YYYY hh24:MI:ss') AS data_hora, lr.autenticacao_id, --re.id_usuario, --re.ip, replace(ld.properties, 'ativo=true', '') as item,
    ld.* 
FROM log_db ld 
join public.log_request lr on lr.log_request_id = ld.log_request_id 
--join public.registro_entrada re on re.id_entrada = lr.autenticacao_id 
WHERE TRUE 
--    AND entity_name = 'EstudanteDocumentoPendente' 
--    and properties ilike '%SsoHash@2c9f47d5%'
    and type = 'U'
--    and lr.data_hora >= NOW() - INTERVAL '7 MONTHS'
--    and lr.data_hora < '2024-03-20'
--    and lr.usuario_id = 105679
    AND entity_id IN   ('1327729')
--    and lr.autenticacao_id in (6378700)
order by ld.entity_id;
SELECT 
    lr.data_hora - (interval '1 second'*lr.duration/1000) as start,
    lr.data_hora,
    lr.autenticacao_id,
    --re.id_usuario,
--    re.ip,
 COALESCE(lr.url, e.endereco) AS endereco,
--    e.endereco,
--    lr.url,
--    '"'||lr.params||'"',
    lr.params,
  --  lr.error,
  --  lr.instance_name,
    lr.duration,
    lr.method,
    lr.total_update,
    lr.total_insert
FROM log_request lr  
LEFT JOIN endpoint e ON e.id = lr.endpoint_id 
--left JOIN registro_entrad re ON re.id_entrada = lr.autenticacao_id 
WHERE TRUE  
--   AND lr.data_hora >= '2025-07-17 10:08:38.729'
--    AND lr.data_hora <= '2025-07-08 15:05:03.896'
--    AND lr.data_hora = '2025-07-17 10:08:38.729'
--    and re.ip = '170.80.178.161                '
--    AND lr.data_hora >= NOW() - INTERVAL '7 MONTHS'
--    AND lr.data_hora < '2024-03-20'
--    AND re.id_usuario in (105517)
-- 	AND e.endereco ILIKE'%/app/diario_classe/matricular/form.jsf%'
    AND autenticacao_id IN (2752572)
--    AND (params ilike '%LIMA DA SILVA FILHO%')
--	  AND params ilike '%idMatricula  : [1327729]%'
--    and (e.endereco ilike '%recalcul%' or lr.url ilike '%recalcul%')
--    and (e.endereco ilike '%renovacao/renovacaoMatriculaExcepcional%' or lr.url ilike '%renovacao/renovacaoMatriculaExcepcional%')
--    and lr.url ilike '%/app/diario_classe/matricular/form.jsf%'
--    and exists (select 1 from )
    -- DESEMPENHO
--           AND (lr.url ILIKE '%/app/diario_classe/frequencia_aluno/form.jsf%' OR e.endereco ILIKE '%/app/diario_classe/frequencia_aluno/form.jsf%')
    -- APP
--    AND (lr.url ILIKE '%app/ava/diagnostico_alfabetizacao/relatorio/form.jsf%' OR e.endereco ILIKE '%app/ava/diagnostico_alfabetizacao/relatorio/form.jsf%')
    -- HORÁRIOS
--    AND (lr.url ILIKE '%app/ensino/horarioTurma%' OR e.endereco ILIKE '%app/ensino/horarioTurma%')
--    AND lr.params ILIKE '%699756%'
    -- CONTEÚDO MINISTRADO
--    AND (lr.url ILIKE '%/sigeduc/ava/TopicoAula/novo.jsf%' OR e.endereco ILIKE '%/sigeduc/ava/TopicoAula/novo.jsf%')
--    AND (lr.url ILIKE '%/diario_classe/conteudo_ministrado/lista_topicos.jsf%' OR e.endereco ILIKE '%/diario_classe/conteudo_ministrado/lista_topicos.jsf%')
--    AND (lr.url ILIKE '%sync/servicesMobile%' OR e.endereco ILIKE '%sync/servicesMobile%')
--    AND lr.params ILIKE '%"evento":"CONTEUDO_MINISTRADO"%' 
    -- NOTAS
--    AND (lr.url ILIKE '%/diario_classe/lancar_notas/form_estudantes_notas_paraiba_recuperacao_por_nota_polivalente.jsf%' OR e.endereco ILIKE '%/diario_classe/lancar_notas/form_estudantes_notas_paraiba_recuperacao_por_nota_polivalente.jsf%')
--    AND (lr.url ILIKE '%estudantes_notas_paraiba_recuperacao_por_nota_polivalente.jsf%' OR e.endereco ILIKE '%estudantes_notas_paraiba_recuperacao_por_nota_polivalente.jsf%')
--    AND lr.url ILIKE '%diario_classe/matricular/form_alterar_data_matricula_em_lote%'
--    AND lr.params ilike '%idTurma%686231%'
    -- RELATÓRIO AVALIATIVO PETROLINA
--    and (lr.url ilike '%ensino_infantil/relatorio_avaliativo/form_relatorio_petrolina%' or e.endereco ilike '%ensino_infantil/relatorio_avaliativo/form_relatorio_petrolina%')
    -- FREQUÊNCIAS
--    and (lr.url ILIKE '%/app/diario_classe/frequencia_aluno/form%' or e.endereco ilike '%/app/diario_classe/frequencia_aluno/form%')
--    AND params ilike '%mes%[8]%dia%[30]%'
--    and lr.autenticacao_id in (6757165)
ORDER BY 1 ;



SELECT  lr.data_hora ,
lr.log_request_id ,
lr.usuario_id ,
lr.autenticacao_id ,
lr.params ,
e.id ,
e.endereco 
FROM log_request lr 
LEFT JOIN endpoint e ON e.id = lr.endpoint_id 
--join log_db ld on lr.log_request_id = ld.log_request_id 
WHERE 1=1 
-- AND e.endereco ILIKE'%/app/turma/transferenciaDeAlunosEntreTurma/form_transf_turma.jsf%'
 AND e.endereco ILIKE'%/app/diario_classe/matricular/form.jsf%'
AND lr.params ILIKE '%idTurmaSerie  : [53037900]%'
--AND lr.data_hora >= '2025-01-21' AND lr.data_hora <= '2025-08-12'
--and ld.entity_id in  ('1327733',' 1327692',' 1327706',' 1327708',' 1327729',' 1327737',' 1327740',' 1327744',' 1327747',' 1327764',' 1327766',' 1327770',' 1327776',' 1327780',' 1327781',' 1327783',' 1327784',' 1327785',' 1327788',' 1327818',' 1328075');
--AND lr.usuario_id = 105010
--AND lr.autenticacao_id = 5659919;


FROM log_db ld 
join public.log_request lr on lr.log_request_id = ld.log_request_id 


