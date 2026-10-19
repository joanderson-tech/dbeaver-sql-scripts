SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_curriculo_basico = 53598442;

SELECT *
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente 
WHERE crc.id_configuracao_relatorio IN (43)
AND crc.id_tipo_avaliacao_componente_relatorio = 1;


SELECT distinct * FROM  ensino_infantil.relatorio_avaliativo ra 
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
LEFT JOIN ensino_infantil.parecer_descritivo_individual pdi ON
pdi.id_parecer_descritivo_individual = ra.id_parecer_descritivo_individual
WHERE ra.id_configuracao_relatorio IN (1);

SELECT * FROM ensino_infantil.tipo_avaliacao_componente_relatorio tacr;


SELECT *
FROM ensino_infantil.configuracao_relatorio_componente crc
WHERE crc.id_configuracao_relatorio_componente IN (1, 2, 3, 4, 5, 6, 7, 8, 55471, 55473, 55474, 55475, 55534)
AND crc.id_configuracao_relatorio IN (43, 1);


SELECT *
FROM ensino_infantil.configuracao_relatorio_componente crc
WHERE crc.id_configuracao_relatorio IN (43, 1);

SELECT *
FROM ensino_infantil.relatorio_avaliativo_componente rac
WHERE rac.id_configuracao_relatorio_componente IN (55544, 55548, 55550, 55552, 55554, 55556, 55558, 55560);



SELECT *
FROM ensino_infantil.relatorio_avaliativo WHERE con

-- Auto-generated SQL script #202609021558
UPDATE ensino_infantil.configuracao_relatorio_componente
SET
ativo = true
WHERE id_configuracao_relatorio_componente IN (55545, 55549, 55551, 55553, 55555, 55557, 55559, 55561);



UPDATE ensino_infantil.configuracao_relatorio_componente
SET
ativo = false
WHERE id_configuracao_relatorio_componente IN (55544, 55548, 55550, 55552, 55554, 55556, 55558, 55560);



