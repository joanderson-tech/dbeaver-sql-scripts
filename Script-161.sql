UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET email = 'desenv@esig.com.br', ramal = 1234;

UPDATE escola.escola SET senhatransferencia = '123456' WHERE senhatransferencia IS NOT NULL;




alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;

alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;

alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;

ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;
---------

ALTER TABLE comum.pessoa ADD nome_social varchar(200) NULL; 
COMMENT ON COLUMN comum.pessoa.nome_social IS 'Nome Social';
----

ALTER TABLE matricula.calendario_matricula ADD data_inicio_transf_int_proprio_semestral timestamp NULL;
ALTER TABLE matricula.calendario_matricula ADD data_fim_transf_int_proprio_semestral timestamp NULL;
UPDATE matricula.calendario_matricula cm SET data_inicio_transf_int_proprio_semestral = cm.data_inicio_transf_int_proprio, data_fim_transf_int_proprio_semestral = cm.data_fim_transf_int_proprio;
---

ALTER TABLE pessoas.configuracao_atualizacao_servidor ADD periodo_final timestamp NULL;

---
---https://jira.esig.com.br/browse/SIGEDUC-34056
CREATE TABLE  educacao_especial.tipo_atendimento_estudante_ee (
    id int4 PRIMARY KEY,
    nome varchar(120),
    sigla varchar(5),
    ativo bool
);

-- Criação da sequência para a coluna id da tabela tipo_atendimento_estudante_ee
CREATE SEQUENCE  educacao_especial.tipo_atendimento_estudante_ee_seg
    START 1
    INCREMENT 1
    MINVALUE 1
    CACHE 1;
   -- Permição para o usuario pode realizar operaçoes
-- Ao executar em produção substituir pelo usuário que a aplicação usa em produção
GRANT ALL ON TABLE   educacao_especial.tipo_atendimento_estudante_ee TO sigeduc;
GRANT ALL ON TABLE  educacao_especial.tipo_atendimento_estudante_ee_seg TO sigeduc;

 ALTER TABLE  educacao_especial.tipo_atendimento_estudante_ee ADD COLUMN removido bool DEFAULT false;
 
----

CREATE TABLE educacao_especial.tipo_atendimento_educacao_especial_estudante (
    id_tipo_atendimento int4 PRIMARY KEY,
    id_tipo int4,
    ativo bool,
    id_atendimento_especial_estudante int4,
     CONSTRAINT fk_atendimento FOREIGN KEY (id_atendimento_especial_estudante) REFERENCES educacao_especial.atendimento_educacao_especial_estudante(id_atendimento_educacao_especial_estudante),
     CONSTRAINT fk_tipo FOREIGN KEY (id_tipo) REFERENCES educacao_especial.tipo_atendimento_estudante_ee(id)
);

----

CREATE SEQUENCE educacao_especial.tipo_atendimento_educacao_especial_estudante_seg
    START 1
    INCREMENT 1
    MINVALUE 1
    CACHE 1;
   
 GRANT ALL ON TABLE educacao_especial.tipo_atendimento_educacao_especial_estudante TO     sigeduc;
GRANT ALL ON TABLE educacao_especial.tipo_atendimento_educacao_especial_estudante_seg TO sigeduc;
    
CREATE SEQUENCE educacao_especial.tipo_recurso_educacional_seg
    START 1
    INCREMENT 1
    MINVALUE 1
    CACHE 1;
-----
   
   CREATE TABLE educacao_especial.tipo_recurso_educacional (
    id int4 PRIMARY KEY,
    descricao varchar,
    ativo bool,
    removido bool
);

-----
GRANT ALL ON TABLE educacao_especial.tipo_recurso_educacional TO sigeduc;
GRANT ALL ON TABLE educacao_especial.tipo_recurso_educacional_seg TO sigeduc;

------------- estudante
-- Criação da sequência para a coluna id da tabel pessoa_recurso_educacional_necessario
CREATE SEQUENCE comum.pessoa_recurso_educacional_necessario_seg
    START 1
    INCREMENT 1
    MINVALUE 1
    CACHE 1;
  
  CREATE TABLE comum.pessoa_recurso_educacional_necessario (
    id_pessoa_recurso_educacional int4  NOT NULL,
    id_recurso_educacional int4 NOT NULL,
    id_pessoa int4 NOT NULL,
    CONSTRAINT id_pessoa_recurso_educacional_pkey PRIMARY KEY (id_pessoa_recurso_educacional),
    CONSTRAINT pessoa_recurso_educacional_fkey FOREIGN KEY (id_recurso_educacional) REFERENCES educacao_especial.tipo_recurso_educacional(id),
    CONSTRAINT pessoa_recurso_necessario_id_pessoa_fkey FOREIGN KEY (id_pessoa) REFERENCES comum.pessoa(id_pessoa)
);

CREATE UNIQUE INDEX idx_unique_pessoa_recurso_necessarios ON comum.pessoa_recurso_educacional_necessario USING btree (id_pessoa, id_pessoa_recurso_educacional);

GRANT ALL ON TABLE comum.pessoa_recurso_educacional_necessario TO sigeduc;
GRANT ALL ON TABLE comum.pessoa_recurso_educacional_necessario_seg TO sigeduc;

INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao) VALUES('Possibilita cadastrar tipo de atendimento AEE para os estudantes da Rede', 'Quando o parametro for true, possibilitá ao gestor cadastrar tipos de atendimento para estudante AEE, e adiciona-los na alocação do estudante na turma.', 'true', NULL, 2, 'estudantes.permite_tipo_atendimento_estudante_aee', NULL, NULL, NULL, NULL, NULL, false);
-----
ALTER TABLE escola.escola ADD sigla varchar NULL;
