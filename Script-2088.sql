SELECT string_agg(e.id_unidade_escola :: varchar , ', ')
FROM escola.escola e
WHERE e.id_situacao_funcionamento = 1
AND e.id_municipio = 2803500;
AND e.id_unidade_escola = 7483;