select p from rh.servidor s 
join comum.pessoa p on p.id_pessoa = s.id_pessoa 
where p.nome ilike '%ANA PAULA DOS SANTOS DE ANDRADE%';



select * from rh.servidor s where s.id_servidor = 1013;

select * from pessoas.historico_servidor_terceirizado  s where s.id_servidor = 1013;

select * from pessoas.vaga_administrativa   s where s.id_servidor = 1013;

select * from rh.historico_transferencia_servidores s where s.id_servidor = 1013;