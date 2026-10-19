
-- Dados discente errado 1400968 Atualizando no id_disc correto 1402144
--cpf 72045678466


--WISLLENY LETICIA SIMOES DOS SANTOS PAZ
UPDATE comum.pessoa
	SET cpf_cnpj=NULL,nome='WISLLENY LETICIA SIMOES DOS SANTOS PAZ'
	WHERE id_pessoa=52800876;

--WISLLANY LETICIA SIMOES DOS SANTOS PAZ
UPDATE comum.pessoa
	SET cpf_cnpj=NULL
	WHERE id_pessoa=52765357;








-- 01 script para unificar a matricula_componente
SELECT 'UPDATE ensino.matricula_componente SET id_discente = 1402144 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao,
	   'UPDATE ensino.matricula_componente SET id_discente = '|| mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup,
	    COUNT(mc.id_matricula_componente) AS quantidade_ids
from ensino.matricula_componente mc 
where mc.id_discente IN (1400968)
GROUP BY  mc.id_discente;	
   
--SOLUÇÃO MATRICULA COMPONENTE AQUI

-- 02 FREQUENCIA
SELECT 
    'UPDATE ensino.frequencia_aluno SET id_discente = 1402144 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script,
    'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup,
     COUNT(fa.id_frequencia) AS quantidade_ids
FROM  ensino.frequencia_aluno fa 
WHERE fa.id_discente IN (1400968)
GROUP BY fa.id_discente;	
   
--SOLUÇÃO FREQUENCIA AQUI


UPDATE basico.matricula_estudante_serie SET id_estudante=1402144 
WHERE id_matricula_discente_serie in (1496825);

UPDATE basico.movimentacao_estudante SET id_discente=1402144
WHERE id_movimentacao_estudante=70306;

DELETE FROM basico.estudante
WHERE id_estudante=1400968;

DELETE FROM public.discente
WHERE id_discente=1400968;

DELETE FROM comum.pessoa
WHERE id_pessoa=774869;

-- Dados discente 979090  Atualizando no id_disc correto 1399574
select matricula , id_pessoa , *  from discente d  
where id_pessoa in (771702, 772973);

select * from comum.pessoa p where p.nome =  'LORENA EDUARDA MELO DOS SANTOS';

BEGIN;
commit;
rollback;


-- Dados de backup discente errado 1400968 
UPDATE basico.matricula_estudante_serie SET id_estudante=1400968 
WHERE id_matricula_discente_serie in (1496825);

UPDATE basico.movimentacao_estudante SET id_discente=1400968
WHERE id_movimentacao_estudante=70306;

INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca) VALUES(1400968, 1005226, 'C.M.PADRE ANACLETO DE CAMARGO', NULL, NULL, false, false, NULL, NULL, NULL, false, false);

INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(1400968, 2024, NULL, '202430063893', NULL, 771702, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-02-01 12:59:17.741', NULL, 6278530, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, nome_social) VALUES(771702, 'ISABELLA FERREIRA HOLANDA', '2010-04-25', 'F', 1, NULL, NULL, NULL, NULL, NULL, 49263039810, 31, NULL, '', 'FRANCISCA KELLY FERREIRA HOLANDA', '', -1, '', 26, 2611101, '', 'F', false, '2024-02-01 12:59:17.740', '', NULL, '', '', '', '', NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(11)94202-1889', NULL, '2024-02-01 12:59:17.740', 'ISABELLA FERREIRA HOLANDA', NULL, NULL, '', false, '1', 'A', '198940', '226', '4332', '2010-04-20', 3550308, '4º DISTRITO DA CAPITAL', '', NULL, '', NULL, 'FRANCISCA KELLY FERREIRA HOLANDA', 'MAE', 'CPF', '1292703342', '56300-000', NULL, 2611101, 26, NULL, '', '', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 61578412, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, 26, 26, NULL, false, '', '', 'MAE', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


