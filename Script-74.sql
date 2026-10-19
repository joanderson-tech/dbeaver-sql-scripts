select * from ensino.interrupcao_escola ie 

select * from ensino.interrupcao_escola_professor iep 
select 

select re.id_usuario ,ie.inicio, ie.fim,p.nome, ie.descricao, ie.tipo
from ensino.interrupcao_escola ie  
join ensino.motivo_interrupcao_escola mie on mie.id_motivo_interrupcao_escola = ie.id_motivo_interrupcao_escola 
join comum.registro_entrada re on re.id_entrada = ie.id_registro_cadastro 
join comum.usuario u on u.id_usuario = re.id_usuario
join comum.pessoa p on p.id_pessoa = u.id_pessoa
where ie.id_interrupcao_escola = 52219009;
