begin;
-- 6º ano
update basico.turma_serie set id_curriculo_medio = 52288218, tipo_diario = 0 where id_turma_serie in (52201290, 52201285, 52201283, 52201295, 52205845);
update basico.matricula_estudante_serie set id_curriculo_medio = 52288218    where id_turma_serie in (52201290, 52201285, 52201283, 52201295, 52205845);
-- 7º ano
update basico.turma_serie set id_curriculo_medio = 52288228, tipo_diario = 0 where id_turma_serie in (52201360, 52201324, 52201407, 52205846);
update basico.matricula_estudante_serie set id_curriculo_medio = 52288228    where id_turma_serie in (52201360, 52201324, 52201407, 52205846);
commit;