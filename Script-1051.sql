begin;

DELETE FROM comum.usuario WHERE id_usuario=129223;

DELETE FROM comum.pessoa WHERE id_pessoa=801716;

rollback;

select * from comum.usuario WHERE id_usuario=129223;

select * from comum.pessoa WHERE id_pessoa=801716;


select * from basico.usuario_familiar uf where uf.id_discente_medio  in (974738, 974081);