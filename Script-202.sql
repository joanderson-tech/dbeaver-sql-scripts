select * from comum.pessoa p where p.nome = 'GREGORIO JOSE SANTOS DE MEDEIROS';
select * from comum.pessoa p where p.nome = 'MARIA EDUARDA CORREIRA ALVES';
select * from discente d where d.id_pessoa  in (52788861,776554);
select * from basico.estudante e where e.id_estudante in (1370053);
select * from basico.matricula_estudante_serie mes where mes.id_estudante in (1370053);
select string_agg(id_matricula_componente::text, ', ')  from ensino.matricula_componente mc where mc.id_discente = 1370053;
select string_agg(id_frequencia::text, ', ')  from ensino.frequencia_aluno fa where fa.id_discente = 1370053;
select * from ensino.abono_frequencia af where af.id_estudante = 1370053;
select * from escola.solicitacao_documento sd where sd.id_estudante =  1370053;
select * from basico.movimentacao_estudante me where id_discente = 975391;
select * from matricula.estudante_inscrito ei where id_estudante  =1370053;
select * from comum.pessoa_necessidade_especial pne where id_pessoa in (748559,748744) ;

select * from comum.pessoa p 
where cpf_cnpj = 17242947413;
-- pessoa mais antigo correto 748744 / errado 748559

select matricula , id_pessoa , * 
 from discente d 
 where id_pessoa  in (748744, 748559 );
 --id_disc correto 975538   / errado 975391

select * 
from basico.matricula_estudante_serie mes 
 where id_estudante in (975538, 975391)
 order by ano_calendario; 
 -- pega os ids errados no id Discente errado / e setar no update para o id discente correto /vai para o update

select string_agg(id_matricula_componente::varchar, ', ')  
from ensino.matricula_componente mc where id_discente = 975391;
--17062688, 17062685, 17062673, 17062676, 17062679, 17062682

select string_agg(id_matricula_discente_serie ::varchar, ', ')  
from basico.matricula_estudante_serie where id_estudante  = 975391;
--1322975

select string_agg(id_renovacao_matricula::varchar, ', ')  
from matricula.renovacao_matricula where id_discente  = 975391;
--null

select string_agg(id_frequencia::varchar, ', ')  
from ensino.frequencia_aluno where id_discente  = 975391;
--138708633, 138708634, 138708635, 138708636, 138708637, 138708638, 138708639, 138708640, 138708641, 138708642, 138708788, 138709060, 138708787, 138708786, 138709303, 138730298, 138730314, 138730330, 138734033, 138734048

select string_agg(id_estudante_documento_pendente::varchar, ', ')  
from basico.estudante_documento_pendente edp where id_estudante  = 975391;
--null

select string_agg(id::varchar, ', ')  from diario.competencia_habilidades_aluno cha where id_discente =  975391;
--NULL

select string_agg(id_historico_implantado::varchar, ', ') from diario.historico_implantado  where id_estudante  =  975391;
--NULL

select id_observacao_discente from ensino.observacao_discente od  where id_discente  =  975391;
--522620670

SELECT * FROM comum.pessoa_necessidade_especial pne WHERE pne.id_pessoa  = 975391;

select * from basico.tipo_movimentacao_estudante tme
where tme.id_tipo_movimentacao_estudante = 975391;

-------------------------------------------------------------------------------
--Usar dados antigos que serão deletados para o backup;
select * FROM basico.estudante WHERE id_estudante in (975391);
select * FROM public.discente WHERE id_discente=975391;
select * FROM comum.pessoa where id_pessoa = 748559; 

--backup
UPDATE basico.matricula_estudante_serie
	SET id_estudante=52253860
	WHERE id_matricula_discente_serie=1322975;

INSERT INTO comum.pessoa_necessidade_especial
(id_pessoa_necessidade_especial, observacao, id_necessidade_especial, id_pessoa, id_pessoa_transferencia, codmergcomperve)
VALUES(52370246, NULL, 6, 748744, NULL, NULL);

INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(975391, 51870468, '', NULL, NULL, false, false, NULL, NULL, NULL, false, false);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(975391, 2023, NULL, '202330001243', NULL, 748559, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2023-01-31 10:57:14.565', NULL, 5819988, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, nome_social)
VALUES(748559, 'GREGORIO JOSE SANTOS DE MEDEIROS', '2020-07-03', 'M', 1, NULL, NULL, NULL, NULL, NULL, 17242947413, 31, NULL, 'JAILSON PEREIRA DE MEDEIROS', 'ROSEANE OLIVEIRA DOS SANTOS', '', 1, 'NOVO HORIZONTE', 24, 2403103, '104', 'F', false, '2023-01-31 10:57:14.564', 'RUA DOUTOR MÁRIO NÓBREGA DE ARAÚJO', NULL, '', '', '', '', NULL, '', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2023-01-31 10:57:14.564', 'GREGORIO JOSE SANTOS DE MEDEIROS', NULL, NULL, 'BRASILEIRA', false, '0', 'N', '', '', '', NULL, 2403004, '', '09554701552020100013170000476931', NULL, '', NULL, 'ROSEANE OLIVEIRA DOS SANTOS', 'Mãe', 'CPF', '6397151417', '59375-000', NULL, 2403004, 24, NULL, 'AGRICULTOR', 'PSICÓLOGA', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '24035262', NULL, '702507771958040', 52253859, NULL, NULL, NULL, NULL, NULL, NULL, '2509453', '3293691', 'SSP', 'SSP', NULL, NULL, 24, 24, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-------------------------------------------------------------------------------
BEGIN;
commit;
rollback;

--SOLUÇÃO

--atualiza ensino.matricula_componente seta no id correto os id discentes errados para univficar
UPDATE ensino.matricula_componente 
	SET id_discente =975538 
	WHERE id_matricula_componente  in (17062688, 17062685, 17062673, 17062676, 17062679, 17062682);


-- Alterar basico.matricula_estudante_serie
UPDATE basico.matricula_estudante_serie
	SET id_estudante=975538
	WHERE id_matricula_discente_serie=1322975;

-- Alterar matricula.renovacao_matricula
--UPDATE matricula.renovacao_matricula SET id_discente=1342055 WHERE id_renovacao_matricula=61134392;

-- Alterar ensino.frequencia_aluno
UPDATE ensino.frequencia_aluno 
	SET id_discente= 975538
	WHERE id_frequencia in (138708633, 138708634, 138708635, 138708636, 138708637, 138708638, 138708639, 138708640, 138708641, 138708642, 138708788, 138709060, 138708787, 138708786, 138709303, 138730298, 138730314, 138730330, 138734033, 138734048);


--update comum.pessoa set nome  = 'JANIKLEYSON FERNANDES DA SILVA BATISTA' where id_pessoa  = 751684;

--update matricula.renovacao_excepcional_matricula_processamento set id_discente = 978392 where id_discente = 982836;

--update basico.estudante_documento_pendente set id_estudante = 1359546 where id_estudante_documento_pendente in (63032671);

--update diario.competencia_habilidades_aluno set id_discente = 978392 where id in (53936, 56228, 56227);

--update diario.historico_implantado set id_estudante = 978392 where id_historico_implantado in (32975, 32976);

update ensino.observacao_discente set id_discente = 975538 where id_observacao_discente = 522620670;

-- Auto-generated SQL script #202407041333
UPDATE basico.movimentacao_estudante
	SET id_discente=975538
	WHERE id_movimentacao_estudante=68789;


UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=748744
	WHERE id_pessoa_necessidade_especial=52253861;

DELETE FROM comum.pessoa_necessidade_especial
WHERE id_pessoa_necessidade_especial=52253860;


-- Deletar basico.estudante o ERRADO
DELETE FROM basico.estudante WHERE id_estudante=975391;
--1387237

BEGIN;
commit;
rollback;


UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=748559
	WHERE id_pessoa_necessidade_especial=52253861;

UPDATE public.discente
	SET id_pessoa=748559
	WHERE id_discente=975391;
------
-- Deletar public.discente
DELETE FROM public.discente WHERE id_discente=975391

UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=748744
	WHERE id_pessoa_necessidade_especial=52253861;

UPDATE public.discente
	SET id_pessoa=748744
	WHERE id_discente=975391;

DELETE FROM comum.pessoa_necessidade_especial
WHERE id_pessoa_necessidade_especial=52253860;

-- Deletar comum.pessoa
DELETE FROM comum.pessoa WHERE id_pessoa=748559; 

Erro SQL [23503]: ERROR: update or delete on table "pessoa" violates foreign key constraint "pessoa_necessidade_especial_id_pessoa_fkey" on table "pessoa_necessidade_especial"
  Detalhe: Key (id_pessoa)=(748559) is still referenced from table "pessoa_necessidade




