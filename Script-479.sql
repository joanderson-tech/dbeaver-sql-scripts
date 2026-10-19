
---Script backup da solução
begin;
rollback;

UPDATE basico.curriculo_basico
	SET possui_parte_diversificada=false, tipo_diario  = 1
	WHERE id_curriculo_basico=52063879;
	
UPDATE basico.turma_serie
	SET tipo_diario=1
	WHERE id_turma_serie in (52093846, 52093850);


------------------------------------------------------------
--Nova solução

UPDATE basico.curriculo_basico
	SET possui_parte_diversificada=true, tipo_diario_diversificado=20
	WHERE id_curriculo_basico=52063879;

commit;

--backup
UPDATE basico.curriculo_basico
	SET possui_parte_diversificada=false, tipo_diario_diversificado=Null
	WHERE id_curriculo_basico=52063879;

-----------------------------------------------------



select cb.tipo_diario_diversificado, * from basico.curriculo_basico cb where cb.id_curriculo_basico=52063879;

select * from diario.competencia_habilidades_aluno cha 
join public.discente d on d.id_discente = cha.id_discente
join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente
where mes.id_turma_serie_multisseriado  in (52093846, 52093850);

select * from ensino.frequencia_aluno fa  
join public.discente d on d.id_discente = fa.id_discente
join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente
join ensino.turma t on t.id_turma_serie = mes.id_turma_serie 
where mes.id_turma_serie_multisseriado  in (52093846, 52093850) and fa.id_turma = t.id_turma;


 with turma_serie as (
select
	id_turma_serie
from
	basico.turma_serie ts
join basico.serie s on
	s.id_serie = ts.id_serie
where
	ts.ano = 2025
	and s.id_serie <> 58413194
	and s.id_etapa_ensino <> 14 ),
datas_calendario as (
select
	1 as bimestre,
	ce.inicio_bim_1 as inicio_bim,
	ce.fim_bim_1 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2025
	and ativo
union
select
	2 as bimestre,
	ce.inicio_bim_2 as inicio_bim,
	ce.fim_bim_2 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2025
	and ativo
union
select
	3 as bimestre,
	ce.inicio_bim_3 as inicio_bim,
	ce.fim_bim_3 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2025
	and ativo
union
select
	4 as bimestre,
	ce.inicio_bim_4 as inicio_bim,
	ce.fim_bim_4 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2025
	and ativo ),
notas as (
select
