select st.destino from SerieTransicao st where st.origem.id =  + origem.getId();


select * FROM basico.serie_transicao st WHERE st.id_serie_origem = 52090928;



select * FROM basico.serie_transicao st;

DELETE FROM basico.serie_transicao
WHERE id_serie_transicao=52285942;

SELECT s.multisseriada FROM basico.serie AS s WHERE id_serie = 52090928;