ALTER TABLE ensino.docente_turma_alteracao ADD COLUMN justificativa VARCHAR(255);

ALTER TABLE ensino.docente_turma_alteracao ADD COLUMN id_alteracao_em_lote INT;

comment on column ensino.docente_turma_alteracao.id_alteracao_em_lote is 'Id que agrupa alterações em lote feitas numa mesma requisição';