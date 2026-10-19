select
	this_.id_cargo as id1_674_2_,
	this_.ativo as ativo674_2_,
	this_.cargo_funcao as cargo3_674_2_,
	this_.cargo_seec as cargo4_674_2_,
	this_.id_categoria as id10_674_2_,
	this_.codigo_rh as codigo5_674_2_,
	this_.data_atualizacao as data6_674_2_,
	this_.denominacao as denomina7_674_2_,
	this_.id_nivel_cargo as id11_674_2_,
	this_.permite_cadastro_servidor as permite8_674_2_,
	this_.id_registro_atualizacao as id12_674_2_,
	this_.id_tipo_cargo as id9_674_2_,
	categoria2_.ID_CATEGORIA as ID1_414_0_,
	categoria2_.DESCRICAO as DESCRICAO414_0_,
	categoria2_.ATIVO as ATIVO414_0_,
	nivelcargo3_.id_nivel_cargo as id1_675_1_,
	nivelcargo3_.ativo as ativo675_1_,
	nivelcargo3_.descricao as descricao675_1_,
	nivelcargo3_.sigla as sigla675_1_
from
	rh.cargo this_
inner join rh.CATEGORIA categoria2_ on
	this_.id_categoria = categoria2_.ID_CATEGORIA
inner join rh.nivel_cargo nivelcargo3_ on
	this_.id_nivel_cargo = nivelcargo3_.id_nivel_cargo
where
	this_.ativo =true
order by
	this_.denominacao asc;
