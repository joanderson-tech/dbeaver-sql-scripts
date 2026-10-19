select * from basico.serie s where ativo

select id_escola, id_turno, * from basico.curriculo_basico cb where id_serie in (51869714, 51869715) and ativo order by id_serie, id_curriculo_basico;

select * 
from basico.curriculo_basico_componente cbc 
where cbc.id_curriculo_basico in (51978804, 51978829, 52031134, 51978806, 51978831, 52031145);