select * from basico.turma_serie ts where ts.id_turma_serie = 55638498;

select * from ensino.componente_curricular cc where id_componente_curricular = 604;

select * from ensino.turma t where t.id_turma_serie = 55638498 and id_disciplina = 604;

select * from ensino.turma t where t.id_turma_serie = 55580485 ;

select * from basico.curriculo_basico cb where cb.id_curriculo_basico = 55456041; --3°ANO - 25

select * from basico.curriculo_basico cb where cb.id_curriculo_basico = 55456120; --3°ANOEF-25

SELECT * FROM basico.turma_serie WHERE id_serie  IN (1005220) and ano = 2025 and id_turno in (545728070, 1);

SELECT * FROM basico.curriculo_basico_componente cbc WHERE id_curriculo_basico  IN (55456041);

select * from ensino_infantil.configuracao_relatorio_componente crc where crc.id_componente_curricular = 604;

SELECT s.* FROM basico.serie AS s;

--ESCOLA MUNICIPAL IZABEL FERNANDES

begin;

/*
INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES(43, 2, 604, 1, 9999, true, 6464189, NULL, '2024-12-17 08:09:54.399', NULL, false, false);
DELETE FROM ensino_infantil.configuracao_relatorio_componente WHERE id_configuracao_relatorio_componente=43;
*/

commit;
/*UPDATE ensino_infantil.relatorio_avaliativo
	SET ativo=false
	WHERE id_relatorio_avaliativo=74332;*/


select
	distinct configurac0_.id_configuracao_relatorio as id1_680_,
	configurac0_.ativo as ativo680_,
	configurac0_.codigo as codigo680_,
	configurac0_.id_curriculo_basico as id7_680_,
	configurac0_.data_alteracao as data4_680_,
	configurac0_.data_cadastro as data5_680_,
	configurac0_.id_grupo_avaliacao_relatorio as id10_680_,
	configurac0_.id_periodicidade_relatorio as id9_680_,
	configurac0_.possui_parecer_descritivo as possui6_680_,
	configurac0_.id_registro_atualizacao as id11_680_,
	configurac0_.id_registro_cadastro as id8_680_
from
	ensino_infantil.configuracao_relatorio configurac0_
inner join basico.curriculo_basico curriculob1_ on
	configurac0_.id_curriculo_basico = curriculob1_.id_curriculo_basico
inner join ensino_infantil.grupo_avaliacao_relatorio grupoavali2_ on
	configurac0_.id_grupo_avaliacao_relatorio = grupoavali2_.id_grupo_avaliacao_relatorio
inner join ensino_infantil.opcao_grupo_avaliacao_relatorio opcoesgrup3_ on
	grupoavali2_.id_grupo_avaliacao_relatorio = opcoesgrup3_.id_grupo_avaliacao_relatorio
inner join ensino_infantil.configuracao_relatorio_componente configurac4_ on
	configurac0_.id_configuracao_relatorio = configurac4_.id_configuracao_relatorio
	and (configurac4_.ativo)
inner join ensino_infantil.tipo_avaliacao_componente_relatorio tipoavalia5_ on
	configurac4_.id_tipo_avaliacao_componente_relatorio = tipoavalia5_.id_tipo_avaliacao_componente_relatorio
inner join ensino.componente_curricular componente6_ on
	configurac4_.id_componente_curricular = componente6_.id_componente_curricular
left outer join ensino_infantil.configuracao_relatorio_componente_habilidade configurac7_ on
	configurac4_.id_configuracao_relatorio_componente = configurac7_.id_configuracao_relatorio_componente
	and (configurac7_.ativo)
left outer join ensino_infantil.habilidade_competencia habilidade8_ on
	configurac7_.id_habilidade_competencia = habilidade8_.id_habilidade_competencia
where
	1 = 1
	and configurac0_.ativo = true
	and configurac4_.ativo = true
	and (configurac4_.id_tipo_avaliacao_componente_relatorio = 1
		or configurac4_.id_tipo_avaliacao_componente_relatorio = 2
		and configurac7_.ativo = true)
	and curriculob1_.id_curriculo_basico = 55456041;





--Não existe uma configuração de relatório avaliativo cadastrado para a série 3º Ano do(a) ENSINO FUNDAMENTAL - ANOS INICIAIS.

select * from ensino_infantil.configuracao_relatorio cr; 

-- SOLUÇÃO
UPDATE ensino.turma
	SET id_turma_agrupadora=NULL
	WHERE id_turma=739884;

UPDATE basico.curriculo_basico
	SET tipo_diario_diversificado=31, possui_parte_diversificada=true
	WHERE id_curriculo_basico=55456041;


commit;

---backup

UPDATE basico.curriculo_basico
	SET tipo_diario_diversificado=null, possui_parte_diversificada=false
	WHERE id_curriculo_basico=55456041;

UPDATE ensino.turma
	SET id_turma_agrupadora=739875
	WHERE id_turma=739884;
