select * from transporte.rota;

select * from transporte.rota_detalhe rd where rd.id_rota = 61070450;

select * from transporte.rota_discente where id_discente = 1363103;

select * from discente d join comum.pessoa p on p.id_pessoa = d.id_pessoa 
where p.nome ilike '%Gabriella Katyleia da Silva%';
--Gabriella Katyleia da Silva 1363103
--Wesley Matheus de Souza Sales  1341646

--Solução
UPDATE transporte.rota_discente	SET ativo=false	WHERE id_rota_discente in (20561,28649);

--backup
UPDATE transporte.rota_discente	SET ativo=true	WHERE id_rota_discente in (20561,28649);
