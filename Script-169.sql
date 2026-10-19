select * from comum.pessoa p where p.nome = 'VANDERSON WILQUE PEREIRA DE AQUINO';
select * from discente d where d.id_pessoa  in (769034);
select * from basico.estudante e where e.id_estudante in (1399592,1398268);
select * from basico.matricula_estudante_serie mes where mes.id_estudante in (1399592,1398268);
select string_agg(id_matricula_componente::text, ', ')  from ensino.matricula_componente mc where mc.id_discente = 1398268;
select string_agg(id_frequencia::text, ', ')  from ensino.frequencia_aluno fa where fa.id_discente = 1398268;
select * from ensino.abono_frequencia af where af.id_estudante = 1398268;
select * from escola.solicitacao_documento sd where sd.id_estudante =  1399592;
select * from basico.movimentacao_estudante me where id_discente = 1398268;
select * from matricula.estudante_inscrito ei where id_estudante  =1398268;
select * from comum.pessoa_necessidade_especial pne where id_pessoa = 770264;

select * from comum.pessoa p 
where cpf_cnpj = 16573485475;
-- pessoa mais antigo correto 770264 / errado 768894

select matricula , id_pessoa , * 
 from discente d 
 where id_pessoa  in (770264,768894 );
 --id_disc correto 1399592   / errado 1398268

select * 
 from basico.matricula_estudante_serie mes 
 where id_estudante in (1398268, 1399592)
 order by ano_calendario; 

 -- pega os ids errados no id Discente errado / e setar no update para o id discente correto /vai para o update

select string_agg(id_matricula_componente::varchar, ', ')  
from ensino.matricula_componente mc where id_discente = 1398268;
--null

select string_agg(id_matricula_discente_serie ::varchar, ', ')  
from basico.matricula_estudante_serie where id_estudante  = 1398268;
--1491807

select string_agg(id_renovacao_matricula::varchar, ', ')  
from matricula.renovacao_matricula where id_discente  = 1398268;
--null

select string_agg(id_frequencia::varchar, ', ')  
from ensino.frequencia_aluno where id_discente  = 1398268;
--Null

select string_agg(id_estudante_documento_pendente::varchar, ', ')  
from basico.estudante_documento_pendente edp where id_estudante  = 1398268;
--null

select string_agg(id::varchar, ', ')  from diario.competencia_habilidades_aluno cha where id_discente =  1398268;
--NULL

select string_agg(id_historico_implantado::varchar, ', ') from diario.historico_implantado  where id_estudante  =  1398268;
--NULL

select id_observacao_discente from ensino.observacao_discente od  where id_discente  =  1398268;
--615159912

SELECT * FROM comum.pessoa_necessidade_especial pne WHERE pne.id_pessoa  = 1398268;

-------------------------------------------------------------------------------
--Usar dados antigos que serão deletados para o backup;
select * FROM basico.estudante WHERE id_estudante in (1398268, 1399592);
select * FROM public.discente WHERE id_discente=1398268;
select * FROM comum.pessoa where id_pessoa = 768894; 
select * from basico.estudante_


--backup
INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(1398268, 51869713, NULL, NULL, NULL, true, false, NULL, NULL, NULL, false, false);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(1398268, 2024, NULL, '202430037614', NULL, 768894, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-24 11:56:23.053', NULL, 6269007, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado)
VALUES(768894, 'KAUA GABRIEL CONCEICAO SILVA', '2023-02-18', 'M', 1, NULL, NULL, NULL, NULL, NULL, 18446537494, 31, NULL, 'JEOVAN EIAS DE SOUZA SILVA', 'MARIA SELIANA CONCEICAO CARVALHO', '', NULL, 'PROJETO SENADOR NILO COELHO N-4', 26, 2611101, '2', 'F', false, '2024-01-24 11:56:22.981', 'Rua U', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '87981511098', NULL, '2024-01-24 11:56:22.981', 'KAUA GABRIEL CONCEICAO SILVA', NULL, NULL, 'JUAZEIRO', false, '0', 'N', '', '', '', NULL, 2611101, '', '16371330155202310017790801945122', NULL, 'Casa', NULL, 'Maria Seliana Conceição carvalho', 'MÃE', 'CPF', '11122022425', '56353777', NULL, 2611101, 26, NULL, 'AGRICULTOR', 'AGRICULTORA', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 61515157, NULL, NULL, NULL, NULL, NULL, NULL, '9300605', '8827602', 'SSP', 'SSP', NULL, NULL, 26, 26, NULL, false, '', '', 'MARIA SELIANA CONCEIÇÃO CARVALHO', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1398268
	WHERE id_matricula_discente_serie=1491807;

UPDATE matricula.estudante_inscrito
	SET id_estudante=1398268
	WHERE id_estudante_inscrito=61423749;

UPDATE basico.movimentacao_estudante
	SET id_discente=1398268
	WHERE id_movimentacao_estudante=69594;

UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=768894
	WHERE id_pessoa_necessidade_especial=61515158;

update ensino.observacao_discente set id_discente = 1398268 where id_observacao_discente = 615159912;
-------------------------------------------------------------------------------
BEGIN;
commit;
rollback;

--SOLUÇÃO

--atualiza ensino.matricula_componente seta no id correto os id discentes errados para univficar
--update ensino.matricula_componente set id_discente =1347800 where id_matricula_componente  in (18241328, 18241329, 18241330, 18241331, 18241332, 18241333, 18241334, 18241335, 18241336);

-- Alterar basico.matricula_estudante_serie
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1399592
	WHERE id_matricula_discente_serie=1491807;

UPDATE matricula.estudante_inscrito
	SET id_estudante=1399592
	WHERE id_estudante_inscrito=61423749;

UPDATE basico.movimentacao_estudante
	SET id_discente=1399592
	WHERE id_movimentacao_estudante=69594;

UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=770264
	WHERE id_pessoa_necessidade_especial=61515158;


-- Alterar matricula.renovacao_matricula
--UPDATE matricula.renovacao_matricula SET id_discente=978392 WHERE id_renovacao_matricula=52430537;

-- Alterar ensino.frequencia_aluno
--UPDATE ensino.frequencia_aluno SET id_discente= 1347800
--WHERE id_frequencia in (154389856, 154390009, 154390060, 154390123, 154390356, 154390595, 154391357, 154390989, 154391047, 154391178, 154391736, 154391896, 154390658, 154392489, 154392675, 154392869, 154391582, 154393111, 154393595, 154393433, 154393782, 154394608, 154623717, 154649436, 154879609, 154879425, 154880293, 154880543, 154880127, 155202874, 155203030, 155203080, 155409621, 155518076, 155828557, 155828820, 155940907, 156306328, 157165050, 157166243, 157166771, 157167173, 157921007, 157921085, 157921270, 157921339, 157921480, 158198226, 158198291, 158198356, 158198505, 158572722, 158572801, 158719840, 158719941, 158741211, 158741231, 158741294, 158741364, 158783464, 158947677, 158947610, 159164378, 159164672, 159348769, 159348886, 159485352, 159586059);


--update comum.pessoa set nome  = 'JANIKLEYSON FERNANDES DA SILVA BATISTA' where id_pessoa  = 751684;

--update matricula.renovacao_excepcional_matricula_processamento set id_discente = 978392 where id_discente = 982836;

--update basico.estudante_documento_pendente set id_estudante = 1359546 where id_estudante_documento_pendente in (63032671);

--update diario.competencia_habilidades_aluno set id_discente = 978392 where id in (53936, 56228, 56227);

--update diario.historico_implantado set id_estudante = 978392 where id_historico_implantado in (32975, 32976);

update ensino.observacao_discente set id_discente = 1399592 where id_observacao_discente = 615159912;

-- Deletar basico.estudante o ERRADO
DELETE FROM basico.estudante WHERE id_estudante=1398268;

-- Deletar public.discente
DELETE FROM public.discente WHERE id_discente=1398268;

-- Deletar comum.pessoa
DELETE FROM comum.pessoa WHERE id_pessoa=768894; 








  
 