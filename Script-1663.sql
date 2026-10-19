SELECT * FROM comum.parametro WHERE codigo ILIKE '%OCULTAR_LISTA_DE_NEE_PRE_MATRICULA%';


SELECT * FROM comum.parametro WHERE codigo ILIKE '%oculta_lista_nee%';


-- Auto-generated SQL script #202601191124
UPDATE comum.parametro
	SET codigo='oculta_lista_nee'
	WHERE codigo='OCULTAR_LISTA_DE_NEE_PRE_MATRICULA';


--bacukp
UPDATE comum.parametro
	SET codigo='OCULTAR_LISTA_DE_NEE_PRE_MATRICULA'
	WHERE codigo='OCULTAR_LISTA_DE_NEE_PRE_MATRICULA';




