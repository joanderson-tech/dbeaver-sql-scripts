BEGIN;

SELECT DISTINCT rac.id_relatorio_avaliativo_componente
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac
  ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
 AND rac.id_configuracao_relatorio_componente = 33
WHERE ra.id_configuracao_relatorio = 5
  AND ra.ativo;


CREATE TEMP TABLE ids_para_delete AS
SELECT id_relatorio_avaliativo_habilidade
FROM (
  INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (
    id_relatorio_avaliativo_habilidade,
    id_relatorio_avaliativo_componente,
    id_configuracao_relatorio_componente_habilidade
  )
  SELECT
    nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq'),
    rac.id_relatorio_avaliativo_componente,
    278
  FROM relatorio_avaliativo_componente rac
  RETURNING id_relatorio_avaliativo_habilidade
) AS t;



ROLLBACK ;