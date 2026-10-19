select *
from basico.curriculo_basico cb
where cb.codigo in('AI1-26', 'AI2-26', 'AI3-26', 'AI4-26', 'AI5-26') 
order by cb.codigo;