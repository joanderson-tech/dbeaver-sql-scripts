select * from comum.pessoa p where p.nome = 'SABRINA EMANUELLE SALES DA ROCHA';
select * from discente d where d.id_pessoa  in (746851,749006,51878867);
select * from basico.movimentacao_estudante me where id_discente in (980932
,978921,
980932);

978921


select * from comum.usuario
where id_usuario = 104910;



--pessoa MARIA MARINEIDE VALDEVINO DA SILVA -- 2024-07-24 14:42:22.492
--ALUNA JÁ COM MATRÍCULA DESDE 2020. FOI CRIADO ESSA NOVA MATRÍCULA DE 2024


with ordena as (
select
	'CADASTRO' as descricao,
	p.nome as nome,
	d.data_cadastro as "data"
from
	public.discente d
left join comum.registro_entrada re on
	re.id_entrada = d.id_discente
left join comum.usuario u on
	u.id_usuario = re.id_usuario
left join comum.pessoa p on
	p.id_pessoa = u.id_pessoa
where
	d.id_discente = :id
union
select
	case
		when mee.id_situacao_matricula_serie <> 1 then 'ESTORNO '
		else ''
	end || tst.denominacao as descricao,
	p.nome as nome,
	mee.data_cadastro as "data"
from
	basico.matricula_estudante_serie mes
join matricula.movimentacao_estudante_escola mee on
	mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
join matricula.tipo_solicitacao_transferencia tst on
	tst.id_tipo_solicitacao_transferencia = mee.id_tipo_sol_transferencia
left join comum.registro_entrada re on
	re.id_entrada = mee.id_registro_cadastro
left join comum.usuario u on
	u.id_usuario = re.id_usuario
left join comum.pessoa p on
	p.id_pessoa = u.id_pessoa
where
	mes.id_estudante = :id
union
select
	'ESTORNO ' || tme.descricao,
	p.nome,
	eme.data_estorno as "data"
from
	basico.movimentacao_estudante me
join basico.tipo_movimentacao_estudante tme on
	tme.id_tipo_movimentacao_estudante = me.id_tipo_movimentacao_estudante
join basico.estorno_movimentacao_estudante eme on
	eme.id_movimentacao_aluno = me.id_movimentacao_estudante
left join comum.registro_entrada re on
	re.id_entrada = eme.id_registro_entrada
left join comum.usuario u on
	u.id_usuario = re.id_usuario
left join comum.pessoa p on
	p.id_pessoa = u.id_pessoa
where
	me.id_discente = :id
	and me.ativo = false
union
select
	tme.descricao,
	p.nome,
	me.data_ocorrencia as "data"
from
	basico.movimentacao_estudante me
join basico.tipo_movimentacao_estudante tme on
	tme.id_tipo_movimentacao_estudante = me.id_tipo_movimentacao_estudante
left join comum.usuario u on
	u.id_usuario = me.id_usuario_cadastro
left join comum.pessoa p on
	p.id_pessoa = u.id_pessoa
where
	me.id_discente = :id
union
select
	'CANCELAMENTO RENOVAÇÃO MATRÍCULA',
	p.nome,
	rm.data_cadastro as "data"
from
	matricula.renovacao_matricula rm
left join comum.registro_entrada re on
	re.id_entrada = rm.id_registro_cancelamento
left join comum.usuario u on
	u.id_usuario = re.id_usuario
left join comum.pessoa p on
	p.id_pessoa = u.id_pessoa
where
	rm.id_discente = :id
	and RM.data_cancelamento is not null
union
select
	'RENOVAÇÃO MATRÍCULA',
	p.nome,
	rm.data_cadastro as "data"
from
	matricula.renovacao_matricula rm
left join comum.registro_entrada re on
	re.id_entrada = rm.id_registro_entrada 
left join comum.usuario u on
	u.id_usuario = re.id_usuario
left join comum.pessoa p on
	p.id_pessoa = u.id_pessoa
where
	rm.id_discente = :id )
select
	*
from
	ordena
order by
	case
		when TO_CHAR("data",
		'HH24:MI:SS.MS') = '00:00:00.000' then 1
		else 0
	end,
	"data";