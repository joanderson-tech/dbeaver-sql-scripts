-- SCRIPT DE INSERÇÃO DIRETA COM GERAÇÃO AUTOMÁTICA DE BACKUP (DELETE)
BEGIN;

ROLLBACK;

WITH 
-- 1. Criação da lista com a ordem exata que você deseja
ordem_desejada (codigo, prioridade) AS (
    VALUES 
        ('EI03EO01', 1),
        ('EI03EO02', 2),
        ('EI03EO03', 3),
        ('EI03EO04', 4),
        ('EI03EO05', 5),
        ('EI03EO06', 6),
        ('EI03EO07', 7)
),
-- 2. Busca e ordenação explícita das habilidades de acordo com a lista
habilidades_competencia_novas AS (
    SELECT 
        hc.id_habilidade_competencia,
        od.prioridade
    FROM ensino_infantil.habilidade_competencia hc
    JOIN ordem_desejada od ON hc.descricao LIKE '%' || od.codigo || '%'
    WHERE hc.ativo = TRUE
    ORDER BY od.prioridade
),
-- 3. Inserção DIRETA na tabela configuracao_relatorio_componente_habilidade
ins_configuracao AS (
    INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (
        id_configuracao_relatorio_componente_habilidade, 
        id_configuracao_relatorio_componente, 
        id_habilidade_competencia, 
        ativo
    )
    SELECT 
        nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'),
        29, 
        hcn.id_habilidade_competencia, 
        TRUE 
    FROM habilidades_competencia_novas hcn
    ORDER BY hcn.prioridade
    RETURNING id_configuracao_relatorio_componente_habilidade
),
-- 4. Busca dos relatórios avaliativos componentes
relatorio_avaliativo_componente AS (
    SELECT rac.id_relatorio_avaliativo_componente 
    FROM ensino_infantil.relatorio_avaliativo ra 
    JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
    JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
    WHERE ra.ativo = TRUE 
      AND crc.id_configuracao_relatorio = 5 
      AND crc.id_componente_curricular = 506
),
-- 5. Inserção DIRETA na tabela relatorio_avaliativo_habilidade
ins_relatorios_habilidades AS (
    INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (
        id_relatorio_avaliativo_habilidade, 
        id_relatorio_avaliativo_componente, 
        id_configuracao_relatorio_componente_habilidade
    )
    SELECT 
        nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq'), 
        rac.id_relatorio_avaliativo_componente, 
        ic.id_configuracao_relatorio_componente_habilidade 
    FROM relatorio_avaliativo_componente rac
    CROSS JOIN ins_configuracao ic
    ORDER BY rac.id_relatorio_avaliativo_componente, ic.id_configuracao_relatorio_componente_habilidade
    RETURNING id_relatorio_avaliativo_habilidade
),
-- 6. Inserção DIRETA na tabela relatorio_avaliativo_habilidade_resposta
ins_relatorios_respostas AS (
    INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (
        id_relatorio_avaliativo_habilidade_resposta, 
        id_relatorio_avaliativo_habilidade, 
        periodo
    )
    SELECT 
        nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq'), 
        irh.id_relatorio_avaliativo_habilidade, 
        gs.periodo 
    FROM ins_relatorios_habilidades irh 
    CROSS JOIN generate_series(1, 4) AS gs(periodo)
    ORDER BY irh.id_relatorio_avaliativo_habilidade, gs.periodo
    RETURNING id_relatorio_avaliativo_habilidade_resposta
),
-- 7. Geração do script de BACKUP (DELETE) para cada tabela
script_backup_configuracao AS (
    SELECT 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || id_configuracao_relatorio_componente_habilidade || ';' AS backup 
    FROM ins_configuracao
),
script_backup_habilidades AS (
    SELECT 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || id_relatorio_avaliativo_habilidade || ';' AS backup 
    FROM ins_relatorios_habilidades
),
script_backup_respostas AS (
    SELECT 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || id_relatorio_avaliativo_habilidade_resposta || ';' AS backup 
    FROM ins_relatorios_respostas
)
-- Retorno Final: Exibe APENAS os comandos de DELETE (Backup)
SELECT backup FROM script_backup_configuracao
UNION ALL 
SELECT backup FROM script_backup_habilidades
UNION ALL 
SELECT backup FROM script_backup_respostas;

ROLLBACK;