BEGIN;

BEGIN;

-- ELISA DA SILVA CARVALHO
DELETE FROM matricula.emissao_documento_matricula WHERE id_emissao_documento_matricula=880605;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2265582;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2265583;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2265584;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2279958;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2279959;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2279960;
DELETE FROM matricula.renovacao_matricula_resultado WHERE id_renovacao_matricula_resultado=617143;
DELETE FROM matricula.renovacao_matricula WHERE id_renovacao_matricula=60149873;
DELETE FROM matricula.solicitacao_transferencia_processamento WHERE id_solicitacao_transferencia_processamento=60161477;
DELETE FROM matricula.solicitacao_transferencia_opcao_escola WHERE id_solicitacao_transferencia_opcao_escola=60161476;
DELETE FROM matricula.solicitacao_transferencia WHERE id_solicitacao_transferencia=60161475;
DELETE FROM basico.matricula_estudante_serie WHERE id_matricula_discente_serie=1360213;


-- MARIA EDUARDA RIBEIRO DA SILVA
DELETE FROM matricula.emissao_documento_matricula WHERE id_emissao_documento_matricula=880608;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2265594;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2265595;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2265596;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2280090;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2282547;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2280091;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2280092;
DELETE FROM matricula.renovacao_matricula_resultado WHERE id_renovacao_matricula_resultado=617147;
DELETE FROM matricula.renovacao_matricula WHERE id_renovacao_matricula=60149879;
DELETE FROM matricula.solicitacao_transferencia_processamento WHERE id_solicitacao_transferencia_processamento=60161670;
DELETE FROM matricula.solicitacao_transferencia_opcao_escola WHERE id_solicitacao_transferencia_opcao_escola=60161669;
DELETE FROM matricula.solicitacao_transferencia WHERE id_solicitacao_transferencia=60161668;
DELETE FROM basico.matricula_estudante_serie WHERE id_matricula_discente_serie=1360217;


-- CORREÇÃO VAGAS - CRECHE MUNICIPAL PEQUENA PRINCESA
UPDATE matricula.vaga_serie
SET 
    vagas_solicitadas = GREATEST(0, vagas_solicitadas - 2),
    vagas_ocupadas = GREATEST(0, vagas_ocupadas - 2)
WHERE id_vaga_serie = 60094431;

UPDATE matricula.vaga_serie_ocupacao
SET 
    solicitadas = GREATEST(0, solicitadas - 2),
    ocupadas = GREATEST(0, ocupadas - 2)
WHERE id_vaga_serie_ocupacao = 60161479;

COMMIT;