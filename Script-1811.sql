SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo IN ('EIP2INT', 'EIP1INT', 'EIM1INT', 'EIM2INT');

SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_curriculo_basico IN (51880990, 51880997, 51881004, 51881011);