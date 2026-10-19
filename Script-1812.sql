SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo IN ('EIP2INT', 'EIP1INT', 'EIM1INT', 'EIM2INT');

SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_curriculo_basico IN (51880990, 51880997, 51881004, 51881011);

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 51880997;


SELECT *
-- DISTINCT id_componente_curricular
--string_agg(id_configuracao_relatorio_componente::varchar, ', ') 
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio IN (43,44,46,47);



UPDATE ensino_infantil.configuracao_relatorio SET ativo=true	WHERE id_configuracao_relatorio IN (43,44,46,47);


UPDATE ensino_infantil.configuracao_relatorio SET ativo=false	WHERE id_configuracao_relatorio IN (43,44,46,47);
