
             ALTER TABLE matricula.estudante_inscrito ADD id_municipio_naturalidade int4 NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD CONSTRAINT id_municipio_naturalidade_fkey FOREIGN KEY (id_municipio_naturalidade) REFERENCES comum.municipio(id_municipio);   
             ALTER TABLE matricula.estudante_inscrito ADD possui_irmao_gemeo bool NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD solicita_prematricula_irmao_gemeo bool NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD nome_irmao_gemeo varchar(200) NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD cpf_irmao_gemeo int8 NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD sexo_irmao_gemeo varchar(1) NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD cpf_filiacao_1 int8 NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD data_nascimento_filiacao_1 date NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD responsavel_filiacao_1 bool NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD cpf_filiacao_2 int8 NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD data_nascimento_filiacao_2 date NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD responsavel_filiacao_2 bool NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD data_nascimento_responsavel date NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD id_grau_parentesco_responsavel int4 NULL;   
             ALTER TABLE matricula.estudante_inscrito ADD CONSTRAINT id_grau_parentesco_responsavel_fkey FOREIGN KEY (id_grau_parentesco_responsavel) REFERENCES comum.grau_parentesco(id_grau_parentesco); 
 