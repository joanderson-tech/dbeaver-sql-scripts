UPDATE comum.usuario SET id_pessoa=54378358 WHERE id_usuario=105040;

DELETE FROM rh.servidor WHERE id_servidor=1013;

DELETE FROM comum.pessoa WHERE id_pessoa=746592;

begin;

rollback;




select * from comum.usuario WHERE id_usuario=105040;

select * from comum.pessoa; WHERE id_pessoa=54378358;