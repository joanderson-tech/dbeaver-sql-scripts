select * from basico.curriculo_basico cb where CB.codigo   = '5PN8';

select * from basico.turma_serie ts where ts.id_curriculo_medio = 51878342;

select * from ensino.turma t where t.id_turma_serie = 51881398;






--Letramento Português & Letramento Matemático
select string_agg(id_curriculo_basico_componente::varchar , ',')
from basico.curriculo_basico_componente cbc
where cbc.id_curriculo_basico  in (51878310, 51878326, 51878342,51878358, 51878374)
and cbc.id_componente_curricular in (512, 513);

--Letramento Português & Letramento Matemático
UPDATE basico.curriculo_basico_componente SET ch_semana=4,ch_ano=160 WHERE id_curriculo_basico_componente in (51878336,51878335,51878352,51878351,51878368,51878367,51878384,51878383,51878319,51878320);

--backup Letramento Português & Letramento Matemático
UPDATE basico.curriculo_basico_componente SET ch_semana=5,ch_ano=200 WHERE id_curriculo_basico_componente in (51878336,51878335,51878352,51878351,51878368,51878367,51878384,51878383,51878319,51878320);

--Educação Científica e Digital &  Práticas Culturais e Artísticas
select string_agg(id_curriculo_basico_componente::varchar , ',')
from basico.curriculo_basico_componente cbc
where cbc.id_curriculo_basico in (51878310, 51878326, 51878342,51878358, 51878374) 
and cbc.id_componente_curricular in (517, 515);

--Educação Científica e Digital &  Práticas Culturais e Artísticas
UPDATE basico.curriculo_basico_componente SET ch_semana=3,ch_ano=120 WHERE id_curriculo_basico_componente in (51878356,51878372,51878338,51878340,51878354,51878370,51878386,51878388,51878322,51878323);

--backup Educação Científica e Digital &  Práticas Culturais e Artísticas
UPDATE basico.curriculo_basico_componente SET ch_semana=2,ch_ano=80 WHERE id_curriculo_basico_componente in (51878356,51878372,51878338,51878340,51878354,51878370,51878386,51878388,51878322,51878323);



