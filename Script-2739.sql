-- ==============================================================================
-- INSERÇÃO DE NOVAS HABILIDADES NA TABELA HABILIDADE_COMPETENCIA
-- COMPONENTE: CORPO, GESTOS E MOVIMENTOS (EI03CG01 A EI03CG05)
-- ==============================================================================;
ROLLBACK;

BEGIN;

INSERT INTO ensino_infantil.habilidade_competencia (id_habilidade_competencia, descricao, ativo, data_cadastro, habilitado_para_conteudo_ministrado, prioridade_ordenacao, id_area_conhecimento, id_eixo)
VALUES
    (nextval('ensino_infantil.habilidade_competencia_seq'), '(EI03CG01) Criar com o corpo formas diversificadas de expressão de sentimentos, sensações e emoções, tanto nas situações do cotidiano quanto em brincadeiras, dança, teatro, música.', TRUE, CURRENT_TIMESTAMP, FALSE, NULL, NULL, NULL),
    (nextval('ensino_infantil.habilidade_competencia_seq'), '(EI03CG02) Demonstrar controle e adequação do uso de seu corpo em brincadeiras e jogos, escuta e recontagem de histórias, atividades artísticas, entre outras possibilidades.', TRUE, CURRENT_TIMESTAMP, FALSE, NULL, NULL, NULL),
    (nextval('ensino_infantil.habilidade_competencia_seq'), '(EI03CG03) Criar movimentos, gestos, olhares e mímicas em brincadeiras, jogos e atividades artísticas como a dança, o teatro e a música.', TRUE, CURRENT_TIMESTAMP, FALSE, NULL, NULL, NULL),
    (nextval('ensino_infantil.habilidade_competencia_seq'), '(EI03CG04) Adotar hábitos autocuidado relacionados à higiene, alimentação, conforto e aparência.', TRUE, CURRENT_TIMESTAMP, FALSE, NULL, NULL, NULL ),
    (nextval('ensino_infantil.habilidade_competencia_seq'), '(EI03CG05) Coordenar suas habilidades manuais no atendimento adequado a seus interesses e necessidades em situações diversas.', TRUE, CURRENT_TIMESTAMP, FALSE, NULL, NULL, NULL)
    ;
