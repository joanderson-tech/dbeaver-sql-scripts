select string_agg(id_curriculo_basico_componente::varchar , ', ') from basico.curriculo_basico_componente 
where id_curriculo_basico in (51878310,51878326, 51878342, 51878358, 51878374)
and id_componente_curricular = 518;


-- Auto-generated SQL script #202507150912
UPDATE basico.curriculo_basico_componente SET ch_semana=2 WHERE id_curriculo_basico_componente in (51878341, 51878357, 51878373, 51878389, 51878325);



--backup
UPDATE basico.curriculo_basico_componente SET ch_semana=8 WHERE id_curriculo_basico_componente in (51878341, 51878357, 51878373, 51878389, 51878325);

