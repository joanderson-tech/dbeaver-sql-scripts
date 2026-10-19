select string_agg(id_habilidade_competencia::varchar, ', ') 
from ensino_infantil.habilidade_competencia hc
where hc.ativo = true
      and hc.descricao similar to '%(EF03HI01|EF03HI04|EF03HI05|EF03HI07)%'
limit 8;


SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio =52831171 AND ts.id_escola = 51877794;

SELECT *
FROM ensino_infantil.habilidade_competencia hc
WHERE  TRUE --hc.ativo = TRUE
AND hc.id_habilidade_competencia IN (51869992, 51869993, 51869994);

SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_configuracao_relatorio = 23;

SELECT *
FROM ensino_infantil.configuracao_relatorio_componente crc
WHERE crc.id_configuracao_relatorio = 23;
--524

 SELECT *
FROM ensino_infantil.relatorio_avaliativo_habilidade rah
WHERE rah.id_relatorio_avaliativo_componente =  524
AND rah.id_configuracao_relatorio_componente_habilidade IN (101, 102, 103);

SELECT crch.* FROM ensino_infantil.configuracao_relatorio_componente_habilidade AS crch
WHERE id_configuracao_relatorio_componente_habilidade IN (101, 102, 103);


-- ADICIONANDO  AS NOVAS HABILIDADE CMPEX05 - ESPAÇOS, TEMPOS, QUANTIDADES, RELAÇÕES E TRANSFORMAÇÕES
WITH habilidades_competencia_novas AS (
    SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.id_habilidade_competencia  IN (51870278, 51870281, 51870282, 51870284) ORDER BY hc.data_cadastro asc LIMIT 4
), configuracoes_relatorio_componente_habilidades_novas AS (
    SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 203 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
    SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente WHERE ra.ativo = TRUE 
    AND crc.id_configuracao_relatorio = 23 AND crc.id_componente_curricular = 524
), relatorios_avaliativos_habilidades_novos AS (
    SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
    SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
    SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
    SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
    SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;



BEGIN;

ROLLBACK;

CREATE TEMP TABLE relatorio_avaliativo_componente AS
SELECT DISTINCT rac.id_relatorio_avaliativo_componente
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
AND rac.id_configuracao_relatorio_componente = 185
WHERE ra.id_configuracao_relatorio = 21
AND ra.ativo
AND NOT EXISTS (
    SELECT 1
FROM ensino_infantil.relatorio_avaliativo_habilidade rah
WHERE rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
AND rah.id_configuracao_relatorio_componente_habilidade = 278
  );

SELECT DISTINCT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') AS id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente 
INTO TEMP adicionar_relatorio_avaliativo_habilidade
FROM relatorio_avaliativo_componente rac;

-- 01 INSERT DO relatorio_avaliativo_habilidade
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade)
SELECT rac.id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, 278
FROM adicionar_relatorio_avaliativo_habilidade rac;

CREATE TEMP TABLE adicionar_relatorio_avaliativo_habilidade_resposta AS
SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') AS id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo
FROM adicionar_relatorio_avaliativo_habilidade rahn
CROSS JOIN generate_series(1, 4) AS gs(periodo)
ORDER BY 
    rahn.id_relatorio_avaliativo_habilidade, gs.periodo;

-- 02 INSERT DO relatorio_avaliativo_habilidade_resposta
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo)
SELECT id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo
FROM adicionar_relatorio_avaliativo_habilidade_resposta;

--backup 
SELECT 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade IN ( ' || string_agg(id_relatorio_avaliativo_habilidade::TEXT, ',') || ');'
FROM adicionar_relatorio_avaliativo_habilidade ;

SELECT 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta IN ( ' || string_agg(id_relatorio_avaliativo_habilidade_resposta::TEXT, ',') || ');'
FROM adicionar_relatorio_avaliativo_habilidade_resposta ;

--ROLLBACK;

COMMIT;

