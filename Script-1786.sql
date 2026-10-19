BEGIN;

update educacenso.educacenso_pessoa ep  set id_pessoa = 760849 where id_educacenso_pessoa = 3824;
delete from comum.alteracao_pessoa where id_alteracao_pessoa = 583809567;
delete from comum.pessoa where id_pessoa = 754946;

delete from comum.pessoa where id_pessoa = 754946;

COMMIT;