-- EF4AINT25 52152318
-- EF5AINT25 52152345

select * from basico.curriculo_basico where id_curriculo_basico = 52152345 , );

select * from basico.curriculo_basico_componente cbc where cbc.id_curriculo_basico = 52152345  and cbc.id_componente_curricular in (514,517,513,512,515,516) 

--514 robotica
--517 musicalização
--513 letramento Matetica 
--512 Letramento em Língua Portuguesa
--515 Recreação
--516 Dança

514,517,513,512,515,516

begin;
--mudando a carga horaria para 2000
UPDATE basico.curriculo_basico SET carga_horaria=2000 WHERE id_curriculo_basico in (52152318,52152345);
--514 Robótica
UPDATE basico.curriculo_basico_componente SET ch_semana=2,ch_ano=80	 WHERE id_curriculo_basico_componente in (52152478,52152484);
--517 Musicalização
UPDATE basico.curriculo_basico_componente SET ch_semana=5,ch_ano=200 WHERE id_curriculo_basico_componente in (52152481,52152487);
--513 Letramento em Matemática
UPDATE basico.curriculo_basico_componente SET ch_semana=5,ch_ano=200 WHERE id_curriculo_basico_componente in (52152477,52152483);
--512 Letramento em Língua Portuguesa
UPDATE basico.curriculo_basico_componente SET ch_semana=5,ch_ano=200 WHERE id_curriculo_basico_componente in (52152476,52152482);
--515 Recreação
UPDATE basico.curriculo_basico_componente SET ch_semana=4,ch_ano=160 WHERE id_curriculo_basico_componente in (52152479,52152485);
--516 Dança
UPDATE basico.curriculo_basico_componente SET ch_semana=4,ch_ano=160 WHERE id_curriculo_basico_componente in (52152480,52152486);

commit;

--backup
UPDATE basico.curriculo_basico SET carga_horaria=1600 WHERE id_curriculo_basico in (52152318,52152345);
--514 Robótica
UPDATE basico.curriculo_basico_componente SET ch_semana=25,ch_ano=100 WHERE id_curriculo_basico_componente in (52152478,52152484);
--517 Musicalização
UPDATE basico.curriculo_basico_componente SET ch_semana=25,ch_ano=100 WHERE id_curriculo_basico_componente in (52152481,52152487);
--513 Letramento em Matemática
UPDATE basico.curriculo_basico_componente SET ch_semana=25,ch_ano=100 WHERE id_curriculo_basico_componente in (52152477,52152483);
--512 Letramento em Língua Portuguesa
UPDATE basico.curriculo_basico_componente SET ch_semana=25,ch_ano=100 WHERE id_curriculo_basico_componente in (52152476,52152482);
--515 Recreação
UPDATE basico.curriculo_basico_componente SET ch_semana=25,ch_ano=100 WHERE id_curriculo_basico_componente in (52152479,52152485);
--516 Dança
UPDATE basico.curriculo_basico_componente SET ch_semana=25,ch_ano=100 WHERE id_curriculo_basico_componente in (52152480,52152486);

