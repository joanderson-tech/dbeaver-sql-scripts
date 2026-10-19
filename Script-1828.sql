SELECT cbc_novo.id_curriculo_basico, cbc_novo.id_componente_curricular
FROM basico.curriculo_basico_componente cbc_novo
WHERE cbc_novo.id_curriculo_basico IN (51880851, 51880867, 51880817, 51880834)
AND NOT EXISTS (
-- Verifica se esse componente já existia nos currículos antigos
    SELECT 1
FROM basico.curriculo_basico_componente cbc_antigo
WHERE cbc_antigo.id_curriculo_basico IN ( 51895174, 51895190, 51895209, 51895225)
	AND cbc_antigo.id_componente_curricular = cbc_novo.id_componente_curricular
);
--antigo
--- 51880851, 51880867, 51880817, 51880834

--novo
--51895174, 51895190, 51895209, 51895225

--remove componente 518 e 520 
-- criar o componente 521 para curriculo 51895174 e 51895190

SELECT *
FROM basico.curriculo_basico_componente
WHERE id_curriculo_basico IN (  51895209, 51895225);