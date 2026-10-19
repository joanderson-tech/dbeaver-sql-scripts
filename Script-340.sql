select
	1 as bimestre,
	ce.inicio_bim_1 as inicio_bim,
	ce.fim_bim_1 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2024
	and ativo;
	
select
	id_turma_serie
from
	basico.turma_serie ts
join basico.serie s on
	s.id_serie = ts.id_serie 
	where ts.id_serie = 58413194;