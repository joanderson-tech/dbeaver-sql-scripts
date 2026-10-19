ALTER TABLE comum.informacoes_medicas ADD COLUMN em_acompanhamento_psicologico BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE comum.informacoes_medicas ADD COLUMN observacao_acompanhamento_psicologico varchar(1000);
ALTER TABLE comum.informacoes_medicas ADD COLUMN em_investigacao_psicossocial BOOLEAN NOT NULL DEFAULT FALSE;