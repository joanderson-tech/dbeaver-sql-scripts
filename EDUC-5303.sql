SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_curriculo_basico = 53598442;

SELECT *
FROM ensino_infantil.configuracao_relatorio_componente crc
WHERE crc.id_configuracao_relatorio IN (43)
AND crc.ativo ;

SELECT *
FROM ensino_infantil.configuracao_relatorio_componente crc
WHERE crc.id_configuracao_relatorio_componente IN (1, 2, 3, 4, 5, 6, 7, 8, 55471, 55473, 55474, 55475, 55534)
AND crc.id_configuracao_relatorio IN (43, 1);



-- Auto-generated SQL script #202609021650
UPDATE ensino_infantil.configuracao_relatorio_componente
    SET ativo=true
    WHERE id_configuracao_relatorio_componente IN (55545, 55549, 55551, 55553, 55555, 55557, 55559, 55561);


-- Auto-generated SQL script #202609021655
UPDATE ensino_infantil.configuracao_relatorio
    SET ativo=true
    WHERE id_configuracao_relatorio=43;
UPDATE ensino_infantil.configuracao_relatorio
    SET ativo=false
    WHERE id_configuracao_relatorio=1;






SELECT distinct rac FROM  ensino_infantil.relatorio_avaliativo ra 
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
--LEFT JOIN ensino_infantil.parecer_descritivo_individual pdi ON pdi.id_parecer_descritivo_individual = ra.id_parecer_descritivo_individual
WHERE ra.id_matricula_discente_serie  IN (1330603, 1345011, 1335978, 1332181, 1331527, 1330440, 1335004, 1335009, 1330256, 1342100, 1342424, 1335549, 1342043, 1337013, 1331444, 1329900, 1331430, 1335563, 1330533, 1336039, 1336399, 1330829, 1334560);



