INSERT INTO comum.papel (
    id, nome, descricao,
    exige_unidade, restrito, tipo_autorizacao,
    id_sistema, id_subsistema
)
SELECT
    710,
    'Configuração do Tema',
    'Permite alterar a cor predominante do tema visual da instituição (vale para o município inteiro).',
    false,
    false,
    p.tipo_autorizacao,
    p.id_sistema,
    p.id_subsistema
FROM comum.papel p
WHERE p.id = 701
  AND NOT EXISTS (SELECT 1 FROM comum.papel existente WHERE existente.id = 710);
