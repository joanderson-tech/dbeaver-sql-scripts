WITH 
-- 1. Mapeamento centralizado dos componentes e suas configurações
mapeamento_componentes (id_componente_curricular, id_configuracao_relatorio_componente, padrao_regex, quantidade_limite) AS (
    VALUES 
        (506, 24, 'EI03EO01|EI03EO02|EI03EO03|EI03EO04|EI03EO05|EI03EO06|EI03EO07', 7),
        (507, 25, 'EI03CG01|EI03CG02|EI03CG03|EI03CG04|EI03CG05', 5),
        (508, 26, 'EI03TS01|EI03TS02|EI03TS03', 3),
        (509, 27, 'EI03EF01|EI03EF02|EI03EF03|EI03EF04|EI03EF05|EI03EF06|EI03EF07|EI03EF08|EI03EF09', 9),
        (510, 28, 'EI03ET01|EI03ET02|EI03ET03|EI03ET04|EI03ET05|EI03ET06|EI03ET07|EI03ET08', 8)
),
-- 2. Busca e mapeamento dinâmico de todas as habilidades de uma só vez
habilidades_competencia_novas AS (
    SELECT 
        hc.id_habilidade_competencia,
        mc.id_componente_curricular,
        mc.id_configuracao_relatorio_componente
    FROM mapeamento_componentes mc
    JOIN LATERAL (
        SELECT hc_sub.id_habilidade_competencia
        FROM ensino_infantil.habilidade_competencia hc_sub
        WHERE hc_sub.ativo = TRUE 
          AND hc_sub.descricao ~* mc.padrao_regex
        ORDER BY hc_sub.descricao ASC
        LIMIT mc.quantidade_limite
    ) hc ON TRUE
),
-- 3. Configuração dos componentes para todas as habilidades
configuracoes_relatorio_componente_habilidades_novas AS (
    SELECT 
        nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') AS id_configuracao_relatorio_componente_habilidade, 
        hcn.id_configuracao_relatorio_componente, 
        hcn.id_habilidade_competencia, 
        TRUE AS ativo 
    FROM habilidades_competencia_novas hcn 
    ORDER BY hcn.id_habilidade_competencia 
),
-- 4. Busca dos relatórios componentes para todos os componentes configurados
relatorio_avaliativo_componente AS (
    SELECT 
        rac.id_relatorio_avaliativo_componente,
        crc.id_componente_curricular,
        crc.id_configuracao_relatorio_componente
    FROM ensino_infantil.relatorio_avaliativo ra 
    JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
    JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
    WHERE ra.ativo = TRUE 
      AND crc.id_configuracao_relatorio = 1
      AND crc.id_componente_curricular IN (506, 507, 508, 509, 510)
),
-- 5. Geração das habilidades de relatório associadas
relatorios_avaliativos_habilidades_novos AS (
    SELECT 
        nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') AS id_relatorio_avaliativo_habilidade, 
        rac.id_relatorio_avaliativo_componente, 
        crchn.id_configuracao_relatorio_componente_habilidade 
    FROM relatorio_avaliativo_componente rac
    JOIN configuracoes_relatorio_componente_habilidades_novas crchn 
      ON crchn.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
    ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
),
-- 6. Geração dos registos de respostas para os 4 períodos
relatorios_avaliativos_habilidades_respostas_novos AS (
    SELECT 
        nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') AS id_relatorio_avaliativo_habilidade_resposta, 
        rahn.id_relatorio_avaliativo_habilidade, 
        gs.periodo 
    FROM relatorios_avaliativos_habilidades_novos rahn 
    CROSS JOIN generate_series(1, 4) AS gs(periodo) 
    ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
),
-- 7. Montagem dos scripts de INSERT e DELETE (Backup)
script_configuracoes AS (
    SELECT 
        'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' AS solucao, 
        'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' AS backup 
    FROM configuracoes_relatorio_componente_habilidades_novas crchn
),
script_habilidades AS (
    SELECT 
        'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' AS solucao, 
        'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' AS backup 
    FROM relatorios_avaliativos_habilidades_novos rahn
),
script_respostas AS (
    SELECT 
        'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' AS solucao, 
        'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' AS backup 
    FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
)
-- Exibição final dos scripts gerados
SELECT solucao, backup FROM script_configuracoes
UNION ALL 
SELECT solucao, backup FROM script_habilidades
UNION ALL 
SELECT solucao, backup FROM script_respostas;