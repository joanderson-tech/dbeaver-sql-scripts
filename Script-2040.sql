--novo
select *
from basico.curriculo_basico cb
where cb.codigo in ('AI6INTE', 'AI7INTE', 'AI8INTE','AI9INTE')
order by cb.codigo;


select *
from basico.curriculo_basico_c cb
where  cb.id_curriculo_basico in (51878310, 51878326, 51878342, 51878358, 51878374);



select *
from basico.curriculo_basico_componente cbc where  cbc.id_curriculo_basico  in (51878310);