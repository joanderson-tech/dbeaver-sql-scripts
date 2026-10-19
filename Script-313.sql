select
	*
from
	comum.emissao_documento_autenticado this_
where
	this_.tipo_documento = 16;



select
	*
from
	comum.emissao_documento_autenticado this_
where
	this_.identificador ='202030008863'
	and this_.codigo_seguranca ='bb82e15db7';


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
	this_.identificador ='202030008863'
	and this_.codigo_seguranca ='bb82e15db7'
	and this_.data_emissao ='2024-11-13'
	and this_.tipo_documento = 16;