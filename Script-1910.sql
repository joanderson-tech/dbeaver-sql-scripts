SELECT *
FROM basico.curriculo_basico_componente cbc
INNER JOIN basico.curriculo_basico cb ON
cbc.id_curriculo_basico = cb.id_curriculo_basico, ensino.componente_curricular cc
WHERE cbc.id_componente_curricular = cc.id_componente_curricular
AND cb.id_curriculo_basico = 51901594
ORDER BY cc.nome;

SELECT categoriac0_.id_categoria_componente AS id1_892_0_, categoriac0_.altura_imagem AS altura2_892_0_, categoriac0_.ativo AS ativo892_0_, categoriac0_.descricao AS descricao892_0_, categoriac0_.id_arquivo_imagem AS id5_892_0_, categoriac0_.ordem AS ordem892_0_
FROM basico.categoria_componente categoriac0_
WHERE categoriac0_.id_categoria_componente =?