	 select 
		   p3.id_pessoa, 
		   p3.cpf_cnpj, p.*
		 from comum.permissao p
		 join comum.papel p2 on p2.id = p.id_papel
		 join comum.unidade u on u.id_unidade = p.id_unidade_papel
		 join comum.usuario u2 on u2.id_usuario = p.id_usuario
		 join comum.pessoa p3 on p3.id_pessoa = u2.id_pessoa
		 where p2.id = 302;
		 and p.id_unidade_papel = 28036786
		 ORDER BY p.data_atribuicao DESC ;
		 limit 1 
		 
		 
		  select p.*
		 from comum.permissao p
		 where p.id_unidade_papel = 28036786;