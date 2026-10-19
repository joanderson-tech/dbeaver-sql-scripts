select * from comum.emi

select
	this_.id_emissao as id1_1302_0_,
	this_.codigo_seguranca as codigo2_1302_0_,
	this_.auxiliar as auxiliar1302_0_,
	this_.data_emissao as data4_1302_0_,
	this_.hora_emissao as hora5_1302_0_,
	this_.identificador as identifi6_1302_0_,
	this_.numero_documento as numero7_1302_0_,
	this_.prng as prng1302_0_,
	this_.sub_tipo_documento as sub9_1302_0_,
	this_.tipo_documento as tipo10_1302_0_
from
	comum.emissao_documento_autenticado this_
where
	this_.identificador =?
	and this_.codigo_seguranca =?
	and this_.data_emissao =?
	and this_.tipo_documento =?
limit ?
