SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo IN ('EIN1INT' , 'EIN2INT' , 'EIN3INT' , 'EIN4INT');

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico = 51881389;

SELECT string_agg(id_curriculo_basico_componente :: varchar , ',')
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico IN (51881389, 51881413, 51881405, 51881397);


UPDATE basico.curriculo_basico SET permite_multiplos_professores_polivalente = TRUE WHERE id_curriculo_basico IN (51881389, 51881413, 51881405, 51881397);

UPDATE basico.curriculo_basico_componente 	SET permite_multiplos_professores=TRUE	WHERE id_curriculo_basico_componente IN (51881394,51881395,51881396,51881398,51881399,51881400,51881401,51881402,51881403,51881404,51881409,51881410,51881407,51881411,51881408,51881406,51881412,51881417,51881418,51881415,51881419,51881416,51881414,51881420,51881391,51881392,51881393,51881390);





UPDATE basico.curriculo_basico SET permite_multiplos_professores_polivalente = FALSE WHERE id_curriculo_basico IN (51881389, 51881413, 51881405, 51881397);

UPDATE basico.curriculo_basico_componente 	SET permite_multiplos_professores= FALSE WHERE id_curriculo_basico_componente IN (51881394,51881395,51881396,51881398,51881399,51881400,51881401,51881402,51881403,51881404,51881409,51881410,51881407,51881411,51881408,51881406,51881412,51881417,51881418,51881415,51881419,51881416,51881414,51881420,51881391,51881392,51881393,51881390);


