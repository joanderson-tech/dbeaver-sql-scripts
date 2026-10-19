SELECT base.id_matricula_discente_serie, base.componente, base.categoria, 
CASE WHEN EVERY(CASE WHEN crc.id_tipo_avaliacao_componente_relatorio = 2 
AND rahr.id_opcao_grupo_avaliacao_relatorio IS NOT NULL THEN TRUE WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 
AND (rac.avaliacao_descritiva <> '' AND rac.avaliacao_descritiva IS NOT NULL) THEN TRUE ELSE FALSE END) THEN 'concluído'
ELSE 'pendente' END AS apontamento --INTO lev_relatorios_avaliacao_temp_1784201436662
/*    CASE WHEN EVERY(CASE 
                WHEN crc.id_tipo_avaliacao_componente_relatorio IS NULL THEN 
                    CASE 
                        WHEN 2 = 4 THEN FALSE 
                        WHEN 2 IN (1, 2, 3) THEN TRUE 
                        ELSE FALSE 
                    END 
                WHEN crc.id_tipo_avaliacao_componente_relatorio = 2 AND rahr.id_opcao_grupo_avaliacao_relatorio IS NOT NULL THEN TRUE 
                WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 THEN 
                    CASE 
                        WHEN 2 = 4 AND (rac.avaliacao_descritiva <> '' AND rac.avaliacao_descritiva IS NOT NULL) THEN TRUE 
                        WHEN 2 IN (1, 2, 3) THEN TRUE 
                        ELSE FALSE 
                    END 
                ELSE FALSE 
            END) THEN 'concluído' ELSE 'pendente' END AS apontamento */
FROM matriculas_componentes_avaliacao_temp_1784201436662 base
LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON
ra.id_matricula_discente_serie = base.id_matricula_discente_serie
AND ra.ativo
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
AND rac.id_matricula_componente = base.id_matricula_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON
rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
AND rahr.periodo = 2
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
WHERE(base.tipo_diario IN (54)
    OR (base.tipo_diario IN (51, 52, 53)
        AND base.tipo_diario_diversificado IS NOT NULL
        AND base.categoria = 2))
AND (base.id_solicitacao_dispensa_estudante IS NULL
    OR base.id_solicitacao_dispensa_estudante_componente IS NULL
    OR base.id_dispensa_unidade_relatorio IS NULL)
    AND base.id_matricula_discente_serie = 1652102
GROUP BY base.id_matricula_discente_serie, base.componente, base.categoria;

CREATE INDEX idx_lra_1784201436662_mat ON
lev_relatorios_avaliacao_temp_1784201436662 (id_matricula_discente_serie);

CREATE INDEX idx_lra_1784201436662_cat ON
lev_relatorios_avaliacao_temp_1784201436662 (id_matricula_discente_serie, categoria);

ANALYZE lev_relatorios_avaliacao_temp_1784201436662;



SELECT rah 
FROM matriculas_componentes_avaliacao_temp_1784201436662 base
LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON
ra.id_matricula_discente_serie = base.id_matricula_discente_serie
AND ra.ativo
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
AND rac.id_matricula_componente = base.id_matricula_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON
rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
AND rahr.periodo = 2
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
WHERE(base.tipo_diario IN (54)
    OR (base.tipo_diario IN (51, 52, 53)
        AND base.tipo_diario_diversificado IS NOT NULL
        AND base.categoria = 2))
AND (base.id_solicitacao_dispensa_estudante IS NULL
    OR base.id_solicitacao_dispensa_estudante_componente IS NULL
    OR base.id_dispensa_unidade_relatorio IS NULL)
    AND base.id_matricula_discente_serie = 1652102;
GROUP BY base.id_matricula_discente_serie, base.componente, base.categoria;




DANIEL LEVY DOS SANTOS SOUZA
idestudante = 1407486
MES = 1652102


--JEAN KARLLOS DOS SANTOS SILVA
idestudante = 1388821
MES = 
1655363  - 1
1628303 -12

SELECT *
FROM ensino_infantil.relatorio_avaliativo_componente rac
WHERE rac.id_relatorio_avaliativo IN (123549, 150818);


SELECT *
FROM ensino_infantil.relatorio_avaliativo_componente rac
WHERE rac.id_relatorio_avaliativo_componente  IN (709388);

SELECT ra.*
FROM ensino_infantil.relatorio_avaliativo ra
WHERE ra.id_relatorio_avaliativo = 116322;

SELECT ra.*
FROM ensino_infantil.relatorio_avaliativo ra
WHERE ra.id_matricula_discente_serie  in(1655363, 1628303) ;

1652102



--JOIN basico.matricula_estudante_serie mes ON mes.id_matricula_discente_serie = ra.id_matricula_discente_serie 
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = ra.id_matricula_discente_serie 
AND 1652102 = mc.id_matricula_estudante_serie ;
WHERE mc.id_estudante = 1407486;

SELECT * FROM ensino.matricula_componente mc WHERE mc.id_matricula_estudante_serie = 1652102;

SELECT * FROM  ensino_infantil.relatorio_avaliativo_componente rac 
WHERE rac.id_matricula_componente  IN (20996931, 20996932, 20996933, 20996934, 20996935, 20996936);


SELECT * FROM ensino.matricula_componente mc ;




UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20996935 WHERE id_relatorio_avaliativo_componente=709385;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20996932 WHERE id_relatorio_avaliativo_componente=709386;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20996936 WHERE id_relatorio_avaliativo_componente=709387;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20996933 WHERE id_relatorio_avaliativo_componente=709388;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20996934 WHERE id_relatorio_avaliativo_componente=709389;

--backup

UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20893175 WHERE id_relatorio_avaliativo_componente=709385;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20996932 WHERE id_relatorio_avaliativo_componente=709386;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20893176 WHERE id_relatorio_avaliativo_componente=709387;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20893173 WHERE id_relatorio_avaliativo_componente=709388;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20893174 WHERE id_relatorio_avaliativo_componente=709389;


