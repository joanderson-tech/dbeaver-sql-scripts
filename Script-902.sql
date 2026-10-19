select *from basico.usuario_familiar uf where uf.id_discente_medio  in (974738, 974081);

select p.nome, * from comum.usuario u 
join comum.pessoa p on p.id_pessoa = u.id_pessoa
where u.id_usuario in (105067,105174);



select p.nome, * from comum.pessoa p 
join discente d on d.id_pessoa = p.id_pessoa
where d.id_discente  in (974738, 974081);


-- Auto-generated SQL script #202507311203
UPDATE basico.usuario_familiar SET ativo=false WHERE id_usuario_familiar=52021343;
UPDATE basico.usuario_familiar SET ativo=false WHERE id_usuario_familiar=52029762;


UPDATE basico.usuario_familiar SET ativo=true WHERE id_usuario_familiar=52021343;
UPDATE basico.usuario_familiar SET ativo=true WHERE id_usuario_familiar=52029762;