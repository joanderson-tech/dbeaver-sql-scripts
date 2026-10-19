CREATE TEMP TABLE tmp_configuracao_relatorio AS
SELECT cr.id_configuracao_relatorio
FROM ensino_infantil.configuracao_relatorio cr
JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cr.id_curriculo_basico
JOIN basico.serie s ON s.id_serie = cb.id_serie
WHERE cr.ativo
AND cr.id_periodicidade_relatorio = 4
AND s.id_etapa_ensino IN (3,37,51869740);

BEGIN;


ROLLBACK;

-- Gerar Backup --
SELECT
    'UPDATE ensino_infantil.configuracao_relatorio
     SET id_periodicidade_relatorio = '
     || id_periodicidade_relatorio ||
     ' WHERE id_configuracao_relatorio = '
     || id_configuracao_relatorio || ';' AS backup
FROM tmp_configuracao_relatorio;

-- Solucao --
UPDATE ensino_infantil.configuracao_relatorio cr
SET id_periodicidade_relatorio = 1
FROM tmp_configuracao_relatorio tmp
WHERE cr.id_configuracao_relatorio = tmp.id_configuracao_relatorio;
CREATE TEMP TABLE tmp_relatorio_ensino_religioso AS
SELECT
    rac.id_relatorio_avaliativo_componente,
    rac.avaliacao_descritiva
FROM ensino_infantil.relatorio_avaliativo_componente rac
JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
JOIN ensino.matricula_componente mc ON mc.id_matricula_componente = rac.id_matricula_componente
WHERE crc.id_componente_curricular = 230
  AND mc.id_situacao_matricula = 2
  AND (
        rac.avaliacao_descritiva IS NULL
        OR trim(rac.avaliacao_descritiva) = ''
      );
-- Gerar Backup -- 
SELECT
    'UPDATE ensino_infantil.relatorio_avaliativo_componente
     SET avaliacao_descritiva = '
     || COALESCE(quote_literal(avaliacao_descritiva), 'NULL')
     || ' WHERE id_relatorio_avaliativo_componente = '
     || id_relatorio_avaliativo_componente
     || ';' AS backup
FROM tmp_relatorio_ensino_religioso;
-- Solucao --
UPDATE ensino_infantil.relatorio_avaliativo_componente rac
SET avaliacao_descritiva = 'Estudante do componente Ensino Religioso obteve aprovação direta neste período letivo.'
FROM tmp_relatorio_ensino_religioso tmp
WHERE rac.id_relatorio_avaliativo_componente = tmp.id_relatorio_avaliativo_componente;
CREATE TEMP TABLE tmp_relatorio_final_polivalente AS
SELECT
    rfp.id_relatorio_final_polivalente,
    rfp.conteudo,
    rfp.data_alteracao
FROM basico.relatorio_final_polivalente rfp
JOIN basico.matricula_estudante_serie mes ON mes.id_matricula_discente_serie = rfp.id_matricula_estudante_serie
WHERE rfp.ativo
  AND mes.id_situacao_matricula_serie = 1
  AND mes.ano_calendario = 2026;
-- Gerar Backup -- 
SELECT
    'UPDATE basico.relatorio_final_polivalente
     SET conteudo = '
     || COALESCE(quote_literal(tmp.conteudo), 'NULL')
     || ',
        data_alteracao = '
     || CASE
            WHEN tmp.data_alteracao IS NULL THEN 'NULL'
            ELSE quote_literal(tmp.data_alteracao::text)
        END
     || '
     WHERE id_relatorio_final_polivalente = '
     || tmp.id_relatorio_final_polivalente
     || ';' AS backup
FROM tmp_relatorio_final_polivalente tmp;
-- Solucao -- 
UPDATE basico.relatorio_final_polivalente rfp
SET conteudo = 'Estudante do componente Ensino Religioso obteve aprovação direta neste período letivo.',
    data_alteracao = NOW()
FROM tmp_relatorio_final_polivalente tmp WHERE rfp.id_relatorio_final_polivalente = tmp.id_relatorio_final_polivalente;