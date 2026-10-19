SELECT * FROM public.log_request lr
WHERE TRUE  and lr.autenticacao_id  = 5784021;

select * from log_db ld where ld. = '17111887';

SELECT * FROM public.log_request lr
WHERE TRUE  and lr.usuario_id = 105389;

'53724563','53724564','53724401','53724402','53725017','53725018','53724971','53724972','53723650','53723651','53723890','53724152','53724153','53724364','53724457','53724458'

SELECT 
    lr.data_hora, /*to_char(lr.data_hora, 'DD/MM/YYYY hh24:MI:ss') AS data_hora,*/ lr.autenticacao_id, --re.id_usuario, --re.ip, replace(ld.properties, 'ativo=true', '') as item,
    ld.* 
FROM log_db ld 
join public.log_request lr on lr.log_request_id = ld.log_request_id 
--join public.registro_entrada re on re.id_entrada = lr.autenticacao_id 
WHERE TRUE 
    AND entity_name = 'PassaporteLogon' 
--    and properties ilike '%turma=687073%'
--    and type = 'U'
--    and lr.data_hora >= NOW() - INTERVAL '7 MONTHS'
--    and lr.data_hora < '2024-03-20'
    and lr.usuario_id = 105389;
--    AND entity_id IN ('17127624')
    and lr.autenticacao_id in (5784021);
order by lr.data_hora;

SELECT  
    lr.data_hora ,--- (interval '1 second'*lr.duration/1000) as start,
    lr.data_hora,
    lr.autenticacao_id,
--    re.id_usuario,
--    re.ip,
    COALESCE(lr.url, e.endereco) AS endereco,
--    e.endereco,
--    lr.url,
--    '"'||lr.params||'"',
    lr.params,
    lr.error,
    lr.instance_name,
    lr.duration,
    lr.method,
    lr.total_update,
    lr.total_insert
FROM log_request lr  
LEFT JOIN endpoint e ON e.id = lr.endpoint_id 
left JOIN  public.log_request re ON re.autenticacao_id  = lr.autenticacao_id 
WHERE TRUE  
   AND lr.data_hora >= '2026-01-16 08:00:00.000'
--    AND lr.data_hora <= '2024-10-09 11:27:00.000'
--    AND lr.data_hora = '2024-10-21'
--    and re.ip = '170.80.178.161                '
--    AND lr.data_hora >= NOW() - INTERVAL '7 MONTHS'
--    AND lr.data_hora < '2024-03-20'
    AND re.usuario_id in (105389)
--    AND lr.autenticacao_id IN (5748544)
    AND (lr.params ilike '%idTurma  : [687073]%')
--    AND params ilike '%form:selectTipoDocumento  : [9]%'
--    and (e.endereco ilike '%recalcul%' or lr.url ilike '%recalcul%')
    and (e.endereco ilike '%form_estudantes_notas_padrao_sem_prog_rec_sem%' or lr.url ilike '%form_estudantes_notas_padrao_sem_prog_rec_sem%')
--    and lr.url ilike '%estudantes/busca_estudante%'
--    and exists (select 1 from )
    -- DESEMPENHO
 --          AND (lr.url ILIKE '%/app/diario_classe/lancar_notas/form_estudantes_notas_padrao_sem_prog_rec_sem.jsf%' OR e.endereco ILIKE '%/app/diario_classe/lancar_notas/form_estudantes_notas_padrao_sem_prog_rec_sem.jsf%')
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
--    AND lr.params ilike '%idTurma%687073%'
    -- RELATÓRIO AVALIATIVO PETROLINA
--    and (lr.url ilike '%ensino_infantil/relatorio_avaliativo/form_relatorio_petrolina%' or e.endereco ilike '%ensino_infantil/relatorio_avaliativo/form_relatorio_petrolina%')
    -- FREQUÊNCIAS
--    and (lr.url ILIKE '%/app/diario_classe/frequencia_aluno/form%' or e.endereco ilike '%/app/diario_classe/frequencia_aluno/form%')
--    AND params ilike '%687073%'
--    and lr.autenticacao_id in (6757165)
ORDER BY 1 ;


SELECT  
    lr.data_hora ,--- (interval '1 second'*lr.duration/1000) as start,
    lr.data_hora,
    lr.autenticacao_id,
--    re.id_usuario,
--    re.ip,
    COALESCE(lr.url, e.endereco) AS endereco,
--    e.endereco,
--    lr.url,
--    '"'||lr.params||'"',
    lr.params,
    lr.error,
    lr.instance_name,
    lr.duration,
    lr.method,
    lr.total_update,
    lr.total_insert
FROM log_request lr  
LEFT JOIN endpoint e ON e.id = lr.endpoint_id 
left JOIN  public.log_request re ON re.autenticacao_id  = lr.autenticacao_id 
WHERE TRUE  
   AND lr.data_hora >= '2026-01-16 08:00:00.000'
    AND re.usuario_id in (105389)
    AND lr.autenticacao_id IN (5784058,5784078, 5784099)
--    AND (lr.params ilike '%idTurma  : [687073]%')
    ORDER BY lr.data_hora ;




