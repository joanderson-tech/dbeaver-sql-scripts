UPDATE basico.turma_serie SET id_curriculo_medio = 52333603 WHERE id_turma_serie = 52330742;

SELECT
'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 52333603 WHERE id_matricula_discente_serie IN (' || string_agg(mes.id_matricula_discente_serie::text,',') || ');' solucao,
'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 35504116 WHERE id_matricula_discente_serie IN (' || string_agg(mes.id_matricula_discente_serie::text,',') || ');' backup 
FROM basico.matricula_estudante_serie mes WHERE mes.id_turma_serie  = 52330742;


UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 52333603 WHERE id_matricula_discente_serie IN (1326192,1326194,1326195,1326196,1326197,1326198,1326199,1326200,1326201,1326214,1326203,1326205,1326206,1326215,1326250,1326252,1326202,1326253,1326479,1326216,1326193,1326251,1326218,1326204,1326213,1326211,1326212,1326209,1326210,1326207,1326217,1326208);