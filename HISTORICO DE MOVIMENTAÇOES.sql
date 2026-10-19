select 
	st.id_solicitacao_transferencia, st.id_status, e.nome, stoe.* 
from matricula.solicitacao_transferencia st 
join matricula.solicitacao_transferencia_opcao_escola stoe on stoe.id_solicitacao = st.id_solicitacao_transferencia 
join escola.escola e on e.id_escola = stoe.id_escola 
where id_matricula_discente_serie = 1484558;

select * from matricula.solicitacao_transferencia st where id_solicitacao_transferencia = 61686314;


select * from comum.usuario u  where id_usuario = 105296;
select * from comum.registro_entrada re  where re.id_entrada = 6292931;

-- (1) identificação dos dados da matrícula
select 
	mes.id_matricula_discente_serie, mes.id_estudante 
from basico.matricula_estudante_serie mes 
join discente d on d.id_discente = mes.id_estudante 
join comum.pessoa p on p.id_pessoa = d.id_pessoa 
where p.nome = 'KEMILLY RUANNY MARINS TAVEIRA DOS SANTOS'
	and mes.ano_calendario = 2024;

-- (2) identificação do registro de transferência cancelado
select 
	st.id_solicitacao_transferencia, st.id_status, e.nome, stoe.* 
from matricula.solicitacao_transferencia st 
join matricula.solicitacao_transferencia_opcao_escola stoe on stoe.id_solicitacao = st.id_solicitacao_transferencia 
join escola.escola e on e.id_escola = stoe.id_escola 
where id_matricula_discente_serie = 1484558;

-- (3) consultas no banco de logs

-- (4) identificação do usuário que realizou a operação
select 
	re."data" as entrada, u.login, p.nome 
from comum.registro_entrada re 
join comum.usuario u on u.id_usuario = re.id_usuario 
join comum.pessoa p on p.id_pessoa = u.id_pessoa
	where re.id_entrada = 6378700;

select
	*
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
	id_estudante = 1019825;

select * from matricula.solicitacao_transferencia st 
join matricula.solicitacao_transferencia_opcao_escola stoe on stoe.id_solicitacao = st.id_solicitacao_transferencia 
where id_solicitacao_transferencia = 61686314;

 with ordena as (
select
	'CADASTRO' as descricao,
	p.nome as nome,
	d.data_cadastro as "data"
from
	public.discente d
left join comum.registro_entrada re on
	re.id_entrada = d.id_registro_entrada
left join comum.usuario u on
	u.id_usuario = re.id_usuario
left join comum.pessoa p on
	p.id_pessoa = u.id_pessoa
where
	d.id_discente =  :id
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
	data_cancelamento as "data"
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
	"data";