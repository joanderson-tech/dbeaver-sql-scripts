
SELECT * FROM comum.pessoa p WHERE p.nome ILIKE 'SILVIA LETICIA DE MENEZES MATHUSALEM';


SELECT * FROM comum.usuario u WHERE u.id_pessoa = 774539;

-- Auto-generated SQL script #202609181516
UPDATE comum.permissao
    SET data_atribuicao='2026-09-18 00:00:00.000'
    WHERE id=13059;


UPDATE comum.permissao
    SET data_atribuicao='2023-02-07 11:17:57.592'
    WHERE id=13059;

BEGIN;
    
INSERT INTO comum.permissao (id, id_sistema, id_usuario, id_papel, id_atribuidor, data_atribuicao, data_expiracao, id_unidade_papel, numero_chamado, motivo, autorizada, id_designacao) 
VALUES(nextval('comum.permissao_seq'), 2, 108824, 302, 1, '2026-09-18 00:00:00.000', NULL, 27223952, 1, '1', true, 0);

select p.*
    from comum.permissao p
        join comum.papel p2 on p2.id = p.id_papel
        join comum.unidade u on u.id_unidade = p.id_unidade_papel
        join comum.usuario u2 on u2.id_usuario = p.id_usuario
        join comum.pessoa p3 on p3.id_pessoa = u2.id_pessoa
        where p2.id = 302
        and p.id_unidade_papel IN (27223952)
        ORDER BY p.data_atribuicao DESC ;

select p.*
    from comum.permissao p WHERE p.id_usuario = 108824;

ROLLBACK;

COMMIT;
    
    -- Auto-generated SQL script #202609180947
UPDATE comum.permissao
    SET data_atribuicao='2023-02-07 11:17:57.592'
    WHERE id=13059;

    -- Auto-generated SQL script #202609180947
UPDATE rh.servidor
    SET id_ativo=null
    WHERE id_servidor=660;

       
        
        SELECT * FROM rh.servidor s WHERE s.id_pessoa = 51873686;
        
        SELECT * FROM comum.pessoa p WHERE p.id_pessoa = 747166;
        
        SELECT * FROM comum.usuario u WHERE u.id_pessoa = 747166;
        
        BEGIN;
        
        INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, codigo_rh, id_designacao, codigo_rh_pessoa_old, codigo_rh_pessoa_new, codigo_rh_old, reducao_regime, codigo_inep, qualificacao, codigo_legado, data_ultimo_login_mobile, id_entrada, ja_alocado_completamente_apos_encaminhamento, id_tipo_contrato_servidor, forma_vacancia, data_resposta_ficha_atualizacao, id_instituicao, justificativa_finalizacao, justificativa_reducao_regime, justificativa_remocao_reducao_regime, ds_referencia, id_registro_atualizacao, id_registro_cadastro, id_classe_servidor, numero_contrato_1, numero_contrato_2, id_unidade_transferida, data_transferencia, salario, numero_termo_aditivo, quantidade_meses_termo_aditivo, data_inicio_termo_aditivo) VALUES(747166, '18474', 747165, NULL, '1', NULL, 1, 1, 11, 2940, NULL, NULL, '2025-07-04 10:28:27.802', 0.00, NULL, 605, NULL, 40, false, '1', NULL, NULL, NULL, NULL, NULL, '2022-03-14 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6645731, NULL, 11, '', '', NULL, NULL, 0.00, NULL, NULL, NULL);
        
        ROLLBACK;
        
        DELETE FROM comum.usuario WHERE id_usuario=105053;
        DELETE FROM comum.pessoa WHERE id_pessoa=747166;
        
        INSERT INTO comum.pessoa (id_pessoa, endereco, cep, uf, telefone, celular, fax, tipo, cpf_cnpj, complemento, nome_representante, nome, bairro, cidade, matricula, id_cargo, nome_fantasia, data_nascimento, sexo, email, funcionario, nitpis, emite_fatura, aliquota_imposto, internacional, passaporte, pais_origem, ultima_atualizacao, valido, nome_ascii, origem, nome_mae, numero, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, data_cadastro, "semCpf", justificativa, pais_nacionalidade, id_municipio_naturalidade, id_uf_naturalidade, numero_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, orgao_expedicao_identidade, id_estado_civil, id_raca) VALUES(747166, NULL, NULL, NULL, NULL, NULL, NULL, 'F', 3694201521, NULL, NULL, 'JOICE FABIANE DOS SANTOS', NULL, NULL, 0, 1, NULL, '1990-07-03', 'F', 'desenv@esig.com.br', NULL, NULL, false, NULL, false, NULL, NULL, NULL, true, 'JOICE FABIANE DOS SANTOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-15 09:56:41.379', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
        INSERT INTO comum.usuario (id_usuario, expira_senha, login, id_unidade, ultimo_acesso, email, inativo, id_pessoa, tipo, autorizado, ramal, objetivo_cadastro, justificativa_negado, origem_cadastro, data_cadastro, id_foto, id_docente_externo, senha, ultima_troca_senha, hash_confirmacao_cadastro, id_servidor, funcionario, id_consignataria, hash_mobile_authenticator, id_aluno, data_ultimo_login_mobile) VALUES(105053, NULL, 'fabiane.joice@hotmail.com', 27223947, NULL, 'desenv@esig.com.br', false, 747166, 3, true, '1234', NULL, NULL, NULL, '2023-02-15 09:56:41.395', NULL, NULL, '49a8c5ddf4aa256478ede8b887d77fc6', '2023-02-15 09:56:41.379', NULL, NULL, false, NULL, NULL, NULL, NULL);
        
        27223960, 27223913, 27223912, 27223915, 27223914, 27223927, 27223966, 27223965, 27223953, 27223920, 27223917, 27223954, 27223952, 27223948, 27223924, 27223930, 27223941, 27223949, 27223923, 27223951, 27223939, 27223962, 27226569, 27223943, 27223909, 27223947, 27223910, 27223944, 27223933, 27223936, 27223919, 27223950, 27223918, 27223940, 27223916, 27223959, 27223925, 27223928, 27223911, 27223935, 27223945, 27223931, 27223961, 27223921, 27223938, 27223926, 27223922, 27223929, 27223942, 27223908, 27223946, 27223932, 27223934, 27223937, 27223963
        
        
        -- Contagem de pessoas com a permissão/papel 302 que NÃO possuem registro de servidor
SELECT p3.nome, p.id_papel, p.id_unidade_papel
FROM comum.permissao p
JOIN comum.papel p2 ON p2.id = p.id_papel
JOIN comum.unidade u ON u.id_unidade = p.id_unidade_papel
JOIN comum.usuario u2 ON u2.id_usuario = p.id_usuario
JOIN comum.pessoa p3 ON p3.id_pessoa = u2.id_pessoa
LEFT JOIN rh.servidor s ON s.id_pessoa = p3.id_pessoa
WHERE p2.id = 302
AND p.id_unidade_papel IN (27223960, 27223913, 27223912, 27223915, 27223914, 27223927, 27223966, 27223965,   27223953, 27223920, 27223917, 27223954, 27223952, 27223948, 27223924, 27223930,       27223941, 27223949, 27223923, 27223951, 27223939, 27223962, 27226569, 27223943,       27223909, 27223947, 27223910, 27223944, 27223933, 27223936, 27223919, 27223950,       27223918, 27223940, 27223916, 27223959, 27223925, 27223928, 27223911, 27223935,       27223945, 27223931, 27223961, 27223921, 27223938, 27223926, 27223922, 27223929,       27223942, 27223908, 27223946, 27223932, 27223934, 27223937, 27223963  )
  GROUP BY   p3.nome, p.id_papel, p.id_unidade_papel ;
  
  
  INSERT INTO comum.permissao (id, id_sistema, id_usuario, id_papel, id_atribuidor, data_atribuicao, data_expiracao, id_unidade_papel, numero_chamado, motivo, autorizada, id_designacao) 
  VALUES(nextval('comum.permissao_seq'), 2, 104972, 302, 1, '2026-09-18 10:05:08.784', NULL, 27223966, 1, '1', true, NULL);

  27223928
  27223952
  27223966
  
  
  COMMIT;ALTER 
  -- Executa este comando para descobrir o nome da sequência:
SELECT pg_get_serial_sequence('comum.permissao', 'id');
  
-- Executa este comando para listar todas as sequences do schema 'comum'
SELECT sequence_name 
FROM information_schema.sequences 
WHERE sequence_schema = 'comum';

  27223928
  27223952
  27223966