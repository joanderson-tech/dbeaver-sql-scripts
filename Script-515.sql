select p.nome, p.id_pessoa , d.matricula, * from basico.matricula_estudante_serie mes 
join discente d on d.id_discente = mes.id_estudante 
join comum.pessoa p on p.id_pessoa = d.id_pessoa 
where mes.id_turma_serie = 51886535;

select
	count (mes.id_matricula_discente_serie)
from
	basico.matricula_estudante_serie mes
left join escola.escola_etapa_ensino_serie ees on
	ees.id_escola_etapa_ensino_serie = mes.id_serie_escola
left join basico.turma_serie ts on
	ts.id_turma_serie = mes.id_turma_serie
	and ts.id_tipo_turma_serie <> 2
inner join basico.serie s on
	s.id_serie = ees.id_serie
inner join basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
where
	ees.id_escola = 51880464
	and mes.ano_calendario = 2025
	and ees.id_serie = 51869714
	and mes.id_turno = 2
	and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 12 );




select * from processamento.estudante_inscrio_aux eia ;
select * from matricula.estudante_inscrito ei ;
select * from comum.pessoa_recurso_avaliacao_nee pran  where pran.id_pessoa = 51885271;


Não foi possível alocar os estudantes pois o total informado, de acordo com o cálculo: X estudantes (x vagas) + y estudantes com NEE (y vagas) = 31, ultrapassa a capacidade da sala de 30 estudantes.