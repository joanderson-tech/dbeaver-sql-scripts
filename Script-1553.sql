BEGIN;

UPDATE basico.matricula_estudante_serie SET id_estudante = 976557 WHERE id_matricula_discente_serie IN (1326546);

UPDATE ensino.matricula_componente SET id_discente = 976557 WHERE id_matricula_componente IN (17077381, 17077382, 17077383, 17077384, 17077385, 17077386, 17077387, 17077388, 17077389);

SELECT 'UPDATE ensino.frequencia_aluno SET id_discente = 976557 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script, 'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup, COUNT(fa.id_frequencia) AS quantidade_ids
FROM ensino.frequencia_aluno fa
WHERE fa.id_discente IN (977046)
GROUP BY fa.id_discente;

UPDATE ensino.frequencia_aluno SET id_discente = 976557 WHERE id_frequencia IN (138749430, 138749432, 138749434, 138749435, 138749437, 138749441, 138749443, 138749450, 138749456, 138749458, 138749459, 138749469, 138749475, 138749476, 138749481, 138749482, 138749488, 138749491, 138749493, 138801617, 138801637, 138801673, 138801746, 138801759, 138801804, 138801807, 138801817, 138801818, 138801827, 138801828, 138801831, 138801833, 138801839, 138801863, 138801865, 138801869, 138801873, 138822178, 138822183, 138822186, 138822195, 138822199, 138822205, 138822218, 138822219, 138822226, 138840825, 138840826, 138840828, 138840841, 138840859, 138840869, 138840873, 138840883, 138840887, 138840888, 138840898, 138847157, 138847158, 138847164, 138847166, 138847170, 138847171, 138847173, 138847174, 138854595, 138854596, 138854644, 138854659, 138908467, 138908481, 138908483, 138908500, 138908550, 138908581, 138908586, 138908587, 138908619, 138908638, 138923104, 138923124, 138923140, 138923143, 138923176, 138923179, 138923101, 138923079, 138923164, 138923089, 138923108, 138924743, 138924757, 138923167, 138927999, 138931198, 138933023, 138934193, 138937463, 138937471, 138961455, 139121474, 139121507, 139121639, 139121649, 139121650, 139121657, 139121702, 139121714, 139121734, 139121748, 139121799, 139121865, 139121875, 138847169, 138908452, 138908493, 138908631, 138908498, 138908632);

DELETE FROM diario.competencia_habilidades_aluno WHERE id=44554;

DELETE FROM basico.estudante WHERE id_estudante = 977046;

DELETE FROM public.discente WHERE id_discente = 977046;

DELETE FROM comum.pessoa WHERE id_pessoa = 750192;

COMMIT;

ROLLBACK ;


---=== BACKUP


INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, codigo_sus, id_escolaridade, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula, id_povo_indigena, id_foto_reconhecimento_facial, codigo_familia) VALUES (750192, 'MOISES HENRIQUE ALVES DA SILVA', '2018-07-05', 'M', -1, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, 'MAXSUEL ALVES DE LIMA', 'EDNA MARIA DA SILVA DUTRA', '', -1, '', 24, 2400505, '', 'F', false, '2025-02-19 15:13:59.575', 'sitio riacho do meio', NULL, '', '', '', '', NULL, '', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2025-02-19 15:13:59.575', 'MOISES HENRIQUE ALVES DA SILVA', NULL, NULL, '', false, '0', 'N', '', '', '', NULL, 2400505, '', '13093001552018100070173001227323', NULL, '', NULL, 'edna maria da silva dutra', 'MÃE', NULL, '0', '59965-000', NULL, 2400505, 24, NULL, 'agricultor', 'agricultora', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, 52201317, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, 24, 24, NULL, false, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,'f',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL);

INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES (977046, 2025, NULL, '202530001820', NULL, 750192, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2025-02-19 15:13:59.577', NULL, 5661773, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca) VALUES (977046, 1005218, '', NULL, NULL, false, false, NULL, NULL, NULL, false, false);

INSERT INTO competencia_habilidades_aluno (id, id_discente, descricao_parcial, descricao_conclusiva, ano_escolar, ano_letivo, id_turma, data_parcial, data_conclusao, id_registro_entrada, id_historico_implantado, homologado, id_relatorios_bimestrais_aluno)
VALUES(44554, 977046, 'RELATÓRIO INDIVIDUAL DO ESTUDANTE
NOME: MOISES HENRIQUE ALVES DA SILVA
TURMA: 1º ANO     TURNO:  VESPERTINO 
PROFESSORA: ALINE FEREIRA DE LIMA 
Este relatório tem como finalidade descrever o desenvolvimento do estudante MOISES HENRIQUE ALVES DA SILVA, Durante o primeiro semestre, foi possível observar avanços importantes no desenvolvimento escolar de Moisés Henrique. No início das aulas, o aluno não conseguia escrever seu próprio nome e não reconhecia as letras do alfabeto. Contudo, ao longo do processo de aprendizagem, apresentou progressos significativos: atualmente já consegue escrever seu primeiro nome sozinho, ainda que com dificuldades, principalmente na letra cursiva, permanecendo em maior contato com a letra bastão.
Em Matemática, Moisés demonstra conhecimento do sistema de enumeração e consegue realizar operações simples de adição e subtração, revelando compreensão dos conceitos básicos trabalhados.
Na área de Ciências da Natureza, evidencia interesse nos conteúdos, principalmente em temas relacionados à sustentabilidade, com destaque para o estudo dos solos. Em Arte e Ensino Religioso, mostra-se participativo e motivado, com grande envolvimento em atividades de desenho e pintura. Em Educação Física, apresenta ótimo engajamento, participando das propostas com entusiasmo.
Nos momentos de roda de leitura, Moisés participa ativamente e destaca-se por sua criatividade, criando histórias imaginárias a partir das atividades propostas.
Apesar dos avanços, observa-se que em Língua Portuguesa Moisés ainda apresenta grandes dificuldades, sobretudo na leitura e escrita, necessitando de apoio contínuo. Um fator que prejudica significativamente sua aprendizagem é a frequência irregular, uma vez que as faltas constantes comprometem a consolidação dos conteúdos trabalhados em sala.
De modo geral, Moisés Henrique é um aluno que demonstra potencial e já alcançou progressos relevantes, mas que necessita de acompanhamento constante, incentivo ao desenvolvimento da escrita cursiva e, sobretudo, maior assiduidade escolar para que possa evoluir de maneira mais consistente em sua trajetória de aprendizagem.
', '', 2025, 2025, 687151, '2025-08-24', NULL, 5668089, NULL, NULL, NULL);

UPDATE ensino.matricula_componente SET id_discente = 977046 WHERE id_matricula_componente IN (17077381, 17077382, 17077383, 17077384, 17077385, 17077386, 17077387, 17077388, 17077389);

UPDATE basico.matricula_estudante_serie SET id_estudante = 977046 WHERE id_matricula_discente_serie IN (1326546);



