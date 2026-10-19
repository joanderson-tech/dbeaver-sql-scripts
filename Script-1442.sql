select distinct  p2.nome, u.login, pp.nome 
from rh.servidor s
join comum.usuario u on u.id_pessoa = s.id_pessoa 
join comum.permissao p on p.id_usuario = u.id_usuario 
join comum.papel pp on pp.id = p.id_papel 
join comum.pessoa p2 on p2.id_pessoa = u.id_pessoa 
where s.id_situacao = 1
order by p2.nome, pp.nome;