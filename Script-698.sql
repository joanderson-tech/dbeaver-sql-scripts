select string_agg(T.id_turma  ::varchar, ', ')  from ensino.docente_turma dt 
join ensino.turma t on t.id_turma = dt.id_turma 
where dt.ativo 
and t.codigo = 'EFAIV2B'
and t.ano = 2025;


select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and p.nome = 'LUZINEIDE PEREIRA DA SILVA BEZERRA';


select * from discente d where D.matricula = '202030000266';


select * from ensino.frequencia_aluno fa where FA.id_discente = 986805 and data = 2025-02-17;

SELECT * 
FROM ensino.frequencia_aluno fa 
WHERE fa.id_discente = 986805 
  AND EXTRACT(YEAR FROM fa.data) = 2025
  and FA.id_turma in (709802);

select * from ensino.frequencia_turma ft where ft.id_turma in  (709802);

select * from basico.matricula_estudante_serie mes where mes.id_estudante = 986805 and mes.ano_calendario = 2025;






















select
	this_.id_turma as id1_5926_94_,
	this_.agrupadora as agrupadora5926_94_,
	this_.ano as ano5926_94_,
	this_.capacidade_aluno as capacidade4_5926_94_,
	this_.id_categoria_componente as id31_5926_94_,
	this_.categoria_esportiva as categoria5_5926_94_,
	this_.codigo as codigo5926_94_,
	this_.codigo_rh as codigo7_5926_94_,
	this_.data_alteracao as data8_5926_94_,
	this_.data_cadastro as data9_5926_94_,
	this_.data_consolidacao as data10_5926_94_,
	this_.data_fim as data11_5926_94_,
	this_.data_inicio as data12_5926_94_,
	this_.descricao_horario as descricao13_5926_94_,
	this_.id_disciplina as id30_5926_94_,
	this_.execucao as execucao5926_94_,
	this_.extra as extra5926_94_,
	this_.grupo as grupo5926_94_,
	this_.local as local5926_94_,
	this_.id_modulo as id29_5926_94_,
	this_.motivo_exclusao as motivo18_5926_94_,
	this_.nome_professor as nome19_5926_94_,
	this_.numero_estudantes as numero20_5926_94_,
	this_.observacao as observacao5926_94_,
	this_.ordem as ordem5926_94_,
	this_.periodo as periodo5926_94_,
	this_.processada as processada5926_94_,
	this_.processada_rematricula as processada25_5926_94_,
	this_.execucao_parcial_qtd_unidades as execucao26_5926_94_,
	this_.id_registro_atualizacao as id32_5926_94_,
	this_.id_registro_cadastro as id34_5926_94_,
	this_.id_situacao_turma as id37_5926_94_,
	this_.tipo as tipo5926_94_,
	this_.total_matriculados as total28_5926_94_,
	this_.id_turma_agrupadora as id35_5926_94_,
	this_.id_turma_serie as id33_5926_94_,
	this_.id_usuario_consolidacao as id36_5926_94_,
	categoriac2_.id_categoria_componente as id1_6204_0_,
	categoriac2_.altura_imagem as altura2_6204_0_,
	categoriac2_.ativo as ativo6204_0_,
	categoriac2_.descricao as descricao6204_0_,
	categoriac2_.id_arquivo_imagem as id5_6204_0_,
	categoriac2_.ordem as ordem6204_0_,
	componente3_.id_componente_curricular as id1_5921_1_,
	componente3_.id_area_conhecimento as id11_5921_1_,
	componente3_.ativo as ativo5921_1_,
	componente3_.codigo as codigo5921_1_,
	componente3_.seq_censo as seq4_5921_1_,
	componente3_.codigo_rh as codigo5_5921_1_,
	componente3_.data_cadastro as data6_5921_1_,
	componente3_.matriculavel as matricul7_5921_1_,
	componente3_.nivel as nivel5921_1_,
	componente3_.nome as nome5921_1_,
	componente3_.sigla as sigla5921_1_,
	componente3_.id_tipo_componente as id12_5921_1_,
	areaconhec4_.id_area_conhecimento as id1_5991_2_,
	areaconhec4_.descricao as descricao5991_2_,
	tipocompon5_.id_tipo_disciplina as id1_5922_3_,
	tipocompon5_.ativo as ativo5922_3_,
	tipocompon5_.cr_ead_max as cr3_5922_3_,
	tipocompon5_.descricao as descricao5922_3_,
	docentestu6_.id_turma as id21_96_,
	docentestu6_.id_docente_turma as id1_96_,
	docentestu6_.id_docente_turma as id1_5915_4_,
	docentestu6_.id_afastamento as id20_5915_4_,
	docentestu6_.id_atividade_ape as id22_5915_4_,
	docentestu6_.ativo as ativo5915_4_,
	docentestu6_.auxiliar as auxiliar5915_4_,
	docentestu6_.ch_dedicada_periodo as ch4_5915_4_,
	docentestu6_.ch_alternativa as ch5_5915_4_,
	docentestu6_.codigo_rh as codigo6_5915_4_,
	docentestu6_.complementar as compleme7_5915_4_,
	docentestu6_.data_alteracao as data8_5915_4_,
	docentestu6_.data_cadastro as data9_5915_4_,
	docentestu6_.data_fim as data10_5915_4_,
	docentestu6_.data_inicio as data11_5915_4_,
	docentestu6_.id_docente as id26_5915_4_,
	docentestu6_.id_docente_externo as id25_5915_4_,
	docentestu6_.id_encaminhamento_candidato_escola as id24_5915_4_,
	docentestu6_.finalizada as finalizada5915_4_,
	docentestu6_.justificativa_alocacao as justifi13_5915_4_,
	docentestu6_.justificativa_cancelamento as justifi14_5915_4_,
	docentestu6_.justificativa_ch_alternativa as justifi15_5915_4_,
	docentestu6_.id_registro_atualizacao as id18_5915_4_,
	docentestu6_.id_registro_cadastro as id19_5915_4_,
	docentestu6_.regra_excecao_validacao_regras_alocacao_qualificacao as regra16_5915_4_,
	docentestu6_.suplementar as supleme17_5915_4_,
	docentestu6_.id_turma as id21_5915_4_,
	docentestu6_.id_turma_auxiliar as id23_5915_4_,
	afastament7_.id_afastamento as id1_6188_5_,
	afastament7_.ativo as ativo6188_5_,
	afastament7_.codigo_rh as codigo3_6188_5_,
	afastament7_.data_fim as data4_6188_5_,
	afastament7_.data_inicio as data5_6188_5_,
	afastament7_.enviado_servidor_para_substituicao as enviado6_6188_5_,
	afastament7_.gerou_desalocacoes as gerou7_6188_5_,
	afastament7_.id_servidor as id10_6188_5_,
	afastament7_.id_tipo as id8_6188_5_,
	afastament7_.id_unidade as id9_6188_5_,
	servidor8_.id_servidor as id1_5866_6_,
	servidor8_.id_atividade as id41_5866_6_,
	servidor8_.auxilio_transporte as auxilio2_5866_6_,
	servidor8_.id_cargo as id37_5866_6_,
	servidor8_.id_categoria as id47_5866_6_,
	servidor8_.id_classe_servidor as id48_5866_6_,
	servidor8_.codigo_inep as codigo3_5866_6_,
	servidor8_.codigo_legado as codigo4_5866_6_,
	servidor8_.codigo_rh as codigo5_5866_6_,
	servidor8_.codigo_rh_old as codigo6_5866_6_,
	servidor8_.codigo_rh_pessoa_new as codigo7_5866_6_,
	servidor8_.codigo_rh_pessoa_old as codigo8_5866_6_,
	servidor8_.admissao as admissao5866_6_,
	servidor8_.data_desligamento as data10_5866_6_,
	servidor8_.data_resposta_ficha_atualizacao as data11_5866_6_,
	servidor8_.data_transferencia as data12_5866_6_,
	servidor8_.data_ultimo_login_mobile as data13_5866_6_,
	servidor8_.dedicacao_exclusiva as dedicacao14_5866_6_,
	servidor8_.digito_siape as digito15_5866_6_,
	servidor8_.forma_vacancia as forma16_5866_6_,
	servidor8_.id_formacao as id46_5866_6_,
	servidor8_.id_foto as id17_5866_6_,
	servidor8_.id_perfil as id18_5866_6_,
	servidor8_.id_instituicao as id39_5866_6_,
	servidor8_.ja_alocado_completamente_apos_encaminhamento as ja19_5866_6_,
	servidor8_.justificativa_finalizacao as justifi20_5866_6_,
	servidor8_.justificativa_reducao_regime as justifi21_5866_6_,
	servidor8_.justificativa_remocao_reducao_regime as justifi22_5866_6_,
	servidor8_.lotacao as lotacao5866_6_,
	servidor8_.numero_contrato_1 as numero24_5866_6_,
	servidor8_.numero_contrato_2 as numero25_5866_6_,
	servidor8_.numero_termo_aditivo as numero26_5866_6_,
	servidor8_.id_pessoa as id38_5866_6_,
	servidor8_.qualificacao as qualifi27_5866_6_,
	servidor8_.quantidade_meses_termo_aditivo as quantidade28_5866_6_,
	servidor8_.reducao_regime as reducao29_5866_6_,
	servidor8_.ds_referencia as ds30_5866_6_,
	servidor8_.regime_trabalho as regime31_5866_6_,
	servidor8_.id_registro_atualizacao as id45_5866_6_,
	servidor8_.id_registro_cadastro as id40_5866_6_,
	servidor8_.id_entrada as id43_5866_6_,
	servidor8_.salario as salario5866_6_,
	servidor8_.id_ativo as id49_5866_6_,
	servidor8_.siape as siape5866_6_,
	servidor8_.id_situacao as id50_5866_6_,
	servidor8_.id_tipo_contrato_servidor as id42_5866_6_,
	servidor8_.tipo_vinculo as tipo34_5866_6_,
	servidor8_.ultima_atualizacao as ultima35_5866_6_,
	servidor8_.id_unidade as id51_5866_6_,
	servidor8_.id_unidade_transferida as id44_5866_6_,
	servidor8_.uorg as uorg5866_6_,
	cargo9_.id_cargo as id1_6106_7_,
	cargo9_.ativo as ativo6106_7_,
	cargo9_.atribuicoes as atribuic3_6106_7_,
	cargo9_.cargo_funcao as cargo4_6106_7_,
	cargo9_.cargo_seec as cargo5_6106_7_,
	cargo9_.id_categoria as id12_6106_7_,
	cargo9_.codigo_rh as codigo6_6106_7_,
	cargo9_.data_atualizacao as data7_6106_7_,
	cargo9_.denominacao as denomina8_6106_7_,
	cargo9_.id_nivel_cargo as id13_6106_7_,
	cargo9_.permite_cadastro_servidor as permite9_6106_7_,
	cargo9_.id_registro_atualizacao as id11_6106_7_,
	cargo9_.id_tipo_cargo as id10_6106_7_,
	categoria10_.ID_CATEGORIA as ID1_5832_8_,
	categoria10_.DESCRICAO as DESCRICAO5832_8_,
	categoria10_.ATIVO as ATIVO5832_8_,
	nivelcargo11_.id_nivel_cargo as id1_6107_9_,
	nivelcargo11_.ativo as ativo6107_9_,
	nivelcargo11_.descricao as descricao6107_9_,
	nivelcargo11_.sigla as sigla6107_9_,
	categoria12_.ID_CATEGORIA as ID1_5832_10_,
	categoria12_.DESCRICAO as DESCRICAO5832_10_,
	categoria12_.ATIVO as ATIVO5832_10_,
	classeserv13_.id_classe_servidor as id1_6108_11_,
	classeserv13_.ativo as ativo6108_11_,
	classeserv13_.descricao as descricao6108_11_,
	formacao14_.ID_FORMACAO as ID1_5834_12_,
	formacao14_.DENOMINACAO as DENOMINA2_5834_12_,
	formacao14_.ORDENACAO_TITULACAO as ORDENACAO3_5834_12_,
	instituica15_.id_instituicao as id1_6155_13_,
	instituica15_.ativo as ativo6155_13_,
	instituica15_.bairro as bairro6155_13_,
	instituica15_.cep as cep6155_13_,
	instituica15_.cnpj as cnpj6155_13_,
	instituica15_.cod_merge as cod6_6155_13_,
	instituica15_.complemento as compleme7_6155_13_,
	instituica15_.id_contato_instituicao as id16_6155_13_,
	instituica15_.email as email6155_13_,
	instituica15_.endereco as endereco6155_13_,
	instituica15_.id_municipio as id15_6155_13_,
	instituica15_.nome_fantasia as nome10_6155_13_,
	instituica15_.numero as numero6155_13_,
	instituica15_.prefeitura as prefeitura6155_13_,
	instituica15_.razao_social as razao13_6155_13_,
	instituica15_.telefone as telefone6155_13_,
	instituica15_.id_uf as id17_6155_13_,
	contatoins16_.id_contato_instituicao as id1_6152_14_,
	contatoins16_.bairro as bairro6152_14_,
	contatoins16_.cep as cep6152_14_,
	contatoins16_.complemento as compleme4_6152_14_,
	contatoins16_.cpf as cpf6152_14_,
	contatoins16_.email as email6152_14_,
	contatoins16_.endereco as endereco6152_14_,
	contatoins16_.identidade as identidade6152_14_,
	contatoins16_.id_municipio as id12_6152_14_,
	contatoins16_.nome as nome6152_14_,
	contatoins16_.numero as numero6152_14_,
	contatoins16_.telefone as telefone6152_14_,
	municipio17_.id_municipio as id1_5859_15_,
	municipio17_.ativo as ativo5859_15_,
	municipio17_.codigo as codigo5859_15_,
	municipio17_.codigo_acao as codigo4_5859_15_,
	municipio17_.nome as nome5859_15_,
	municipio17_.id_unidade_federativa as id6_5859_15_,
	unidadefed18_.id_unidade_federativa as id1_5894_16_,
	unidadefed18_.ativo as ativo5894_16_,
	unidadefed18_.id_capital as id5_5894_16_,
	unidadefed18_.descricao as descricao5894_16_,
	unidadefed18_.id_pais as id6_5894_16_,
	unidadefed18_.sigla as sigla5894_16_,
	pessoa19_.id_pessoa as id1_5861_17_,
	pessoa19_.cep as cep5861_17_,
	pessoa19_.abreviatura as abreviat3_5861_17_,
	pessoa19_.bairro as bairro5861_17_,
	pessoa19_.bairro_atual as bairro5_5861_17_,
	pessoa19_.id_bairro_endereco as id89_5861_17_,
	pessoa19_.telefone_celular as telefone6_5861_17_,
	pessoa19_.telefone_celular2 as telefone7_5861_17_,
	pessoa19_.telefone_celular3 as telefone8_5861_17_,
	pessoa19_.cep_atual as cep9_5861_17_,
	pessoa19_.certidao_civil_data as certidao10_5861_17_,
	pessoa19_.certidao_civil_modelo as certidao11_5861_17_,
	pessoa19_.certidao_civil_id_municipio_cartorio as certidao98_5861_17_,
	pessoa19_.certidao_civil_cartorio as certidao12_5861_17_,
	pessoa19_.certidao_civil_num_folha as certidao13_5861_17_,
	pessoa19_.certidao_civil_num_livro as certidao14_5861_17_,
	pessoa19_.certidao_civil_matricula_nova as certidao15_5861_17_,
	pessoa19_.certidao_civil_num_termo as certidao16_5861_17_,
	pessoa19_.certidao_civil_tipo as certidao17_5861_17_,
	pessoa19_.categoria_certificado_militar as categoria18_5861_17_,
	pessoa19_.data_expedicao_certificado_militar as data19_5861_17_,
	pessoa19_.numero_certificado_militar as numero20_5861_17_,
	pessoa19_.orgao_expedicao_certificado_militar as orgao21_5861_17_,
	pessoa19_.serie_certificado_militar as serie22_5861_17_,
	pessoa19_.cid as cid5861_17_,
	pessoa19_.codigo_inep as codigo24_5861_17_,
	pessoa19_.codigo_nis as codigo25_5861_17_,
	pessoa19_.codigo_rh as codigo26_5861_17_,
	pessoa19_.codigo_rh_old as codigo27_5861_17_,
	pessoa19_.codigo_sus as codigo28_5861_17_,
	pessoa19_.id_conta_bancaria as id103_5861_17_,
	pessoa19_.contato_celular as contato29_5861_17_,
	pessoa19_.contato_celular2 as contato30_5861_17_,
	pessoa19_.contato_celular3 as contato31_5861_17_,
	pessoa19_.cpf_filiacao_1 as cpf32_5861_17_,
	pessoa19_.cpf_filiacao_2 as cpf33_5861_17_,
	pessoa19_.cpf_cnpj as cpf34_5861_17_,
	pessoa19_.id_dados_pessoa_censo as id92_5861_17_,
	pessoa19_.data_cadastro as data35_5861_17_,
	pessoa19_.data_nascimento as data36_5861_17_,
	pessoa19_.documento_militar as documento37_5861_17_,
	pessoa19_.email as email5861_17_,
	pessoa19_.email_alternativo as email39_5861_17_,
	pessoa19_.endereco as endereco5861_17_,
	pessoa19_.endereco_atual as endereco41_5861_17_,
	pessoa19_.complemento as complem42_5861_17_,
	pessoa19_.id_escolaridade as id102_5861_17_,
	pessoa19_.id_estado_civil as id106_5861_17_,
	pessoa19_.estrangeiro as estrang43_5861_17_,
	pessoa19_.fax as fax5861_17_,
	pessoa19_.grau_parentesco_responsavel_matricula as grau45_5861_17_,
	pessoa19_.data_expedicao_identidade as data46_5861_17_,
	pessoa19_.numero_identidade as numero47_5861_17_,
	pessoa19_.orgao_expedicao_identidade as orgao48_5861_17_,
	pessoa19_.id_unidade_federativa_identidade as id88_5861_17_,
	pessoa19_.data_expedicao_identidade_mae as data49_5861_17_,
	pessoa19_.numero_identidade_mae as numero50_5861_17_,
	pessoa19_.orgao_expedicao_identidade_mae as orgao51_5861_17_,
	pessoa19_.id_uf_identidade_mae as id86_5861_17_,
	pessoa19_.data_expedicao_identidade_pai as data52_5861_17_,
	pessoa19_.numero_identidade_pai as numero53_5861_17_,
	pessoa19_.orgao_expedicao_identidade_pai as orgao54_5861_17_,
	pessoa19_.id_uf_identidade_pai as id87_5861_17_,
	pessoa19_.id_informacoes_medicas as id110_5861_17_,
	pessoa19_.id_localizacao_zona as id97_5861_17_,
	pessoa19_.id_municipio_naturalidade as id96_5861_17_,
	pessoa19_.id_municipio_contato as id91_5861_17_,
	pessoa19_.municipio_ext as municipio55_5861_17_,
	pessoa19_.nome as nome5861_17_,
	pessoa19_.nome_ascii as nome57_5861_17_,
	pessoa19_.nome_mae as nome58_5861_17_,
	pessoa19_.nome_pai as nome59_5861_17_,
	pessoa19_.nome_responsavel_matricula as nome60_5861_17_,
	pessoa19_.numero as numero5861_17_,
	pessoa19_.numero_documento_responsavel_matricula as numero62_5861_17_,
	pessoa19_.id_pais_nacionalidade as id111_5861_17_,
	pessoa19_.pais_nacionalidade as pais63_5861_17_,
	pessoa19_.passaporte as passaporte5861_17_,
	pessoa19_.pis_pasep as pis65_5861_17_,
	pessoa19_.possui_laudo as possui66_5861_17_,
	pessoa19_.profissaoMae as profiss67_5861_17_,
	pessoa19_.profissaoPai as profiss68_5861_17_,
	pessoa19_.quilombola as quilombola5861_17_,
	pessoa19_.sexo as sexo5861_17_,
	pessoa19_.id_tamanho_calca_letra as id104_5861_17_,
	pessoa19_.tamanho_calca_livre as tamanho71_5861_17_,
	pessoa19_.tamanho_calcado as tamanho72_5861_17_,
	pessoa19_.id_tamanho_camisa_letra as id112_5861_17_,
	pessoa19_.tamanho_camisa_livre as tamanho73_5861_17_,
	pessoa19_.id_tamanho_short_calca_letra as id90_5861_17_,
	pessoa19_.tamanho_short_calca_livre as tamanho74_5861_17_,
	pessoa19_.telefone_fixo as telefone75_5861_17_,
	pessoa19_.tipo as tipo5861_17_,
	pessoa19_.id_tipo_documento_militar as id100_5861_17_,
	pessoa19_.tipo_documento_responsavel_matricula as tipo77_5861_17_,
	pessoa19_.id_tipo_etnia as id94_5861_17_,
	pessoa19_.id_tipo_militar as id93_5861_17_,
	pessoa19_.id_raca as id107_5861_17_,
	pessoa19_.tipo_sanguineo as tipo78_5861_17_,
	pessoa19_.id_tipo_tamanho_calca as id105_5861_17_,
	pessoa19_.id_tipo_tamanho_camisa as id108_5861_17_,
	pessoa19_.id_tipo_tamanho_short_calca as id101_5861_17_,
	pessoa19_.data_expedicao_titulo_eleitor as data79_5861_17_,
	pessoa19_.numero_titulo_eleitor as numero80_5861_17_,
	pessoa19_.secao_titulo_eleitor as secao81_5861_17_,
	pessoa19_.id_unidade_federativa_titulo_eleitor as id95_5861_17_,
	pessoa19_.zona_titulo_eleitor as zona82_5861_17_,
	pessoa19_.id_uf_contato as id109_5861_17_,
	pessoa19_.ultima_atualizacao as ultima83_5861_17_,
	pessoa19_.id_uf_naturalidade as id99_5861_17_,
	pessoa19_.uf_naturalidade_ext as uf84_5861_17_,
	pessoa19_.valido as valido5861_17_,
	bairroesco20_.id_bairro_escola as id1_6298_18_,
	bairroesco20_.ativo as ativo6298_18_,
	bairroesco20_.id_municipio as id4_6298_18_,
	bairroesco20_.denominacao as denomina3_6298_18_,
	escolarida21_.id_escolaridade as id1_6104_19_,
	escolarida21_.ativo as ativo6104_19_,
	escolarida21_.descricao as descricao6104_19_,
	estadocivi22_.id_estado_civil as id1_5857_20_,
	estadocivi22_.ativo as ativo5857_20_,
	estadocivi22_.descricao as descricao5857_20_,
	unidadefed23_.id_unidade_federativa as id1_5894_21_,
	unidadefed23_.ativo as ativo5894_21_,
	unidadefed23_.id_capital as id5_5894_21_,
	unidadefed23_.descricao as descricao5894_21_,
	unidadefed23_.id_pais as id6_5894_21_,
	unidadefed23_.sigla as sigla5894_21_,
	municipio24_.id_municipio as id1_5859_22_,
	municipio24_.ativo as ativo5859_22_,
	municipio24_.codigo as codigo5859_22_,
	municipio24_.codigo_acao as codigo4_5859_22_,
	municipio24_.nome as nome5859_22_,
	municipio24_.id_unidade_federativa as id6_5859_22_,
	tamanhofar25_.id_tamanho as id1_5981_23_,
	tamanhofar25_.ordem as ordem5981_23_,
	tamanhofar25_.tamanho as tamanho5981_23_,
	tamanhofar26_.id_tamanho as id1_5981_24_,
	tamanhofar26_.ordem as ordem5981_24_,
	tamanhofar26_.tamanho as tamanho5981_24_,
	tamanhofar27_.id_tamanho as id1_5981_25_,
	tamanhofar27_.ordem as ordem5981_25_,
	tamanhofar27_.tamanho as tamanho5981_25_,
	tipodocume28_.id_tipo_documento_militar as id1_6258_26_,
	tipodocume28_.denominacao as denomina2_6258_26_,
	tipomilita29_.id_tipo_militar as id1_6260_27_,
	tipomilita29_.denominacao as denomina2_6260_27_,
	tiporaca30_.id_tipo_raca as id1_5870_28_,
	tiporaca30_.ativo as ativo5870_28_,
	tiporaca30_.descricao as descricao5870_28_,
	tipotamanh31_.id_tipo_tamanho as id1_5980_29_,
	tipotamanh31_.descricao as descricao5980_29_,
	tipotamanh31_.tamanhos_predefinidos as tamanhos3_5980_29_,
	tipotamanh31_.tipo_selecione as tipo4_5980_29_,
	tipotamanh31_.valido_para_camisa as valido5_5980_29_,
	tipotamanh31_.valido_para_short_calca as valido6_5980_29_,
	tipotamanh32_.id_tipo_tamanho as id1_5980_30_,
	tipotamanh32_.descricao as descricao5980_30_,
	tipotamanh32_.tamanhos_predefinidos as tamanhos3_5980_30_,
	tipotamanh32_.tipo_selecione as tipo4_5980_30_,
	tipotamanh32_.valido_para_camisa as valido5_5980_30_,
	tipotamanh32_.valido_para_short_calca as valido6_5980_30_,
	tipotamanh33_.id_tipo_tamanho as id1_5980_31_,
	tipotamanh33_.descricao as descricao5980_31_,
	tipotamanh33_.tamanhos_predefinidos as tamanhos3_5980_31_,
	tipotamanh33_.tipo_selecione as tipo4_5980_31_,
	tipotamanh33_.valido_para_camisa as valido5_5980_31_,
	tipotamanh33_.valido_para_short_calca as valido6_5980_31_,
	unidadefed34_.id_unidade_federativa as id1_5894_32_,
	unidadefed34_.ativo as ativo5894_32_,
	unidadefed34_.id_capital as id5_5894_32_,
	unidadefed34_.descricao as descricao5894_32_,
	unidadefed34_.id_pais as id6_5894_32_,
	unidadefed34_.sigla as sigla5894_32_,
	unidadefed35_.id_unidade_federativa as id1_5894_33_,
	unidadefed35_.ativo as ativo5894_33_,
	unidadefed35_.id_capital as id5_5894_33_,
	unidadefed35_.descricao as descricao5894_33_,
	unidadefed35_.id_pais as id6_5894_33_,
	unidadefed35_.sigla as sigla5894_33_,
	registroen36_.ID_ENTRADA as ID1_5828_34_,
	registroen36_.IP as IP5828_34_,
	registroen36_.IP_INTERNO_NAT as IP3_5828_34_,
	registroen36_.DATA as DATA5828_34_,
	registroen36_.id_sistema as id5_5828_34_,
	registroen36_.host as host5828_34_,
	registroen36_.user_agent as user7_5828_34_,
	registroen36_.resolucao as resolucao5828_34_,
	registroen36_.passaporte as passaporte5828_34_,
	registroen36_.ID_USUARIO as ID10_5828_34_,
	registroen36_.DATA_SAIDA as DATA11_5828_34_,
	registroen36_.canal as canal5828_34_,
	usuario37_.id_usuario as id1_5900_35_,
	usuario37_.autorizado as autorizado5900_35_,
	usuario37_.data_cadastro as data3_5900_35_,
	usuario37_.data_ultimo_login_mobile as data4_5900_35_,
	usuario37_.email as email5900_35_,
	usuario37_.expira_senha as expira6_5900_35_,
	usuario37_.hash_mobile_authenticator as hash7_5900_35_,
	usuario37_.id_foto as id8_5900_35_,
	usuario37_.id_servidor as id9_5900_35_,
	usuario37_.inativo as inativo5900_35_,
	usuario37_.login as login5900_35_,
	usuario37_.id_pessoa as id15_5900_35_,
	usuario37_.ramal as ramal5900_35_,
	usuario37_.tipo as tipo5900_35_,
	usuario37_.ultimo_acesso as ultimo13_5900_35_,
	usuario37_.id_unidade as id14_5900_35_,
	tipocontra38_.id_tipo_contrato_servidor as id1_6634_36_,
	tipocontra38_.descricao as descricao6634_36_,
	unidade39_.id_unidade as id1_5895_37_,
	unidade39_.ativo as ativo5895_37_,
	unidade39_.bairro as bairro5895_37_,
	unidade39_.cep as cep5895_37_,
	unidade39_.cnpj as cnpj5895_37_,
	unidade39_.codigo_unidade as codigo6_5895_37_,
	unidade39_.codigo_inep as codigo7_5895_37_,
	unidade39_.codigo_rh as codigo8_5895_37_,
	unidade39_.complemento as compleme9_5895_37_,
	unidade39_.data_cadastro as data10_5895_37_,
	unidade39_.distrito as distrito5895_37_,
	unidade39_.email as email5895_37_,
	unidade39_.endereco as endereco5895_37_,
	unidade39_.fax as fax5895_37_,
	unidade39_.hierarquia as hierarquia5895_37_,
	unidade39_.id_municipio as id16_5895_37_,
	unidade39_.instituicao_ensino_superior as institu17_5895_37_,
	unidade39_.nome as nome5895_37_,
	unidade39_.nome_ascii as nome19_5895_37_,
	unidade39_.numero as numero5895_37_,
	unidade39_.sigla as sigla5895_37_,
	unidade39_.telefone as telefone5895_37_,
	unidade39_.tipo as tipo5895_37_,
	unidade39_.uf as uf5895_37_,
	unidade39_.unidade_orcamentaria as unidade25_5895_37_,
	unidade39_.id_responsavel as id26_5895_37_,
	unidade40_.id_unidade as id1_5895_38_,
	unidade40_.ativo as ativo5895_38_,
	unidade40_.bairro as bairro5895_38_,
	unidade40_.cep as cep5895_38_,
	unidade40_.cnpj as cnpj5895_38_,
	unidade40_.codigo_unidade as codigo6_5895_38_,
	unidade40_.codigo_inep as codigo7_5895_38_,
	unidade40_.codigo_rh as codigo8_5895_38_,
	unidade40_.complemento as compleme9_5895_38_,
	unidade40_.data_cadastro as data10_5895_38_,
	unidade40_.distrito as distrito5895_38_,
	unidade40_.email as email5895_38_,
	unidade40_.endereco as endereco5895_38_,
	unidade40_.fax as fax5895_38_,
	unidade40_.hierarquia as hierarquia5895_38_,
	unidade40_.id_municipio as id16_5895_38_,
	unidade40_.instituicao_ensino_superior as institu17_5895_38_,
	unidade40_.nome as nome5895_38_,
	unidade40_.nome_ascii as nome19_5895_38_,
	unidade40_.numero as numero5895_38_,
	unidade40_.sigla as sigla5895_38_,
	unidade40_.telefone as telefone5895_38_,
	unidade40_.tipo as tipo5895_38_,
	unidade40_.uf as uf5895_38_,
	unidade40_.unidade_orcamentaria as unidade25_5895_38_,
	unidade40_.id_responsavel as id26_5895_38_,
	tipoafasta41_.id_tipo_afastamento as id1_6189_39_,
	tipoafasta41_.descricao as descricao6189_39_,
	unidade42_.id_unidade as id1_5895_40_,
	unidade42_.ativo as ativo5895_40_,
	unidade42_.bairro as bairro5895_40_,
	unidade42_.cep as cep5895_40_,
	unidade42_.cnpj as cnpj5895_40_,
	unidade42_.codigo_unidade as codigo6_5895_40_,
	unidade42_.codigo_inep as codigo7_5895_40_,
	unidade42_.codigo_rh as codigo8_5895_40_,
	unidade42_.complemento as compleme9_5895_40_,
	unidade42_.data_cadastro as data10_5895_40_,
	unidade42_.distrito as distrito5895_40_,
	unidade42_.email as email5895_40_,
	unidade42_.endereco as endereco5895_40_,
	unidade42_.fax as fax5895_40_,
	unidade42_.hierarquia as hierarquia5895_40_,
	unidade42_.id_municipio as id16_5895_40_,
	unidade42_.instituicao_ensino_superior as institu17_5895_40_,
	unidade42_.nome as nome5895_40_,
	unidade42_.nome_ascii as nome19_5895_40_,
	unidade42_.numero as numero5895_40_,
	unidade42_.sigla as sigla5895_40_,
	unidade42_.telefone as telefone5895_40_,
	unidade42_.tipo as tipo5895_40_,
	unidade42_.uf as uf5895_40_,
	unidade42_.unidade_orcamentaria as unidade25_5895_40_,
	unidade42_.id_responsavel as id26_5895_40_,
	atividadea43_.id_atividade_ape as id1_5919_41_,
	atividadea43_.atividade_esportiva as atividade2_5919_41_,
	atividadea43_.ativo as ativo5919_41_,
	atividadea43_.ch as ch5919_41_,
	atividadea43_.descricao as descricao5919_41_,
	atividadea43_.medio_integral as medio6_5919_41_,
	atividadea43_.id_registro_atualizacao as id7_5919_41_,
	atividadea43_.id_registro_cadastro as id8_5919_41_,
	servidor44_.id_servidor as id1_5866_42_,
	servidor44_.id_atividade as id41_5866_42_,
	servidor44_.auxilio_transporte as auxilio2_5866_42_,
	servidor44_.id_cargo as id37_5866_42_,
	servidor44_.id_categoria as id47_5866_42_,
	servidor44_.id_classe_servidor as id48_5866_42_,
	servidor44_.codigo_inep as codigo3_5866_42_,
	servidor44_.codigo_legado as codigo4_5866_42_,
	servidor44_.codigo_rh as codigo5_5866_42_,
	servidor44_.codigo_rh_old as codigo6_5866_42_,
	servidor44_.codigo_rh_pessoa_new as codigo7_5866_42_,
	servidor44_.codigo_rh_pessoa_old as codigo8_5866_42_,
	servidor44_.admissao as admissao5866_42_,
	servidor44_.data_desligamento as data10_5866_42_,
	servidor44_.data_resposta_ficha_atualizacao as data11_5866_42_,
	servidor44_.data_transferencia as data12_5866_42_,
	servidor44_.data_ultimo_login_mobile as data13_5866_42_,
	servidor44_.dedicacao_exclusiva as dedicacao14_5866_42_,
	servidor44_.digito_siape as digito15_5866_42_,
	servidor44_.forma_vacancia as forma16_5866_42_,
	servidor44_.id_formacao as id46_5866_42_,
	servidor44_.id_foto as id17_5866_42_,
	servidor44_.id_perfil as id18_5866_42_,
	servidor44_.id_instituicao as id39_5866_42_,
	servidor44_.ja_alocado_completamente_apos_encaminhamento as ja19_5866_42_,
	servidor44_.justificativa_finalizacao as justifi20_5866_42_,
	servidor44_.justificativa_reducao_regime as justifi21_5866_42_,
	servidor44_.justificativa_remocao_reducao_regime as justifi22_5866_42_,
	servidor44_.lotacao as lotacao5866_42_,
	servidor44_.numero_contrato_1 as numero24_5866_42_,
	servidor44_.numero_contrato_2 as numero25_5866_42_,
	servidor44_.numero_termo_aditivo as numero26_5866_42_,
	servidor44_.id_pessoa as id38_5866_42_,
	servidor44_.qualificacao as qualifi27_5866_42_,
	servidor44_.quantidade_meses_termo_aditivo as quantidade28_5866_42_,
	servidor44_.reducao_regime as reducao29_5866_42_,
	servidor44_.ds_referencia as ds30_5866_42_,
	servidor44_.regime_trabalho as regime31_5866_42_,
	servidor44_.id_registro_atualizacao as id45_5866_42_,
	servidor44_.id_registro_cadastro as id40_5866_42_,
	servidor44_.id_entrada as id43_5866_42_,
	servidor44_.salario as salario5866_42_,
	servidor44_.id_ativo as id49_5866_42_,
	servidor44_.siape as siape5866_42_,
	servidor44_.id_situacao as id50_5866_42_,
	servidor44_.id_tipo_contrato_servidor as id42_5866_42_,
	servidor44_.tipo_vinculo as tipo34_5866_42_,
	servidor44_.ultima_atualizacao as ultima35_5866_42_,
	servidor44_.id_unidade as id51_5866_42_,
	servidor44_.id_unidade_transferida as id44_5866_42_,
	servidor44_.uorg as uorg5866_42_,
	docenteext45_.id_docente_externo as id1_5854_43_,
	docenteext45_.ativo as ativo5854_43_,
	docenteext45_.data_atualizacao as data3_5854_43_,
	docenteext45_.data_cadastro as data4_5854_43_,
	docenteext45_.id_formacao as id12_5854_43_,
	docenteext45_.id_foto as id5_5854_43_,
	docenteext45_.id_perfil as id6_5854_43_,
	docenteext45_.matricula as matricula5854_43_,
	docenteext45_.id_pessoa as id13_5854_43_,
	docenteext45_.prazo_validade as prazo8_5854_43_,
	docenteext45_.id_registro_atualizacao as id11_5854_43_,
	docenteext45_.id_registro_entrada as id9_5854_43_,
	docenteext45_.id_servidor as id10_5854_43_,
	docenteext45_.id_tipo_docente_externo as id15_5854_43_,
	docenteext45_.id_unidade as id14_5854_43_,
	formacao46_.ID_FORMACAO as ID1_5834_44_,
	formacao46_.DENOMINACAO as DENOMINA2_5834_44_,
	formacao46_.ORDENACAO_TITULACAO as ORDENACAO3_5834_44_,
	pessoa47_.id_pessoa as id1_5861_45_,
	pessoa47_.cep as cep5861_45_,
	pessoa47_.abreviatura as abreviat3_5861_45_,
	pessoa47_.bairro as bairro5861_45_,
	pessoa47_.bairro_atual as bairro5_5861_45_,
	pessoa47_.id_bairro_endereco as id89_5861_45_,
	pessoa47_.telefone_celular as telefone6_5861_45_,
	pessoa47_.telefone_celular2 as telefone7_5861_45_,
	pessoa47_.telefone_celular3 as telefone8_5861_45_,
	pessoa47_.cep_atual as cep9_5861_45_,
	pessoa47_.certidao_civil_data as certidao10_5861_45_,
	pessoa47_.certidao_civil_modelo as certidao11_5861_45_,
	pessoa47_.certidao_civil_id_municipio_cartorio as certidao98_5861_45_,
	pessoa47_.certidao_civil_cartorio as certidao12_5861_45_,
	pessoa47_.certidao_civil_num_folha as certidao13_5861_45_,
	pessoa47_.certidao_civil_num_livro as certidao14_5861_45_,
	pessoa47_.certidao_civil_matricula_nova as certidao15_5861_45_,
	pessoa47_.certidao_civil_num_termo as certidao16_5861_45_,
	pessoa47_.certidao_civil_tipo as certidao17_5861_45_,
	pessoa47_.categoria_certificado_militar as categoria18_5861_45_,
	pessoa47_.data_expedicao_certificado_militar as data19_5861_45_,
	pessoa47_.numero_certificado_militar as numero20_5861_45_,
	pessoa47_.orgao_expedicao_certificado_militar as orgao21_5861_45_,
	pessoa47_.serie_certificado_militar as serie22_5861_45_,
	pessoa47_.cid as cid5861_45_,
	pessoa47_.codigo_inep as codigo24_5861_45_,
	pessoa47_.codigo_nis as codigo25_5861_45_,
	pessoa47_.codigo_rh as codigo26_5861_45_,
	pessoa47_.codigo_rh_old as codigo27_5861_45_,
	pessoa47_.codigo_sus as codigo28_5861_45_,
	pessoa47_.id_conta_bancaria as id103_5861_45_,
	pessoa47_.contato_celular as contato29_5861_45_,
	pessoa47_.contato_celular2 as contato30_5861_45_,
	pessoa47_.contato_celular3 as contato31_5861_45_,
	pessoa47_.cpf_filiacao_1 as cpf32_5861_45_,
	pessoa47_.cpf_filiacao_2 as cpf33_5861_45_,
	pessoa47_.cpf_cnpj as cpf34_5861_45_,
	pessoa47_.id_dados_pessoa_censo as id92_5861_45_,
	pessoa47_.data_cadastro as data35_5861_45_,
	pessoa47_.data_nascimento as data36_5861_45_,
	pessoa47_.documento_militar as documento37_5861_45_,
	pessoa47_.email as email5861_45_,
	pessoa47_.email_alternativo as email39_5861_45_,
	pessoa47_.endereco as endereco5861_45_,
	pessoa47_.endereco_atual as endereco41_5861_45_,
	pessoa47_.complemento as complem42_5861_45_,
	pessoa47_.id_escolaridade as id102_5861_45_,
	pessoa47_.id_estado_civil as id106_5861_45_,
	pessoa47_.estrangeiro as estrang43_5861_45_,
	pessoa47_.fax as fax5861_45_,
	pessoa47_.grau_parentesco_responsavel_matricula as grau45_5861_45_,
	pessoa47_.data_expedicao_identidade as data46_5861_45_,
	pessoa47_.numero_identidade as numero47_5861_45_,
	pessoa47_.orgao_expedicao_identidade as orgao48_5861_45_,
	pessoa47_.id_unidade_federativa_identidade as id88_5861_45_,
	pessoa47_.data_expedicao_identidade_mae as data49_5861_45_,
	pessoa47_.numero_identidade_mae as numero50_5861_45_,
	pessoa47_.orgao_expedicao_identidade_mae as orgao51_5861_45_,
	pessoa47_.id_uf_identidade_mae as id86_5861_45_,
	pessoa47_.data_expedicao_identidade_pai as data52_5861_45_,
	pessoa47_.numero_identidade_pai as numero53_5861_45_,
	pessoa47_.orgao_expedicao_identidade_pai as orgao54_5861_45_,
	pessoa47_.id_uf_identidade_pai as id87_5861_45_,
	pessoa47_.id_informacoes_medicas as id110_5861_45_,
	pessoa47_.id_localizacao_zona as id97_5861_45_,
	pessoa47_.id_municipio_naturalidade as id96_5861_45_,
	pessoa47_.id_municipio_contato as id91_5861_45_,
	pessoa47_.municipio_ext as municipio55_5861_45_,
	pessoa47_.nome as nome5861_45_,
	pessoa47_.nome_ascii as nome57_5861_45_,
	pessoa47_.nome_mae as nome58_5861_45_,
	pessoa47_.nome_pai as nome59_5861_45_,
	pessoa47_.nome_responsavel_matricula as nome60_5861_45_,
	pessoa47_.numero as numero5861_45_,
	pessoa47_.numero_documento_responsavel_matricula as numero62_5861_45_,
	pessoa47_.id_pais_nacionalidade as id111_5861_45_,
	pessoa47_.pais_nacionalidade as pais63_5861_45_,
	pessoa47_.passaporte as passaporte5861_45_,
	pessoa47_.pis_pasep as pis65_5861_45_,
	pessoa47_.possui_laudo as possui66_5861_45_,
	pessoa47_.profissaoMae as profiss67_5861_45_,
	pessoa47_.profissaoPai as profiss68_5861_45_,
	pessoa47_.quilombola as quilombola5861_45_,
	pessoa47_.sexo as sexo5861_45_,
	pessoa47_.id_tamanho_calca_letra as id104_5861_45_,
	pessoa47_.tamanho_calca_livre as tamanho71_5861_45_,
	pessoa47_.tamanho_calcado as tamanho72_5861_45_,
	pessoa47_.id_tamanho_camisa_letra as id112_5861_45_,
	pessoa47_.tamanho_camisa_livre as tamanho73_5861_45_,
	pessoa47_.id_tamanho_short_calca_letra as id90_5861_45_,
	pessoa47_.tamanho_short_calca_livre as tamanho74_5861_45_,
	pessoa47_.telefone_fixo as telefone75_5861_45_,
	pessoa47_.tipo as tipo5861_45_,
	pessoa47_.id_tipo_documento_militar as id100_5861_45_,
	pessoa47_.tipo_documento_responsavel_matricula as tipo77_5861_45_,
	pessoa47_.id_tipo_etnia as id94_5861_45_,
	pessoa47_.id_tipo_militar as id93_5861_45_,
	pessoa47_.id_raca as id107_5861_45_,
	pessoa47_.tipo_sanguineo as tipo78_5861_45_,
	pessoa47_.id_tipo_tamanho_calca as id105_5861_45_,
	pessoa47_.id_tipo_tamanho_camisa as id108_5861_45_,
	pessoa47_.id_tipo_tamanho_short_calca as id101_5861_45_,
	pessoa47_.data_expedicao_titulo_eleitor as data79_5861_45_,
	pessoa47_.numero_titulo_eleitor as numero80_5861_45_,
	pessoa47_.secao_titulo_eleitor as secao81_5861_45_,
	pessoa47_.id_unidade_federativa_titulo_eleitor as id95_5861_45_,
	pessoa47_.zona_titulo_eleitor as zona82_5861_45_,
	pessoa47_.id_uf_contato as id109_5861_45_,
	pessoa47_.ultima_atualizacao as ultima83_5861_45_,
	pessoa47_.id_uf_naturalidade as id99_5861_45_,
	pessoa47_.uf_naturalidade_ext as uf84_5861_45_,
	pessoa47_.valido as valido5861_45_,
	servidor48_.id_servidor as id1_5866_46_,
	servidor48_.id_atividade as id41_5866_46_,
	servidor48_.auxilio_transporte as auxilio2_5866_46_,
	servidor48_.id_cargo as id37_5866_46_,
	servidor48_.id_categoria as id47_5866_46_,
	servidor48_.id_classe_servidor as id48_5866_46_,
	servidor48_.codigo_inep as codigo3_5866_46_,
	servidor48_.codigo_legado as codigo4_5866_46_,
	servidor48_.codigo_rh as codigo5_5866_46_,
	servidor48_.codigo_rh_old as codigo6_5866_46_,
	servidor48_.codigo_rh_pessoa_new as codigo7_5866_46_,
	servidor48_.codigo_rh_pessoa_old as codigo8_5866_46_,
	servidor48_.admissao as admissao5866_46_,
	servidor48_.data_desligamento as data10_5866_46_,
	servidor48_.data_resposta_ficha_atualizacao as data11_5866_46_,
	servidor48_.data_transferencia as data12_5866_46_,
	servidor48_.data_ultimo_login_mobile as data13_5866_46_,
	servidor48_.dedicacao_exclusiva as dedicacao14_5866_46_,
	servidor48_.digito_siape as digito15_5866_46_,
	servidor48_.forma_vacancia as forma16_5866_46_,
	servidor48_.id_formacao as id46_5866_46_,
	servidor48_.id_foto as id17_5866_46_,
	servidor48_.id_perfil as id18_5866_46_,
	servidor48_.id_instituicao as id39_5866_46_,
	servidor48_.ja_alocado_completamente_apos_encaminhamento as ja19_5866_46_,
	servidor48_.justificativa_finalizacao as justifi20_5866_46_,
	servidor48_.justificativa_reducao_regime as justifi21_5866_46_,
	servidor48_.justificativa_remocao_reducao_regime as justifi22_5866_46_,
	servidor48_.lotacao as lotacao5866_46_,
	servidor48_.numero_contrato_1 as numero24_5866_46_,
	servidor48_.numero_contrato_2 as numero25_5866_46_,
	servidor48_.numero_termo_aditivo as numero26_5866_46_,
	servidor48_.id_pessoa as id38_5866_46_,
	servidor48_.qualificacao as qualifi27_5866_46_,
	servidor48_.quantidade_meses_termo_aditivo as quantidade28_5866_46_,
	servidor48_.reducao_regime as reducao29_5866_46_,
	servidor48_.ds_referencia as ds30_5866_46_,
	servidor48_.regime_trabalho as regime31_5866_46_,
	servidor48_.id_registro_atualizacao as id45_5866_46_,
	servidor48_.id_registro_cadastro as id40_5866_46_,
	servidor48_.id_entrada as id43_5866_46_,
	servidor48_.salario as salario5866_46_,
	servidor48_.id_ativo as id49_5866_46_,
	servidor48_.siape as siape5866_46_,
	servidor48_.id_situacao as id50_5866_46_,
	servidor48_.id_tipo_contrato_servidor as id42_5866_46_,
	servidor48_.tipo_vinculo as tipo34_5866_46_,
	servidor48_.ultima_atualizacao as ultima35_5866_46_,
	servidor48_.id_unidade as id51_5866_46_,
	servidor48_.id_unidade_transferida as id44_5866_46_,
	servidor48_.uorg as uorg5866_46_,
	tipodocent49_.id_tipo_docente_externo as id1_5855_47_,
	tipodocent49_.denominacao as denomina2_5855_47_,
	tipodocent49_.sequencia as sequencia5855_47_,
	solicitaca50_.id_solicitacao_carga_horaria_suplementar as id1_5949_48_,
	solicitaca50_.data_atualizacao as data2_5949_48_,
	solicitaca50_.data_cadastro as data3_5949_48_,
	solicitaca50_.data_publicacao as data4_5949_48_,
	solicitaca50_.id_docente_turma as id8_5949_48_,
	solicitaca50_.horas_solicitadas as horas5_5949_48_,
	solicitaca50_.id_registro_cadastro as id7_5949_48_,
	solicitaca50_.remanejada as remanejada5949_48_,
	solicitaca50_.id_status_solicitacao_carga_horaria_suplementar as id9_5949_48_,
	statussoli51_.id_status_solicitacao_carga_horaria_suplementar as id1_5950_49_,
	statussoli51_.descricao as descricao5950_49_,
	horarios52_.id_turma as id12_97_,
	horarios52_.id_horario_turma as id1_97_,
	horarios52_.id_horario_turma as id1_5931_50_,
	horarios52_.ativo as ativo5931_50_,
	horarios52_.data_alteracao as data3_5931_50_,
	horarios52_.data_fim as data4_5931_50_,
	horarios52_.data_inicio as data5_5931_50_,
	horarios52_.dia as dia5931_50_,
	horarios52_.hora_fim as hora7_5931_50_,
	horarios52_.hora_inicio as hora8_5931_50_,
	horarios52_.id_horario as id11_5931_50_,
	horarios52_.id_registro_entrada as id10_5931_50_,
	horarios52_.tipo as tipo5931_50_,
	horarios52_.id_turma as id12_5931_50_,
	horario53_.id_horario as id1_5930_51_,
	horario53_.ano_entrada_vigor as ano2_5930_51_,
	horario53_.ativo as ativo5930_51_,
	horario53_.id_etapa_ensino as id9_5930_51_,
	horario53_.fim as fim5930_51_,
	horario53_.inicio as inicio5930_51_,
	horario53_.nivel as nivel5930_51_,
	horario53_.ordem as ordem5930_51_,
	horario53_.tipo as tipo5930_51_,
	horario53_.id_unidade as id10_5930_51_,
	etapaensin54_.id_etapa_ensino as id1_6205_52_,
	etapaensin54_.ativo as ativo6205_52_,
	etapaensin54_.bloquear_alteracao as bloquear3_6205_52_,
	etapaensin54_.capacidade_excesso as capacidade4_6205_52_,
	etapaensin54_.capacidade_maxima as capacidade5_6205_52_,
	etapaensin54_.capacidade_maxima_correcao_fluxo as capacidade6_6205_52_,
	etapaensin54_.capacidade_minima as capacidade7_6205_52_,
	etapaensin54_.capacidade_minima_correcao_fluxo as capacidade8_6205_52_,
	etapaensin54_.codigo_rh as codigo9_6205_52_,
	etapaensin54_.data_atualizacao as data10_6205_52_,
	etapaensin54_.denominacao as denomin11_6205_52_,
	etapaensin54_.duracao_conclusao as duracao12_6205_52_,
	etapaensin54_.id_forma_organizacao_Etapa as id22_6205_52_,
	etapaensin54_.id_local_oferta as id17_6205_52_,
	etapaensin54_.id_modalidade as id19_6205_52_,
	etapaensin54_.id_nivel_etapa as id21_6205_52_,
	etapaensin54_.periodicidade_etapa as periodi13_6205_52_,
	etapaensin54_.permite_disciplina_contraturno as permite14_6205_52_,
	etapaensin54_.id_registro_atualizacao as id16_6205_52_,
	etapaensin54_.sigla as sigla6205_52_,
	etapaensin54_.id_situacao as id18_6205_52_,
	etapaensin54_.id_unidade as id20_6205_52_,
	formaorgan55_.id_forma_organizacao_etapa as id1_6206_53_,
	formaorgan55_.data_atualizacao as data2_6206_53_,
	formaorgan55_.denominacao as denomina3_6206_53_,
	formaorgan55_.gerencia_turmas_individuais as gerencia4_6206_53_,
	formaorgan55_.id_registro_atualizacao as id5_6206_53_,
	formaorgan55_.id_unidade as id6_6206_53_,
	unidade56_.id_unidade as id1_5895_54_,
	unidade56_.ativo as ativo5895_54_,
	unidade56_.bairro as bairro5895_54_,
	unidade56_.cep as cep5895_54_,
	unidade56_.cnpj as cnpj5895_54_,
	unidade56_.codigo_unidade as codigo6_5895_54_,
	unidade56_.codigo_inep as codigo7_5895_54_,
	unidade56_.codigo_rh as codigo8_5895_54_,
	unidade56_.complemento as compleme9_5895_54_,
	unidade56_.data_cadastro as data10_5895_54_,
	unidade56_.distrito as distrito5895_54_,
	unidade56_.email as email5895_54_,
	unidade56_.endereco as endereco5895_54_,
	unidade56_.fax as fax5895_54_,
	unidade56_.hierarquia as hierarquia5895_54_,
	unidade56_.id_municipio as id16_5895_54_,
	unidade56_.instituicao_ensino_superior as institu17_5895_54_,
	unidade56_.nome as nome5895_54_,
	unidade56_.nome_ascii as nome19_5895_54_,
	unidade56_.numero as numero5895_54_,
	unidade56_.sigla as sigla5895_54_,
	unidade56_.telefone as telefone5895_54_,
	unidade56_.tipo as tipo5895_54_,
	unidade56_.uf as uf5895_54_,
	unidade56_.unidade_orcamentaria as unidade25_5895_54_,
	unidade56_.id_responsavel as id26_5895_54_,
	localofert57_.id_local_oferta as id1_6235_55_,
	localofert57_.ativo as ativo6235_55_,
	localofert57_.descricao as descricao6235_55_,
	modalidade58_.id_modalidade_ensino_basico as id1_6209_56_,
	modalidade58_.data_atualizacao as data2_6209_56_,
	modalidade58_.denominacao as denomina3_6209_56_,
	modalidade58_.id_registro_atualizacao as id5_6209_56_,
	modalidade58_.id_unidade as id4_6209_56_,
	unidade59_.id_unidade as id1_5895_57_,
	unidade59_.ativo as ativo5895_57_,
	unidade59_.bairro as bairro5895_57_,
	unidade59_.cep as cep5895_57_,
	unidade59_.cnpj as cnpj5895_57_,
	unidade59_.codigo_unidade as codigo6_5895_57_,
	unidade59_.codigo_inep as codigo7_5895_57_,
	unidade59_.codigo_rh as codigo8_5895_57_,
	unidade59_.complemento as compleme9_5895_57_,
	unidade59_.data_cadastro as data10_5895_57_,
	unidade59_.distrito as distrito5895_57_,
	unidade59_.email as email5895_57_,
	unidade59_.endereco as endereco5895_57_,
	unidade59_.fax as fax5895_57_,
	unidade59_.hierarquia as hierarquia5895_57_,
	unidade59_.id_municipio as id16_5895_57_,
	unidade59_.instituicao_ensino_superior as institu17_5895_57_,
	unidade59_.nome as nome5895_57_,
	unidade59_.nome_ascii as nome19_5895_57_,
	unidade59_.numero as numero5895_57_,
	unidade59_.sigla as sigla5895_57_,
	unidade59_.telefone as telefone5895_57_,
	unidade59_.tipo as tipo5895_57_,
	unidade59_.uf as uf5895_57_,
	unidade59_.unidade_orcamentaria as unidade25_5895_57_,
	unidade59_.id_responsavel as id26_5895_57_,
	niveletapa60_.id_nivel_etapa_ensino as id1_6210_58_,
	niveletapa60_.ativo as ativo6210_58_,
	niveletapa60_.data_atualizacao as data3_6210_58_,
	niveletapa60_.denominacao as denomina4_6210_58_,
	niveletapa60_.ensino_infantil as ensino5_6210_58_,
	niveletapa60_.id_registro_atualizacao as id7_6210_58_,
	niveletapa60_.sigla as sigla6210_58_,
	niveletapa60_.id_unidade as id8_6210_58_,
	unidade61_.id_unidade as id1_5895_59_,
	unidade61_.ativo as ativo5895_59_,
	unidade61_.bairro as bairro5895_59_,
	unidade61_.cep as cep5895_59_,
	unidade61_.cnpj as cnpj5895_59_,
	unidade61_.codigo_unidade as codigo6_5895_59_,
	unidade61_.codigo_inep as codigo7_5895_59_,
	unidade61_.codigo_rh as codigo8_5895_59_,
	unidade61_.complemento as compleme9_5895_59_,
	unidade61_.data_cadastro as data10_5895_59_,
	unidade61_.distrito as distrito5895_59_,
	unidade61_.email as email5895_59_,
	unidade61_.endereco as endereco5895_59_,
	unidade61_.fax as fax5895_59_,
	unidade61_.hierarquia as hierarquia5895_59_,
	unidade61_.id_municipio as id16_5895_59_,
	unidade61_.instituicao_ensino_superior as institu17_5895_59_,
	unidade61_.nome as nome5895_59_,
	unidade61_.nome_ascii as nome19_5895_59_,
	unidade61_.numero as numero5895_59_,
	unidade61_.sigla as sigla5895_59_,
	unidade61_.telefone as telefone5895_59_,
	unidade61_.tipo as tipo5895_59_,
	unidade61_.uf as uf5895_59_,
	unidade61_.unidade_orcamentaria as unidade25_5895_59_,
	unidade61_.id_responsavel as id26_5895_59_,
	situacaoet62_.id_situacao as id1_5933_60_,
	situacaoet62_.descricao as descricao5933_60_,
	unidade63_.id_unidade as id1_5895_61_,
	unidade63_.ativo as ativo5895_61_,
	unidade63_.bairro as bairro5895_61_,
	unidade63_.cep as cep5895_61_,
	unidade63_.cnpj as cnpj5895_61_,
	unidade63_.codigo_unidade as codigo6_5895_61_,
	unidade63_.codigo_inep as codigo7_5895_61_,
	unidade63_.codigo_rh as codigo8_5895_61_,
	unidade63_.complemento as compleme9_5895_61_,
	unidade63_.data_cadastro as data10_5895_61_,
	unidade63_.distrito as distrito5895_61_,
	unidade63_.email as email5895_61_,
	unidade63_.endereco as endereco5895_61_,
	unidade63_.fax as fax5895_61_,
	unidade63_.hierarquia as hierarquia5895_61_,
	unidade63_.id_municipio as id16_5895_61_,
	unidade63_.instituicao_ensino_superior as institu17_5895_61_,
	unidade63_.nome as nome5895_61_,
	unidade63_.nome_ascii as nome19_5895_61_,
	unidade63_.numero as numero5895_61_,
	unidade63_.sigla as sigla5895_61_,
	unidade63_.telefone as telefone5895_61_,
	unidade63_.tipo as tipo5895_61_,
	unidade63_.uf as uf5895_61_,
	unidade63_.unidade_orcamentaria as unidade25_5895_61_,
	unidade63_.id_responsavel as id26_5895_61_,
	unidade64_.id_unidade as id1_5895_62_,
	unidade64_.ativo as ativo5895_62_,
	unidade64_.bairro as bairro5895_62_,
	unidade64_.cep as cep5895_62_,
	unidade64_.cnpj as cnpj5895_62_,
	unidade64_.codigo_unidade as codigo6_5895_62_,
	unidade64_.codigo_inep as codigo7_5895_62_,
	unidade64_.codigo_rh as codigo8_5895_62_,
	unidade64_.complemento as compleme9_5895_62_,
	unidade64_.data_cadastro as data10_5895_62_,
	unidade64_.distrito as distrito5895_62_,
	unidade64_.email as email5895_62_,
	unidade64_.endereco as endereco5895_62_,
	unidade64_.fax as fax5895_62_,
	unidade64_.hierarquia as hierarquia5895_62_,
	unidade64_.id_municipio as id16_5895_62_,
	unidade64_.instituicao_ensino_superior as institu17_5895_62_,
	unidade64_.nome as nome5895_62_,
	unidade64_.nome_ascii as nome19_5895_62_,
	unidade64_.numero as numero5895_62_,
	unidade64_.sigla as sigla5895_62_,
	unidade64_.telefone as telefone5895_62_,
	unidade64_.tipo as tipo5895_62_,
	unidade64_.uf as uf5895_62_,
	unidade64_.unidade_orcamentaria as unidade25_5895_62_,
	unidade64_.id_responsavel as id26_5895_62_,
	modulo65_.id_modulo as id1_6231_63_,
	modulo65_.id_curriculo as id5_6231_63_,
	modulo65_.denominacao as denomina2_6231_63_,
	modulo65_.periodo_oferta as periodo3_6231_63_,
	modulo65_.sigla as sigla6231_63_,
	situacaotu66_.id_situacao_turma as id1_5911_64_,
	situacaotu66_.codigo_rh as codigo2_5911_64_,
	situacaotu66_.descricao as descricao5911_64_,
	turmacompo67_.id_turma as id1_5926_65_,
	turmacompo67_.agrupadora as agrupadora5926_65_,
	turmacompo67_.ano as ano5926_65_,
	turmacompo67_.capacidade_aluno as capacidade4_5926_65_,
	turmacompo67_.id_categoria_componente as id31_5926_65_,
	turmacompo67_.categoria_esportiva as categoria5_5926_65_,
	turmacompo67_.codigo as codigo5926_65_,
	turmacompo67_.codigo_rh as codigo7_5926_65_,
	turmacompo67_.data_alteracao as data8_5926_65_,
	turmacompo67_.data_cadastro as data9_5926_65_,
	turmacompo67_.data_consolidacao as data10_5926_65_,
	turmacompo67_.data_fim as data11_5926_65_,
	turmacompo67_.data_inicio as data12_5926_65_,
	turmacompo67_.descricao_horario as descricao13_5926_65_,
	turmacompo67_.id_disciplina as id30_5926_65_,
	turmacompo67_.execucao as execucao5926_65_,
	turmacompo67_.extra as extra5926_65_,
	turmacompo67_.grupo as grupo5926_65_,
	turmacompo67_.local as local5926_65_,
	turmacompo67_.id_modulo as id29_5926_65_,
	turmacompo67_.motivo_exclusao as motivo18_5926_65_,
	turmacompo67_.nome_professor as nome19_5926_65_,
	turmacompo67_.numero_estudantes as numero20_5926_65_,
	turmacompo67_.observacao as observacao5926_65_,
	turmacompo67_.ordem as ordem5926_65_,
	turmacompo67_.periodo as periodo5926_65_,
	turmacompo67_.processada as processada5926_65_,
	turmacompo67_.processada_rematricula as processada25_5926_65_,
	turmacompo67_.execucao_parcial_qtd_unidades as execucao26_5926_65_,
	turmacompo67_.id_registro_atualizacao as id32_5926_65_,
	turmacompo67_.id_registro_cadastro as id34_5926_65_,
	turmacompo67_.id_situacao_turma as id37_5926_65_,
	turmacompo67_.tipo as tipo5926_65_,
	turmacompo67_.total_matriculados as total28_5926_65_,
	turmacompo67_.id_turma_agrupadora as id35_5926_65_,
	turmacompo67_.id_turma_serie as id33_5926_65_,
	turmacompo67_.id_usuario_consolidacao as id36_5926_65_,
	usuario68_.id_usuario as id1_5900_66_,
	usuario68_.autorizado as autorizado5900_66_,
	usuario68_.data_cadastro as data3_5900_66_,
	usuario68_.data_ultimo_login_mobile as data4_5900_66_,
	usuario68_.email as email5900_66_,
	usuario68_.expira_senha as expira6_5900_66_,
	usuario68_.hash_mobile_authenticator as hash7_5900_66_,
	usuario68_.id_foto as id8_5900_66_,
	usuario68_.id_servidor as id9_5900_66_,
	usuario68_.inativo as inativo5900_66_,
	usuario68_.login as login5900_66_,
	usuario68_.id_pessoa as id15_5900_66_,
	usuario68_.ramal as ramal5900_66_,
	usuario68_.tipo as tipo5900_66_,
	usuario68_.ultimo_acesso as ultimo13_5900_66_,
	usuario68_.id_unidade as id14_5900_66_,
	pessoa69_.id_pessoa as id1_5861_67_,
	pessoa69_.cep as cep5861_67_,
	pessoa69_.abreviatura as abreviat3_5861_67_,
	pessoa69_.bairro as bairro5861_67_,
	pessoa69_.bairro_atual as bairro5_5861_67_,
	pessoa69_.id_bairro_endereco as id89_5861_67_,
	pessoa69_.telefone_celular as telefone6_5861_67_,
	pessoa69_.telefone_celular2 as telefone7_5861_67_,
	pessoa69_.telefone_celular3 as telefone8_5861_67_,
	pessoa69_.cep_atual as cep9_5861_67_,
	pessoa69_.certidao_civil_data as certidao10_5861_67_,
	pessoa69_.certidao_civil_modelo as certidao11_5861_67_,
	pessoa69_.certidao_civil_id_municipio_cartorio as certidao98_5861_67_,
	pessoa69_.certidao_civil_cartorio as certidao12_5861_67_,
	pessoa69_.certidao_civil_num_folha as certidao13_5861_67_,
	pessoa69_.certidao_civil_num_livro as certidao14_5861_67_,
	pessoa69_.certidao_civil_matricula_nova as certidao15_5861_67_,
	pessoa69_.certidao_civil_num_termo as certidao16_5861_67_,
	pessoa69_.certidao_civil_tipo as certidao17_5861_67_,
	pessoa69_.categoria_certificado_militar as categoria18_5861_67_,
	pessoa69_.data_expedicao_certificado_militar as data19_5861_67_,
	pessoa69_.numero_certificado_militar as numero20_5861_67_,
	pessoa69_.orgao_expedicao_certificado_militar as orgao21_5861_67_,
	pessoa69_.serie_certificado_militar as serie22_5861_67_,
	pessoa69_.cid as cid5861_67_,
	pessoa69_.codigo_inep as codigo24_5861_67_,
	pessoa69_.codigo_nis as codigo25_5861_67_,
	pessoa69_.codigo_rh as codigo26_5861_67_,
	pessoa69_.codigo_rh_old as codigo27_5861_67_,
	pessoa69_.codigo_sus as codigo28_5861_67_,
	pessoa69_.id_conta_bancaria as id103_5861_67_,
	pessoa69_.contato_celular as contato29_5861_67_,
	pessoa69_.contato_celular2 as contato30_5861_67_,
	pessoa69_.contato_celular3 as contato31_5861_67_,
	pessoa69_.cpf_filiacao_1 as cpf32_5861_67_,
	pessoa69_.cpf_filiacao_2 as cpf33_5861_67_,
	pessoa69_.cpf_cnpj as cpf34_5861_67_,
	pessoa69_.id_dados_pessoa_censo as id92_5861_67_,
	pessoa69_.data_cadastro as data35_5861_67_,
	pessoa69_.data_nascimento as data36_5861_67_,
	pessoa69_.documento_militar as documento37_5861_67_,
	pessoa69_.email as email5861_67_,
	pessoa69_.email_alternativo as email39_5861_67_,
	pessoa69_.endereco as endereco5861_67_,
	pessoa69_.endereco_atual as endereco41_5861_67_,
	pessoa69_.complemento as complem42_5861_67_,
	pessoa69_.id_escolaridade as id102_5861_67_,
	pessoa69_.id_estado_civil as id106_5861_67_,
	pessoa69_.estrangeiro as estrang43_5861_67_,
	pessoa69_.fax as fax5861_67_,
	pessoa69_.grau_parentesco_responsavel_matricula as grau45_5861_67_,
	pessoa69_.data_expedicao_identidade as data46_5861_67_,
	pessoa69_.numero_identidade as numero47_5861_67_,
	pessoa69_.orgao_expedicao_identidade as orgao48_5861_67_,
	pessoa69_.id_unidade_federativa_identidade as id88_5861_67_,
	pessoa69_.data_expedicao_identidade_mae as data49_5861_67_,
	pessoa69_.numero_identidade_mae as numero50_5861_67_,
	pessoa69_.orgao_expedicao_identidade_mae as orgao51_5861_67_,
	pessoa69_.id_uf_identidade_mae as id86_5861_67_,
	pessoa69_.data_expedicao_identidade_pai as data52_5861_67_,
	pessoa69_.numero_identidade_pai as numero53_5861_67_,
	pessoa69_.orgao_expedicao_identidade_pai as orgao54_5861_67_,
	pessoa69_.id_uf_identidade_pai as id87_5861_67_,
	pessoa69_.id_informacoes_medicas as id110_5861_67_,
	pessoa69_.id_localizacao_zona as id97_5861_67_,
	pessoa69_.id_municipio_naturalidade as id96_5861_67_,
	pessoa69_.id_municipio_contato as id91_5861_67_,
	pessoa69_.municipio_ext as municipio55_5861_67_,
	pessoa69_.nome as nome5861_67_,
	pessoa69_.nome_ascii as nome57_5861_67_,
	pessoa69_.nome_mae as nome58_5861_67_,
	pessoa69_.nome_pai as nome59_5861_67_,
	pessoa69_.nome_responsavel_matricula as nome60_5861_67_,
	pessoa69_.numero as numero5861_67_,
	pessoa69_.numero_documento_responsavel_matricula as numero62_5861_67_,
	pessoa69_.id_pais_nacionalidade as id111_5861_67_,
	pessoa69_.pais_nacionalidade as pais63_5861_67_,
	pessoa69_.passaporte as passaporte5861_67_,
	pessoa69_.pis_pasep as pis65_5861_67_,
	pessoa69_.possui_laudo as possui66_5861_67_,
	pessoa69_.profissaoMae as profiss67_5861_67_,
	pessoa69_.profissaoPai as profiss68_5861_67_,
	pessoa69_.quilombola as quilombola5861_67_,
	pessoa69_.sexo as sexo5861_67_,
	pessoa69_.id_tamanho_calca_letra as id104_5861_67_,
	pessoa69_.tamanho_calca_livre as tamanho71_5861_67_,
	pessoa69_.tamanho_calcado as tamanho72_5861_67_,
	pessoa69_.id_tamanho_camisa_letra as id112_5861_67_,
	pessoa69_.tamanho_camisa_livre as tamanho73_5861_67_,
	pessoa69_.id_tamanho_short_calca_letra as id90_5861_67_,
	pessoa69_.tamanho_short_calca_livre as tamanho74_5861_67_,
	pessoa69_.telefone_fixo as telefone75_5861_67_,
	pessoa69_.tipo as tipo5861_67_,
	pessoa69_.id_tipo_documento_militar as id100_5861_67_,
	pessoa69_.tipo_documento_responsavel_matricula as tipo77_5861_67_,
	pessoa69_.id_tipo_etnia as id94_5861_67_,
	pessoa69_.id_tipo_militar as id93_5861_67_,
	pessoa69_.id_raca as id107_5861_67_,
	pessoa69_.tipo_sanguineo as tipo78_5861_67_,
	pessoa69_.id_tipo_tamanho_calca as id105_5861_67_,
	pessoa69_.id_tipo_tamanho_camisa as id108_5861_67_,
	pessoa69_.id_tipo_tamanho_short_calca as id101_5861_67_,
	pessoa69_.data_expedicao_titulo_eleitor as data79_5861_67_,
	pessoa69_.numero_titulo_eleitor as numero80_5861_67_,
	pessoa69_.secao_titulo_eleitor as secao81_5861_67_,
	pessoa69_.id_unidade_federativa_titulo_eleitor as id95_5861_67_,
	pessoa69_.zona_titulo_eleitor as zona82_5861_67_,
	pessoa69_.id_uf_contato as id109_5861_67_,
	pessoa69_.ultima_atualizacao as ultima83_5861_67_,
	pessoa69_.id_uf_naturalidade as id99_5861_67_,
	pessoa69_.uf_naturalidade_ext as uf84_5861_67_,
	pessoa69_.valido as valido5861_67_,
	tipousuari70_.id as id5841_68_,
	tipousuari70_.interno as interno5841_68_,
	tipousuari70_.nome as nome5841_68_,
	unidade71_.id_unidade as id1_5895_69_,
	unidade71_.ativo as ativo5895_69_,
	unidade71_.bairro as bairro5895_69_,
	unidade71_.cep as cep5895_69_,
	unidade71_.cnpj as cnpj5895_69_,
	unidade71_.codigo_unidade as codigo6_5895_69_,
	unidade71_.codigo_inep as codigo7_5895_69_,
	unidade71_.codigo_rh as codigo8_5895_69_,
	unidade71_.complemento as compleme9_5895_69_,
	unidade71_.data_cadastro as data10_5895_69_,
	unidade71_.distrito as distrito5895_69_,
	unidade71_.email as email5895_69_,
	unidade71_.endereco as endereco5895_69_,
	unidade71_.fax as fax5895_69_,
	unidade71_.hierarquia as hierarquia5895_69_,
	unidade71_.id_municipio as id16_5895_69_,
	unidade71_.instituicao_ensino_superior as institu17_5895_69_,
	unidade71_.nome as nome5895_69_,
	unidade71_.nome_ascii as nome19_5895_69_,
	unidade71_.numero as numero5895_69_,
	unidade71_.sigla as sigla5895_69_,
	unidade71_.telefone as telefone5895_69_,
	unidade71_.tipo as tipo5895_69_,
	unidade71_.uf as uf5895_69_,
	unidade71_.unidade_orcamentaria as unidade25_5895_69_,
	unidade71_.id_responsavel as id26_5895_69_,
	turmaserie72_.id_turma_serie as id1_6401_70_,
	turmaserie72_.id_ambiente_unidade_escolar as id30_6401_70_,
	turmaserie72_.ano as ano6401_70_,
	turmaserie72_.atividade_complementar as atividade3_6401_70_,
	turmaserie72_.ativo as ativo6401_70_,
	turmaserie72_.capacidade_aluno as capacidade5_6401_70_,
	turmaserie72_.capacidade_sala_aula as capacidade6_6401_70_,
	turmaserie72_.codigo_rh as codigo7_6401_70_,
	turmaserie72_.id_curriculo_medio as id29_6401_70_,
	turmaserie72_.data_cadastro as data8_6401_70_,
	turmaserie72_.data_fim as data9_6401_70_,
	turmaserie72_.data_inicio as data10_6401_70_,
	turmaserie72_.descricao_horario as descricao11_6401_70_,
	turmaserie72_.id_escola as id31_6401_70_,
	turmaserie72_.id_proxima_turma as id12_6401_70_,
	turmaserie72_.identificador as identif13_6401_70_,
	turmaserie72_.justificativa_indeferimento as justifi14_6401_70_,
	turmaserie72_.justificativa_qtd_alunos as justifi15_6401_70_,
	turmaserie72_.justificativa_regra_nao as justifi16_6401_70_,
	turmaserie72_.id_modulo_inicial as id32_6401_70_,
	turmaserie72_.nome as nome6401_70_,
	turmaserie72_.nome_auxiliar as nome18_6401_70_,
	turmaserie72_.numero_estudantes as numero19_6401_70_,
	turmaserie72_.periodo as periodo6401_70_,
	turmaserie72_.permite_disciplina_contraturno as permite21_6401_70_,
	turmaserie72_.progressao_parcial as progressao22_6401_70_,
	turmaserie72_.id_registro_entrada as id28_6401_70_,
	turmaserie72_.regra_nao as regra23_6401_70_,
	turmaserie72_.id_serie as id33_6401_70_,
	turmaserie72_.tipo_diario as tipo24_6401_70_,
	turmaserie72_.tipo_importacao as tipo25_6401_70_,
	turmaserie72_.id_tipo_turma_serie as id27_6401_70_,
	turmaserie72_.id_turma_serie_agrupadora as id34_6401_70_,
	turmaserie72_.id_turno as id26_6401_70_,
	turmaserie72_.id_unidade as id35_6401_70_,
	escola73_.id_escola as id1_6301_71_,
	escola73_.ato_autorizacao_doe_data as ato2_6301_71_,
	escola73_.ato_autorizacao_doe_numero as ato3_6301_71_,
	escola73_.ato_autorizacao_data as ato4_6301_71_,
	escola73_.ato_autorizacao_descricao as ato5_6301_71_,
	escola73_.ato_criacao_doe_data as ato6_6301_71_,
	escola73_.ato_criacao_doe_numero as ato7_6301_71_,
	escola73_.ato_criacao_data as ato8_6301_71_,
	escola73_.ato_criacao_descricao as ato9_6301_71_,
	escola73_.ato_reconhecimento_doe_data as ato10_6301_71_,
	escola73_.ato_reconhecimento_doe_numero as ato11_6301_71_,
	escola73_.ato_reconhecimento_data as ato12_6301_71_,
	escola73_.ato_reconhecimento_descricao as ato13_6301_71_,
	escola73_.id_bairro_escola as id47_6301_71_,
	escola73_.cep as cep6301_71_,
	escola73_.cnpj as cnpj6301_71_,
	escola73_.codigo_acao as codigo16_6301_71_,
	escola73_.codigo_cadastro_escolar as codigo17_6301_71_,
	escola73_.codigo_inep as codigo18_6301_71_,
	escola73_.codigo_ies as codigo19_6301_71_,
	escola73_.codigo_legado as codigo20_6301_71_,
	escola73_.id_conta as id48_6301_71_,
	escola73_.data_validacao_geocode as data21_6301_71_,
	escola73_.id_dependencia_administrativa as id37_6301_71_,
	escola73_.distrito as distrito6301_71_,
	escola73_.id_drae as id46_6301_71_,
	escola73_.email as email6301_71_,
	escola73_.endereco as endereco6301_71_,
	escola73_.escola_rh as escola25_6301_71_,
	escola73_.fax as fax6301_71_,
	escola73_.geocode as geocode6301_71_,
	escola73_.habilita_ambientes as habilita28_6301_71_,
	escola73_.id_unidade_anexo as id29_6301_71_,
	escola73_.instituicao_ensino_superior as institu30_6301_71_,
	escola73_.id_localizacao_zona as id40_6301_71_,
	escola73_.id_municipio as id39_6301_71_,
	escola73_.nome as nome6301_71_,
	escola73_.numero as numero6301_71_,
	escola73_.id_regional_ensino as id42_6301_71_,
	escola73_.senhaTransferencia as senhaTr33_6301_71_,
	escola73_.sigla as sigla6301_71_,
	escola73_.id_situacao_funcionamento as id45_6301_71_,
	escola73_.telefone as telefone6301_71_,
	escola73_.id_tipo_unidade_escolar as id38_6301_71_,
	escola73_.unidade_anexo as unidade36_6301_71_,
	escola73_.id_unidade_escola as id41_6301_71_,
	escola73_.id_registro_validacao_geocode as id44_6301_71_,
	escola73_.id_zona_municipal as id43_6301_71_,
	bairroesco74_.id_bairro_escola as id1_6298_72_,
	bairroesco74_.ativo as ativo6298_72_,
	bairroesco74_.id_municipio as id4_6298_72_,
	bairroesco74_.denominacao as denomina3_6298_72_,
	municipio75_.id_municipio as id1_5859_73_,
	municipio75_.ativo as ativo5859_73_,
	municipio75_.codigo as codigo5859_73_,
	municipio75_.codigo_acao as codigo4_5859_73_,
	municipio75_.nome as nome5859_73_,
	municipio75_.id_unidade_federativa as id6_5859_73_,
	unidadefed76_.id_unidade_federativa as id1_5894_74_,
	unidadefed76_.ativo as ativo5894_74_,
	unidadefed76_.id_capital as id5_5894_74_,
	unidadefed76_.descricao as descricao5894_74_,
	unidadefed76_.id_pais as id6_5894_74_,
	unidadefed76_.sigla as sigla5894_74_,
	contabanca77_.id_conta_bancaria as id1_5852_75_,
	contabanca77_.agencia as agencia5852_75_,
	contabanca77_.id_banco as id5_5852_75_,
	contabanca77_.numero as numero5852_75_,
	contabanca77_.variacao as variacao5852_75_,
	banco78_.id_banco as id1_5849_76_,
	banco78_.ativo as ativo5849_76_,
	banco78_.codigo as codigo5849_76_,
	banco78_.denominacao as denomina4_5849_76_,
	banco78_.publicado as publicado5849_76_,
	dependenci79_.id_dependencia_administrativa_escola as id1_6300_77_,
	dependenci79_.denominacao as denomina2_6300_77_,
	unidade80_.id_unidade as id1_5895_78_,
	unidade80_.ativo as ativo5895_78_,
	unidade80_.bairro as bairro5895_78_,
	unidade80_.cep as cep5895_78_,
	unidade80_.cnpj as cnpj5895_78_,
	unidade80_.codigo_unidade as codigo6_5895_78_,
	unidade80_.codigo_inep as codigo7_5895_78_,
	unidade80_.codigo_rh as codigo8_5895_78_,
	unidade80_.complemento as compleme9_5895_78_,
	unidade80_.data_cadastro as data10_5895_78_,
	unidade80_.distrito as distrito5895_78_,
	unidade80_.email as email5895_78_,
	unidade80_.endereco as endereco5895_78_,
	unidade80_.fax as fax5895_78_,
	unidade80_.hierarquia as hierarquia5895_78_,
	unidade80_.id_municipio as id16_5895_78_,
	unidade80_.instituicao_ensino_superior as institu17_5895_78_,
	unidade80_.nome as nome5895_78_,
	unidade80_.nome_ascii as nome19_5895_78_,
	unidade80_.numero as numero5895_78_,
	unidade80_.sigla as sigla5895_78_,
	unidade80_.telefone as telefone5895_78_,
	unidade80_.tipo as tipo5895_78_,
	unidade80_.uf as uf5895_78_,
	unidade80_.unidade_orcamentaria as unidade25_5895_78_,
	unidade80_.id_responsavel as id26_5895_78_,
	localizaca81_.id_localizacao_zona as id1_6313_79_,
	localizaca81_.denominacao as denomina2_6313_79_,
	municipio82_.id_municipio as id1_5859_80_,
	municipio82_.ativo as ativo5859_80_,
	municipio82_.codigo as codigo5859_80_,
	municipio82_.codigo_acao as codigo4_5859_80_,
	municipio82_.nome as nome5859_80_,
	municipio82_.id_unidade_federativa as id6_5859_80_,
	unidade83_.id_unidade as id1_5895_81_,
	unidade83_.ativo as ativo5895_81_,
	unidade83_.bairro as bairro5895_81_,
	unidade83_.cep as cep5895_81_,
	unidade83_.cnpj as cnpj5895_81_,
	unidade83_.codigo_unidade as codigo6_5895_81_,
	unidade83_.codigo_inep as codigo7_5895_81_,
	unidade83_.codigo_rh as codigo8_5895_81_,
	unidade83_.complemento as compleme9_5895_81_,
	unidade83_.data_cadastro as data10_5895_81_,
	unidade83_.distrito as distrito5895_81_,
	unidade83_.email as email5895_81_,
	unidade83_.endereco as endereco5895_81_,
	unidade83_.fax as fax5895_81_,
	unidade83_.hierarquia as hierarquia5895_81_,
	unidade83_.id_municipio as id16_5895_81_,
	unidade83_.instituicao_ensino_superior as institu17_5895_81_,
	unidade83_.nome as nome5895_81_,
	unidade83_.nome_ascii as nome19_5895_81_,
	unidade83_.numero as numero5895_81_,
	unidade83_.sigla as sigla5895_81_,
	unidade83_.telefone as telefone5895_81_,
	unidade83_.tipo as tipo5895_81_,
	unidade83_.uf as uf5895_81_,
	unidade83_.unidade_orcamentaria as unidade25_5895_81_,
	unidade83_.id_responsavel as id26_5895_81_,
	situacaofu84_.id_situacao_funcionamento as id1_6317_82_,
	situacaofu84_.denominacao as denomina2_6317_82_,
	tipounidad85_.id_tipo_unidade_escolar as id1_6331_83_,
	tipounidad85_.descricao as descricao6331_83_,
	unidade86_.id_unidade as id1_5895_84_,
	unidade86_.ativo as ativo5895_84_,
	unidade86_.bairro as bairro5895_84_,
	unidade86_.cep as cep5895_84_,
	unidade86_.cnpj as cnpj5895_84_,
	unidade86_.codigo_unidade as codigo6_5895_84_,
	unidade86_.codigo_inep as codigo7_5895_84_,
	unidade86_.codigo_rh as codigo8_5895_84_,
	unidade86_.complemento as compleme9_5895_84_,
	unidade86_.data_cadastro as data10_5895_84_,
	unidade86_.distrito as distrito5895_84_,
	unidade86_.email as email5895_84_,
	unidade86_.endereco as endereco5895_84_,
	unidade86_.fax as fax5895_84_,
	unidade86_.hierarquia as hierarquia5895_84_,
	unidade86_.id_municipio as id16_5895_84_,
	unidade86_.instituicao_ensino_superior as institu17_5895_84_,
	unidade86_.nome as nome5895_84_,
	unidade86_.nome_ascii as nome19_5895_84_,
	unidade86_.numero as numero5895_84_,
	unidade86_.sigla as sigla5895_84_,
	unidade86_.telefone as telefone5895_84_,
	unidade86_.tipo as tipo5895_84_,
	unidade86_.uf as uf5895_84_,
	unidade86_.unidade_orcamentaria as unidade25_5895_84_,
	unidade86_.id_responsavel as id26_5895_84_,
	zonamunici87_.id_zona_municipal as id1_5881_85_,
	zonamunici87_.data_atualizacao as data2_5881_85_,
	zonamunici87_.data_cadastro as data3_5881_85_,
	zonamunici87_.descricao as descricao5881_85_,
	zonamunici87_.id_municipio as id6_5881_85_,
	zonamunici87_.id_registro_atualizacao as id7_5881_85_,
	zonamunici87_.id_registro_cadastro as id5_5881_85_,
	municipio88_.id_municipio as id1_5859_86_,
	municipio88_.ativo as ativo5859_86_,
	municipio88_.codigo as codigo5859_86_,
	municipio88_.codigo_acao as codigo4_5859_86_,
	municipio88_.nome as nome5859_86_,
	municipio88_.id_unidade_federativa as id6_5859_86_,
	modulo89_.id_modulo as id1_6231_87_,
	modulo89_.id_curriculo as id5_6231_87_,
	modulo89_.denominacao as denomina2_6231_87_,
	modulo89_.periodo_oferta as periodo3_6231_87_,
	modulo89_.sigla as sigla6231_87_,
	serie90_.id_serie as id1_6213_88_,
	serie90_.ativo as ativo6213_88_,
	serie90_.bloquear_oferta_vagas as bloquear3_6213_88_,
	serie90_.capacidade_excesso as capacidade4_6213_88_,
	serie90_.capacidade_maxima as capacidade5_6213_88_,
	serie90_.capacidade_minima as capacidade6_6213_88_,
	serie90_.cod_censo as cod7_6213_88_,
	serie90_.codigo_rh as codigo8_6213_88_,
	serie90_.correcao_fluxo as correcao9_6213_88_,
	serie90_.data_atualizacao as data10_6213_88_,
	serie90_.data_cadastro as data11_6213_88_,
	serie90_.descricao as descricao6213_88_,
	serie90_.emite_certificado as emite13_6213_88_,
	serie90_.id_etapa_ensino as id30_6213_88_,
	serie90_.exige_carga_horaria_por_componente as exige14_6213_88_,
	serie90_.final_etapa as final15_6213_88_,
	serie90_.multisseriada as multiss16_6213_88_,
	serie90_. nao_contabiliza_turma as column17_6213_88_,
	serie90_.numero as numero6213_88_,
	serie90_.permite_avanco_estudo as permite19_6213_88_,
	serie90_.permite_gerenciar_turma_sem_horario as permite20_6213_88_,
	serie90_.permite_participar_atv_esportiva as permite21_6213_88_,
	serie90_.permite_participar_sol_cadastro_reserva as permite22_6213_88_,
	serie90_.id_proxima_serie as id28_6213_88_,
	serie90_.id_registro_atualizacao as id27_6213_88_,
	serie90_.id_registro_entrada as id26_6213_88_,
	serie90_.sigla as sigla6213_88_,
	serie90_.tipo_diario as tipo24_6213_88_,
	serie90_.id_unidade as id29_6213_88_,
	serie90_. verifica_frequencia_anos_anteriores as column25_6213_88_,
	etapaensin91_.id_etapa_ensino as id1_6205_89_,
	etapaensin91_.ativo as ativo6205_89_,
	etapaensin91_.bloquear_alteracao as bloquear3_6205_89_,
	etapaensin91_.capacidade_excesso as capacidade4_6205_89_,
	etapaensin91_.capacidade_maxima as capacidade5_6205_89_,
	etapaensin91_.capacidade_maxima_correcao_fluxo as capacidade6_6205_89_,
	etapaensin91_.capacidade_minima as capacidade7_6205_89_,
	etapaensin91_.capacidade_minima_correcao_fluxo as capacidade8_6205_89_,
	etapaensin91_.codigo_rh as codigo9_6205_89_,
	etapaensin91_.data_atualizacao as data10_6205_89_,
	etapaensin91_.denominacao as denomin11_6205_89_,
	etapaensin91_.duracao_conclusao as duracao12_6205_89_,
	etapaensin91_.id_forma_organizacao_Etapa as id22_6205_89_,
	etapaensin91_.id_local_oferta as id17_6205_89_,
	etapaensin91_.id_modalidade as id19_6205_89_,
	etapaensin91_.id_nivel_etapa as id21_6205_89_,
	etapaensin91_.periodicidade_etapa as periodi13_6205_89_,
	etapaensin91_.permite_disciplina_contraturno as permite14_6205_89_,
	etapaensin91_.id_registro_atualizacao as id16_6205_89_,
	etapaensin91_.sigla as sigla6205_89_,
	etapaensin91_.id_situacao as id18_6205_89_,
	etapaensin91_.id_unidade as id20_6205_89_,
	unidade92_.id_unidade as id1_5895_90_,
	unidade92_.ativo as ativo5895_90_,
	unidade92_.bairro as bairro5895_90_,
	unidade92_.cep as cep5895_90_,
	unidade92_.cnpj as cnpj5895_90_,
	unidade92_.codigo_unidade as codigo6_5895_90_,
	unidade92_.codigo_inep as codigo7_5895_90_,
	unidade92_.codigo_rh as codigo8_5895_90_,
	unidade92_.complemento as compleme9_5895_90_,
	unidade92_.data_cadastro as data10_5895_90_,
	unidade92_.distrito as distrito5895_90_,
	unidade92_.email as email5895_90_,
	unidade92_.endereco as endereco5895_90_,
	unidade92_.fax as fax5895_90_,
	unidade92_.hierarquia as hierarquia5895_90_,
	unidade92_.id_municipio as id16_5895_90_,
	unidade92_.instituicao_ensino_superior as institu17_5895_90_,
	unidade92_.nome as nome5895_90_,
	unidade92_.nome_ascii as nome19_5895_90_,
	unidade92_.numero as numero5895_90_,
	unidade92_.sigla as sigla5895_90_,
	unidade92_.telefone as telefone5895_90_,
	unidade92_.tipo as tipo5895_90_,
	unidade92_.uf as uf5895_90_,
	unidade92_.unidade_orcamentaria as unidade25_5895_90_,
	unidade92_.id_responsavel as id26_5895_90_,
	tipoturmas93_.id_tipo_turma_serie as id1_5912_91_,
	tipoturmas93_.ativo as ativo5912_91_,
	tipoturmas93_.descricao as descricao5912_91_,
	turmaserie94_.id_turma_serie as id1_6401_92_,
	turmaserie94_.id_ambiente_unidade_escolar as id30_6401_92_,
	turmaserie94_.ano as ano6401_92_,
	turmaserie94_.atividade_complementar as atividade3_6401_92_,
	turmaserie94_.ativo as ativo6401_92_,
	turmaserie94_.capacidade_aluno as capacidade5_6401_92_,
	turmaserie94_.capacidade_sala_aula as capacidade6_6401_92_,
	turmaserie94_.codigo_rh as codigo7_6401_92_,
	turmaserie94_.id_curriculo_medio as id29_6401_92_,
	turmaserie94_.data_cadastro as data8_6401_92_,
	turmaserie94_.data_fim as data9_6401_92_,
	turmaserie94_.data_inicio as data10_6401_92_,
	turmaserie94_.descricao_horario as descricao11_6401_92_,
	turmaserie94_.id_escola as id31_6401_92_,
	turmaserie94_.id_proxima_turma as id12_6401_92_,
	turmaserie94_.identificador as identif13_6401_92_,
	turmaserie94_.justificativa_indeferimento as justifi14_6401_92_,
	turmaserie94_.justificativa_qtd_alunos as justifi15_6401_92_,
	turmaserie94_.justificativa_regra_nao as justifi16_6401_92_,
	turmaserie94_.id_modulo_inicial as id32_6401_92_,
	turmaserie94_.nome as nome6401_92_,
	turmaserie94_.nome_auxiliar as nome18_6401_92_,
	turmaserie94_.numero_estudantes as numero19_6401_92_,
	turmaserie94_.periodo as periodo6401_92_,
	turmaserie94_.permite_disciplina_contraturno as permite21_6401_92_,
	turmaserie94_.progressao_parcial as progressao22_6401_92_,
	turmaserie94_.id_registro_entrada as id28_6401_92_,
	turmaserie94_.regra_nao as regra23_6401_92_,
	turmaserie94_.id_serie as id33_6401_92_,
	turmaserie94_.tipo_diario as tipo24_6401_92_,
	turmaserie94_.tipo_importacao as tipo25_6401_92_,
	turmaserie94_.id_tipo_turma_serie as id27_6401_92_,
	turmaserie94_.id_turma_serie_agrupadora as id34_6401_92_,
	turmaserie94_.id_turno as id26_6401_92_,
	turmaserie94_.id_unidade as id35_6401_92_,
	turno95_.id_turno as id1_5929_93_,
	turno95_.ativo as ativo5929_93_,
	turno95_.codigo_rh as codigo3_5929_93_,
	turno95_.descricao as descricao5929_93_,
	turno95_.hora_fim as hora5_5929_93_,
	turno95_.hora_inicio as hora6_5929_93_,
	turno95_.ordem as ordem5929_93_,
	turno95_.sigla as sigla5929_93_
from
	ensino.turma this_
left outer join basico.categoria_componente categoriac2_ on
	this_.id_categoria_componente = categoriac2_.id_categoria_componente
left outer join ensino.componente_curricular componente3_ on
	this_.id_disciplina = componente3_.id_componente_curricular
left outer join ensino_infantil.area_conhecimento areaconhec4_ on
	componente3_.id_area_conhecimento = areaconhec4_.id_area_conhecimento
left outer join ensino.tipo_componente_curricular tipocompon5_ on
	componente3_.id_tipo_componente = tipocompon5_.id_tipo_disciplina
left outer join ensino.docente_turma docentestu6_ on
	this_.id_turma = docentestu6_.id_turma
left outer join rh.afastamento afastament7_ on
	docentestu6_.id_afastamento = afastament7_.id_afastamento
left outer join rh.servidor servidor8_ on
	afastament7_.id_servidor = servidor8_.id_servidor
left outer join rh.cargo cargo9_ on
	servidor8_.id_cargo = cargo9_.id_cargo
left outer join rh.CATEGORIA categoria10_ on
	cargo9_.id_categoria = categoria10_.ID_CATEGORIA
left outer join rh.nivel_cargo nivelcargo11_ on
	cargo9_.id_nivel_cargo = nivelcargo11_.id_nivel_cargo
left outer join rh.CATEGORIA categoria12_ on
	servidor8_.id_categoria = categoria12_.ID_CATEGORIA
left outer join rh.classe_servidor classeserv13_ on
	servidor8_.id_classe_servidor = classeserv13_.id_classe_servidor
left outer join rh.FORMACAO formacao14_ on
	servidor8_.id_formacao = formacao14_.ID_FORMACAO
left outer join pessoas.instituicao instituica15_ on
	servidor8_.id_instituicao = instituica15_.id_instituicao
left outer join pessoas.contato_instituicao contatoins16_ on
	instituica15_.id_contato_instituicao = contatoins16_.id_contato_instituicao
left outer join comum.municipio municipio17_ on
	instituica15_.id_municipio = municipio17_.id_municipio
left outer join comum.unidade_federativa unidadefed18_ on
	instituica15_.id_uf = unidadefed18_.id_unidade_federativa
left outer join comum.pessoa pessoa19_ on
	servidor8_.id_pessoa = pessoa19_.id_pessoa
left outer join escola.bairro_escola bairroesco20_ on
	pessoa19_.id_bairro_endereco = bairroesco20_.id_bairro_escola
left outer join pessoas.escolaridade escolarida21_ on
	pessoa19_.id_escolaridade = escolarida21_.id_escolaridade
left outer join comum.estado_civil estadocivi22_ on
	pessoa19_.id_estado_civil = estadocivi22_.id_estado_civil
left outer join comum.unidade_federativa unidadefed23_ on
	pessoa19_.id_unidade_federativa_identidade = unidadefed23_.id_unidade_federativa
left outer join comum.municipio municipio24_ on
	pessoa19_.id_municipio_contato = municipio24_.id_municipio
left outer join comum.tamanho_fardamento tamanhofar25_ on
	pessoa19_.id_tamanho_calca_letra = tamanhofar25_.id_tamanho
left outer join comum.tamanho_fardamento tamanhofar26_ on
	pessoa19_.id_tamanho_camisa_letra = tamanhofar26_.id_tamanho
left outer join comum.tamanho_fardamento tamanhofar27_ on
	pessoa19_.id_tamanho_short_calca_letra = tamanhofar27_.id_tamanho
left outer join matricula.tipo_documento_militar tipodocume28_ on
	pessoa19_.id_tipo_documento_militar = tipodocume28_.id_tipo_documento_militar
left outer join matricula.tipo_militar tipomilita29_ on
	pessoa19_.id_tipo_militar = tipomilita29_.id_tipo_militar
left outer join comum.tipo_raca tiporaca30_ on
	pessoa19_.id_raca = tiporaca30_.id_tipo_raca
left outer join comum.tipo_tamanho_fardamento tipotamanh31_ on
	pessoa19_.id_tipo_tamanho_calca = tipotamanh31_.id_tipo_tamanho
left outer join comum.tipo_tamanho_fardamento tipotamanh32_ on
	pessoa19_.id_tipo_tamanho_camisa = tipotamanh32_.id_tipo_tamanho
left outer join comum.tipo_tamanho_fardamento tipotamanh33_ on
	pessoa19_.id_tipo_tamanho_short_calca = tipotamanh33_.id_tipo_tamanho
left outer join comum.unidade_federativa unidadefed34_ on
	pessoa19_.id_uf_contato = unidadefed34_.id_unidade_federativa
left outer join comum.unidade_federativa unidadefed35_ on
	pessoa19_.id_uf_naturalidade = unidadefed35_.id_unidade_federativa
left outer join COMUM.REGISTRO_ENTRADA registroen36_ on
	servidor8_.id_entrada = registroen36_.ID_ENTRADA
left outer join comum.usuario usuario37_ on
	registroen36_.ID_USUARIO = usuario37_.id_usuario
left outer join rh.tipo_contrato_servidor tipocontra38_ on
	servidor8_.id_tipo_contrato_servidor = tipocontra38_.id_tipo_contrato_servidor
left outer join comum.unidade unidade39_ on
	servidor8_.id_unidade = unidade39_.id_unidade
left outer join comum.unidade unidade40_ on
	servidor8_.id_unidade_transferida = unidade40_.id_unidade
left outer join rh.tipo_afastamento tipoafasta41_ on
	afastament7_.id_tipo = tipoafasta41_.id_tipo_afastamento
left outer join comum.unidade unidade42_ on
	afastament7_.id_unidade = unidade42_.id_unidade
left outer join ensino.atividade_ape atividadea43_ on
	docentestu6_.id_atividade_ape = atividadea43_.id_atividade_ape
left outer join rh.servidor servidor44_ on
	docentestu6_.id_docente = servidor44_.id_servidor
left outer join ensino.docente_externo docenteext45_ on
	docentestu6_.id_docente_externo = docenteext45_.id_docente_externo
left outer join rh.FORMACAO formacao46_ on
	docenteext45_.id_formacao = formacao46_.ID_FORMACAO
left outer join comum.pessoa pessoa47_ on
	docenteext45_.id_pessoa = pessoa47_.id_pessoa
left outer join rh.servidor servidor48_ on
	docenteext45_.id_servidor = servidor48_.id_servidor
left outer join ensino.tipo_docente_externo tipodocent49_ on
	docenteext45_.id_tipo_docente_externo = tipodocent49_.id_tipo_docente_externo
left outer join ensino.solicitacao_carga_horaria_suplementar solicitaca50_ on
	docentestu6_.id_docente_turma = solicitaca50_.id_docente_turma
left outer join ensino.status_solicitacao_carga_horaria_suplementar statussoli51_ on
	solicitaca50_.id_status_solicitacao_carga_horaria_suplementar = statussoli51_.id_status_solicitacao_carga_horaria_suplementar
left outer join ensino.horario_turma horarios52_ on
	this_.id_turma = horarios52_.id_turma
left outer join ensino.Horario horario53_ on
	horarios52_.id_horario = horario53_.id_horario
left outer join basico.etapa_ensino etapaensin54_ on
	horario53_.id_etapa_ensino = etapaensin54_.id_etapa_ensino
left outer join basico.forma_organizacao_etapa formaorgan55_ on
	etapaensin54_.id_forma_organizacao_Etapa = formaorgan55_.id_forma_organizacao_etapa
left outer join comum.unidade unidade56_ on
	formaorgan55_.id_unidade = unidade56_.id_unidade
left outer join basico.local_oferta localofert57_ on
	etapaensin54_.id_local_oferta = localofert57_.id_local_oferta
left outer join basico.modalidade_ensino_basico modalidade58_ on
	etapaensin54_.id_modalidade = modalidade58_.id_modalidade_ensino_basico
left outer join comum.unidade unidade59_ on
	modalidade58_.id_unidade = unidade59_.id_unidade
left outer join basico.nivel_etapa_ensino niveletapa60_ on
	etapaensin54_.id_nivel_etapa = niveletapa60_.id_nivel_etapa_ensino
left outer join comum.unidade unidade61_ on
	niveletapa60_.id_unidade = unidade61_.id_unidade
left outer join basico.situacao_etapa_ensino situacaoet62_ on
	etapaensin54_.id_situacao = situacaoet62_.id_situacao
left outer join comum.unidade unidade63_ on
	etapaensin54_.id_unidade = unidade63_.id_unidade
left outer join comum.unidade unidade64_ on
	horario53_.id_unidade = unidade64_.id_unidade
left outer join basico.modulo modulo65_ on
	this_.id_modulo = modulo65_.id_modulo
left outer join ensino.situacao_turma situacaotu66_ on
	this_.id_situacao_turma = situacaotu66_.id_situacao_turma
left outer join ensino.turma turmacompo67_ on
	this_.id_turma_agrupadora = turmacompo67_.id_turma
left outer join comum.usuario usuario68_ on
	turmacompo67_.id_usuario_consolidacao = usuario68_.id_usuario
left outer join comum.pessoa pessoa69_ on
	usuario68_.id_pessoa = pessoa69_.id_pessoa
left outer join comum.tipo_usuario tipousuari70_ on
	usuario68_.tipo = tipousuari70_.id
left outer join comum.unidade unidade71_ on
	usuario68_.id_unidade = unidade71_.id_unidade
left outer join basico.turma_serie turmaserie72_ on
	this_.id_turma_serie = turmaserie72_.id_turma_serie
left outer join escola.escola escola73_ on
	turmaserie72_.id_escola = escola73_.id_escola
left outer join escola.bairro_escola bairroesco74_ on
	escola73_.id_bairro_escola = bairroesco74_.id_bairro_escola
left outer join comum.municipio municipio75_ on
	bairroesco74_.id_municipio = municipio75_.id_municipio
left outer join comum.unidade_federativa unidadefed76_ on
	municipio75_.id_unidade_federativa = unidadefed76_.id_unidade_federativa
left outer join comum.conta_bancaria contabanca77_ on
	escola73_.id_conta = contabanca77_.id_conta_bancaria
left outer join comum.banco banco78_ on
	contabanca77_.id_banco = banco78_.id_banco
left outer join escola.dependencia_administrativa_escola dependenci79_ on
	escola73_.id_dependencia_administrativa = dependenci79_.id_dependencia_administrativa_escola
left outer join comum.unidade unidade80_ on
	escola73_.id_drae = unidade80_.id_unidade
left outer join escola.localizacao_zona localizaca81_ on
	escola73_.id_localizacao_zona = localizaca81_.id_localizacao_zona
left outer join comum.municipio municipio82_ on
	escola73_.id_municipio = municipio82_.id_municipio
left outer join comum.unidade unidade83_ on
	escola73_.id_regional_ensino = unidade83_.id_unidade
left outer join escola.situacao_funcionamento situacaofu84_ on
	escola73_.id_situacao_funcionamento = situacaofu84_.id_situacao_funcionamento
left outer join escola.tipo_unidade_escolar tipounidad85_ on
	escola73_.id_tipo_unidade_escolar = tipounidad85_.id_tipo_unidade_escolar
left outer join comum.unidade unidade86_ on
	escola73_.id_unidade_escola = unidade86_.id_unidade
left outer join comum.zona_municipal zonamunici87_ on
	escola73_.id_zona_municipal = zonamunici87_.id_zona_municipal
left outer join comum.municipio municipio88_ on
	zonamunici87_.id_municipio = municipio88_.id_municipio
left outer join basico.modulo modulo89_ on
	turmaserie72_.id_modulo_inicial = modulo89_.id_modulo
left outer join basico.serie serie90_ on
	turmaserie72_.id_serie = serie90_.id_serie
left outer join basico.etapa_ensino etapaensin91_ on
	serie90_.id_etapa_ensino = etapaensin91_.id_etapa_ensino
left outer join comum.unidade unidade92_ on
	serie90_.id_unidade = unidade92_.id_unidade
left outer join basico.tipo_turma_serie tipoturmas93_ on
	turmaserie72_.id_tipo_turma_serie = tipoturmas93_.id_tipo_turma_serie
left outer join basico.turma_serie turmaserie94_ on
	turmaserie72_.id_turma_serie_agrupadora = turmaserie94_.id_turma_serie
left outer join ensino.turno turno95_ on
	turmaserie94_.id_turno = turno95_.id_turno
where
	this_.id_turma =709802;


 select
	distinct rfs.data_aula
from
	ensino.registro_falta_professor rfs
join ensino.docente_turma dt on
	(dt.id_docente_turma = rfs.id_docente_turma)
where
	dt.ativo is true
	and rfs.ativo is true
	and dt.id_turma in (709802);
 
 
  select * 
	--distinct rfs.data_aula
from
	ensino.registro_falta_professor rfs;
  
  
  
  
  select
	pessoa.id_pessoa,
	pessoa.nome,
	mes.num_chamada,
	mes.id_situacao_matricula_serie,
	case
		when aet.data_entrada_escola is not null then aet.data_entrada_escola
		when mes.data_matricula_turma is not null then mes.data_matricula_turma
		else mes.data_cadastro
	end
from
	ensino.matricula_componente mc
inner join ensino.turma tc on
	tc.id_turma = mc.id_turma
inner join basico.turma_serie ts on
	ts.id_turma_serie = tc.id_turma_serie
inner join basico.serie s
		using(id_serie)
inner join public.discente discente on
	discente.id_discente = mc.id_discente
inner join comum.pessoa pessoa on
	pessoa.id_pessoa = discente.id_pessoa
inner join basico.matricula_estudante_serie mes on
	mes.id_estudante = mc.id_discente
	and mes.periodo = tc.periodo
	and ( (mes.id_turma_serie = ts.id_turma_serie
		and s.tipo_diario <> 16 )
	or s.tipo_diario = 16 )
	and mes.id_situacao_matricula_serie in ( 1, 2, 3, 4, 6, 7, 8, 9, 10, 11 )
left join ensino.avaliacao_estudante_transferido aet on
	aet.id_matricula_estudante_serie = mes.id_matricula_discente_serie
where
	tc.id_turma = :idTurma
	and mes.id_estudante = discente.id_discente
	and mc.id_situacao_matricula in ( 5, 6, 2, 8, 9, 4 )
order by
	mes.num_chamada,
	pessoa.nome asc,
	mc.id_discente ;

  select
	pessoa.id_pessoa,
	freq.id_frequencia,
	freq.data,
	freq.frequencia,
	freq.abonada
from
	ensino.frequencia_aluno freq
join discente d
		using (id_discente)
join comum.pessoa pessoa on
	d.id_pessoa = pessoa.id_pessoa
join ensino.turma t on
	t.id_turma = freq.id_turma
join basico.matricula_estudante_serie mes on
	mes.id_estudante = freq.id_discente
	and mes.id_turma_serie = t.id_turma_serie
left join (
	select
		mes.id_matricula_discente_serie,
		mes.id_estudante,
		MAX(coalesce(mee.data_solicitacao, mee.DATA)) ultima_data
	from
		basico.matricula_estudante_serie mes
	join matricula.movimentacao_estudante_escola mee on
		mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	where
		mes.id_situacao_matricula_serie = 6
		and mee.id_tipo_sol_transferencia in ( 5, 3  )
	group by
		mes.id_estudante,
		mes.id_matricula_discente_serie ) mee_externa on
	mee_externa.id_matricula_discente_serie = mes.id_matricula_discente_serie
	and mes.id_situacao_matricula_serie = 6
where
	(freq.ativo
		or freq.abonada)
	and freq.id_turma = 709802
	and freq.id_frequencia in (146138719, 146089438)
	and (mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10, 4 )
		or (mes.id_situacao_matricula_serie = 6 and freq.data < mee_externa.ultima_data))
order by
	freq.frequencia desc,
	freq.abonada;
  
  
  
  select
	mee.id_tipo_sol_transferencia, * 
	from
		basico.matricula_estudante_serie mes
	join matricula.movimentacao_estudante_escola mee on mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	where
		mes.id_situacao_matricula_serie = 6
		and mes.ano_calendario = 2025
		and mes.id_matricula_discente_serie in (1353309,1358236 );
		and mee.id_tipo_sol_transferencia in ( 5, 3 );
  
  
  
  
  
  
  
  
  
  begin;
  
  rollback;
  
  
  
  
  
  
  
  
select
	pessoa.id_pessoa,
	freq.id_frequencia,
	freq.data,
	freq.frequencia,
	freq.abonada
from
	ensino.frequencia_aluno freq
join discente d
		using (id_discente)
join comum.pessoa pessoa on
	d.id_pessoa = pessoa.id_pessoa
join ensino.turma t on
	t.id_turma = freq.id_turma
join basico.matricula_estudante_serie mes on
	mes.id_estudante = freq.id_discente
	and mes.id_turma_serie = t.id_turma_serie
left join (
	select
		mes.id_matricula_discente_serie,
		mes.id_estudante,
		MAX(coalesce(mee.data_solicitacao, mee.DATA)) ultima_data
	from
		basico.matricula_estudante_serie mes
	join matricula.movimentacao_estudante_escola mee on
		mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	where
		mes.id_situacao_matricula_serie = 6
		and mee.id_tipo_sol_transferencia in ( 5, 3 )1
	group by
		mes.id_estudante,
		mes.id_matricula_discente_serie ) mee_externa on
	mee_externa.id_matricula_discente_serie = mes.id_matricula_discente_serie
	and mes.id_situacao_matricula_serie = 6
where
	(freq.ativo
		or freq.abonada)
	and freq.id_turma = 709802
	and (mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10, 4 )
		or (mes.id_situacao_matricula_serie = 6
			and freq.data < mee_externa.ultima_data))
order by
	freq.frequencia desc,
	freq.abonada;


select
	aet.id_matricula_estudante_serie,
	aet.faltas
from
	ensino.avaliacao_estudante_transferido aet
where
	aet.ativo
	and aet.id_matricula_estudante_serie in ( 1354248, 1356800, 1357820, 1353309, 1353197, 1353763, 1356930, 1354104, 1353380, 1354533, 1352813, 1356806, 1354247, 1355984, 1355253, 1355027, 1354504, 1355857, 1353413, 1355308, 1355091, 1358094 ) 

select
	fa.id_discente as discente,
	coalesce(sum(case when fa.abonada then fa.atual else fa.frequencia end), 0) as faltas
from
	ensino.frequencia_aluno fa
join ensino.turma t on
	t.id_turma = fa.id_turma
where
	fa.ativo
	and t.id_turma = 709802
group by
	fa.id_discente
order by
	fa.id_discente;
