SELECT * FROM comum.pessoa p WHERE p.nome = 'JOICE FABIANE DOS SANTOS';

SELECT * FROM comum.pessoa p WHERE p.id_pessoa = 51873686;
BENILDES SALGUEIRO LUZ FILHO


SELECT * FROM rh.servidor s WHERE s.id_pessoa = 747165;

 SELECT * FROM rh.servidor s WHERE s.id_pessoa = 51873686;
 
 Não há um diretor vinculado à escola: 

 ESCOLA MUNICIPAL NAIR MENEZES SANTOS
 ESCOLA MUNICIPAL IZÍDIO MARQUES DE MELO
 ESCOLA MUNICIPAL ANÁLIA VIEIRA DE FIGUEIREDO
 ESCOLA MUNICIPAL JOSE DE MELO MENEZES
 
Para realizar o vínculo, conceda ao diretor a permissão de GESTOR DA ESCOLA (Diretor).
        
SELECT uni* FROM comum.unidade u WHERE u.id_unidade = 27223928;

SELECT e.id_unidade_escola  FROM escola.escola e WHERE e.nome = 'ESCOLA MUNICIPAL JOSE DE MELO MENEZES';


-- Auto-generated SQL script #202609180908
UPDATE rh.servidor
    SET id_ativo=4
    WHERE id_servidor=54385536 AND siape='18474' AND id_pessoa=747165 AND id_atividade IS NULL AND digito_siape='1' AND id_escolaridade IS NULL AND id_ativo=4 AND id_situacao=1 AND id_categoria=9 AND id_cargo=2884 AND uorg IS NULL AND lotacao IS NULL AND ultima_atualizacao='2025-07-04 10:28:27.802' AND auxilio_transporte=0.00 AND uorgsiapecad IS NULL AND id_unidade=605 AND id_formacao IS NULL AND regime_trabalho=40 AND dedicacao_exclusiva=false AND tipo_vinculo='3' AND id_foto IS NULL AND id_perfil IS NULL AND id_pessoa_transferencia IS NULL AND data_desligamento IS NULL AND id_classe_funcional IS NULL AND admissao='2022-03-14 00:00:00.000' AND referencia_nivel_padrao IS NULL AND id_unidade_lotacao IS NULL AND matricula_interna IS NULL AND nome_identificacao IS NULL AND id_unidade_pagadora IS NULL AND codigo_rh IS NULL AND id_designacao IS NULL AND codigo_rh_pessoa_old IS NULL AND codigo_rh_pessoa_new IS NULL AND codigo_rh_old IS NULL AND reducao_regime IS NULL AND codigo_inep IS NULL AND qualificacao IS NULL AND codigo_legado IS NULL AND data_ultimo_login_mobile IS NULL AND id_entrada IS NULL AND ja_alocado_completamente_apos_encaminhamento=true AND id_tipo_contrato_servidor=1 AND forma_vacancia IS NULL AND data_resposta_ficha_atualizacao IS NULL AND id_instituicao IS NULL AND justificativa_finalizacao IS NULL AND justificativa_reducao_regime IS NULL AND justificativa_remocao_reducao_regime IS NULL AND ds_referencia IS NULL AND id_registro_atualizacao IS NULL AND id_registro_cadastro IS NULL AND id_classe_servidor=11 AND numero_contrato_1 IS NULL AND numero_contrato_2 IS NULL AND id_unidade_transferida IS NULL AND data_transferencia IS NULL AND salario IS NULL AND numero_termo_aditivo IS NULL AND quantidade_meses_termo_aditivo IS NULL AND data_inicio_termo_aditivo IS NULL;

        