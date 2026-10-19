SELECT *
FROM ambiente.ambiente_tipo_acessibilidade_unidade_escolar
WHERE id_ambiente_unidade_escolar IN (40, 41, 42, 43, 44, 45, 46, 47, 48, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69);

SELECT aue.* FROM ambiente.ambiente_unidade_escolar aue;

SELECT aue.* FROM ambiente.ambiente_unidade_escolar aue WHERE aue.id_escola = 51870353;
