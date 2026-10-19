select * from discente d where matricula = '202130039479';

select * from basico.matricula_estudante_serie mes where id_estudante = 977415;

select * from basico.serie s where id_serie in (1005224,15290011,1005225);

select * from basico.serie_equivalencia se where id_serie = 1005224;

begin;
commit;

--Solução 
DELETE FROM basico.serie_equivalencia WHERE id_serie_equivalencia=614;


--backup

 INSERT INTO basico.serie_equivalencia (id_serie_equivalencia, id_serie, id_serie_equivalente, id_unidade, data_cadastro, id_registro_cadastro) VALUES(614, 1005224, 1005225, 605, '2025-03-10 16:05:48.327', 5806153);
