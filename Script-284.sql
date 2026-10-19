-- Dados discente errado 978936 Atualizando no id_disc correto 974718

-- 01 script para unificar a matricula_componente
SELECT 'UPDATE ensino.matricula_componente SET id_discente = 974718 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao,
	   'UPDATE ensino.matricula_componente SET id_discente = '|| mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup,
	    COUNT(mc.id_matricula_componente) AS quantidade_ids
from ensino.matricula_componente mc 
where mc.id_discente IN (978936)
GROUP BY  mc.id_discente;	
   
--SOLUÇÃO MATRICULA COMPONENTE AQUI

-- 02 FREQUENCIA
SELECT 
    'UPDATE ensino.frequencia_aluno SET id_discente = 974718 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script,
    'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup,
     COUNT(fa.id_frequencia) AS quantidade_ids
FROM  ensino.frequencia_aluno fa 
WHERE fa.id_discente IN (978936)
GROUP BY fa.id_discente;	
   
--SOLUÇÃO FREQUENCIA AQUI


UPDATE basico.matricula_estudante_serie SET id_estudante=974718 
WHERE id_matricula_discente_serie in (1326034);

update diario.competencia_habilidades_aluno set id_discente = 974718 
where id in (40245, 40246, 40247, 40318, 40319, 40320);

update diario.historico_implantado set id_estudante = 974718 
where id_historico_implantado in (29070, 29071, 29072, 29065, 29066, 29067, 29068, 29069, 29274, 29275, 29276, 29277, 29278);

UPDATE ensino.observacao_discente SET id_discente = 974718 
WHERE id_observacao_discente = 539124682;

UPDATE comum.pessoa_recurso_avaliacao_nee SET id_pessoa=747723
WHERE id_pessoa_recurso_avaliacao_nee=130284097;

DELETE FROM comum.pessoa_necessidade_especial WHERE id_pessoa_necessidade_especial=53493739;

DELETE FROM basico.estudante
WHERE id_estudante=978936;

DELETE FROM public.discente
WHERE id_discente=978936;

DELETE FROM comum.pessoa
WHERE id_pessoa=752209;

-- Dados discente 979090  Atualizando no id_disc correto 973817
select matricula , id_pessoa , *  from discente d  
where id_pessoa in (752209, 747723);
select * from comum.pessoa p where p.nome = 'KAUÃ FERNANDES DA COSTA';

BEGIN;
commit;
rollback;


-- Dados de backup discente errado 978936 id pessoa 752209

UPDATE basico.matricula_estudante_serie SET id_estudante=978936 
WHERE id_matricula_discente_serie in (1326034);

update diario.competencia_habilidades_aluno set id_discente = 978936 
where id in (40245, 40246, 40247, 40318, 40319, 40320);

update diario.historico_implantado set id_estudante = 978936 
where id_historico_implantado in (29070, 29071, 29072, 29065, 29066, 29067, 29068, 29069, 29274, 29275, 29276, 29277, 29278);

UPDATE ensino.observacao_discente SET id_discente = 978936 
WHERE id_observacao_discente = 539124682;

UPDATE comum.pessoa_recurso_avaliacao_nee SET id_pessoa=752209
WHERE id_pessoa_recurso_avaliacao_nee=130284097;

INSERT INTO comum.pessoa_necessidade_especial (id_pessoa_necessidade_especial, observacao, id_necessidade_especial, id_pessoa, id_pessoa_transferencia, codmergcomperve) VALUES(53493739, NULL, 7, 752209, NULL, NULL);

INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca) VALUES(978936, 1005226, '', NULL, NULL, false, false, '2024-08-28', 5677297, NULL, false, false);

INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(978936, 2024, NULL, '202430000973', NULL, 752209, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-02-01 09:27:32.501', NULL, 5665804, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, nome_social) VALUES(752209, 'KAUÃ FERNANDES DA COSTA', '2007-08-17', 'M', 2, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, 'LUZINETE DO NASCIMENTO FERNANDES', 'CARLOS ALBERTO DA COSTA', '', 1, '', 25, 2507101, '', 'F', false, '2024-08-28 10:29:31.063', 'SÍTIO:MARÉS', NULL, '', '', '', '', NULL, '', '', 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2024-02-01 09:27:32.500', 'KAUA FERNANDES DA COSTA', NULL, NULL, 'BRASILEIRO', false, '0', NULL, '', '', '', NULL, 2507101, '', '', NULL, '', NULL, '', '', NULL, '0', '58275-000', NULL, 2507101, 25, NULL, 'AGRICULTORA', '', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '122885425007', NULL, '', 53493738, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, 25, 25, NULL, true, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);






