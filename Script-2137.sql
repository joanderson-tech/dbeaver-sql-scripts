SELECT *
FROM ambiente.ambiente_tipo_acessibilidade_unidade_escolar
WHERE id_ambiente_tipo_acessibilidade_unidade_escolar = 59;

SELECT aue.*
FROM ambiente.ambiente_unidade_escolar AS aue;
WHERE aue.nome_numero ILIKE 'SALA DE AEE'
AND aue.id_escola = 51870353;

SELECT aue.*
FROM ambiente.ambiente_unidade_escolar aue
WHERE aue.id_tipo_cadeira_unidade_escolar IS NOT NULL
AND aue.id_escola = 51870353;

SELECT aue.*
FROM ambiente.ambiente_unidade_escolar aue
WHERE aue.id_escola = 51870353;

SELECT *
FROM ambiente.ambiente_tipo_acessibilidade_unidade_escolar
WHERE id_ambiente_unidade_escolar IN (40, 41, 42, 43, 44, 45, 46, 47, 48, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69);

DELETE
FROM ambiente.ambiente_tipo_acessibilidade_unidade_escolar
WHERE id_ambiente_tipo_acessibilidade_unidade_escolar IN (2784, 2785, 2786, 2787, 2788, 2789, 2790, 2791, 2792, 2793, 2794, 2795, 2796, 2797, 2798, 2799, 2800, 2801, 2802, 2803, 2804, 2805, 2806, 2807, 2808, 2809, 2810, 2811, 2812, 2813, 2814, 2815, 2816, 2817, 2818, 2819, 2820);




BEGIN;

ROLLBACK ;

SELECT *
FROM ambiente.ambiente_tipo_acessibilidade_unidade_escolar
WHERE id_ambiente_tipo_acessibilidade_unidade_escolar = ( SELECT id_ambiente_tipo_acessibilidade_unidade_escolar
FROM ambiente.ambiente_tipo_acessibilidade_unidade_escolar
WHERE id_ambiente_unidade_escolar IN (45, 46, 47, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68));

SELECT id_ambiente_tipo_acessibilidade_unidade_escolar
FROM ambiente.ambiente_tipo_acessibilidade_unidade_escolar
WHERE id_ambiente_unidade_escolar IN (45, 46, 47, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68);

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 45;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 46;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 47;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 58;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 59;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 60;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 61;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 62;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 63;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 64;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 65;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 66;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 67;

DELETE
FROM ambiente.ambiente_unidade_escolar
WHERE id_ambiente_unidade_escolar = 68;