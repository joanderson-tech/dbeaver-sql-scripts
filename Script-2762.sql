-- ADICIONANDO  AS NOVAS HABILIDADE NO COMPONENTE Corpo, Gestos e Movimentos (CG)  
-- INSERÇÃO DIRETA E GERAÇÃO AUTOMÁTICA DE SCRIPT DE BACKUP (DELETE)
BEGIN;

WITH ins_habilidades AS (
    -- 1. Inserção dos registos com captura imediata dos IDs gerados pela sequence
   INSERT INTO ensino_infantil.habilidade_competencia (id_habilidade_competencia, descricao, ativo, data_cadastro, habilitado_para_conteudo_ministrado, prioridade_ordenacao, id_area_conhecimento, id_eixo)
    VALUES
        (nextval('ensino_infantil.habilidade_competencia_seq'), '(EI03CG01) Criar com o corpo formas diversificadas de expressão de sentimentos, sensações e emoções, tanto nas situações do cotidiano quanto em brincadeiras, dança, teatro, música.', TRUE, CURRENT_TIMESTAMP, FALSE, NULL, NULL, NULL),
        (nextval('ensino_infantil.habilidade_competencia_seq'), '(EI03CG02) Demonstrar controle e adequação do uso de seu corpo em brincadeiras e jogos, escuta e recontagem de histórias, atividades artísticas, entre outras possibilidades.', TRUE, CURRENT_TIMESTAMP, FALSE, NULL, NULL, NULL),
        (nextval('ensino_infantil.habilidade_competencia_seq'), '(EI03CG03) Criar movimentos, gestos, olhares e mímicas em brincadeiras, jogos e atividades artísticas como a dança, o teatro e a música.', TRUE, CURRENT_TIMESTAMP, FALSE, NULL, NULL, NULL),
        (nextval('ensino_infantil.habilidade_competencia_seq'), '(EI03CG04) Adotar hábitos autocuidado relacionados à higiene, alimentação, conforto e aparência.', TRUE, CURRENT_TIMESTAMP, FALSE, NULL, NULL, NULL),
        (nextval('ensino_infantil.habilidade_competencia_seq'), '(EI03CG05) Coordenar suas habilidades manuais no atendimento adequado a seus interesses e necessidades em situações diversas.', TRUE, CURRENT_TIMESTAMP, FALSE, NULL, NULL, NULL)
    RETURNING id_habilidade_competencia
)
SELECT 'DELETE FROM ensino_infantil.habilidade_competencia WHERE id_habilidade_competencia = ' || id_habilidade_competencia || ';' AS backup_delete
FROM ins_habilidades;


DELETE FROM ensino_infantil.habilidade_competencia WHERE id_habilidade_competencia = 572;
DELETE FROM ensino_infantil.habilidade_competencia WHERE id_habilidade_competencia = 573;
DELETE FROM ensino_infantil.habilidade_competencia WHERE id_habilidade_competencia = 574;
DELETE FROM ensino_infantil.habilidade_competencia WHERE id_habilidade_competencia = 575;
DELETE FROM ensino_infantil.habilidade_competencia WHERE id_habilidade_competencia = 576;


COMMIT;