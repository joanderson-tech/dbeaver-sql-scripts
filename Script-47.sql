select distinct 
	turmacompo34_.id_turma as id1_80_,
	this_.id_turma_serie as id1_928_78_,
	this_.ano as ano928_78_,
	this_.atividade_complementar as atividade3_928_78_,
	this_.ativo as ativo928_78_,
	this_.capacidade_aluno as capacidade5_928_78_,
	this_.capacidade_sala_aula as capacidade6_928_78_,
	this_.codigo_rh as codigo7_928_78_,
	this_.id_curriculo_medio as id27_928_78_,
	this_.data_cadastro as data8_928_78_,
	this_.data_fim as data9_928_78_,
	this_.data_inicio as data10_928_78_,
	this_.descricao_horario as descricao11_928_78_,
	this_.id_escola as id32_928_78_,
	this_.id_proxima_turma as id12_928_78_,
	this_.identificador as identif13_928_78_,
	this_.justificativa_indeferimento as justifi14_928_78_,
	this_.justificativa_qtd_alunos as justifi15_928_78_,
	this_.justificativa_regra_nao as justifi16_928_78_,
	this_.id_modulo_inicial as id31_928_78_,
	this_.nome as nome928_78_,
	this_.nome_auxiliar as nome18_928_78_,
	this_.numero_estudantes as numero19_928_78_,
	this_.periodo as periodo928_78_,
	this_.permite_disciplina_contraturno as permite21_928_78_,
	this_.progressao_parcial as progressao22_928_78_,
	this_.id_registro_entrada as id26_928_78_,
	this_.regra_nao as regra23_928_78_,
	this_.id_serie as id33_928_78_,
	this_.tipo_diario as tipo24_928_78_,
	this_.tipo_importacao as tipo25_928_78_,
	this_.id_tipo_turma_serie as id28_928_78_,
	this_.id_turma_serie_agrupadora as id34_928_78_,
	this_.id_turno as id30_928_78_,
	this_.id_unidade as id29_928_78_,
	turmacompo34_.id_turma_serie as id36_80_,
	turmacompo34_.id_turma as id1_80_,
	turmacompo34_.id_turma as id1_495_32_,
	turmacompo34_.agrupadora as agrupadora495_32_,
	turmacompo34_.ano as ano495_32_,
	turmacompo34_.capacidade_aluno as capacidade4_495_32_,
	turmacompo34_.id_categoria_componente as id29_495_32_,
	turmacompo34_.categoria_esportiva as categoria5_495_32_,
	turmacompo34_.codigo as codigo495_32_,
	turmacompo34_.codigo_rh as codigo7_495_32_,
	turmacompo34_.data_alteracao as data8_495_32_,
	turmacompo34_.data_cadastro as data9_495_32_,
	turmacompo34_.data_consolidacao as data10_495_32_,
	turmacompo34_.data_fim as data11_495_32_,
	turmacompo34_.data_inicio as data12_495_32_,
	turmacompo34_.descricao_horario as descricao13_495_32_,
	turmacompo34_.id_disciplina as id30_495_32_,
	turmacompo34_.execucao as execucao495_32_,
	turmacompo34_.extra as extra495_32_,
	turmacompo34_.grupo as grupo495_32_,
	turmacompo34_.local as local495_32_,
	turmacompo34_.id_modulo as id31_495_32_,
	turmacompo34_.motivo_exclusao as motivo18_495_32_,
	turmacompo34_.nome_professor as nome19_495_32_,
	turmacompo34_.numero_estudantes as numero20_495_32_,
	turmacompo34_.observacao as observacao495_32_,
	turmacompo34_.ordem as ordem495_32_,
	turmacompo34_.periodo as periodo495_32_,
	turmacompo34_.processada as processada495_32_,
	turmacompo34_.processada_rematricula as processada25_495_32_,
	turmacompo34_.execucao_parcial_qtd_unidades as execucao26_495_32_,
	turmacompo34_.id_registro_atualizacao as id37_495_32_,
	turmacompo34_.id_registro_cadastro as id34_495_32_,
	turmacompo34_.id_situacao_turma as id35_495_32_,
	turmacompo34_.tipo as tipo495_32_,
	turmacompo34_.total_matriculados as total28_495_32_,
	turmacompo34_.id_turma_agrupadora as id32_495_32_,
	turmacompo34_.id_turma_serie as id36_495_32_,
	turmacompo34_.id_usuario_consolidacao as id33_495_32_
from
	basico.turma_serie this_
left outer join escola.escola escola2_ on
	this_.id_escola = escola2_.id_escola
left outer join escola.bairro_escola bairroesco3_ on
	escola2_.id_bairro_escola = bairroesco3_.id_bairro_escola
left outer join comum.municipio municipio4_ on
	bairroesco3_.id_municipio = municipio4_.id_municipio
left outer join comum.unidade_federativa unidadefed5_ on
	municipio4_.id_unidade_federativa = unidadefed5_.id_unidade_federativa
left outer join comum.municipio municipio6_ on
	unidadefed5_.id_capital = municipio6_.id_municipio
left outer join comum.pais pais7_ on
	unidadefed5_.id_pais = pais7_.id_pais
left outer join comum.conta_bancaria contabanca8_ on
	escola2_.id_conta = contabanca8_.id_conta_bancaria
left outer join comum.banco banco9_ on
	contabanca8_.id_banco = banco9_.id_banco
left outer join escola.dependencia_administrativa_escola dependenci10_ on
	escola2_.id_dependencia_administrativa = dependenci10_.id_dependencia_administrativa_escola
left outer join comum.unidade unidade11_ on
	escola2_.id_drae = unidade11_.id_unidade
left outer join escola.localizacao_zona localizaca12_ on
	escola2_.id_localizacao_zona = localizaca12_.id_localizacao_zona
left outer join comum.municipio municipio13_ on
	escola2_.id_municipio = municipio13_.id_municipio
left outer join comum.unidade unidade14_ on
	escola2_.id_regional_ensino = unidade14_.id_unidade
left outer join escola.situacao_funcionamento situacaofu15_ on
	escola2_.id_situacao_funcionamento = situacaofu15_.id_situacao_funcionamento
left outer join escola.tipo_unidade_escolar tipounidad16_ on
	escola2_.id_tipo_unidade_escolar = tipounidad16_.id_tipo_unidade_escolar
left outer join comum.unidade unidade17_ on
	escola2_.id_unidade_escola = unidade17_.id_unidade
left outer join comum.zona_municipal zonamunici18_ on
	escola2_.id_zona_municipal = zonamunici18_.id_zona_municipal
left outer join comum.municipio municipio19_ on
	zonamunici18_.id_municipio = municipio19_.id_municipio
left outer join basico.modulo modulo20_ on
	this_.id_modulo_inicial = modulo20_.id_modulo
left outer join basico.serie serie21_ on
	this_.id_serie = serie21_.id_serie
left outer join basico.etapa_ensino etapaensin22_ on
	serie21_.id_etapa_ensino = etapaensin22_.id_etapa_ensino
left outer join basico.forma_organizacao_etapa formaorgan23_ on
	etapaensin22_.id_forma_organizacao_Etapa = formaorgan23_.id_forma_organizacao_etapa
left outer join comum.unidade unidade24_ on
	formaorgan23_.id_unidade = unidade24_.id_unidade
left outer join basico.local_oferta localofert25_ on
	etapaensin22_.id_local_oferta = localofert25_.id_local_oferta
left outer join basico.modalidade_ensino_basico modalidade26_ on
	etapaensin22_.id_modalidade = modalidade26_.id_modalidade_ensino_basico
left outer join comum.unidade unidade27_ on
	modalidade26_.id_unidade = unidade27_.id_unidade
left outer join basico.nivel_etapa_ensino niveletapa28_ on
	etapaensin22_.id_nivel_etapa = niveletapa28_.id_nivel_etapa_ensino
left outer join comum.unidade unidade29_ on
	niveletapa28_.id_unidade = unidade29_.id_unidade
left outer join basico.situacao_etapa_ensino situacaoet30_ on
	etapaensin22_.id_situacao = situacaoet30_.id_situacao
left outer join comum.unidade unidade31_ on
	etapaensin22_.id_unidade = unidade31_.id_unidade
left outer join comum.unidade unidade32_ on
	serie21_.id_unidade = unidade32_.id_unidade
left outer join basico.tipo_turma_serie tipoturmas33_ on
	this_.id_tipo_turma_serie = tipoturmas33_.id_tipo_turma_serie
left outer join ensino.turma turmacompo34_ on
	this_.id_turma_serie = turmacompo34_.id_turma_serie
	and ( turmacompo34_.id_situacao_turma <> 4)
left outer join basico.categoria_componente categoriac35_ on
	turmacompo34_.id_categoria_componente = categoriac35_.id_categoria_componente
left outer join ensino.componente_curricular componente36_ on
	turmacompo34_.id_disciplina = componente36_.id_componente_curricular
left outer join ensino_infantil.area_conhecimento areaconhec37_ on
	componente36_.id_area_conhecimento = areaconhec37_.id_area_conhecimento
left outer join ensino.tipo_componente_curricular tipocompon38_ on
	componente36_.id_tipo_componente = tipocompon38_.id_tipo_disciplina
left outer join ensino.docente_turma docentestu39_ on
	turmacompo34_.id_turma = docentestu39_.id_turma
left outer join rh.afastamento afastament40_ on
	docentestu39_.id_afastamento = afastament40_.id_afastamento
left outer join rh.servidor servidor41_ on
	afastament40_.id_servidor = servidor41_.id_servidor
left outer join rh.cargo cargo42_ on
	servidor41_.id_cargo = cargo42_.id_cargo
left outer join rh.CATEGORIA categoria43_ on
	servidor41_.id_categoria = categoria43_.ID_CATEGORIA
left outer join rh.classe_servidor classeserv44_ on
	servidor41_.id_classe_servidor = classeserv44_.id_classe_servidor
left outer join rh.FORMACAO formacao45_ on
	servidor41_.id_formacao = formacao45_.ID_FORMACAO
left outer join pessoas.instituicao instituica46_ on
	servidor41_.id_instituicao = instituica46_.id_instituicao
left outer join comum.pessoa pessoa47_ on
	servidor41_.id_pessoa = pessoa47_.id_pessoa
left outer join COMUM.REGISTRO_ENTRADA registroen48_ on
	servidor41_.id_entrada = registroen48_.ID_ENTRADA
left outer join rh.tipo_contrato_servidor tipocontra49_ on
	servidor41_.id_tipo_contrato_servidor = tipocontra49_.id_tipo_contrato_servidor
left outer join comum.unidade unidade50_ on
	servidor41_.id_unidade = unidade50_.id_unidade
left outer join comum.unidade unidade51_ on
	servidor41_.id_unidade_transferida = unidade51_.id_unidade
left outer join rh.tipo_afastamento tipoafasta52_ on
	afastament40_.id_tipo = tipoafasta52_.id_tipo_afastamento
left outer join comum.unidade unidade53_ on
	afastament40_.id_unidade = unidade53_.id_unidade
left outer join ensino.atividade_ape atividadea54_ on
	docentestu39_.id_atividade_ape = atividadea54_.id_atividade_ape
left outer join rh.servidor servidor55_ on
	docentestu39_.id_docente = servidor55_.id_servidor
left outer join ensino.docente_externo docenteext56_ on
	docentestu39_.id_docente_externo = docenteext56_.id_docente_externo
left outer join rh.FORMACAO formacao57_ on
	docenteext56_.id_formacao = formacao57_.ID_FORMACAO
left outer join comum.pessoa pessoa58_ on
	docenteext56_.id_pessoa = pessoa58_.id_pessoa
left outer join escola.bairro_escola bairroesco59_ on
	pessoa58_.id_bairro_endereco = bairroesco59_.id_bairro_escola
left outer join pessoas.escolaridade escolarida60_ on
	pessoa58_.id_escolaridade = escolarida60_.id_escolaridade
left outer join comum.estado_civil estadocivi61_ on
	pessoa58_.id_estado_civil = estadocivi61_.id_estado_civil
left outer join comum.unidade_federativa unidadefed62_ on
	pessoa58_.id_unidade_federativa_identidade = unidadefed62_.id_unidade_federativa
left outer join matricula.tipo_documento_militar tipodocume63_ on
	pessoa58_.id_tipo_documento_militar = tipodocume63_.id_tipo_documento_militar
left outer join matricula.tipo_militar tipomilita64_ on
	pessoa58_.id_tipo_militar = tipomilita64_.id_tipo_militar
left outer join comum.tipo_raca tiporaca65_ on
	pessoa58_.id_raca = tiporaca65_.id_tipo_raca
left outer join comum.unidade_federativa unidadefed66_ on
	pessoa58_.id_uf_naturalidade = unidadefed66_.id_unidade_federativa
left outer join rh.servidor servidor67_ on
	docenteext56_.id_servidor = servidor67_.id_servidor
left outer join ensino.tipo_docente_externo tipodocent68_ on
	docenteext56_.id_tipo_docente_externo = tipodocent68_.id_tipo_docente_externo
left outer join ensino.solicitacao_carga_horaria_suplementar solicitaca69_ on
	docentestu39_.id_docente_turma = solicitaca69_.id_docente_turma
left outer join ensino.status_solicitacao_carga_horaria_suplementar statussoli70_ on
	solicitaca69_.id_status_solicitacao_carga_horaria_suplementar = statussoli70_.id_status_solicitacao_carga_horaria_suplementar
left outer join basico.modulo modulo71_ on
	turmacompo34_.id_modulo = modulo71_.id_modulo
left outer join ensino.situacao_turma situacaotu72_ on
	turmacompo34_.id_situacao_turma = situacaotu72_.id_situacao_turma
left outer join ensino.turma turmacompo73_ on
	turmacompo34_.id_turma_agrupadora = turmacompo73_.id_turma
left outer join comum.usuario usuario74_ on
	turmacompo73_.id_usuario_consolidacao = usuario74_.id_usuario
left outer join comum.pessoa pessoa75_ on
	usuario74_.id_pessoa = pessoa75_.id_pessoa
left outer join comum.tipo_usuario tipousuari76_ on
	usuario74_.tipo = tipousuari76_.id
left outer join comum.unidade unidade77_ on
	usuario74_.id_unidade = unidade77_.id_unidade
left outer join basico.turma_serie turmaserie78_ on
	this_.id_turma_serie_agrupadora = turmaserie78_.id_turma_serie
left outer join ensino.turno turno79_ on
	turmaserie78_.id_turno = turno79_.id_turno
where
	this_.id_turma_serie = 52815489

