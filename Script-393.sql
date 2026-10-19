select * from basico.estudante e;


select * from comum.pessoa p where p.nome = 'ANA BEATRIZ DE MOURA CARVALHO';
select * from comum.pessoa p where p.nome = 'ABDIEL ARTHUR DA SILVA MELO';
-- pessoa mais antigo correto 52793684 / errado 756024   

select * from comum.pessoa p where cpf_cnpj = '10776064517';

select * from comum.pessoa   where id_pessoa  in (763738, 763738);

select matricula , id_pessoa , *  from discente d  where id_pessoa   in (757078, 749615);

select * from basico.estudante e where id_estudante =1024485;
select * from discente d where id_discente = 1024485;

select * from basico. mes where mes.id_estudante in (1019779,1022377);


select
	mes
from
	basico.matricula_estudante_serie mes
join ensino.turma t on
	t.id_turma_serie = mes.id_turma_serie
join basico.turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
join ensino.situacao_turma st on
	st.id_situacao_turma = t.id_situacao_turma
where
	st.id_situacao_turma in ( :situacaoExcluida )
	and t.agrupadora = true
	and mes.ano_calendario = 2025;

begin; 
commit;
UPDATE basico.matricula_estudante_serie SET id_estudante=1019779, id_situacao_matricula_serie=6, situacao_final=NULL, id_turma_serie=55496443, id_curriculo_medio=55493750, dependencia=false, id_registro_entrada=6521166, data_cadastro='2025-01-02 16:17:19.136', num_chamada=NULL, id_serie_escola=51915027, ano_calendario=2025, id_turno=2, status_censo=NULL, periodo=1, avaliacao='N', id_tipo_ocupacao_vaga=NULL, id_usuario_consolidacao=NULL, data_consolidacao=NULL, id_vaga_serie=55420223, data_reabertura_ficha=NULL, id_serie_multisseriado=51869715, id_registro_atualizacao=6574159, data_atualizacao='2025-02-15 09:28:21.000', retencao_progressao_parcial=false, id_turma_serie_multisseriado=55496445, data_matricula_turma=NULL, frequencia=NULL, numero_faltas=NULL, id_tipo_matricula_serie=1 WHERE id_matricula_discente_serie=1430608;

-- Auto-generated SQL script #202502250949
UPDATE basico.matricula_estudante_serie
	SET id_turma_serie=55496443
	WHERE id_matricula_discente_serie=1430608;


SELECT x.* FROM ensino.situacao_turma x;

select * from basico.matricula_estudante_serie mes where id_matricula_discente_serie  = 1430608;

select * from matricula.movimentacao_estudante_escola mee where id_movimentacao_estudante_escola = 55515808;



select * from basico.turma_serie ts where ts.nome = 'EIMSMMTS1A-M1' and id_serie = 51875238;

select * from basico.grupo_serie gs;

select * from  basico.matricula_estudante_serie mes where id

begin;
rollback;

commit;

select * from comum.pessoa p where p.nome = 'ANA BEATRIZ DE MOURA CARVALHO';

INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola) 
			VALUES(nextval('hibernate_sequence'), 'ANA BEATRIZ DE MOURA CARVALHO', '2010-03-07', 'F', 1, NULL, NULL, NULL, NULL, NULL, 60729360326, 31, NULL, 'WALLISON CARVALHO SANTOS MOURA', 'PAULA DE MOURA CARVALHO', 'Anabeatrizdemouracarvalho@gmail.com', 1, 'SANTO ANTONIO', 21, 2109106, '503', 'F', false, 
CURRENT_DATE, 'AVENIDA RIO BRANCO', NULL, '', '', '', '', NULL, '0413399520104', 'SSP', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(84)99108-0217', NULL, 
CURRENT_DATE, 'ANA BEATRIZ DE MOURA CARVALHO', NULL, NULL, 'BRASILEIRA', false, '0', 'N', '', '', '', NULL, 2408003, '', NULL, NULL, 'lado ímpar', NULL, 'PAULA DE MOURA CARVALHO', 'MAE', NULL, '2533131393', '59619400', NULL, 2408003, 24, NULL, 'MONTADOR', 'EMPRESARIA', NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '703005830454776', 55069126, NULL, NULL, NULL, NULL, NULL, NULL, '0228164220023', '', 'SSP', '', NULL, NULL, 21, 24, 1, false, '', '', 'MAE', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
	

select
	*
from
	basico.matricula_estudante_serie mes
where
	id_estudante = 1019779
	and ano_calendario = 2025;

update
	basico.matricula_estudante_serie
set
	ano_calendario =?,
	avaliacao =?,
	id_curriculo_medio =?,
	data_atualizacao =?,
	data_cadastro =?,
	data_consolidacao =?,
	data_matricula_turma =?,
	data_reabertura_ficha =?,
	dependencia =?,
	id_estudante =?,
	frequencia =?,
	id_vaga_serie =?,
	num_chamada =?,
	numero_faltas =?,
	periodo =?,
	id_registro_atualizacao =?,
	id_registro_entrada =?,
	id_serie_escola =?,
	id_serie_multisseriado =?,
	id_situacao_matricula_serie =?,
	status_censo =?,
	id_turma_serie =?,
	id_turma_serie_multisseriado =?,
	id_turno =?,
	id_usuario_consolidacao =?
where
	id_matricula_discente_serie =?
	
	

select
	d.id_discente,
	d.matricula,
	d.status,
	d.nivel,
	d.tipo,
	p.nome as nome_discente,
	d.ano_ingresso,
	d.periodo_ingresso,
	esc.id_escola,
	esc.nome as nome_escola,
	mun_esc.nome as nome_mun_escola,
	mee.id_matricula_discente_serie as id_matricula_estudante_serie,
	s.id_serie,
	s.descricao as serie_nome,
	etapa.id_etapa_ensino as id_etapa,
	etapa.denominacao as etapa_nome,
	mee.id_situacao_matricula_serie,
	sms.descricao as situacaoMatricula,
	t.descricao as turnoDescricao,
	ts.nome as nomeTurma,
	est.participa_bolsa_familia as participaBolsaFamilia,
	cb.possui_parte_diversificada
from
	discente d
inner join comum.pessoa p on
	(p.id_pessoa = d.id_pessoa)
inner join basico.estudante est on
	(est.id_estudante = d.id_discente)
left join basico.matricula_estudante_serie mee on
	mee.id_estudante = est.id_estudante
left join basico.turma_serie ts on (coalesce(mee.id_turma_serie_multisseriado, mee.id_turma_serie) = ts.id_turma_serie)
left join basico.curriculo_basico cb on
	cb.id_curriculo_basico = ts.id_curriculo_medio
left join ensino.turno t on
	(mee.id_turno = t.id_turno)
left join basico. situacao_matricula_serie sms
		using(id_situacao_matricula_serie)
left join escola.escola_etapa_ensino_serie esc_serie on
	(esc_serie.id_escola_etapa_ensino_serie = mee.id_serie_escola)
left join escola.escola esc on
	(esc.id_escola = esc_serie.id_escola)
left join escola.configuracao_escola ce on
	(esc.id_escola = ce.id_Escola)
left join comum.municipio as mun_esc on
	(mun_esc.id_municipio = esc.id_municipio)
left join basico.serie s on
	(s.id_serie = esc_serie.id_serie)
left join basico.grupo_serie gs on
	(gs.id_serie = s.id_serie)
left join basico.etapa_ensino etapa on
	(etapa.id_etapa_ensino = s.id_etapa_ensino)
where
	1 = 1
	and mee.ano_calendario = '2025'
	and d.nivel = 'B'
	and ( upper(p.nome) like '%HARLLEY KAUA DANTAS MORAIS%'
		or upper(p.nome_ascii) like '%HARLLEY KAUA DANTAS MORAIS%')
	and esc.id_escola = 2583
	and sms.id_situacao_matricula_serie in ( 1, 2, 3, 8, 7 )
order by
	mun_esc.nome,
	esc.nome,
	p.nome;