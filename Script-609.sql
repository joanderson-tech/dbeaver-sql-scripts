insert into comum.emissao_documento_autenticado (codigo_seguranca, auxiliar, data_emissao, hora_emissao, identificador, numero_documento, prng, sub_tipo_documento, tipo_documento, id_emissao) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
15:55:15,829 INFO  [STDOUT] Hibernate: 


select * from comum.parametro p where p.codigo = '2_10100_8'




-- Auto-generated SQL script #202505291602
UPDATE comum.parametro
	SET valor='https://jardimdeangicos-rn.portalsigeduc.com.br/app/documentos'
	WHERE codigo='2_10100_8';





UPDATE comum.parametro
	SET valor='https://portalegre-rn.portalsigeduc.com.br/app/documentos'
	WHERE codigo='2_10100_8';