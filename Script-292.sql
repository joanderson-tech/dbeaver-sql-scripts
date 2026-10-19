select
	*
from
	ensino.horario_turma this_
left outer join ensino.Horario horario2_ on
	this_.id_horario = horario2_.id_horario
left outer join basico.etapa_ensino etapaensin3_ on
	horario2_.id_etapa_ensino = etapaensin3_.id_etapa_ensino
left outer join basico.forma_organizacao_etapa formaorgan4_ on
	etapaensin3_.id_forma_organizacao_Etapa = formaorgan4_.id_forma_organizacao_etapa
left outer join comum.unidade unidade5_ on
	formaorgan4_.id_unidade = unidade5_.id_unidade
left outer join basico.local_oferta localofert6_ on
	etapaensin3_.id_local_oferta = localofert6_.id_local_oferta
left outer join basico.modalidade_ensino_basico modalidade7_ on
	etapaensin3_.id_modalidade = modalidade7_.id_modalidade_ensino_basico
left outer join comum.unidade unidade8_ on
	modalidade7_.id_unidade = unidade8_.id_unidade
left outer join basico.nivel_etapa_ensino niveletapa9_ on
	etapaensin3_.id_nivel_etapa = niveletapa9_.id_nivel_etapa_ensino
left outer join comum.unidade unidade10_ on
	niveletapa9_.id_unidade = unidade10_.id_unidade
left outer join basico.situacao_etapa_ensino situacaoet11_ on
	etapaensin3_.id_situacao = situacaoet11_.id_situacao
left outer join comum.unidade unidade12_ on
	etapaensin3_.id_unidade = unidade12_.id_unidade
left outer join comum.unidade unidade13_ on
	horario2_.id_unidade = unidade13_.id_unidade
where
	this_.ativo = true
	and this_.id_turma =733295;
	
	select
	ta.id_topico_aula,
	ta."data"
from
	ava.topico_aula ta
where
	ta.ativo
	and (ta.conteudo_ministrado is not null
		or ta.conteudo_ministrado <> '')
	and ta.id_turma = 733295; 	


select * from ava.topico_aula ta 
where id_topico_aula in (76070288,76070287, 76070286);

select * from comum.usuario u where u.id_usuario = 106021;
