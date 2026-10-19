select *
from ensino_infantil.habilidade_competencia hc
where hc.ativo = true and hc.descricao similar to '%((EF01MA09)|(EF01MA10)|(EF01MA12))%'
ORDER BY hc.data_cadastro ASC
LIMIT 3;

SELECT *
FROM ensino_infantil.habilidade_competencia hc
WHERE hc.ativo = true 
  AND hc.descricao similar to '%((EF01MA09)|(EF01MA10)|(EF01MA12))%'

