select * from comum.pessoa p where p.nome  = 'MARIA DOS NAVEGANTES SANTOS' ---51870548


SELECT * 
FROM comum.pessoa p 
WHERE p.nome ILIKE '%MARIA DOS NAVEGANTES SANTOS%';

select * from comum.usuario u where u.id_pessoa = 51870548;

select * from comum.alteracao_registro_entrada where id_usuario in (104928);

begin;
rollback ;
commit;


DELETE FROM comum.usuario WHERE id_usuario=104928;