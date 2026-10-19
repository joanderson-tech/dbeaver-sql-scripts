BEGIN;

ROLLBACK;

DROP TABLE tmp_respostas_migracao;


-- ==============================================================================
-- PASSO 1: Criar e popular a tabela temporária com o mapeamento e backup
-- ==============================================================================
CREATE TEMP TABLE tmp_respostas_migracao AS
SELECT 
nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq')  AS id_rah_antigo,
    rah_novo.id_relatorio_avaliativo_habilidade AS id_rah_novo,
    rahr_antigo.id_relatorio_avaliativo_habilidade_resposta AS id_rahr_antigo,
    rahr_antigo.id_opcao_grupo_avaliacao_relatorio,
    rahr_antigo.periodo
FROM ensino_infantil.relatorio_avaliativo ra_antigo
-- Mapeia os componentes e habilidades da matrícula ANTIGA (1357694)
JOIN ensino_infantil.relatorio_avaliativo_componente rac_antigo 
    ON rac_antigo.id_relatorio_avaliativo = ra_antigo.id_relatorio_avaliativo
JOIN ensino.matricula_componente mc_antigo 
    ON mc_antigo.id_matricula_componente = rac_antigo.id_matricula_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah_antigo 
    ON rah_antigo.id_relatorio_avaliativo_componente = rac_antigo.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr_antigo 
    ON rahr_antigo.id_relatorio_avaliativo_habilidade = rah_antigo.id_relatorio_avaliativo_habilidade
-- Mapeia os componentes e habilidades da matrícula NOVA (1360912)
JOIN ensino_infantil.relatorio_avaliativo ra_novo 
    ON ra_novo.id_matricula_discente_serie = 1360912 AND ra_novo.ativo IS TRUE
JOIN ensino_infantil.relatorio_avaliativo_componente rac_novo 
    ON rac_novo.id_relatorio_avaliativo = ra_novo.id_relatorio_avaliativo
JOIN ensino.matricula_componente mc_novo 
    ON mc_novo.id_matricula_componente = rac_novo.id_matricula_componente 
   AND mc_novo.id_componente_curricular = mc_antigo.id_componente_curricular
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah_novo 
    ON rah_novo.id_relatorio_avaliativo_componente = rac_novo.id_relatorio_avaliativo_componente
   AND rah_novo.id_configuracao_relatorio_componente_habilidade = rah_antigo.id_configuracao_relatorio_componente_habilidade
WHERE ra_antigo.id_matricula_discente_serie = 1357694
  AND ra_antigo.ativo IS TRUE
  AND rahr_antigo.id_opcao_grupo_avaliacao_relatorio IS NOT NULL
  AND rahr_antigo.periodo IN (1, 2);

  
-- ==============================================================================
-- PASSO 2: Backup das respostas na matrícula NOVA usando a tabela temporária
-- ==============================================================================
SELECT 
    COUNT(trm.id_rah_antigo) AS quantidade_registros, 
    'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta IN (' 
    || string_agg(trm.id_rah_antigo::TEXT, ', ') 
    || ');' AS backup_sql
FROM tmp_respostas_migracao trm;

DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta IN (926123, 926124, 926125, 926126, 926127, 926128, 926129, 926130, 926131, 926132, 926133, 926134, 926135, 926136, 926137, 926138, 926139, 926140, 926141, 926142, 926143, 926144, 926145, 926146, 926147, 926148, 926149, 926150, 926151, 926152, 926153, 926154, 926155, 926156, 926157, 926158, 926159, 926160, 926161, 926162, 926163, 926164, 926165, 926166, 926167, 926168, 926169, 926170, 926171, 926172, 926173, 926174, 926175, 926176, 926177, 926178, 926179, 926180, 926181, 926182, 926183, 926184, 926185, 926186, 926187, 926188, 926189, 926190, 926191, 926192, 926193, 926194, 926195, 926196, 926197, 926198);

-- ==============================================================================
-- PASSO 3: Inserir as respostas na matrícula NOVA usando a tabela temporária
-- ==============================================================================
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (
-- Se o banco exigir Sequence manual, descomente a linha abaixo:
id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo
)
SELECT id_rah_antigo, id_rah_novo, id_opcao_grupo_avaliacao_relatorio, periodo
FROM tmp_respostas_migracao;


COMMIT;

select rahr.* --ra.id_matricula_discente_serie, rahr.id_relatorio_avaliativo_habilidade_resposta, mc.id_componente_curricular, crch.id_habilidade_competencia, rahr.id_opcao_grupo_avaliacao_relatorio, rahr.periodo  
from ensino_infantil.relatorio_avaliativo ra 
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
join ensino_infantil.relatorio_avaliativo_habilidade rah on rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade 
join ensino_infantil.configuracao_relatorio_componente_habilidade crch on crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
join ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
where ra.id_matricula_discente_serie in (1360912) 
and ra.ativo 
--and rahr.id_opcao_grupo_avaliacao_relatorio is  NULL
AND rahr.periodo IN (1,2);

COMMIT ;

ROLLBACK;



SELECT DISTINCT mc.id_matricula_componente, sdeu.unidade FROM ensino.matricula_componente mc    JOIN ensino.turma t ON t.id_turma = mc.id_turma AND mc.id_matricula_componente IN  ( 17171224 ) JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = mc.id_discente AND mes.ano_calendario = mc.ano AND t.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)    JOIN ensino.solicitacao_dispensa_estudante sde ON sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie    JOIN ensino.solicitacao_dispensa_estudante_componente sdec ON sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante AND sdec.id_componente_curricular  = mc.id_componente_curricular   JOIN ensino.solicitacao_dispensa_estudante_unidade sdeu ON sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente  WHERE t.id_situacao_turma <> 4    AND mes.id_situacao_matricula_serie <> 5    AND sde.id_status_solicitacao_dispensa_estudante = 2    AND sde.ativo   AND sdec.ativo  AND sdeu.ativo ORDER BY mc.id_matricula_componente, sdeu.unidade

