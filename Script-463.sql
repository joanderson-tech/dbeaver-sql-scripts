select
count(*)
from
	basico.matricula_estudante_serie mes
inner join basico.estudante e  on
	mes.id_estudante = e.id_estudante
inner join discente d on
	e.id_estudante = d.id_discente
inner join comum.pessoa p on
	d.id_pessoa = p.id_pessoa
left outer join comum.municipio m  on
	p.id_municipio_contato = m.id_municipio
left outer join basico.turma_serie ts on
	mes.id_turma_serie = ts.id_turma_serie
left outer join ensino.turno t on
	ts.id_turno = t.id_turno
left outer join escola.escola_etapa_ensino_serie eees  on
	mes.id_serie_escola = eees.id_escola_etapa_ensino_serie
left outer join basico.serie s  on
	eees.id_serie = s.id_serie
left outer join basico.etapa_ensino ee  on
	s.id_etapa_ensino = ee.id_etapa_ensino
left outer join escola.escola e2  on
	eees.id_escola = e2.id_escola
left outer join comum.municipio m2  on
	e2.id_municipio = m2.id_municipio
left outer join basico.situacao_matricula_serie sms  on
	mes.id_situacao_matricula_serie = sms.id_situacao_matricula_serie
where
	1 = 1
--	and ts.ativo
	and (mes.id_situacao_matricula_serie  in ( 1, 2, 3 ))
	and eees.id_escola = 52232889
	and mes.ano_calendario = 2025
	--and s.id_etapa_ensino = 14
	and ( select count(*)
	from comum.pessoa_necessidade_especial eee where p.id_pessoa = eee.id_pessoa) > 0;

select count(*) from comum.pessoa_necessidade_especial pne where pne.id_pessoa in (796530, 771377, 766718, 768483, 769480, 766961, 760426, 760724, 766293, 760723, 749140, 52798727, 52783898, 52773728, 749803, 52773934, 52781944, 52780968, 760424, 771921, 755185, 52761609, 798457, 798293);
		
SELECT distinct pne.id_pessoa
FROM comum.pessoa_necessidade_especial pne 
WHERE pne.id_pessoa in (52798727, 760426, 760426, 766718, 766718, 766718, 766718, 766718, 766718, 760426, 760426, 766961, 766961, 766961, 766961, 766961, 766961, 760723, 760723, 798457, 798457, 760424, 760424, 760424, 760424, 760424, 760424, 52783898, 52783898, 760424, 760424, 760424, 760424, 760424, 760424, 52783898, 52783898, 52780968, 52780968, 796530, 796530, 771921, 771921, 52798727, 52798727, 766718, 766718, 766718, 766718, 766718, 766718, 796530, 796530, 52780968, 771921, 771921, 52798727);
		
		
 