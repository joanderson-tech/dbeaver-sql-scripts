alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;--

alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;--

alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;--

alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;--

alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;--

ALTER TABLE matricula.calendario_matricula ADD COLUMN utiliza_periodo_semestral_solicitacoes boolean DEFAULT FALSE;--xx

ALTER TABLE matricula.calendario_matricula ADD COLUMN inicio_renovacao_nee date, ADD COLUMN fim_renovacao_nee date, ADD COLUMN inicio_transf_nee date, ADD COLUMN fim_transf_nee date; --xx

ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;--
---------------------

alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL; --xx

alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;--xx

alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL; --xx

alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar; --xx

alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;--xx

ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true; --xx
-------------

INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao) 
    VALUES('RECAPTCHA_SECRET_KEY', 'Chave privada do reCaptcha V3 da Google.', '6Lew9VQpAAAAAJeGw0EbsTzjWi_JFMXwADVTPNSX', 22, 2, 'infra.recaptchaSecretKey', NULL, 16, NULL, NULL, NULL, false);

INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao) 
    VALUES('RECAPTCHA_SITE_KEY', 'Chave pública do reCaptcha V3 da Google.', '6Lew9VQpAAAAAMpY6ggQq_O8BseA11nu3d7cswgP', 22, 2, 'infra.recaptchaSiteKey', NULL, 16, NULL, NULL, NULL, false);
   
   
   ALTER TABLE comum.pessoa ADD nome_social varchar(200) NULL; COMMENT ON COLUMN comum.pessoa.nome_social IS 'Nome Social';--
  
  ALTER TABLE basico.serie
ADD COLUMN permite_participar_sol_cadastro_reserva bool NOT NULL DEFAULT FALSE; --xx

ALTER TABLE matricula.calendario_matricula ADD data_inicio_transf_int_proprio_semestral timestamp NULL; --
ALTER TABLE matricula.calendario_matricula ADD data_fim_transf_int_proprio_semestral timestamp NULL;--
UPDATE matricula.calendario_matricula cm SET data_inicio_transf_int_proprio_semestral = cm.data_inicio_transf_int_proprio, data_fim_transf_int_proprio_semestral = cm.data_fim_transf_int_proprio;--


ALTER TABLE pessoas.configuracao_atualizacao_servidor ADD periodo_final timestamp NULL;