BEGIN;

-- ==============================================================================
-- SCRIPT 1: INSERÇÃO DIRETA DOS DADOS (TODOS OS COMPONENTES)
-- ==============================================================================

WITH 
-- 1. Mapeamento dos componentes curriculares e configurações
mapeamento_componentes (id_componente_curricular, id_configuracao_relatorio_componente, padrao_regex, quantidade_limite) AS (
    VALUES 
        (506, 29, 'EI03EO01|EI03EO02|EI03EO03|EI03EO04|EI03EO05|EI03EO06|EI03EO07', 7),
        (507, 30, 'EI03CG01|EI03CG02|EI03CG03|EI03CG04|EI03CG05', 5),
        (508, 31, 'EI03TS01|EI03TS02|EI03TS03', 3),
        (509, 32, 'EI03EF01|EI03EF02|EI03EF03|EI03EF04|EI03EF05|EI03EF06|EI03EF07|EI03EF08|EI03EF09', 9),
        (510, 33, 'EI03ET01|EI03ET02|EI03ET03|EI03ET04|EI03ET05|EI03ET06|EI03ET07|EI03ET08', 8)
),
-- 2. Busca das habilidades cadastradas no banco
habilidades_novas AS (
    SELECT 
        hc.id_habilidade_competencia,
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
-- 3. INSERÇÃO 1: configuracao_relatorio_componente_habilidade
ins_configuracao AS (
    INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (
        id_configuracao_relatorio_componente_habilidade, 
        id_configuracao_relatorio_componente, 
        id_habilidade_competencia, 
        ativo
    )
    SELECT 
        nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'),
        hn.id_configuracao_relatorio_componente,
        hn.id_habilidade_competencia,
        TRUE
    FROM habilidades_novas hn
    RETURNING id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente
),
-- 4. Busca dos relatórios componentes ativos
relatorios_componentes AS (
    SELECT 
        rac.id_relatorio_avaliativo_componente,
        crc.id_configuracao_relatorio_componente
    FROM ensino_infantil.relatorio_avaliativo ra 
    JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
    JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
    WHERE ra.ativo = TRUE 
      AND crc.id_configuracao_relatorio = 5 
      AND crc.id_componente_curricular IN (506, 507, 508, 509, 510)
),
-- 5. INSERÇÃO 2: relatorio_avaliativo_habilidade
ins_relatorio_habilidade AS (
    INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (
        id_relatorio_avaliativo_habilidade, 
        id_relatorio_avaliativo_componente, 
        id_configuracao_relatorio_componente_habilidade
    )
    SELECT 
        nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq'),
        rc.id_relatorio_avaliativo_componente,
        ic.id_configuracao_relatorio_componente_habilidade
    FROM relatorios_componentes rc
    JOIN ins_configuracao ic ON ic.id_configuracao_relatorio_componente = rc.id_configuracao_relatorio_componente
    RETURNING id_relatorio_avaliativo_habilidade
)
-- 6. INSERÇÃO 3: relatorio_avaliativo_habilidade_resposta (4 Períodos)
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (
    id_relatorio_avaliativo_habilidade_resposta, 
    id_relatorio_avaliativo_habilidade, 
    periodo
)
SELECT 
    nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq'),
    irh.id_relatorio_avaliativo_habilidade,
    gs.periodo
FROM ins_relatorio_habilidade irh
CROSS JOIN generate_series(1, 4) AS gs(periodo);


-- ==============================================================================
-- SCRIPT 2: GERAÇÃO DO SCRIPT DE BACKUP (DELETE)
-- ==============================================================================

WITH mapeamento_componentes (id_configuracao_relatorio_componente, padrao_regex) AS (
    VALUES 
        (29, 'EI03EO01|EI03EO02|EI03EO03|EI03EO04|EI03EO05|EI03EO06|EI03EO07'),
        (30, 'EI03CG01|EI03CG02|EI03CG03|EI03CG04|EI03CG05'),
        (31, 'EI03TS01|EI03TS02|EI03TS03'),
        (32, 'EI03EF01|EI03EF02|EI03EF03|EI03EF04|EI03EF05|EI03EF06|EI03EF07|EI03EF08|EI03EF09'),
        (33, 'EI03ET01|EI03ET02|EI03ET03|EI03ET04|EI03ET05|EI03ET06|EI03ET07|EI03ET08')
),
-- 1. Identifica as configurações de componentes recém-inseridas
configuracoes_criadas AS (
    SELECT crch.id_configuracao_relatorio_componente_habilidade
    FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch
    JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia
    JOIN mapeamento_componentes mc ON mc.id_configuracao_relatorio_componente = crch.id_configuracao_relatorio_componente
    WHERE crch.ativo = TRUE AND hc.descricao ~* mc.padrao_regex
),
-- 2. Identifica os relatórios de habilidades associados
habilidades_criadas AS (
    SELECT rah.id_relatorio_avaliativo_habilidade
    FROM ensino_infantil.relatorio_avaliativo_habilidade rah
    JOIN configuracoes_criadas cc ON cc.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
),
-- 3. Identifica as respostas associadas
respostas_criadas AS (
    SELECT rahr.id_relatorio_avaliativo_habilidade_resposta
    FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr
    JOIN habilidades_criadas hc ON hc.id_relatorio_avaliativo_habilidade = rahr.id_relatorio_avaliativo_habilidade
),
-- Montagem dos comandos DELETE na ordem correta de exclusão (filhos -> pais)
del_respostas AS (
    SELECT 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || id_relatorio_avaliativo_habilidade_resposta || ';' AS script_delete, 1 AS ordem
    FROM respostas_criadas
),
del_habilidades AS (
    SELECT 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || id_relatorio_avaliativo_habilidade || ';' AS script_delete, 2 AS ordem
    FROM habilidades_criadas
),
del_configuracoes AS (
    SELECT 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || id_configuracao_relatorio_componente_habilidade || ';' AS script_delete, 3 AS ordem
    FROM configuracoes_criadas
)
-- Exibe todos os DELETEs ordenados para evitar erros de Chave Estrangeira (FK)
SELECT script_delete 
FROM (
    SELECT * FROM del_respostas
    UNION ALL 
    SELECT * FROM del_habilidades
    UNION ALL 
    SELECT * FROM del_configuracoes
) t
ORDER BY ordem, script_delete;


ROLLBACK;


COMMIT;