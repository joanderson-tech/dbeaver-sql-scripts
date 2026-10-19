select * from log_db ld where entity_id = '54881473';

'53724563','53724564','53724401','53724402','53725017','53725018','53724971','53724972','53723650','53723651','53723890','53724152','53724153','53724364','53724457','53724458'

SELECT 
    to_char(lr.data_hora, 'DD/MM/YYYY hh24:MI:ss') AS data_hora, lr.autenticacao_id, --re.id_usuario, --re.ip, replace(ld.properties, 'ativo=true', '') as item,
    ld.* 
FROM log_db ld 
join public.log_request lr on lr.log_request_id = ld.log_request_id 
--join public.registro_entrada re on re.id_entrada = lr.autenticacao_id 
WHERE TRUE 
--    AND entity_name = 'RotaDiscente' 
--    and properties ilike '%1403748%'
      and type = 'D'
--    and lr.data_hora >= NOW() - INTERVAL '7 MONTHS'
--    and lr.data_hora > '2026-01-20'
--    and lr.usuario_id = 105679
    AND entity_id IN ('40995','40996','40997','40999','41000','41001','41002','41003','41004','41005','41006','41008','41009','41010','41011','41012','41013','41014','41015','41016','41017','41018','41020','41021','41022','41023','41024','41025','41026','41027','41028','41030','41031','41032','41033','41034','41035','41048','41050','41051','41052','41053','41055','41056','41057','41058','41059','41060','41061','41062','41064','41065','41066','41067','41068','41069','41072','41073','41074','41075','41076','41078','41079','41080','41081','41082','41083','41085','41086','41138','41139','41140','41141','41142','41143','41615','41806','41807','41808','41810','41812','41813','41814','41816','41817','41818','41819','41822','41824','41825','41826','41829','41830','41831','41832','41834','41835','41837','41838','41839','41840','41841','41855','41856','41857','41858','41859','41860','41863','41864','41865','41867','41868','41870','41871','41873','41875','41876','41877','41879','41880','41987','41990','41991','41992','41994','41996','41997','41998','42000','42001','42002','42003','42004','42005','42006','42007','42009','42010','42011','42013','42016','42017','42018','42019','42020','42023','42024','42025','42026','42028','42030','42032','42033','42034','42035','42036','42037','42146','42148','42149','42150','42153','42154','42155','42156','42157','42158','42159','42161','42162','42163','42164','42165','42166','42167','42168'
)
--    and lr.autenticacao_id in (6378700)
order by lr.data_hora;

SELECT 
    lr.data_hora - (interval '1 second'*lr.duration/1000) as start,
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
left JOIN registro_entrada re ON re.id_entrada = lr.autenticacao_id 
WHERE TRUE  
 --   AND lr.data_hora >= '2025-01-16 08:00:00.000'
--    AND lr.data_hora <= '2024-10-09 11:27:00.000'
--    AND lr.data_hora = '2024-10-21'
--    and re.ip = '170.80.178.161                '
--    AND lr.data_hora >= NOW() - INTERVAL '7 MONTHS'
--    AND lr.data_hora < '2024-03-20'
--    AND re.id_usuario in (105517)
    AND autenticacao_id IN (8227506, 8264178, 8264178)
    --    AND (params ilike '%LIMA DA SILVA FILHO%')
--    AND params ilike '%Salvar e Concluir%'
--    and (e.endereco ilike '%recalcul%' or lr.url ilike '%recalcul%')
 --  and (e.endereco ilike '%/app/transporte/controle/gerencia_estudante_rota.jsf%' or lr.url ilike '%/app/transporte/controle/gerencia_estudante_rota.jsf%')
--    and lr.url ilike '%estudantes/busca_estudante%'
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



