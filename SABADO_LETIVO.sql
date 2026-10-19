
begin;
-- Updated Rows	4232
with dias_agg (dia) as (values
	('2025-03-15'),
	('2025-04-05'),
	('2025-04-26'),
	('2025-05-10'),
	('2025-06-07'),
	('2025-08-09'),
	('2025-09-13'),
	('2025-11-08')),
turmas_agg as (
	select distinct	 
		coalesce(t.id_turma_agrupadora, t.id_turma) as id_turma,
		d.dia
	from dias_agg d, ensino.turma t
	where t.id_situacao_turma not in (4,9) 
	and t.ano = 2025
	and coalesce(t.id_turma_agrupadora, t.id_turma) not in (
		select 
			ae.id_turma 
		from ava.aula_extra ae
		where ae.id_turma = coalesce(t.id_turma_agrupadora, t.id_turma) 
		and ae.data_aula = d.dia::date
	)
)
insert into ava.aula_extra (id, id_turma, data_aula, criado_em, numero_aulas, tipo, descricao) (
	select
		nextval('hibernate_sequence') as id,
		t.id_turma,
		t.dia::date,
		now()::timestamp as criado_em,
		1 as numero_aulas,
		3 as tipo,
		'Sábado Letivo' as descricao
	from turmas_agg t);

--solução para turmas com professor adjunto - Updated Rows	72
WITH datas (dia, descricao) AS (VALUES
  	('2025-03-15', 'Sábado Letivo'),
	('2025-04-05', 'Sábado Letivo'),
	('2025-04-26', 'Sábado Letivo'),
	('2025-05-10', 'Sábado Letivo'),
	('2025-06-07', 'Sábado Letivo'),
	('2025-08-09', 'Sábado Letivo'),
	('2025-09-13', 'Sábado Letivo'),
	('2025-11-08', 'Sábado Letivo'))
SELECT distinct 'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'|| t.id_turma ||','''|| d.dia || ''','''||current_date||''',1,3, '''||d.descricao||''');'
	FROM ensino.turma t
	join basico.turma_serie ts on t.id_turma_serie  = ts.id_turma_serie 
	join basico.curriculo_basico cb  on cb.id_curriculo_basico  = ts.id_curriculo_medio 
	join ensino.docente_turma dt on dt.id_turma  = t.id_turma 
	join basico.curriculo_basico_componente cbc on cbc.id_curriculo_basico  = ts.id_curriculo_medio 
	and cbc.permite_alocacao_adjunto and cbc.id_componente_curricular = t.id_disciplina, datas d
	WHERE dt.ativo and not dt.finalizada 
	and (now() between dt.data_inicio and dt.data_fim ) and t.id_turma_agrupadora IS NOT NULL
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date);

--Backup
 WITH dias_agg (dia) AS (
VALUES
	('2025-03-15'),
	('2025-04-05'),
	('2025-04-26'),
	('2025-05-10'),
	('2025-06-07'),
	('2025-08-09'),
	('2025-09-13'),
	('2025-11-08')),
registros as (
select id
from ava.aula_extra ae
where ae.criado_em::date = now()::date
and ae.data_aula in (select dia::date from dias_agg)
)
delete from ava.aula_extra 
where id in (select id from registros);


commit;





:
insert into basico.turma_serie (id_ambiente_unidade_escolar,
	ano,
	atividade_complementar,
	ativo,
	capacidade_aluno,
	capacidade_sala_aula,
	codigo_rh,
	id_curriculo_medio,
	data_cadastro,
	data_fim,
	data_inicio,
	descricao_horario,
	id_escola,
	id_proxima_turma,
	identificador,
	justificativa_indeferimento,
	justificativa_qtd_alunos,
	justificativa_regra_nao,
	id_modulo_inicial,
	nome,
	nome_auxiliar,
	numero_estudantes,
	periodo,
	permite_disciplina_contraturno,
	progressao_parcial,
	id_registro_entrada,
	regra_nao,
	id_serie,
	tipo_diario,
	tipo_importacao,
	id_tipo_turma_serie,
	id_turma_serie_agrupadora,
	id_turno,
	id_unidade,
	id_turma_serie)
values (?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?)


select
	this_.id_curriculo_basico as id1_886_32_,
	this_.ano_entrada_vigor as ano2_886_32_,
	this_.ativo as ativo886_32_,
	this_.carga_horaria as carga4_886_32_,
	this_.codigo as codigo886_32_,
	this_.data_alteracao as data6_886_32_,
	this_.data_cadastro as data7_886_32_,
	this_.diario_diversificado_reprova_por_falta as diario8_886_32_,
	this_.id_escola as id16_886_32_,
	this_.multisseriado as multisse9_886_32_,
	this_.permite_parecer_descritivo as permite10_886_32_,
	this_.possui_parte_diversificada as possui11_886_32_,
	this_.id_registro_atualizacao as id18_886_32_,
	this_.id_registro_entrada as id19_886_32_,
	this_.id_serie as id17_886_32_,
	this_.tipo_diario as tipo12_886_32_,
	this_.tipo_diario_diversificado as tipo13_886_32_,
	this_.id_turno as id15_886_32_,
	this_.id_unidade as id14_886_32_,
	escola2_.id_escola as id1_985_0_,
	escola2_.ato_autorizacao_doe_data as ato2_985_0_,
	escola2_.ato_autorizacao_doe_numero as ato3_985_0_,
	escola2_.ato_autorizacao_data as ato4_985_0_,
	escola2_.ato_autorizacao_descricao as ato5_985_0_,
	escola2_.ato_criacao_doe_data as ato6_985_0_,
	escola2_.ato_criacao_doe_numero as ato7_985_0_,
	escola2_.ato_criacao_data as ato8_985_0_,
	escola2_.ato_criacao_descricao as ato9_985_0_,
	escola2_.ato_reconhecimento_doe_data as ato10_985_0_,
	escola2_.ato_reconhecimento_doe_numero as ato11_985_0_,
	escola2_.ato_reconhecimento_data as ato12_985_0_,
	escola2_.ato_reconhecimento_descricao as ato13_985_0_,
	escola2_.id_bairro_escola as id45_985_0_,
	escola2_.cep as cep985_0_,
	escola2_.cnpj as cnpj985_0_,
	escola2_.codigo_acao as codigo16_985_0_,
	escola2_.codigo_cadastro_escolar as codigo17_985_0_,
	escola2_.codigo_inep as codigo18_985_0_,
	escola2_.codigo_ies as codigo19_985_0_,
	escola2_.codigo_legado as codigo20_985_0_,
	escola2_.id_conta as id42_985_0_,
	escola2_.data_validacao_geocode as data21_985_0_,
	escola2_.id_dependencia_administrativa as id40_985_0_,
	escola2_.distrito as distrito985_0_,
	escola2_.id_drae as id43_985_0_,
	escola2_.email as email985_0_,
	escola2_.endereco as endereco985_0_,
	escola2_.escola_rh as escola25_985_0_,
	escola2_.fax as fax985_0_,
	escola2_.geocode as geocode985_0_,
	escola2_.habilita_ambientes as habilita28_985_0_,
	escola2_.id_unidade_anexo as id29_985_0_,
	escola2_.instituicao_ensino_superior as institu30_985_0_,
	escola2_.id_localizacao_zona as id44_985_0_,
	escola2_.id_municipio as id39_985_0_,
	escola2_.nome as nome985_0_,
	escola2_.numero as numero985_0_,
	escola2_.id_regional_ensino as id47_985_0_,
	escola2_.senhaTransferencia as senhaTr33_985_0_,
	escola2_.sigla as sigla985_0_,
	escola2_.id_situacao_funcionamento as id46_985_0_,
	escola2_.telefone as telefone985_0_,
	escola2_.id_tipo_unidade_escolar as id48_985_0_,
	escola2_.unidade_anexo as unidade36_985_0_,
	escola2_.id_unidade_escola as id38_985_0_,
	escola2_.id_registro_validacao_geocode as id37_985_0_,
	escola2_.id_zona_municipal as id41_985_0_,
	bairroesco3_.id_bairro_escola as id1_982_1_,
	bairroesco3_.ativo as ativo982_1_,
	bairroesco3_.id_municipio as id4_982_1_,
	bairroesco3_.denominacao as denomina3_982_1_,
	municipio4_.id_municipio as id1_543_2_,
	municipio4_.ativo as ativo543_2_,
	municipio4_.codigo as codigo543_2_,
	municipio4_.codigo_acao as codigo4_543_2_,
	municipio4_.nome as nome543_2_,
	municipio4_.id_unidade_federativa as id6_543_2_,
	unidadefed5_.id_unidade_federativa as id1_578_3_,
	unidadefed5_.ativo as ativo578_3_,
	unidadefed5_.id_capital as id6_578_3_,
	unidadefed5_.descricao as descricao578_3_,
	unidadefed5_.id_pais as id5_578_3_,
	unidadefed5_.sigla as sigla578_3_,
	municipio6_.id_municipio as id1_543_4_,
	municipio6_.ativo as ativo543_4_,
	municipio6_.codigo as codigo543_4_,
	municipio6_.codigo_acao as codigo4_543_4_,
	municipio6_.nome as nome543_4_,
	municipio6_.id_unidade_federativa as id6_543_4_,
	pais7_.id_pais as id1_544_5_,
	pais7_.nacionalidade as nacional2_544_5_,
	pais7_.nome as nome544_5_,
	contabanca8_.id_conta_bancaria as id1_536_6_,
	contabanca8_.agencia as agencia536_6_,
	contabanca8_.id_banco as id5_536_6_,
	contabanca8_.numero as numero536_6_,
	contabanca8_.variacao as variacao536_6_,
	banco9_.id_banco as id1_533_7_,
	banco9_.ativo as ativo533_7_,
	banco9_.codigo as codigo533_7_,
	banco9_.denominacao as denomina4_533_7_,
	banco9_.publicado as publicado533_7_,
	dependenci10_.id_dependencia_administrativa_escola as id1_984_8_,
	dependenci10_.denominacao as denomina2_984_8_,
	unidade11_.id_unidade as id1_579_9_,
	unidade11_.ativo as ativo579_9_,
	unidade11_.bairro as bairro579_9_,
	unidade11_.cep as cep579_9_,
	unidade11_.cnpj as cnpj579_9_,
	unidade11_.codigo_unidade as codigo6_579_9_,
	unidade11_.codigo_inep as codigo7_579_9_,
	unidade11_.codigo_rh as codigo8_579_9_,
	unidade11_.complemento as compleme9_579_9_,
	unidade11_.data_cadastro as data10_579_9_,
	unidade11_.distrito as distrito579_9_,
	unidade11_.email as email579_9_,
	unidade11_.endereco as endereco579_9_,
	unidade11_.fax as fax579_9_,
	unidade11_.hierarquia as hierarquia579_9_,
	unidade11_.id_municipio as id16_579_9_,
	unidade11_.instituicao_ensino_superior as institu17_579_9_,
	unidade11_.nome as nome579_9_,
	unidade11_.nome_ascii as nome19_579_9_,
	unidade11_.numero as numero579_9_,
	unidade11_.sigla as sigla579_9_,
	unidade11_.telefone as telefone579_9_,
	unidade11_.tipo as tipo579_9_,
	unidade11_.uf as uf579_9_,
	unidade11_.unidade_orcamentaria as unidade25_579_9_,
	unidade11_.id_responsavel as id26_579_9_,
	localizaca12_.id_localizacao_zona as id1_997_10_,
	localizaca12_.denominacao as denomina2_997_10_,
	municipio13_.id_municipio as id1_543_11_,
	municipio13_.ativo as ativo543_11_,
	municipio13_.codigo as codigo543_11_,
	municipio13_.codigo_acao as codigo4_543_11_,
	municipio13_.nome as nome543_11_,
	municipio13_.id_unidade_federativa as id6_543_11_,
	unidade14_.id_unidade as id1_579_12_,
	unidade14_.ativo as ativo579_12_,
	unidade14_.bairro as bairro579_12_,
	unidade14_.cep as cep579_12_,
	unidade14_.cnpj as cnpj579_12_,
	unidade14_.codigo_unidade as codigo6_579_12_,
	unidade14_.codigo_inep as codigo7_579_12_,
	unidade14_.codigo_rh as codigo8_579_12_,
	unidade14_.complemento as compleme9_579_12_,
	unidade14_.data_cadastro as data10_579_12_,
	unidade14_.distrito as distrito579_12_,
	unidade14_.email as email579_12_,
	unidade14_.endereco as endereco579_12_,
	unidade14_.fax as fax579_12_,
	unidade14_.hierarquia as hierarquia579_12_,
	unidade14_.id_municipio as id16_579_12_,
	unidade14_.instituicao_ensino_superior as institu17_579_12_,
	unidade14_.nome as nome579_12_,
	unidade14_.nome_ascii as nome19_579_12_,
	unidade14_.numero as numero579_12_,
	unidade14_.sigla as sigla579_12_,
	unidade14_.telefone as telefone579_12_,
	unidade14_.tipo as tipo579_12_,
	unidade14_.uf as uf579_12_,
	unidade14_.unidade_orcamentaria as unidade25_579_12_,
	unidade14_.id_responsavel as id26_579_12_,
	situacaofu15_.id_situacao_funcionamento as id1_1001_13_,
	situacaofu15_.denominacao as denomina2_1001_13_,
	tipounidad16_.id_tipo_unidade_escolar as id1_1015_14_,
	tipounidad16_.descricao as descricao1015_14_,
	unidade17_.id_unidade as id1_579_15_,
	unidade17_.ativo as ativo579_15_,
	unidade17_.bairro as bairro579_15_,
	unidade17_.cep as cep579_15_,
	unidade17_.cnpj as cnpj579_15_,
	unidade17_.codigo_unidade as codigo6_579_15_,
	unidade17_.codigo_inep as codigo7_579_15_,
	unidade17_.codigo_rh as codigo8_579_15_,
	unidade17_.complemento as compleme9_579_15_,
	unidade17_.data_cadastro as data10_579_15_,
	unidade17_.distrito as distrito579_15_,
	unidade17_.email as email579_15_,
	unidade17_.endereco as endereco579_15_,
	unidade17_.fax as fax579_15_,
	unidade17_.hierarquia as hierarquia579_15_,
	unidade17_.id_municipio as id16_579_15_,
	unidade17_.instituicao_ensino_superior as institu17_579_15_,
	unidade17_.nome as nome579_15_,
	unidade17_.nome_ascii as nome19_579_15_,
	unidade17_.numero as numero579_15_,
	unidade17_.sigla as sigla579_15_,
	unidade17_.telefone as telefone579_15_,
	unidade17_.tipo as tipo579_15_,
	unidade17_.uf as uf579_15_,
	unidade17_.unidade_orcamentaria as unidade25_579_15_,
	unidade17_.id_responsavel as id26_579_15_,
	zonamunici18_.id_zona_municipal as id1_565_16_,
	zonamunici18_.data_atualizacao as data2_565_16_,
	zonamunici18_.data_cadastro as data3_565_16_,
	zonamunici18_.descricao as descricao565_16_,
	zonamunici18_.id_municipio as id6_565_16_,
	zonamunici18_.id_registro_atualizacao as id7_565_16_,
	zonamunici18_.id_registro_cadastro as id5_565_16_,
	municipio19_.id_municipio as id1_543_17_,
	municipio19_.ativo as ativo543_17_,
	municipio19_.codigo as codigo543_17_,
	municipio19_.codigo_acao as codigo4_543_17_,
	municipio19_.nome as nome543_17_,
	municipio19_.id_unidade_federativa as id6_543_17_,
	serie20_.id_serie as id1_897_18_,
	serie20_.ativo as ativo897_18_,
	serie20_.bloquear_oferta_vagas as bloquear3_897_18_,
	serie20_.capacidade_excesso as capacidade4_897_18_,
	serie20_.capacidade_maxima as capacidade5_897_18_,
	serie20_.capacidade_minima as capacidade6_897_18_,
	serie20_.cod_censo as cod7_897_18_,
	serie20_.codigo_rh as codigo8_897_18_,
	serie20_.correcao_fluxo as correcao9_897_18_,
	serie20_.data_atualizacao as data10_897_18_,
	serie20_.data_cadastro as data11_897_18_,
	serie20_.descricao as descricao897_18_,
	serie20_.emite_certificado as emite13_897_18_,
	serie20_.id_etapa_ensino as id29_897_18_,
	serie20_.exige_carga_horaria_por_componente as exige14_897_18_,
	serie20_.final_etapa as final15_897_18_,
	serie20_.multisseriada as multiss16_897_18_,
	serie20_. nao_contabiliza_turma as column17_897_18_,
	serie20_.numero as numero897_18_,
	serie20_.permite_avanco_estudo as permite19_897_18_,
	serie20_.permite_gerenciar_turma_sem_horario as permite20_897_18_,
	serie20_.permite_participar_atv_esportiva as permite21_897_18_,
	serie20_.permite_participar_sol_cadastro_reserva as permite22_897_18_,
	serie20_.id_proxima_serie as id26_897_18_,
	serie20_.id_registro_atualizacao as id27_897_18_,
	serie20_.id_registro_entrada as id30_897_18_,
	serie20_.sigla as sigla897_18_,
	serie20_.tipo_diario as tipo24_897_18_,
	serie20_.id_unidade as id28_897_18_,
	serie20_. verifica_frequencia_anos_anteriores as column25_897_18_,
	etapaensin21_.id_etapa_ensino as id1_889_19_,
	etapaensin21_.ativo as ativo889_19_,
	etapaensin21_.bloquear_alteracao as bloquear3_889_19_,
	etapaensin21_.capacidade_excesso as capacidade4_889_19_,
	etapaensin21_.capacidade_maxima as capacidade5_889_19_,
	etapaensin21_.capacidade_maxima_correcao_fluxo as capacidade6_889_19_,
	etapaensin21_.capacidade_minima as capacidade7_889_19_,
	etapaensin21_.capacidade_minima_correcao_fluxo as capacidade8_889_19_,
	etapaensin21_.codigo_rh as codigo9_889_19_,
	etapaensin21_.data_atualizacao as data10_889_19_,
	etapaensin21_.denominacao as denomin11_889_19_,
	etapaensin21_.duracao_conclusao as duracao12_889_19_,
	etapaensin21_.id_forma_organizacao_Etapa as id22_889_19_,
	etapaensin21_.id_local_oferta as id21_889_19_,
	etapaensin21_.id_modalidade as id17_889_19_,
	etapaensin21_.id_nivel_etapa as id16_889_19_,
	etapaensin21_.periodicidade_etapa as periodi13_889_19_,
	etapaensin21_.permite_disciplina_contraturno as permite14_889_19_,
	etapaensin21_.id_registro_atualizacao as id18_889_19_,
	etapaensin21_.sigla as sigla889_19_,
	etapaensin21_.id_situacao as id19_889_19_,
	etapaensin21_.id_unidade as id20_889_19_,
	formaorgan22_.id_forma_organizacao_etapa as id1_890_20_,
	formaorgan22_.data_atualizacao as data2_890_20_,
	formaorgan22_.denominacao as denomina3_890_20_,
	formaorgan22_.gerencia_turmas_individuais as gerencia4_890_20_,
	formaorgan22_.id_registro_atualizacao as id5_890_20_,
	formaorgan22_.id_unidade as id6_890_20_,
	unidade23_.id_unidade as id1_579_21_,
	unidade23_.ativo as ativo579_21_,
	unidade23_.bairro as bairro579_21_,
	unidade23_.cep as cep579_21_,
	unidade23_.cnpj as cnpj579_21_,
	unidade23_.codigo_unidade as codigo6_579_21_,
	unidade23_.codigo_inep as codigo7_579_21_,
	unidade23_.codigo_rh as codigo8_579_21_,
	unidade23_.complemento as compleme9_579_21_,
	unidade23_.data_cadastro as data10_579_21_,
	unidade23_.distrito as distrito579_21_,
	unidade23_.email as email579_21_,
	unidade23_.endereco as endereco579_21_,
	unidade23_.fax as fax579_21_,
	unidade23_.hierarquia as hierarquia579_21_,
	unidade23_.id_municipio as id16_579_21_,
	unidade23_.instituicao_ensino_superior as institu17_579_21_,
	unidade23_.nome as nome579_21_,
	unidade23_.nome_ascii as nome19_579_21_,
	unidade23_.numero as numero579_21_,
	unidade23_.sigla as sigla579_21_,
	unidade23_.telefone as telefone579_21_,
	unidade23_.tipo as tipo579_21_,
	unidade23_.uf as uf579_21_,
	unidade23_.unidade_orcamentaria as unidade25_579_21_,
	unidade23_.id_responsavel as id26_579_21_,
	localofert24_.id_local_oferta as id1_919_22_,
	localofert24_.ativo as ativo919_22_,
	localofert24_.descricao as descricao919_22_,
	modalidade25_.id_modalidade_ensino_basico as id1_893_23_,
	modalidade25_.data_atualizacao as data2_893_23_,
	modalidade25_.denominacao as denomina3_893_23_,
	modalidade25_.id_registro_atualizacao as id4_893_23_,
	modalidade25_.id_unidade as id5_893_23_,
	unidade26_.id_unidade as id1_579_24_,
	unidade26_.ativo as ativo579_24_,
	unidade26_.bairro as bairro579_24_,
	unidade26_.cep as cep579_24_,
	unidade26_.cnpj as cnpj579_24_,
	unidade26_.codigo_unidade as codigo6_579_24_,
	unidade26_.codigo_inep as codigo7_579_24_,
	unidade26_.codigo_rh as codigo8_579_24_,
	unidade26_.complemento as compleme9_579_24_,
	unidade26_.data_cadastro as data10_579_24_,
	unidade26_.distrito as distrito579_24_,
	unidade26_.email as email579_24_,
	unidade26_.endereco as endereco579_24_,
	unidade26_.fax as fax579_24_,
	unidade26_.hierarquia as hierarquia579_24_,
	unidade26_.id_municipio as id16_579_24_,
	unidade26_.instituicao_ensino_superior as institu17_579_24_,
	unidade26_.nome as nome579_24_,
	unidade26_.nome_ascii as nome19_579_24_,
	unidade26_.numero as numero579_24_,
	unidade26_.sigla as sigla579_24_,
	unidade26_.telefone as telefone579_24_,
	unidade26_.tipo as tipo579_24_,
	unidade26_.uf as uf579_24_,
	unidade26_.unidade_orcamentaria as unidade25_579_24_,
	unidade26_.id_responsavel as id26_579_24_,
	niveletapa27_.id_nivel_etapa_ensino as id1_894_25_,
	niveletapa27_.ativo as ativo894_25_,
	niveletapa27_.data_atualizacao as data3_894_25_,
	niveletapa27_.denominacao as denomina4_894_25_,
	niveletapa27_.ensino_infantil as ensino5_894_25_,
	niveletapa27_.id_registro_atualizacao as id7_894_25_,
	niveletapa27_.sigla as sigla894_25_,
	niveletapa27_.id_unidade as id8_894_25_,
	unidade28_.id_unidade as id1_579_26_,
	unidade28_.ativo as ativo579_26_,
	unidade28_.bairro as bairro579_26_,
	unidade28_.cep as cep579_26_,
	unidade28_.cnpj as cnpj579_26_,
	unidade28_.codigo_unidade as codigo6_579_26_,
	unidade28_.codigo_inep as codigo7_579_26_,
	unidade28_.codigo_rh as codigo8_579_26_,
	unidade28_.complemento as compleme9_579_26_,
	unidade28_.data_cadastro as data10_579_26_,
	unidade28_.distrito as distrito579_26_,
	unidade28_.email as email579_26_,
	unidade28_.endereco as endereco579_26_,
	unidade28_.fax as fax579_26_,
	unidade28_.hierarquia as hierarquia579_26_,
	unidade28_.id_municipio as id16_579_26_,
	unidade28_.instituicao_ensino_superior as institu17_579_26_,
	unidade28_.nome as nome579_26_,
	unidade28_.nome_ascii as nome19_579_26_,
	unidade28_.numero as numero579_26_,
	unidade28_.sigla as sigla579_26_,
	unidade28_.telefone as telefone579_26_,
	unidade28_.tipo as tipo579_26_,
	unidade28_.uf as uf579_26_,
	unidade28_.unidade_orcamentaria as unidade25_579_26_,
	unidade28_.id_responsavel as id26_579_26_,
	situacaoet29_.id_situacao as id1_617_27_,
	situacaoet29_.descricao as descricao617_27_,
	unidade30_.id_unidade as id1_579_28_,
	unidade30_.ativo as ativo579_28_,
	unidade30_.bairro as bairro579_28_,
	unidade30_.cep as cep579_28_,
	unidade30_.cnpj as cnpj579_28_,
	unidade30_.codigo_unidade as codigo6_579_28_,
	unidade30_.codigo_inep as codigo7_579_28_,
	unidade30_.codigo_rh as codigo8_579_28_,
	unidade30_.complemento as compleme9_579_28_,
	unidade30_.data_cadastro as data10_579_28_,
	unidade30_.distrito as distrito579_28_,
	unidade30_.email as email579_28_,
	unidade30_.endereco as endereco579_28_,
	unidade30_.fax as fax579_28_,
	unidade30_.hierarquia as hierarquia579_28_,
	unidade30_.id_municipio as id16_579_28_,
	unidade30_.instituicao_ensino_superior as institu17_579_28_,
	unidade30_.nome as nome579_28_,
	unidade30_.nome_ascii as nome19_579_28_,
	unidade30_.numero as numero579_28_,
	unidade30_.sigla as sigla579_28_,
	unidade30_.telefone as telefone579_28_,
	unidade30_.tipo as tipo579_28_,
	unidade30_.uf as uf579_28_,
	unidade30_.unidade_orcamentaria as unidade25_579_28_,
	unidade30_.id_responsavel as id26_579_28_,
	unidade31_.id_unidade as id1_579_29_,
	unidade31_.ativo as ativo579_29_,
	unidade31_.bairro as bairro579_29_,
	unidade31_.cep as cep579_29_,
	unidade31_.cnpj as cnpj579_29_,
	unidade31_.codigo_unidade as codigo6_579_29_,
	unidade31_.codigo_inep as codigo7_579_29_,
	unidade31_.codigo_rh as codigo8_579_29_,
	unidade31_.complemento as compleme9_579_29_,
	unidade31_.data_cadastro as data10_579_29_,
	unidade31_.distrito as distrito579_29_,
	unidade31_.email as email579_29_,
	unidade31_.endereco as endereco579_29_,
	unidade31_.fax as fax579_29_,
	unidade31_.hierarquia as hierarquia579_29_,
	unidade31_.id_municipio as id16_579_29_,
	unidade31_.instituicao_ensino_superior as institu17_579_29_,
	unidade31_.nome as nome579_29_,
	unidade31_.nome_ascii as nome19_579_29_,
	unidade31_.numero as numero579_29_,
	unidade31_.sigla as sigla579_29_,
	unidade31_.telefone as telefone579_29_,
	unidade31_.tipo as tipo579_29_,
	unidade31_.uf as uf579_29_,
	unidade31_.unidade_orcamentaria as unidade25_579_29_,
	unidade31_.id_responsavel as id26_579_29_,
	turno32_.id_turno as id1_613_30_,
	turno32_.ativo as ativo613_30_,
	turno32_.codigo_rh as codigo3_613_30_,
	turno32_.descricao as descricao613_30_,
	turno32_.hora_fim as hora5_613_30_,
	turno32_.hora_inicio as hora6_613_30_,
	turno32_.ordem as ordem613_30_,
	turno32_.sigla as sigla613_30_,
	unidade33_.id_unidade as id1_579_31_,
	unidade33_.ativo as ativo579_31_,
	unidade33_.bairro as bairro579_31_,
	unidade33_.cep as cep579_31_,
	unidade33_.cnpj as cnpj579_31_,
	unidade33_.codigo_unidade as codigo6_579_31_,
	unidade33_.codigo_inep as codigo7_579_31_,
	unidade33_.codigo_rh as codigo8_579_31_,
	unidade33_.complemento as compleme9_579_31_,
	unidade33_.data_cadastro as data10_579_31_,
	unidade33_.distrito as distrito579_31_,
	unidade33_.email as email579_31_,
	unidade33_.endereco as endereco579_31_,
	unidade33_.fax as fax579_31_,
	unidade33_.hierarquia as hierarquia579_31_,
	unidade33_.id_municipio as id16_579_31_,
	unidade33_.instituicao_ensino_superior as institu17_579_31_,
	unidade33_.nome as nome579_31_,
	unidade33_.nome_ascii as nome19_579_31_,
	unidade33_.numero as numero579_31_,
	unidade33_.sigla as sigla579_31_,
	unidade33_.telefone as telefone579_31_,
	unidade33_.tipo as tipo579_31_,
	unidade33_.uf as uf579_31_,
	unidade33_.unidade_orcamentaria as unidade25_579_31_,
	unidade33_.id_responsavel as id26_579_31_
from
	basico.curriculo_basico this_
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
inner join basico.serie serie20_ on
	this_.id_serie = serie20_.id_serie
left outer join basico.etapa_ensino etapaensin21_ on
	serie20_.id_etapa_ensino = etapaensin21_.id_etapa_ensino
left outer join basico.forma_organizacao_etapa formaorgan22_ on
	etapaensin21_.id_forma_organizacao_Etapa = formaorgan22_.id_forma_organizacao_etapa
left outer join comum.unidade unidade23_ on
	formaorgan22_.id_unidade = unidade23_.id_unidade
left outer join basico.local_oferta localofert24_ on
	etapaensin21_.id_local_oferta = localofert24_.id_local_oferta
left outer join basico.modalidade_ensino_basico modalidade25_ on
	etapaensin21_.id_modalidade = modalidade25_.id_modalidade_ensino_basico
left outer join comum.unidade unidade26_ on
	modalidade25_.id_unidade = unidade26_.id_unidade
left outer join basico.nivel_etapa_ensino niveletapa27_ on
	etapaensin21_.id_nivel_etapa = niveletapa27_.id_nivel_etapa_ensino
left outer join comum.unidade unidade28_ on
	niveletapa27_.id_unidade = unidade28_.id_unidade
left outer join basico.situacao_etapa_ensino situacaoet29_ on
	etapaensin21_.id_situacao = situacaoet29_.id_situacao
left outer join comum.unidade unidade30_ on
	etapaensin21_.id_unidade = unidade30_.id_unidade
left outer join comum.unidade unidade31_ on
	serie20_.id_unidade = unidade31_.id_unidade
left outer join ensino.turno turno32_ on
	this_.id_turno = turno32_.id_turno
left outer join comum.unidade unidade33_ on
	this_.id_unidade = unidade33_.id_unidade
where
	this_.ativo =?
	and this_.id_serie =?
	and this_.ano_entrada_vigor =?
	and this_.id_turno =?
	and this_.id_escola is null
order by
	this_.ano_entrada_vigor desc,
	this_.id_escola desc,
	this_.id_turno desc,
	this_.id_curriculo_basico desc
limit ?
