select * from basico.matricula_estudante_serie mes where id_estudante = 1395420 and ano_calendario = 2024;

select * from matricula.movimentacao_estudante_escola mee where id_matricula_estudante_serie  = 1488334;

begin;
rollback;





UPDATE basico.matricula_estudante_serie SET id_situacao_matricula_serie=6 WHERE id_matricula_discente_serie=1488334;
UPDATE matricula.movimentacao_estudante_escola SET "data"='2024-06-19',data_solicitacao='2024-06-19' WHERE id_movimentacao_estudante_escola=70920865;
UPDATE matricula.movimentacao_estudante_escola SET ativo=false WHERE id_movimentacao_estudante_escola=70936302;

--backup
UPDATE basico.matricula_estudante_serie SET id_situacao_matricula_serie=1 WHERE id_matricula_discente_serie=1488334;
UPDATE matricula.movimentacao_estudante_escola SET "data"='2024-06-18',data_solicitacao='2024-06-18' WHERE id_movimentacao_estudante_escola=70920865;
UPDATE matricula.movimentacao_estudante_escola SET ativo=true WHERE id_movimentacao_estudante_escola=70936302;


