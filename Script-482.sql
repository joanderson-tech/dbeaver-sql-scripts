/*with curriculos as (select * from basico.curriculo_basico where ativo)
update basico.serie
set tipo_diario = curriculos.tipo_diario
from (select * from curriculos ) as curriculos
where curriculos.id_serie = serie.id_serie
and curriculos.tipo_diario <> serie.tipo_diario;

Updated Rows	10
Execute time	0.838s
Start time	Fri May 09 10:12:00 BRT 2025
Finish time	Fri May 09 10:12:01 BRT 2025
Query	with curriculos as (select * from basico.curriculo_basico where ativo)
	update basico.serie
	set tipo_diario = curriculos.tipo_diario
	from (select * from curriculos ) as curriculos
	where curriculos.id_serie = serie.id_serie
	and curriculos.tipo_diario <> serie.tipo_diario*/


select * from basico.serie s; where s.data_atualizacao = '2025-05-09';
2024-09-25 14:22:21.000