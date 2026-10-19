
select cb.codigo, tipo_diario, * from basico.curriculo_basico cb 
where cb.id_curriculo_basico in(35558311,35559167,51873720,51873729) 
;

select * from basico.etapa_ensino ee 
where ee.denominacao like 'EJA - ENS FUNDAMENTAL - 2ª FASE';

select * from basico.serie s 
where s.id_etapa_ensino =10;
--15290011, 15290013, 51873709, 51873710
 

--Solução
UPDATE basico.curriculo_basico
SET  tipo_diario= 15
WHERE id_curriculo_basico in (35558311,35559167,51873720,51873729);

UPDATE basico.turma_serie
	SET tipo_diario= 15
	WHERE id_turma_serie in (15290011, 15290013, 51873709, 51873710);


-- Backup
UPDATE basico.curriculo_basico
SET  tipo_diario= 5
WHERE id_curriculo_basico in (35558311,35559167,51873720,51873729);
-----
UPDATE basico.serie
	SET tipo_diario=10
	WHERE id_serie=15290011;
UPDATE basico.serie
	SET tipo_diario=10
	WHERE id_serie=15290013;
UPDATE basico.serie
	SET tipo_diario=10
	WHERE id_serie=51873709;
UPDATE basico.serie
	SET tipo_diario=10
	WHERE id_serie=51873710;
----


select string_agg(tipo_diario::varchar,',')  from basico.turma_serie ts
where ts.id_serie in(15290011, 15290013, 51873709, 51873710);




begin;

commit;

rollback;

--Tipo diario
0,5,5,5,5,0,2,0,0,0,5,5,0,5,2,0,5,5,5,0,5,0,5,5,5,2,2,0,5,2,2,0,0,0,5,5,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5





