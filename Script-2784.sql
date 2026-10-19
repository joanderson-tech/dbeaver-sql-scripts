BEGIN;


DROP TABLE tmp_respostas_migracao;

-- ==============================================================================
-- PASSO 1: Criar a tabela temporária e gerar os novos IDs antecipadamente
-- ==============================================================================
CREATE TEMP TABLE tmp_respostas_migracao AS
SELECT 
    -- Gera o novo ID via sequence e salva na temporária
    nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') AS id_rahr_novo,
    rah_antigo.id_relatorio_avaliativo_habilidade AS id_rah_antigo,
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
-- PASSO 2: Gerar o backup da deleção dos registros da matrícula antiga
-- ==============================================================================
SELECT 
    COUNT(trm.id_rahr_novo) AS quantidade_registros, 
    'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta IN (' 
    || string_agg(trm.id_rahr_novo::TEXT, ', ') 
    || ');' AS backup_sql
FROM tmp_respostas_migracao trm;


DELETE  FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta IN (926133, 926134, 925991, 925992, 925993, 925994, 926135, 926136, 925995, 925996, 925997, 925998, 926137, 926138, 925999, 926000, 926001, 926002, 926139, 926140, 926003, 926004, 926005, 926006, 926141, 926142, 926007, 926008, 926009, 926010, 926143, 926144, 926011, 926012, 926013, 926014, 926145, 926146, 926015, 926016, 926017, 926018, 926147, 926148, 926019, 926020, 926021, 926022, 926149, 926150, 926023, 926024, 926025, 926026, 926151, 926152, 926027, 926028, 926029, 926030, 926153, 926154, 926031, 926032, 926033, 926034, 926155, 926156, 926035, 926036, 926037, 926038, 926193, 926194, 926111, 926112, 926113, 926114, 926195, 926196, 926115, 926116, 926117, 926118, 926197, 926198, 926119, 926120, 926121, 926122, 926123, 926124, 925971, 925972, 925973, 925974, 926125, 926126, 925975, 925976, 925977, 925978, 926127, 926128, 925979, 925980, 925981, 925982, 926129, 926130, 925983, 925984, 925985, 925986, 926131, 926132, 925987, 925988, 925989, 925990, 926157, 926158, 926039, 926040, 926041, 926042, 926159, 926160, 926043, 926044, 926045, 926046, 926161, 926162, 926047, 926048, 926049, 926050, 926163, 926164, 926051, 926052, 926053, 926054, 926165, 926166, 926055, 926056, 926057, 926058, 926167, 926168, 926059, 926060, 926061, 926062, 926169, 926170, 926063, 926064, 926065, 926066, 926171, 926172, 926067, 926068, 926069, 926070, 926173, 926174, 926071, 926072, 926073, 926074, 926175, 926176, 926075, 926076, 926077, 926078, 926177, 926178, 926079, 926080, 926081, 926082, 926179, 926180, 926083, 926084, 926085, 926086, 926181, 926182, 926087, 926088, 926089, 926090, 926183, 926184, 926091, 926092, 926093, 926094, 926185, 926186, 926095, 926096, 926097, 926098, 926187, 926188, 926099, 926100, 926101, 926102, 926189, 926190, 926103, 926104, 926105, 926106, 926191, 926192, 926107, 926108, 926109, 926110);

COMMIT;
BEGIN;

select rahr --ra.id_matricula_discente_serie, rahr.id_relatorio_avaliativo_habilidade_resposta, mc.id_componente_curricular, crch.id_habilidade_competencia, rahr.id_opcao_grupo_avaliacao_relatorio, rahr.periodo  
from ensino_infantil.relatorio_avaliativo ra 
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
join ensino_infantil.relatorio_avaliativo_habilidade rah on rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade 
join ensino_infantil.configuracao_relatorio_componente_habilidade crch on crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
join ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
where ra.id_matricula_discente_serie in (1360912) 
and ra.ativo ;
and rahr.id_opcao_grupo_avaliacao_relatorio is not NULL;
AND rahr.periodo IN (1,2);

-- ==============================================================================
-- PASSO 3: Inserir as respostas na matrícula NOVA pegando os IDs da temporária
-- ==============================================================================
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (
    id_relatorio_avaliativo_habilidade_resposta, 
    id_relatorio_avaliativo_habilidade, 
    id_opcao_grupo_avaliacao_relatorio, 
    periodo
)
SELECT 
    id_rahr_novo, -- Pega o ID gerado e guardado na tabela temporária!
    id_rah_novo, 
    id_opcao_grupo_avaliacao_relatorio, 
    periodo
FROM tmp_respostas_migracao;


-- ==============================================================================
-- PASSO 4: Remover as respostas da matrícula ANTIGA
-- ==============================================================================
SELECT *  FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta
WHERE id_relatorio_avaliativo_habilidade_resposta IN (
    SELECT id_rahr_novo FROM tmp_respostas_migracao
);


-- ==============================================================================
-- PASSO 5: Limpeza e Validação Final
-- ==============================================================================
-- Consulta de conferência dos novos dados gravados na matrícula NOVA (1360912)
SELECT 
    ra.id_matricula_discente_serie,
    rahr.id_relatorio_avaliativo_habilidade_resposta,
    rahr.id_relatorio_avaliativo_habilidade,
    rahr.id_opcao_grupo_avaliacao_relatorio,
    rahr.periodo
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac 
    ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah 
    ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr 
    ON rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_matricula_discente_serie = 1360912
  AND ra.ativo IS TRUE;

-- Limpa a tabela temporária
DROP TABLE tmp_respostas_migracao;

-- Se o resultado estiver correto, confirme com:
 COMMIT;

-- Se precisar desfazer:
-- ROLLBACK;