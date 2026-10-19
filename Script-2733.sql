BEGIN;
--ROLLBACK;

-- DIAGNÓSTICO 1: Listar exatamente os registos descartados
CREATE TEMP TABLE dados_docente_turma AS
SELECT dt.*
FROM ensino.docente_turma dt 
JOIN ensino.turma t ON t.id_turma = dt.id_turma 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
WHERE ts.id_curriculo_medio = 52540564
  AND t.id_disciplina <> 220
  AND t.agrupadora IS FALSE;
  
-- PASSO 2: GERAÇÃO DE INSERTS DE BACKUP PARA: ensino.docente_turma_alteracao
SELECT CONCAT(
    'INSERT INTO ensino.docente_turma_alteracao (',
    'id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, ',
    'id_usuario, data_cadastro, justificativa, id_alteracao_em_lote) ',
    'VALUES (',
        COALESCE(dta.id_docente_turma_alteracao::text, 'NULL'), ', ',
        COALESCE(dta.id_docente_turma::text, 'NULL'), ', ',
        COALESCE(quote_literal(dta.data_inicio), 'NULL'), ', ',
        COALESCE(quote_literal(dta.data_fim), 'NULL'), ', ',
        COALESCE(dta.id_usuario::text, 'NULL'), ', ',
        COALESCE(quote_literal(dta.data_cadastro), 'NULL'), ', ',
        COALESCE(quote_literal(dta.justificativa), 'NULL'), ', ',
        COALESCE(dta.id_alteracao_em_lote::text, 'NULL'),
    ');'
) AS backup_docente_turma_alteracao
FROM ensino.docente_turma_alteracao dta
JOIN dados_docente_turma ddt 
    ON ddt.id_docente_turma = dta.id_docente_turma;
 
-- PASSO 3: GERAÇÃO DE INSERTS DE BACKUP PARA: ensino.docente_turma
SELECT CONCAT(
    'INSERT INTO ensino.docente_turma (',
    'ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, ',
    'docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, ',
    'id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, ',
    'auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, ',
    'justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, ',
    'data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, ',
    'justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao) ',
    'VALUES (',
        COALESCE(ddt.ch_dedicada_periodo::text, 'NULL'), ', ',
        COALESCE(ddt.id_docente::text, 'NULL'), ', ',
        COALESCE(ddt.id_docente_turma::text, 'NULL'), ', ',
        COALESCE(ddt.id_turma::text, 'NULL'), ', ',
        COALESCE(ddt.id_docente_externo::text, 'NULL'), ', ',
        COALESCE(ddt.docext::text, 'NULL'), ', ',
        COALESCE(ddt.nova::text, 'NULL'), ', ',
        COALESCE(quote_literal(ddt.data_cadastro), 'NULL'), ', ',
        COALESCE(quote_literal(ddt.codigo_rh), 'NULL'), ', ',
        COALESCE(ddt.ativo::text, 'NULL'), ', ',
        COALESCE(quote_literal(ddt.data_inicio), 'NULL'), ', ',
        COALESCE(quote_literal(ddt.data_fim), 'NULL'), ', ',
        COALESCE(ddt.id_turma_auxiliar::text, 'NULL'), ', ',
        COALESCE(quote_literal(ddt.tipo_participacao), 'NULL'), ', ',
        COALESCE(ddt.suplementar::text, 'NULL'), ', ',
        COALESCE(ddt.finalizada::text, 'NULL'), ', ',
        COALESCE(ddt.complementar::text, 'NULL'), ', ',
        COALESCE(ddt.auxiliar::text, 'NULL'), ', ',
        COALESCE(quote_literal(ddt.justificativa_ch_alternativa), 'NULL'), ', ',
        COALESCE(ddt.ch_alternativa::text, 'NULL'), ', ',
        COALESCE(ddt.id_afastamento::text, 'NULL'), ', ',
        COALESCE(quote_literal(ddt.justificativa_cancelamento), 'NULL'), ', ',
        COALESCE(ddt.id_registro_cadastro::text, 'NULL'), ', ',
        COALESCE(ddt.id_registro_atualizacao::text, 'NULL'), ', ',
        COALESCE(quote_literal(ddt.data_alteracao), 'NULL'), ', ',
        COALESCE(ddt.id_atividade_ape::text, 'NULL'), ', ',
        COALESCE(ddt.id_encaminhamento_candidato_escola::text, 'NULL'), ', ',
        COALESCE(quote_literal(ddt.justificativa_alocacao), 'NULL'), ', ',
        COALESCE(ddt.regra_excecao_validacao_regras_alocacao_qualificacao::text, 'NULL'),
    ');'
) AS comando_backup
FROM dados_docente_turma ddt;

-- PASSO 4: Eliminar os registos da tabela dependente (docente_turma_alteracao)
DELETE FROM ensino.docente_turma_alteracao dta
USING dados_docente_turma ddt
WHERE dta.id_docente_turma = ddt.id_docente_turma;

-- PASSO 5: Eliminar os registos da tabela principal (docente_turma)
DELETE FROM ensino.docente_turma dt
USING dados_docente_turma ddt
WHERE dt.id_docente_turma = ddt.id_docente_turma;

COMMIT;


