SELECT cb.codigo AS curriculo, cr.codigo AS configuracao, cr.data_cadastro, * 
FROM ensino_infantil.configuracao_relatorio cr 
JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cr.id_curriculo_basico 
WHERE cr.id_curriculo_basico IN (83942924,83942936); --IN (83382276,83382286)



83382276
83382286

SELECT cr.id_configuracao_relatorio, * 
FROM ensino_infantil.configuracao_relatorio cr 
JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cr.id_curriculo_basico 
WHERE cr.id_curriculo_basico IN (61640186);


SELECT *
FROM basico.curriculo_basico
WHERE codigo IN ('EMEITIRB1', 'EMEITIG3');


SELECT *
-- DISTINCT id_componente_curricular
--string_agg(id_configuracao_relatorio_componente::varchar, ', ') 
FROM ensino_infantil.configuracao_relatorio_componente WHERE id_configuracao_relatorio IN(42) ;