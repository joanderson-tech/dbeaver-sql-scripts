select * from basico.curriculo_basico cb where cb.id_curriculo_basico in (53806701,53806713,53806725,53806737);

select * from ensino.turma t where t.id_turma_serie in (53799454, 53799455, 53799456, 53799458, 53800990, 53800992, 53800994, 53806501, 53806574, 53806576, 53806577, 53800075, 53800111, 53800139, 53800176, 53800200, 53800245, 53800267, 53800312, 53806494, 53806573, 53806575, 53800991, 53806578, 53801092);

select * from basico.turma_serie ts where ts.nome ilike '%EFAF%' and ts.ano = 2026 and ts.ativo;

select * from basico.curriculo_basico_componente cbc where cbc.id_curriculo_basico = 51918302; -- 6° ano antigo
select * from basico.curriculo_basico_componente cbc where cbc.id_curriculo_basico = 53806701; -- 518, 519

select * from basico.curriculo_basico_componente cbc where cbc.id_curriculo_basico = 51918312; -- 7° ano antigo
select * from basico.curriculo_basico_componente cbc where cbc.id_curriculo_basico = 53806713; --518, 520

select * from basico.curriculo_basico_componente cbc where cbc.id_curriculo_basico = 51918292; -- 8° ano antigo
select * from basico.curriculo_basico_componente cbc where cbc.id_curriculo_basico = 53806725; --518, 521

select * from basico.curriculo_basico_componente cbc where cbc.id_curriculo_basico = 51918322; -- 9° ano antigo
select * from basico.curriculo_basico_componente cbc where cbc.id_curriculo_basico = 53806737; --518, 522

select * from ensino.matricula_componente mc

select * from ensino.turma t where t.id_turma_serie = 53799456;

-- Script Solução

UPDATE basico.turma_serie SET id_curriculo_medio=53806725 WHERE id_turma_serie in (53799456,53800992,53806574,53800200,53800245,53806573,53801092);

UPDATE basico.turma_serie SET id_curriculo_medio=53806701 WHERE id_turma_serie in (53799454,53800990,53806577,53800075,53800111,53806578);

UPDATE basico.turma_serie SET id_curriculo_medio=53806713 WHERE id_turma_serie in (53799458,53806576,53800139,53800176,53806575,53800991);

UPDATE basico.turma_serie SET id_curriculo_medio=53806737 WHERE id_turma_serie in (53799455,53800994,53806501,53800267,53800312,53806494);

-- Script Backup

UPDATE basico.turma_serie SET id_curriculo_medio=51918292 WHERE id_turma_serie in (53799456,53800992,53806574,53800200,53800245,53806573,53801092);

UPDATE basico.turma_serie SET id_curriculo_medio=51918302 WHERE id_turma_serie in (53799454,53800990,53806577,53800075,53800111,53806578);

UPDATE basico.turma_serie SET id_curriculo_medio=51918312 WHERE id_turma_serie in (53799458,53806576,53800139,53800176,53806575,53800991);

UPDATE basico.turma_serie SET id_curriculo_medio=51918322 WHERE id_turma_serie in (53799455,53800994,53806501,53800267,53800312,53806494);