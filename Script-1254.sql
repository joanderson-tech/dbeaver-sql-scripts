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
--re.id_usuario, --re.ip, replace(ld.properties, 'ativo=true', '') as item,
ld.*
FROM log_db ld
JOIN public.log_request lr ON
lr.log_request_id = ld.log_request_id
JOIN registro_entrada re ON
re.id_entrada = lr.autenticacao_id
WHERE TRUE
--    AND entity_name = 'EstudanteDocumentoPendente' 
--AND properties ILIKE '%710750%'
--    and type = 'U'
--    and lr.data_hora >= NOW() - INTERVAL '7 MONTHS'
--AND lr.data_hora > '2025-05-20'
AND re.id_entrada = 8115571
AND lr.usuario_id = 105207
--    AND entity_id IN ('54038087')
--    and lr.autenticacao_id in (6378700)
ORDER BY lr.data_hora;

SELECT lr.data_hora - (INTERVAL '1 second' * lr.duration / 1000) AS START, lr.data_hora, lr.autenticacao_id,
--    re.id_usuario,
--    re.ip,
    COALESCE(lr.url, e.endereco) AS endereco,
--    e.endereco,
--    lr.url,
--    '"'||lr.params||'"',
lr.params, lr.error, lr.instance_name, lr.duration, lr.method, lr.total_update, lr.total_insert
FROM log_request lr
LEFT JOIN endpoint e ON
e.id = lr.endpoint_id
LEFT JOIN registro_entrada re ON
re.id_entrada = lr.autenticacao_id
WHERE TRUE
   AND lr.data_hora >= '2025-01-16 08:00:00.000'
--    AND lr.data_hora <= '2024-10-09 11:27:00.000'
--    AND lr.data_hora = '2024-10-21'
--    and re.ip = '170.80.178.161                '
--    AND lr.data_hora >= NOW() - INTERVAL '7 MONTHS'
--    AND lr.data_hora < '2024-03-20'
    AND re.id_usuario in (105207)
--AND autenticacao_id IN (8143557)
  AND (params ilike '%710750%')
--    AND params ilike '%54038086%'
--    and (e.endereco ilike '%recalcul%' or lr.url ilike '%recalcul%')
AND (e.endereco ILIKE '%lancar_notas%'	OR lr.url ILIKE '%lancar_notas%')
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
