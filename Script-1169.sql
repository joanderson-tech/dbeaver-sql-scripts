select * from basico.serie where id_serie = 5118243;


INSERT INTO basico.serie_equivalencia (id_serie_equivalencia, id_serie, id_serie_equivalente, id_unidade, data_cadastro, id_registro_cadastro) VALUES(6003, 5118243, 15290013, 605, '2025-09-16 15:59:43.938', 6276852);

select * from basico.serie_equivalencia where id_serie = 5118243;

select*  from basico.turma_serie ts where ts.id_turma_serie   in (54617267,54617264,54617265,54617266);


select * from basico.serie where id_serie in (15289982,15289983,15290011,15290013) ;



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
 
 DELETE FROM basico.serie_equivalencia WHERE id_serie_equivalencia=643;
 
INSERT INTO basico.serie_equivalencia (id_serie_equivalencia, id_serie, id_serie_equivalente, id_unidade, data_cadastro, id_registro_cadastro) VALUES(643, 5118243, 15290013, 605, '2025-09-18 09:15:01.024', 6276959);

DELETE FROM basico.serie_equivalencia WHERE id_serie_equivalencia=644;