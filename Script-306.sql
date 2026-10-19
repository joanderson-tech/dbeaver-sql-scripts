select
	this_.id_emissao as id1_1305_0_,
	this_.codigo_seguranca as codigo2_1305_0_,
	this_.auxiliar as auxiliar1305_0_,
	this_.data_emissao as data4_1305_0_,
	this_.hora_emissao as hora5_1305_0_,
	this_.identificador as identifi6_1305_0_,
	this_.numero_documento as numero7_1305_0_,
	this_.prng as prng1305_0_,
	this_.sub_tipo_documento as sub9_1305_0_,
	this_.tipo_documento as tipo10_1305_0_
from
	comum.emissao_documento_autenticado this_
where this_.codigo_seguranca ='964fcf19df'
;

select
	this_.id_emissao as id1_1305_0_,
	this_.codigo_seguranca as codigo2_1305_0_,
	this_.auxiliar as auxiliar1305_0_,
	this_.data_emissao as data4_1305_0_,
	this_.hora_emissao as hora5_1305_0_,
	this_.identificador as identifi6_1305_0_,
	this_.numero_documento as numero7_1305_0_,
	this_.prng as prng1305_0_,
	this_.sub_tipo_documento as sub9_1305_0_,
	this_.tipo_documento as tipo10_1305_0_
from
	comum.emissao_documento_autenticado this_
where
	this_.identificador ='202330002886'
	and this_.codigo_seguranca ='487661c41b'
;	



select
	this_.id_emissao as id1_1305_0_,
	this_.codigo_seguranca as codigo2_1305_0_,
	this_.auxiliar as auxiliar1305_0_,
	this_.data_emissao as data4_1305_0_,
	this_.hora_emissao as hora5_1305_0_,
	this_.identificador as identifi6_1305_0_,
	this_.numero_documento as numero7_1305_0_,
	this_.prng as prng1305_0_,
	this_.sub_tipo_documento as sub9_1305_0_,
	this_.tipo_documento as tipo10_1305_0_
from
	comum.emissao_documento_autenticado this_
where this_.codigo_seguranca ='d8c6fdf8e6'
	and this_.data_emissao ='2024-11-11'
	and this_.tipo_documento = 15;

select
	matriculae0_.id_matricula_discente_serie as id1_681_0_,
	turmaserie1_.id_turma_serie as id1_869_1_,
	escolaetap2_.id_escola_etapa_ensino_serie as id1_773_2_,
	escola4_.id_escola as id1_769_3_,
	serie5_.id_serie as id1_686_4_,
	matriculae0_.ano_calendario as ano2_681_0_,
	matriculae0_.avaliacao as avaliacao681_0_,
	matriculae0_.id_curriculo_medio as id22_681_0_,
	matriculae0_.data_atualizacao as data4_681_0_,
	matriculae0_.data_cadastro as data5_681_0_,
	matriculae0_.data_consolidacao as data6_681_0_,
	matriculae0_.data_matricula_turma as data7_681_0_,
	matriculae0_.data_reabertura_ficha as data8_681_0_,
	matriculae0_.dependencia as dependen9_681_0_,
	matriculae0_.id_estudante as id24_681_0_,
	matriculae0_.frequencia as frequencia681_0_,
	matriculae0_.id_vaga_serie as id11_681_0_,
	matriculae0_.num_chamada as num12_681_0_,
	matriculae0_.numero_faltas as numero13_681_0_,
	matriculae0_.periodo as periodo681_0_,
	matriculae0_.id_registro_atualizacao as id16_681_0_,
	matriculae0_.id_registro_entrada as id19_681_0_,
	matriculae0_.id_serie_escola as id21_681_0_,
	matriculae0_.id_serie_multisseriado as id26_681_0_,
	matriculae0_.id_situacao_matricula_serie as id23_681_0_,
	matriculae0_.status_censo as status15_681_0_,
	matriculae0_.id_turma_serie as id25_681_0_,
	matriculae0_.id_turma_serie_multisseriado as id20_681_0_,
	matriculae0_.id_turno as id18_681_0_,
	matriculae0_.id_usuario_consolidacao as id17_681_0_,
	turmaserie1_.ano as ano869_1_,
	turmaserie1_.atividade_complementar as atividade3_869_1_,
	turmaserie1_.ativo as ativo869_1_,
	turmaserie1_.capacidade_aluno as capacidade5_869_1_,
	turmaserie1_.capacidade_sala_aula as capacidade6_869_1_,
	turmaserie1_.codigo_rh as codigo7_869_1_,
	turmaserie1_.id_curriculo_medio as id27_869_1_,
	turmaserie1_.data_cadastro as data8_869_1_,
	turmaserie1_.data_fim as data9_869_1_,
	turmaserie1_.data_inicio as data10_869_1_,
	turmaserie1_.descricao_horario as descricao11_869_1_,
	turmaserie1_.id_escola as id34_869_1_,
	turmaserie1_.id_proxima_turma as id12_869_1_,
	turmaserie1_.identificador as identif13_869_1_,
	turmaserie1_.justificativa_indeferimento as justifi14_869_1_,
	turmaserie1_.justificativa_qtd_alunos as justifi15_869_1_,
	turmaserie1_.justificativa_regra_nao as justifi16_869_1_,
	turmaserie1_.id_modulo_inicial as id29_869_1_,
	turmaserie1_.nome as nome869_1_,
	turmaserie1_.nome_auxiliar as nome18_869_1_,
	turmaserie1_.numero_estudantes as numero19_869_1_,
	turmaserie1_.periodo as periodo869_1_,
	turmaserie1_.permite_disciplina_contraturno as permite21_869_1_,
	turmaserie1_.progressao_parcial as progressao22_869_1_,
	turmaserie1_.id_registro_entrada as id33_869_1_,
	turmaserie1_.regra_nao as regra23_869_1_,
	turmaserie1_.id_serie as id31_869_1_,
	turmaserie1_.tipo_diario as tipo24_869_1_,
	turmaserie1_.tipo_importacao as tipo25_869_1_,
	turmaserie1_.id_tipo_turma_serie as id28_869_1_,
	turmaserie1_.id_turma_serie_agrupadora as id26_869_1_,
	turmaserie1_.id_turno as id32_869_1_,
	turmaserie1_.id_unidade as id30_869_1_,
	escolaetap2_.ativo as ativo773_2_,
	escolaetap2_.codigo_rh as codigo3_773_2_,
	escolaetap2_.item_remanejamento_destino as item4_773_2_,
	escolaetap2_.id_escola as id7_773_2_,
	escolaetap2_.item_remanejamento_origem as item5_773_2_,
	escolaetap2_.id_registro_entrada as id8_773_2_,
	escolaetap2_.id_serie as id6_773_2_,
	escola4_.ato_autorizacao_doe_data as ato2_769_3_,
	escola4_.ato_autorizacao_doe_numero as ato3_769_3_,
	escola4_.ato_autorizacao_data as ato4_769_3_,
	escola4_.ato_autorizacao_descricao as ato5_769_3_,
	escola4_.ato_criacao_doe_data as ato6_769_3_,
	escola4_.ato_criacao_doe_numero as ato7_769_3_,
	escola4_.ato_criacao_data as ato8_769_3_,
	escola4_.ato_criacao_descricao as ato9_769_3_,
	escola4_.ato_reconhecimento_doe_data as ato10_769_3_,
	escola4_.ato_reconhecimento_doe_numero as ato11_769_3_,
	escola4_.ato_reconhecimento_data as ato12_769_3_,
	escola4_.ato_reconhecimento_descricao as ato13_769_3_,
	escola4_.id_bairro_escola as id37_769_3_,
	escola4_.cep as cep769_3_,
	escola4_.cnpj as cnpj769_3_,
	escola4_.codigo_acao as codigo16_769_3_,
	escola4_.codigo_cadastro_escolar as codigo17_769_3_,
	escola4_.codigo_inep as codigo18_769_3_,
	escola4_.codigo_ies as codigo19_769_3_,
	escola4_.codigo_legado as codigo20_769_3_,
	escola4_.id_conta as id34_769_3_,
	escola4_.data_validacao_geocode as data21_769_3_,
	escola4_.id_dependencia_administrativa as id36_769_3_,
	escola4_.distrito as distrito769_3_,
	escola4_.id_drae as id44_769_3_,
	escola4_.email as email769_3_,
	escola4_.endereco as endereco769_3_,
	escola4_.escola_rh as escola25_769_3_,
	escola4_.fax as fax769_3_,
	escola4_.geocode as geocode769_3_,
	escola4_.instituicao_ensino_superior as institu28_769_3_,
	escola4_.id_localizacao_zona as id41_769_3_,
	escola4_.id_municipio as id42_769_3_,
	escola4_.nome as nome769_3_,
	escola4_.numero as numero769_3_,
	escola4_.id_regional_ensino as id39_769_3_,
	escola4_.senhaTransferencia as senhaTr31_769_3_,
	escola4_.sigla as sigla769_3_,
	escola4_.id_situacao_funcionamento as id38_769_3_,
	escola4_.telefone as telefone769_3_,
	escola4_.id_tipo_unidade_escolar as id43_769_3_,
	escola4_.id_unidade_escola as id45_769_3_,
	escola4_.id_registro_validacao_geocode as id40_769_3_,
	escola4_.id_zona_municipal as id35_769_3_,
	serie5_.ativo as ativo686_4_,
	serie5_.bloquear_oferta_vagas as bloquear3_686_4_,
	serie5_.capacidade_excesso as capacidade4_686_4_,
	serie5_.capacidade_maxima as capacidade5_686_4_,
	serie5_.capacidade_minima as capacidade6_686_4_,
	serie5_.cod_censo as cod7_686_4_,
	serie5_.codigo_rh as codigo8_686_4_,
	serie5_.correcao_fluxo as correcao9_686_4_,
	serie5_.data_atualizacao as data10_686_4_,
	serie5_.data_cadastro as data11_686_4_,
	serie5_.descricao as descricao686_4_,
	serie5_.emite_certificado as emite13_686_4_,
	serie5_.id_etapa_ensino as id29_686_4_,
	serie5_.exige_carga_horaria_por_componente as exige14_686_4_,
	serie5_.final_etapa as final15_686_4_,
	serie5_.multisseriada as multiss16_686_4_,
	serie5_. nao_contabiliza_turma as column17_686_4_,
	serie5_.numero as numero686_4_,
	serie5_.permite_avanco_estudo as permite19_686_4_,
	serie5_.permite_gerenciar_turma_sem_horario as permite20_686_4_,
	serie5_.permite_participar_atv_esportiva as permite21_686_4_,
	serie5_.permite_participar_sol_cadastro_reserva as permite22_686_4_,
	serie5_.id_proxima_serie as id28_686_4_,
	serie5_.id_registro_atualizacao as id26_686_4_,
	serie5_.id_registro_entrada as id30_686_4_,
	serie5_.sigla as sigla686_4_,
	serie5_.tipo_diario as tipo24_686_4_,
	serie5_.id_unidade as id27_686_4_,
	serie5_. verifica_frequencia_anos_anteriores as column25_686_4_
from
	basico.matricula_estudante_serie matriculae0_
left outer join basico.turma_serie turmaserie1_ on
	matriculae0_.id_turma_serie = turmaserie1_.id_turma_serie
inner join escola.escola_etapa_ensino_serie escolaetap2_ on
	matriculae0_.id_serie_escola = escolaetap2_.id_escola_etapa_ensino_serie
inner join escola.escola escola4_ on
	escolaetap2_.id_escola = escola4_.id_escola
left outer join basico.serie serie5_ on
	matriculae0_.id_serie_multisseriado = serie5_.id_serie
where
	matriculae0_.id_estudante =?
	and (matriculae0_.id_situacao_matricula_serie in (1 , 2 , 3 , 4 , 8 , 7 , 10 , 5))
order by
	matriculae0_.ano_calendario desc

