select
	distinct curriculob1_
from
	ensino_infantil.configuracao_relatorio configurac0_
inner join basico.curriculo_basico curriculob1_ on
	configurac0_.id_curriculo_basico = curriculob1_.id_curriculo_basico
inner join ensino_infantil.grupo_avaliacao_relatorio grupoavali2_ on
	configurac0_.id_grupo_avaliacao_relatorio = grupoavali2_.id_grupo_avaliacao_relatorio
inner join ensino_infantil.opcao_grupo_avaliacao_relatorio opcoesgrup3_ on
	grupoavali2_.id_grupo_avaliacao_relatorio = opcoesgrup3_.id_grupo_avaliacao_relatorio
inner join ensino_infantil.configuracao_relatorio_componente configurac4_ on
	configurac0_.id_configuracao_relatorio = configurac4_.id_configuracao_relatorio
	and (configurac4_.ativo)
inner join ensino_infantil.tipo_avaliacao_componente_relatorio tipoavalia5_ on
	configurac4_.id_tipo_avaliacao_componente_relatorio = tipoavalia5_.id_tipo_avaliacao_componente_relatorio
inner join ensino.componente_curricular componente6_ on
	configurac4_.id_componente_curricular = componente6_.id_componente_curricular
left outer join ensino_infantil.configuracao_relatorio_componente_habilidade configurac7_ on
	configurac4_.id_configuracao_relatorio_componente = configurac7_.id_configuracao_relatorio_componente
	and (configurac7_.ativo)
left outer join ensino_infantil.habilidade_competencia habilidade8_ on
	configurac7_.id_habilidade_competencia = habilidade8_.id_habilidade_competencia
where
	1 = 1
	and configurac0_.ativo = true
	and configurac4_.ativo = true
	and (configurac4_.id_tipo_avaliacao_componente_relatorio = 1
		or configurac4_.id_tipo_avaliacao_componente_relatorio = 2
		and configurac7_.ativo = true);
	and curriculob1_.id_curriculo_basico = 55456041;
