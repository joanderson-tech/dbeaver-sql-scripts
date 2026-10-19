begin;

delete from matricula.operacao_vaga_serie where id_vaga_serie in (52769770, 52769706);
delete from matricula.vaga_serie
where id_vaga_serie in (52769770, 52769706);
commit;