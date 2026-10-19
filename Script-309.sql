select
	this_.id_emissao as id1_1305_0_,
	this_.codigo_seguranca as codigo2_1305_0_,
	this_.auxiliar as auxiliar1305_0_,
	this_.data_emissao as data4_1305_0_,
	this_.hora_emissao as hora5_1305_0_,
	this_.identificador as identifi6_1305_0_,
	this_.numero_documento as numero7_1305_0_,
	this_.prng as prng1305_0_,
	this_.sub_tipo_documento as sub9_1305_0_,
	this_.tipo_documento as tipo10_1305_0_
from
	comum.emissao_documento_autenticado this_
where
	this_.identificador =?
	and this_.codigo_seguranca =?
	and this_.data_emissao =?
	and this_.tipo_documento =;
	

select
	mes.id_matricula_discente_serie as col_0_0_,
	mes.id_situacao_matricula_serie as col_1_0_,
	mes.id_estudante as col_2_0_
from
	basico.matricula_estudante_serie mes, basico.estudante est, discente d
where
	mes.id_estudante = est.id_estudante
	and est.id_estudante = d.id_discente
	and (d.matricula like '202330147195');
