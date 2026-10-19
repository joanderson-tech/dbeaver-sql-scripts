select
	extensaoca0_.id_extensao_calendario_escolar as id1_877_,
	extensaoca0_.ativo as ativo877_,
	extensaoca0_.id_calendario_escolar as id21_877_,
	extensaoca0_.data_cadastro as data3_877_,
	extensaoca0_.data_fim_validade as data4_877_,
	extensaoca0_.id_escola as id22_877_,
	extensaoca0_.fim_bim_1 as fim5_877_,
	extensaoca0_.fim_bim_2 as fim6_877_,
	extensaoca0_.fim_bim_3 as fim7_877_,
	extensaoca0_.fim_bim_4 as fim8_877_,
	extensaoca0_.fim_semestre_1 as fim9_877_,
	extensaoca0_.fim_semestre_2 as fim10_877_,
	extensaoca0_.inicio_bim_1 as inicio11_877_,
	extensaoca0_.inicio_bim_2 as inicio12_877_,
	extensaoca0_.inicio_bim_3 as inicio13_877_,
	extensaoca0_.inicio_bim_4 as inicio14_877_,
	extensaoca0_.inicio_semestre_1 as inicio15_877_,
	extensaoca0_.inicio_semestre_2 as inicio16_877_,
	extensaoca0_.justificativa as justifi17_877_,
	extensaoca0_.motivo as motivo877_,
	extensaoca0_.id_registro_cadastro as id20_877_,
	extensaoca0_.validado as validado877_
from
	diario.extensao_calendario_escolar extensaoca0_
where
	extensaoca0_.id_calendario_escolar =?
	and extensaoca0_.id_escola =?
	and extensaoca0_.validado = trueValue()
	and (extensaoca0_.data_fim_validade is null);


select * from basico.turma_serie ts ;

