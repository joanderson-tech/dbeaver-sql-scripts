 select
	*
from basico.turma_serie ts
join basico.serie s on
	s.id_serie = ts.id_serie
left join basico.serie_equivalencia se on
	se.id_serie = s.id_serie
	or se.id_serie_equivalente = s.id_serie
where
	ts.id_turma_serie_agrupadora = 54617263
	and ts.ativo
	and (se.id_serie = 5118243	or se.id_serie_equivalente = 5118243);
 
 
 select * from basico.serie where id_serie = 5118243;
 
select * from  basico.serie_equivalencia se
--join basico.turma_serie ts on se.id_serie = ts.id_serie 
where se.id_serie = 54565635;

select*  from basico.turma_serie ts where ts.id_turma_serie  = 54518609;


select*  from basico.turma_serie ts where ts.id_turma_serie_agrupadora = 54617263;

select distinct s.descricao , * from basico.serie s 
join basico.serie_equivalencia se on se.id_serie = se.id_serie_equivalente 
where s.id_serie in(15289982,15289983,15290011,15290013) ;

select mes.* from discente d 
join comum.pessoa p on p.id_pessoa = d.id_pessoa 
join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente 
where p.nome ilike '%RODRIGO FRANCISCO OLIVEIRA SANTOS%'
and mes.ano_calendario = 2025; --turma_serie 54518609 

select * from basico.serie where id_serie = 5118243;

select * from basico.serie_equivalencia se
where se.id_serie in(15289982,15289983,15290011,15290013) ;

select * from basico.serie_equivalencia where id_serie_equivalencia = 6012;

INSERT INTO basico.serie_equivalencia (id_serie_equivalencia, id_serie, id_serie_equivalente, id_unidade, data_cadastro, id_registro_cadastro) VALUES(6012, 5118243, 15290013, 605, '2025-09-16 15:59:43.938', 6276852);

DELETE FROM basico.serie_equivalencia WHERE id_serie_equivalencia=6012;

select * from basico.serie where id_serie = 54565635;
