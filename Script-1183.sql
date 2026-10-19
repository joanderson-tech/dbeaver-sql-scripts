
SELECT * FROM ensino_infantil.configuracao_relatorio  AS cr WHERE cr.id_curriculo_basico IN (35498937);

--35498937, 35499472
SELECT string_agg(crc.id_configuracao_relatorio_componente :: varchar, ', ')
FROM ensino_infantil.configuracao_relatorio cr
join ensino_infantil.configuracao_relatorio_componente crc on crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
WHERE cr.id_curriculo_basico IN (35498937, 35499472);
ORDER BY cr.id_configuracao_relatorio;


select crch.* 
FROM ensino_infantil.configuracao_relatorio cr
JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
join ensino_infantil.configuracao_relatorio_componente_habilidade crch on  crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente 
WHERE cr.id_curriculo_basico IN (35498937);



-- Solução EIB
UPDATE ensino_infantil.configuracao_relatorio_componente SET maximo_caracteres_relatorio=NULL,id_tipo_avaliacao_componente_relatorio=2 WHERE id_configuracao_relatorio_componente in (14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33);

-- Solução AI1
UPDATE ensino_infantil.configuracao_relatorio_componente SET maximo_caracteres_relatorio=NULL,id_tipo_avaliacao_componente_relatorio=2 WHERE id_configuracao_relatorio_componente in (34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49);

--Backup EIB
UPDATE ensino_infantil.configuracao_relatorio_componente SET maximo_caracteres_relatorio=9999, id_tipo_avaliacao_componente_relatorio=1	WHERE id_configuracao_relatorio_componente in (14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33);

-- Backup AI1
UPDATE ensino_infantil.configuracao_relatorio_componente SET maximo_caracteres_relatorio=NULL,id_tipo_avaliacao_componente_relatorio=2 WHERE id_configuracao_relatorio_componente in (34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49);

