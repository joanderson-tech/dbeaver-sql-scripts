SELECT * FROM public.scripts_restore sr WHERE sr.ativo ;


INSERT INTO comum.parametro
(nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)
VALUES('professor-ed-especial', 'Exibe a seção de Disciplinas da Turma com Professores Auxiliares na alocação de professor', 'false', 10, 2, 'professor-ed-especial', NULL, 0, NULL, NULL, NULL, false);


ALTER TABLE basico.serie ADD COLUMN qtd_assistente_educacional integer NOT NULL DEFAULT 0;

CREATE TABLE ensino.assistente_educacional_pessoa_necessidade_especial (
    id_assistente_educacional_pessoa_necessidade_especial integer NOT NULL, 
    id_turma_serie integer NOT NULL, 
    id_turma integer NOT NULL, 
    id_matricula_discente_serie INTEGER NOT NULL,
    id_servidor integer NOT NULL, 
    ch_dedicada_periodo integer NOT NULL, 
    ordem integer, 
    data_inicio date NOT NULL, 
    data_fim date NOT NULL, 
    ativo boolean NOT NULL DEFAULT TRUE, 
    finalizada boolean NOT NULL DEFAULT FALSE, 
    id_registro_cadastro integer, 
    data_cadastro timestamp WITHOUT time ZONE, 
    id_registro_atualizacao integer, 
    data_alteracao timestamp WITHOUT time ZONE, 
    CONSTRAINT pk_assistente_educacional_pne PRIMARY KEY (id_assistente_educacional_pessoa_necessidade_especial), 
    CONSTRAINT fk_assistente_educacional_pne_turma_serie FOREIGN KEY (id_turma_serie) REFERENCES basico.turma_serie (id_turma_serie), 
    CONSTRAINT fk_assistente_educacional_pne_turma FOREIGN KEY (id_turma) REFERENCES ensino.turma (id_turma), 
    CONSTRAINT fk_assistente_educacional_pne_mes FOREIGN KEY (id_matricula_discente_serie) REFERENCES basico.matricula_estudante_serie (id_matricula_discente_serie),
    CONSTRAINT fk_assistente_educacional_pne_servidor FOREIGN KEY (id_servidor) REFERENCES rh.servidor (id_servidor)
);


CREATE TABLE IF NOT EXISTS diario.configuracao_item_menu (id_configuracao_item_menu INTEGER PRIMARY KEY, codigo VARCHAR(255) NOT NULL UNIQUE, modulo VARCHAR(255) NOT NULL, funcionalidade VARCHAR(255) NOT NULL, habilitado BOOLEAN NOT NULL DEFAULT TRUE, data_cadastro TIMESTAMP NOT NULL, ativo BOOLEAN NOT NULL DEFAULT TRUE)



INSERT INTO pessoas.qualificacao (id_qualificacao, descricao, id_tipo_qualificacao, data_atualizacao, id_registro_atualizacao, id_usuario_atualizacao, cod_censo) VALUES(1889, 'Alfabetização', 12, NULL, NULL, NULL, NULL) ON CONFLICT (id_qualificacao) DO NOTHING;


INSERT INTO pessoas.qualificacao (id_qualificacao, descricao, id_tipo_qualificacao, data_atualizacao, id_registro_atualizacao, id_usuario_atualizacao, cod_censo) VALUES (1890, 'Educação integral em tempo integral', 12, NULL, NULL, NULL, NULL) ON CONFLICT (id_qualificacao) DO NOTHING;
