SELECT * FROM comum.pessoa p WHERE p.nome ILIKE '% Cecília Roseno%';


SELECT * FROM basico.unificacao_estudante ue ;


SELECT * FROM discente d WHERE d.matricula = '202030007759'



-- 747253, DAVI BRAGA DA FONSECA, 202030007759




UPDATE comum.pessoa
SET nome = 'SARA CECÍLIA ROSENO CAETANO SILVA', nome_ascii = 'SARA CECILIA ROSENO CAETANO SILVA', data_nascimento = '2010-02-26', sexo = 'F', id_raca = 2, cpf_cnpj = '15823173482', id_pais_nacionalidade = 31, pais_nacionalidade = 'BRASILEIRA', nome_pai = 'SEBASTIÃO CAETANO DA SILVA', nome_mae = 'ANDRÊSA INÁCIO ROSENO DA SILVA', email = '', id_estado_civil = 1, bairro = 'ZONA RURAL', id_municipio_naturalidade = 2400208, numero = '30', tipo = 'F', valido = FALSE, ultima_atualizacao = '2026-02-26 17:36:36', endereco = 'RUA RIO AMAZONAS', complemento = 'VILA MARIA', numero_identidade = '', orgao_expedicao_identidade = 'ITEP', id_unidade_federativa_identidade = 24, telefone_celular = '(84)99893-7857', telefone_celular2 = '', telefone_celular3 = '', contato_celular = '', estrangeiro = FALSE, nome_responsavel_matricula = 'ANDRÊSA INÁCIO ROSENO DA SILVA', id_grau_parentesco_responsavel_matricula = 1, numero_documento_responsavel_matricula = '', cep = '59598-000', id_municipio_contato = 2404507, id_uf_contato = 24,  codigo_nis = '', codigo_inep = '', codigo_sus = '898004045169646', id_informacoes_medicas = 52616503, endereco_atual = NULL, bairro_atual = NULL, cep_atual = NULL, numero_identidade_mae = '002309480', numero_identidade_pai = '', orgao_expedicao_identidade_mae = 'ITEP', orgao_expedicao_identidade_pai = 'ITEP', id_uf_identidade_mae = 24, id_uf_identidade_pai = 24, possui_laudo = FALSE, profissaopai = 'OPERADOR DE MÁQUINA', profissaomae = '', quilombola = FALSE, cid = NULL, cpf_filiacao_1 = NULL, cpf_filiacao_2 = NULL, data_nascimento_responsavel = NULL, tamanho_calcado = NULL, id_tamanho_camisa_predefinido = NULL, id_tamanho_short_calca_predefinido = NULL
WHERE id_pessoa = 747253;

UPDATE public.discente 	SET id_pessoa=747300	WHERE id_discente=974289;


--backup
UPDATE public.discente 	SET id_pessoa=747253	WHERE id_discente=974289;
UPDATE comum.pessoa SET nome='DAVI BRAGA DA FONSECA', data_nascimento='2010-02-15', sexo='F', id_raca=2, id_endereco_residencial=NULL, id_endereco_contato=NULL, passaporte=NULL, id_grau_formacao=NULL, abreviatura=NULL, cpf_cnpj=NULL, id_pais_nacionalidade=31, nome_pai='FRANCINALDO GOMES DA FONSECA', nome_mae='ELIANA LEITÃO BRAGA', email='davibraga@gmail.com', id_estado_civil=1, bairro='Salina da Cruz', id_uf_naturalidade=24, id_municipio_naturalidade=2400208, numero='30', tipo='F', valido=false, ultima_atualizacao='2026-04-17 08:38:53.218', endereco='Rua Santa Terezinha', id_conta_bancaria=NULL, numero_certificado_militar='', serie_certificado_militar='', categoria_certificado_militar='', orgao_expedicao_certificado_militar='', data_expedicao_certificado_militar=NULL, numero_identidade='', orgao_expedicao_identidade='', id_unidade_federativa_identidade=24, data_expedicao_identidade=NULL, numero_titulo_eleitor=NULL, zona_titulo_eleitor=NULL, secao_titulo_eleitor=NULL, data_expedicao_titulo_eleitor=NULL, id_unidade_federativa_titulo_eleitor=NULL, id_uf_identidade=NULL, id_uf_titulo_eleitor=NULL, id_uf_certificado_militar=NULL, codigo_area_nacional_telefone_celular=NULL, codigo_area_nacional_telefone_fixo=NULL, origem=NULL, telefone_fixo='', telefone_celular='(84)99984-0033', fax=NULL, data_cadastro='2020-09-24 10:54:25.352', nome_ascii='DAVI BRAGA DA FONSECA', id_tipo_rg=NULL, tipo_sanguineo=NULL, pais_nacionalidade='BRASILEIRA', estrangeiro=false, certidao_civil_tipo='0', certidao_civil_modelo='N', certidao_civil_num_termo='', certidao_civil_num_folha='', certidao_civil_num_livro='', certidao_civil_data=NULL, certidao_civil_id_municipio_cartorio=2404507, certidao_civil_cartorio='', certidao_civil_matricula_nova='09561201552010000113155000926495', cod_educacenso=NULL, complemento='', codigo_rh=NULL, nome_responsavel_matricula='Francinaldo Gomes da Fonseca', grau_parentesco_responsavel_matricula='PAI', tipo_documento_responsavel_matricula=NULL, numero_documento_responsavel_matricula='4301564489', cep='59598-000', codigo_rh_old=NULL, id_municipio_contato=2404507, id_uf_contato=24, id_pessoa_restauracao=NULL, profissaopai='', profissaomae='', codigo_unificado=NULL, id_pessoa_unificada=NULL, id_orgao_emissor_identidade=NULL, codigo_nis='', certidao_civil_cartorio_codigo_inep=NULL, "semCpf"=false, justificativa=NULL, id_bairro_endereco=NULL, id_tipo_documento_militar=NULL, id_tipo_militar=NULL, documento_militar=NULL, semcpf=NULL, municipio_ext=NULL, uf_naturalidade_ext=NULL, codigo_inep='', id_escolaridade=NULL, codigo_sus='898003013076684', id_informacoes_medicas=52616503, endereco_atual=NULL, bairro_atual=NULL, cep_atual=NULL, id_dados_pessoa_censo=NULL, email_alternativo=NULL, pis_pasep=NULL, numero_identidade_mae='00.230.948-0', numero_identidade_pai='', orgao_expedicao_identidade_mae='ITEP', orgao_expedicao_identidade_pai='', data_expedicao_identidade_mae=NULL, data_expedicao_identidade_pai=NULL, id_uf_identidade_mae=24, id_uf_identidade_pai=24, id_localizacao_zona=2, possui_laudo=false, telefone_celular2='', telefone_celular3='', contato_celular='MÃE', contato_celular2='', contato_celular3='', id_tipo_tamanho_camisa=NULL, id_tamanho_camisa_letra=NULL, tamanho_camisa_livre=NULL, id_tipo_tamanho_short_calca=NULL, id_tamanho_short_calca_letra=NULL, tamanho_short_calca_livre=NULL, tamanho_calcado='40', id_tipo_tamanho_calca=NULL, id_tamanho_calca_letra=NULL, tamanho_calca_livre=NULL, nome_social=NULL, cid='', cpf_filiacao_1=0, cpf_filiacao_2=0, id_tamanho_camisa_predefinido=11, id_tamanho_short_calca_predefinido=11, id_grau_parentesco_responsavel_matricula=2, id_povo_indigena=NULL, id_foto_reconhecimento_facial=NULL, codigo_familia='', data_nascimento_filiacao_1=NULL, data_nascimento_filiacao_2=NULL, data_nascimento_responsavel='1983-04-10', quilombola=false, id_tipo_etnia=NULL, status_avaliacao_nee=0 WHERE id_pessoa=747253;



SELECT *
FROM comum.pessoa p
WHERE p.nome ILIKE '%Cecília Roseno%';

SELECT *
FROM comum.pessoa p
WHERE p.id_pessoa IN (747300, 747253);

SELECT *
FROM basico.unificacao_estudante ue ;

SELECT *
FROM discente d
WHERE d.matricula = '202030007759';


SELECT *
FROM discente d
WHERE d.id_pessoa IN (747300, 747253);

-- 747253, 974242 SARA CECÃLIA ROSENO CAETANO SILVA


--747300, 974289, DAVI BRAGA DA FONSECA, 202030007759

SELECT mes.id_estudante, mes.id_situacao_matricula_serie, s.descricao,  mes.id_turma_serie, mes.ano_calendario, *
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie 
JOIN basico.serie s ON s.id_serie = ts.id_serie 
WHERE mes.id_estudante IN (974242, 974289)
ORDER BY mes.id_estudante, mes.ano_calendario 





202030007759,SARA CECÃLIA ROSENO CAETANO SILVA,17,12,0,0,false,1,974242,12/17/2024,



UPDATE comum.pessoa
SET nome = 'SARA CECÍLIA ROSENO CAETANO SILVA', nome_ascii = 'SARA CECILIA ROSENO CAETANO SILVA', data_nascimento = '2010-02-26', sexo = 'F', id_raca = 2, cpf_cnpj = '15823173482', id_pais_nacionalidade = 31, pais_nacionalidade = 'BRASILEIRA', nome_pai = 'SEBASTIÃO CAETANO DA SILVA', nome_mae = 'ANDRÊSA INÁCIO ROSENO DA SILVA', email = '', id_estado_civil = 1, bairro = 'ZONA RURAL', id_municipio_naturalidade = 2400208, numero = '30', tipo = 'F', valido = FALSE, ultima_atualizacao = '2026-02-26 17:36:36', endereco = 'RUA RIO AMAZONAS', complemento = 'VILA MARIA', numero_identidade = '', orgao_expedicao_identidade = 'ITEP', id_unidade_federativa_identidade = 24, telefone_celular = '(84)99893-7857', telefone_celular2 = '', telefone_celular3 = '', contato_celular = '', estrangeiro = FALSE, nome_responsavel_matricula = 'ANDRÊSA INÁCIO ROSENO DA SILVA', id_grau_parentesco_responsavel_matricula = 1, numero_documento_responsavel_matricula = '', cep = '59598-000', id_municipio_contato = 2404507, id_uf_contato = 24,  codigo_nis = '', codigo_inep = '', codigo_sus = '898004045169646', id_informacoes_medicas = 52616503, endereco_atual = NULL, bairro_atual = NULL, cep_atual = NULL, numero_identidade_mae = '002309480', numero_identidade_pai = '', orgao_expedicao_identidade_mae = 'ITEP', orgao_expedicao_identidade_pai = 'ITEP', id_uf_identidade_mae = 24, id_uf_identidade_pai = 24, possui_laudo = FALSE, profissaopai = 'OPERADOR DE MÁQUINA', profissaomae = '', quilombola = FALSE, cid = NULL, cpf_filiacao_1 = NULL, cpf_filiacao_2 = NULL, data_nascimento_responsavel = NULL, tamanho_calcado = NULL, id_tamanho_camisa_predefinido = NULL, id_tamanho_short_calca_predefinido = NULL
WHERE id_pessoa = 747253;

UPDATE public.discente 	SET id_pessoa=747300	WHERE id_discente=974289;


--backup
UPDATE public.discente 	SET id_pessoa=747253	WHERE id_discente=974289;
UPDATE comum.pessoa SET nome='DAVI BRAGA DA FONSECA', data_nascimento='2010-02-15', sexo='F', id_raca=2, id_endereco_residencial=NULL, id_endereco_contato=NULL, passaporte=NULL, id_grau_formacao=NULL, abreviatura=NULL, cpf_cnpj=NULL, id_pais_nacionalidade=31, nome_pai='FRANCINALDO GOMES DA FONSECA', nome_mae='ELIANA LEITÃO BRAGA', email='davibraga@gmail.com', id_estado_civil=1, bairro='Salina da Cruz', id_uf_naturalidade=24, id_municipio_naturalidade=2400208, numero='30', tipo='F', valido=false, ultima_atualizacao='2026-04-17 08:38:53.218', endereco='Rua Santa Terezinha', id_conta_bancaria=NULL, numero_certificado_militar='', serie_certificado_militar='', categoria_certificado_militar='', orgao_expedicao_certificado_militar='', data_expedicao_certificado_militar=NULL, numero_identidade='', orgao_expedicao_identidade='', id_unidade_federativa_identidade=24, data_expedicao_identidade=NULL, numero_titulo_eleitor=NULL, zona_titulo_eleitor=NULL, secao_titulo_eleitor=NULL, data_expedicao_titulo_eleitor=NULL, id_unidade_federativa_titulo_eleitor=NULL, id_uf_identidade=NULL, id_uf_titulo_eleitor=NULL, id_uf_certificado_militar=NULL, codigo_area_nacional_telefone_celular=NULL, codigo_area_nacional_telefone_fixo=NULL, origem=NULL, telefone_fixo='', telefone_celular='(84)99984-0033', fax=NULL, data_cadastro='2020-09-24 10:54:25.352', nome_ascii='DAVI BRAGA DA FONSECA', id_tipo_rg=NULL, tipo_sanguineo=NULL, pais_nacionalidade='BRASILEIRA', estrangeiro=false, certidao_civil_tipo='0', certidao_civil_modelo='N', certidao_civil_num_termo='', certidao_civil_num_folha='', certidao_civil_num_livro='', certidao_civil_data=NULL, certidao_civil_id_municipio_cartorio=2404507, certidao_civil_cartorio='', certidao_civil_matricula_nova='09561201552010000113155000926495', cod_educacenso=NULL, complemento='', codigo_rh=NULL, nome_responsavel_matricula='Francinaldo Gomes da Fonseca', grau_parentesco_responsavel_matricula='PAI', tipo_documento_responsavel_matricula=NULL, numero_documento_responsavel_matricula='4301564489', cep='59598-000', codigo_rh_old=NULL, id_municipio_contato=2404507, id_uf_contato=24, id_pessoa_restauracao=NULL, profissaopai='', profissaomae='', codigo_unificado=NULL, id_pessoa_unificada=NULL, id_orgao_emissor_identidade=NULL, codigo_nis='', certidao_civil_cartorio_codigo_inep=NULL, "semCpf"=false, justificativa=NULL, id_bairro_endereco=NULL, id_tipo_documento_militar=NULL, id_tipo_militar=NULL, documento_militar=NULL, semcpf=NULL, municipio_ext=NULL, uf_naturalidade_ext=NULL, codigo_inep='', id_escolaridade=NULL, codigo_sus='898003013076684', id_informacoes_medicas=52616503, endereco_atual=NULL, bairro_atual=NULL, cep_atual=NULL, id_dados_pessoa_censo=NULL, email_alternativo=NULL, pis_pasep=NULL, numero_identidade_mae='00.230.948-0', numero_identidade_pai='', orgao_expedicao_identidade_mae='ITEP', orgao_expedicao_identidade_pai='', data_expedicao_identidade_mae=NULL, data_expedicao_identidade_pai=NULL, id_uf_identidade_mae=24, id_uf_identidade_pai=24, id_localizacao_zona=2, possui_laudo=false, telefone_celular2='', telefone_celular3='', contato_celular='MÃE', contato_celular2='', contato_celular3='', id_tipo_tamanho_camisa=NULL, id_tamanho_camisa_letra=NULL, tamanho_camisa_livre=NULL, id_tipo_tamanho_short_calca=NULL, id_tamanho_short_calca_letra=NULL, tamanho_short_calca_livre=NULL, tamanho_calcado='40', id_tipo_tamanho_calca=NULL, id_tamanho_calca_letra=NULL, tamanho_calca_livre=NULL, nome_social=NULL, cid='', cpf_filiacao_1=0, cpf_filiacao_2=0, id_tamanho_camisa_predefinido=11, id_tamanho_short_calca_predefinido=11, id_grau_parentesco_responsavel_matricula=2, id_povo_indigena=NULL, id_foto_reconhecimento_facial=NULL, codigo_familia='', data_nascimento_filiacao_1=NULL, data_nascimento_filiacao_2=NULL, data_nascimento_responsavel='1983-04-10', quilombola=false, id_tipo_etnia=NULL, status_avaliacao_nee=0 WHERE id_pessoa=747253;




SELECT * FROM comum.usuario u WHERE u.id_usuario = 107927;

--TANUZIA ROSANGELA DA CAMARA OLEGARIO --2026-02-26 17:36:36.780
