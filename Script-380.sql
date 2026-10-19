{panel:title=Cenário de testes}
*Ambiente de testes*: http://goianinha-rn.testes-portalsigeduc.esig.com.br/app/public/home.jsf
*Usuário:* goianinharn
*Caminho do caso de uso:* Módulo Gestão de Estudantes >> Estudantes >> Estudantes >> Consulta Geral de Estudantes
{panel}

{panel:title=O que foi feito}
	
Os dados das irmãs gêmeas ANA CLARA COSTA FERNANDES e ANNE CAROLINE COSTA FERNANDES, que estavam unificados, foram desvinculados, assim como os de NICOLAS KAIQUE DA SILVA SANTOS e ANTHONY KAEU DA SILVA SANTOS. No entanto, é necessário realizar ajustes nos dados pessoais. Como não foi possível obter essas informações no banco de logs, solicitamos que o cliente atualize os dados, "sem unificar".

{panel}

{panel:title=Scripts - Municipio de Caico - RN}
*Identificação do banco:* Qual o servidor de banco (s4-portal-db-01, acadêmico).
*Script de solução:*
{code:sql}

--SOLUÇÃO de ANA CLARA COSTA FERNANDES e ANNE CAROLINE COSTA FERNANDES

-- 01 script para unificar a matricula_componente
SELECT 'UPDATE ensino.matricula_componente SET id_discente = 992969 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao,
	   'UPDATE ensino.matricula_componente SET id_discente = '|| mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup,
	    COUNT(mc.id_matricula_componente) AS quantidade_ids
from ensino.matricula_componente mc 
where mc.id_discente IN (979783)
GROUP BY  mc.id_discente;	

--SOLUÇÃO MATRICULA COMPONENTE AQUI 51 

-- 02 FREQUENCIA
SELECT 
    'UPDATE ensino.frequencia_aluno SET id_discente = 992969 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script,
    'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup,
     COUNT(fa.id_frequencia) AS quantidade_ids
FROM  ensino.frequencia_aluno fa 
WHERE fa.id_discente IN (979783)
GROUP BY fa.id_discente;

--SOLUÇÃO FREQUENCIA AQUI 1118

UPDATE basico.matricula_estudante_serie SET id_estudante=992969 
WHERE id_matricula_discente_serie in (1320579, 1326242, 1334268, 1338628, 1344247, 1349993, 1350048);

UPDATE basico.movimentacao_estudante SET id_discente=992969
WHERE id_movimentacao_estudante in (69940);

UPDATE diario.competencia_habilidades_aluno SET id_discente = 992969 
WHERE id in (39874, 48888, 50539);

UPDATE ensino.observacao_discente SET id_discente = 992969 
WHERE id_observacao_discente in (52120455,530846931) ;

UPDATE matricula.renovacao_matricula SET id_discente=992969 
WHERE id_renovacao_matricula in (51970632, 52204122, 52785524, 53071101, 53071239);

UPDATE comum.alteracao_status_aluno SET id_discente=992969
WHERE id_alteracao=530918474;

UPDATE public.discente SET id_pessoa=51876858
WHERE id_discente=979649;

UPDATE comum.alteracao_pessoa SET id_pessoa=51876858
WHERE id_alteracao_pessoa in (524805823,524806951);

DELETE FROM basico.estudante
WHERE id_estudante=979783;

DELETE FROM public.discente
WHERE id_discente=979783;

DELETE FROM comum.pessoa WHERE id_pessoa=51876815;


-- SOLUÇÃO de NICOLAS KAIQUE DA SILVA SANTOS e ANTHONY KAEU DA SILVA SANTOS
UPDATE comum.pessoa
	SET cpf_cnpj=NULL,nome='ANTHONY KAEU DA SILVA SANTOS'
	WHERE id_pessoa=751845;

UPDATE public.discente
	SET id_pessoa=751845
	WHERE id_discente=990068;


{code}
*Backup:*
{code:sql}

--backup de ANA CLARA COSTA FERNANDES e ANNE CAROLINE COSTA FERNANDES

UPDATE basico.matricula_estudante_serie SET id_estudante=979783 
WHERE id_matricula_discente_serie in (1320579, 1326242, 1334268, 1338628, 1344247, 1349993, 1350048);

UPDATE basico.movimentacao_estudante SET id_discente=979783
WHERE id_movimentacao_estudante in (69940);

UPDATE diario.competencia_habilidades_aluno SET id_discente = 979783 
WHERE id in (39874, 48888, 50539);

UPDATE ensino.observacao_discente SET id_discente = 979783 
WHERE id_observacao_discente in (52120455,530846931) ;

UPDATE matricula.renovacao_matricula SET id_discente=979783 
WHERE id_renovacao_matricula in (51970632, 52204122, 52785524, 53071101, 53071239);

UPDATE comum.alteracao_status_aluno SET id_discente=979783
WHERE id_alteracao=530918474;

UPDATE public.discente SET id_pessoa=51876815
WHERE id_discente=979649;

UPDATE comum.alteracao_pessoa SET id_pessoa=51876815
WHERE id_alteracao_pessoa in (524805823,524806951);

INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca, id_tipo_instituicao_origem) VALUES(979783, 51869847, NULL, NULL, NULL, false, false, '2022-08-16', 5719037, NULL, false, false, NULL);

INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(979783, 2019, NULL, '201951876815', NULL, 51876815, 605, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2019-10-08 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola) VALUES(51876815, 'ANNA CLARA COSTA FERNANDES', '2015-05-02', 'F', 1, NULL, NULL, NULL, NULL, NULL, 71160565481, 31, NULL, 'SUELI FERNANDES', 'ANA KARINE COSTA DE ARAUJO', '', NULL, 'ZONA RURAL VILA 2 DO SABUGI', 24, 2402006, 'lote 30', 'F', true, '2022-08-16 09:28:04.420', 'RUA ELIAS FERNANDES DE MORAIS', NULL, NULL, NULL, NULL, NULL, NULL, '003665771', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '8499629809', NULL, '2019-10-08 00:00:00.000', 'ANNA CLARA COSTA FERNANDES', NULL, NULL, 'BRASILEIRA', false, '0', NULL, '', '', '', NULL, 2402006, '', '', NULL, '', NULL, 'Ana Karine Costa de Araujo', 'MAE', 'CPF', '4771276498', '59300000', NULL, 2402006, 24, NULL, 'REPRESENTANTE DE VENDAS', 'DO LAR', NULL, NULL, NULL, '23743657224', NULL, false, NULL, 3834, NULL, NULL, NULL, NULL, NULL, NULL, '150005117517', NULL, '898004722408493', 52679450, NULL, NULL, NULL, NULL, NULL, NULL, '002056969', '', 'SSP', '', NULL, NULL, 24, 24, NULL, false, NULL, NULL, 'MÃE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);

--backup de NICOLAS KAIQUE DA SILVA SANTOS e ANTHONY KAEU DA SILVA SANTOS
UPDATE comum.pessoa
	SET cpf_cnpj=17628241409, nome='ANTHONY KAEU DA SILVA SANTOS'
	WHERE id_pessoa=751845;

UPDATE public.discente
	SET id_pessoa=751831
	WHERE id_discente=990068;


{code}

{panel}
