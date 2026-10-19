select * from comum.pessoa p where p.nome  = 'MARIA DOS NAVEGANTES SANTOS' ---51870548


SELECT * 
FROM comum.pessoa p 
WHERE p.nome ILIKE '%MARIA DOS NAVEGANTES SANTOS%';

select * from comum.usuario u where u.id_pessoa = 51870548;

select * from comum.alteracao_registro_entrada where id_usuario in (104928);

begin;
rollback ;
commit;

--Solução
UPDATE comum.alteracao_registro_entrada SET id_usuario=105187 WHERE id_alteracao in (52110818, 52110819, 52110820, 52110821, 52175209)
DELETE FROM comum.usuario WHERE id_usuario=104928;

--Bacukp 
INSERT INTO comum.usuario (id_usuario, login, email, inativo, ultimo_acesso, autorizado, id_unidade, id_pessoa, tipo, ramal, objetivo_cadastro, justificativa_negado, id_foto, data_cadastro, expira_senha, id_servidor, funcionario, id_consignataria, hash_mobile_authenticator, data_ultimo_login_mobile) VALUES(104928, '123456', 'desenv@esig.com.br', true, NULL, true, 3446, 51870548, 3, '1234', NULL, NULL, NULL, '2021-05-28 11:58:22.208', NULL, NULL, false, NULL, NULL, NULL);
UPDATE comum.alteracao_registro_entrada SET id_usuario=104928 WHERE id_alteracao in (52110818, 52110819, 52110820, 52110821, 52175209)







Erro SQL [23503]: ERROR: update or delete on table "usuario" violates foreign key constraint "alteracao_registro_entrada_id_usuario_fkey" on table "alteracao_registro_entrada"
  Detalhe: Key (id_usuario)=(104928) is still referenced from table "alteracao_registro_entrada".






-- Auto-generated SQL script #202506260847
UPDATE comum.usuario
	SET inativo=false
	WHERE id_usuario=105187;


UPDATE comum.usuario
	SET inativo=true
	WHERE id_usuario=104928;

 select
	this_.id_usuario as id1_584_23_,
	this_.autorizado as autorizado584_23_,
	this_.data_cadastro as data3_584_23_,
	this_.data_ultimo_login_mobile as data4_584_23_,
	this_.email as email584_23_,
	this_.expira_senha as expira6_584_23_,
	this_.hash_mobile_authenticator as hash7_584_23_,
	this_.id_foto as id8_584_23_,
	this_.id_servidor as id9_584_23_,
	this_.inativo as inativo584_23_,
	this_.login as login584_23_,
	this_.id_pessoa as id14_584_23_,
	this_.ramal as ramal584_23_,
	this_.tipo as tipo584_23_,
	this_.ultimo_acesso as ultimo13_584_23_,
	this_.id_unidade as id15_584_23_,
	pessoa2_.id_pessoa as id1_545_0_,
	pessoa2_.cep as cep545_0_,
	pessoa2_.abreviatura as abreviat3_545_0_,
	pessoa2_.bairro as bairro545_0_,
	pessoa2_.bairro_atual as bairro5_545_0_,
	pessoa2_.id_bairro_endereco as id96_545_0_,
	pessoa2_.telefone_celular as telefone6_545_0_,
	pessoa2_.telefone_celular2 as telefone7_545_0_,
	pessoa2_.telefone_celular3 as telefone8_545_0_,
	pessoa2_.cep_atual as cep9_545_0_,
	pessoa2_.certidao_civil_data as certidao10_545_0_,
	pessoa2_.certidao_civil_modelo as certidao11_545_0_,
	pessoa2_.certidao_civil_id_municipio_cartorio as certidao92_545_0_,
	pessoa2_.certidao_civil_cartorio as certidao12_545_0_,
	pessoa2_.certidao_civil_num_folha as certidao13_545_0_,
	pessoa2_.certidao_civil_num_livro as certidao14_545_0_,
	pessoa2_.certidao_civil_matricula_nova as certidao15_545_0_,
	pessoa2_.certidao_civil_num_termo as certidao16_545_0_,
	pessoa2_.certidao_civil_tipo as certidao17_545_0_,
	pessoa2_.categoria_certificado_militar as categoria18_545_0_,
	pessoa2_.data_expedicao_certificado_militar as data19_545_0_,
	pessoa2_.numero_certificado_militar as numero20_545_0_,
	pessoa2_.orgao_expedicao_certificado_militar as orgao21_545_0_,
	pessoa2_.serie_certificado_militar as serie22_545_0_,
	pessoa2_.cid as cid545_0_,
	pessoa2_.codigo_inep as codigo24_545_0_,
	pessoa2_.codigo_nis as codigo25_545_0_,
	pessoa2_.codigo_rh as codigo26_545_0_,
	pessoa2_.codigo_rh_old as codigo27_545_0_,
	pessoa2_.codigo_sus as codigo28_545_0_,
	pessoa2_.id_conta_bancaria as id102_545_0_,
	pessoa2_.contato_celular as contato29_545_0_,
	pessoa2_.contato_celular2 as contato30_545_0_,
	pessoa2_.contato_celular3 as contato31_545_0_,
	pessoa2_.cpf_filiacao_1 as cpf32_545_0_,
	pessoa2_.cpf_filiacao_2 as cpf33_545_0_,
	pessoa2_.cpf_cnpj as cpf34_545_0_,
	pessoa2_.id_dados_pessoa_censo as id95_545_0_,
	pessoa2_.data_cadastro as data35_545_0_,
	pessoa2_.data_nascimento as data36_545_0_,
	pessoa2_.documento_militar as documento37_545_0_,
	pessoa2_.email as email545_0_,
	pessoa2_.email_alternativo as email39_545_0_,
	pessoa2_.endereco as endereco545_0_,
	pessoa2_.endereco_atual as endereco41_545_0_,
	pessoa2_.complemento as complem42_545_0_,
	pessoa2_.id_escolaridade as id105_545_0_,
	pessoa2_.id_estado_civil as id106_545_0_,
	pessoa2_.estrangeiro as estrang43_545_0_,
	pessoa2_.fax as fax545_0_,
	pessoa2_.grau_parentesco_responsavel_matricula as grau45_545_0_,
	pessoa2_.data_expedicao_identidade as data46_545_0_,
	pessoa2_.numero_identidade as numero47_545_0_,
	pessoa2_.orgao_expedicao_identidade as orgao48_545_0_,
	pessoa2_.id_unidade_federativa_identidade as id86_545_0_,
	pessoa2_.data_expedicao_identidade_mae as data49_545_0_,
	pessoa2_.numero_identidade_mae as numero50_545_0_,
	pessoa2_.orgao_expedicao_identidade_mae as orgao51_545_0_,
	pessoa2_.id_uf_identidade_mae as id88_545_0_,
	pessoa2_.data_expedicao_identidade_pai as data52_545_0_,
	pessoa2_.numero_identidade_pai as numero53_545_0_,
	pessoa2_.orgao_expedicao_identidade_pai as orgao54_545_0_,
	pessoa2_.id_uf_identidade_pai as id87_545_0_,
	pessoa2_.id_informacoes_medicas as id112_545_0_,
	pessoa2_.id_localizacao_zona as id109_545_0_,
	pessoa2_.id_municipio_naturalidade as id98_545_0_,
	pessoa2_.id_municipio_contato as id108_545_0_,
	pessoa2_.municipio_ext as municipio55_545_0_,
	pessoa2_.nome as nome545_0_,
	pessoa2_.nome_ascii as nome57_545_0_,
	pessoa2_.nome_mae as nome58_545_0_,
	pessoa2_.nome_pai as nome59_545_0_,
	pessoa2_.nome_responsavel_matricula as nome60_545_0_,
	pessoa2_.numero as numero545_0_,
	pessoa2_.numero_documento_responsavel_matricula as numero62_545_0_,
	pessoa2_.id_pais_nacionalidade as id90_545_0_,
	pessoa2_.pais_nacionalidade as pais63_545_0_,
	pessoa2_.passaporte as passaporte545_0_,
	pessoa2_.pis_pasep as pis65_545_0_,
	pessoa2_.possui_laudo as possui66_545_0_,
	pessoa2_.profissaoMae as profiss67_545_0_,
	pessoa2_.profissaoPai as profiss68_545_0_,
	pessoa2_.quilombola as quilombola545_0_,
	pessoa2_.sexo as sexo545_0_,
	pessoa2_.id_tamanho_calca_letra as id97_545_0_,
	pessoa2_.tamanho_calca_livre as tamanho71_545_0_,
	pessoa2_.tamanho_calcado as tamanho72_545_0_,
	pessoa2_.id_tamanho_camisa_letra as id101_545_0_,
	pessoa2_.tamanho_camisa_livre as tamanho73_545_0_,
	pessoa2_.id_tamanho_short_calca_letra as id111_545_0_,
	pessoa2_.tamanho_short_calca_livre as tamanho74_545_0_,
	pessoa2_.telefone_fixo as telefone75_545_0_,
	pessoa2_.tipo as tipo545_0_,
	pessoa2_.id_tipo_documento_militar as id94_545_0_,
	pessoa2_.tipo_documento_responsavel_matricula as tipo77_545_0_,
	pessoa2_.id_tipo_etnia as id89_545_0_,
	pessoa2_.id_tipo_militar as id91_545_0_,
	pessoa2_.id_raca as id104_545_0_,
	pessoa2_.tipo_sanguineo as tipo78_545_0_,
	pessoa2_.id_tipo_tamanho_calca as id103_545_0_,
	pessoa2_.id_tipo_tamanho_camisa as id99_545_0_,
	pessoa2_.id_tipo_tamanho_short_calca as id93_545_0_,
	pessoa2_.data_expedicao_titulo_eleitor as data79_545_0_,
	pessoa2_.numero_titulo_eleitor as numero80_545_0_,
	pessoa2_.secao_titulo_eleitor as secao81_545_0_,
	pessoa2_.id_unidade_federativa_titulo_eleitor as id107_545_0_,
	pessoa2_.zona_titulo_eleitor as zona82_545_0_,
	pessoa2_.id_uf_contato as id100_545_0_,
	pessoa2_.ultima_atualizacao as ultima83_545_0_,
	pessoa2_.id_uf_naturalidade as id110_545_0_,
	pessoa2_.uf_naturalidade_ext as uf84_545_0_,
	pessoa2_.valido as valido545_0_,
	bairroesco3_.id_bairro_escola as id1_982_1_,
	bairroesco3_.ativo as ativo982_1_,
	bairroesco3_.id_municipio as id4_982_1_,
	bairroesco3_.denominacao as denomina3_982_1_,
	municipio4_.id_municipio as id1_543_2_,
	municipio4_.ativo as ativo543_2_,
	municipio4_.codigo as codigo543_2_,
	municipio4_.codigo_acao as codigo4_543_2_,
	municipio4_.nome as nome543_2_,
	municipio4_.id_unidade_federativa as id6_543_2_,
	unidadefed5_.id_unidade_federativa as id1_578_3_,
	unidadefed5_.ativo as ativo578_3_,
	unidadefed5_.id_capital as id6_578_3_,
	unidadefed5_.descricao as descricao578_3_,
	unidadefed5_.id_pais as id5_578_3_,
	unidadefed5_.sigla as sigla578_3_,
	municipio6_.id_municipio as id1_543_4_,
	municipio6_.ativo as ativo543_4_,
	municipio6_.codigo as codigo543_4_,
	municipio6_.codigo_acao as codigo4_543_4_,
	municipio6_.nome as nome543_4_,
	municipio6_.id_unidade_federativa as id6_543_4_,
	pais7_.id_pais as id1_544_5_,
	pais7_.nacionalidade as nacional2_544_5_,
	pais7_.nome as nome544_5_,
	escolarida8_.id_escolaridade as id1_788_6_,
	escolarida8_.ativo as ativo788_6_,
	escolarida8_.descricao as descricao788_6_,
	estadocivi9_.id_estado_civil as id1_541_7_,
	estadocivi9_.ativo as ativo541_7_,
	estadocivi9_.descricao as descricao541_7_,
	unidadefed10_.id_unidade_federativa as id1_578_8_,
	unidadefed10_.ativo as ativo578_8_,
	unidadefed10_.id_capital as id6_578_8_,
	unidadefed10_.descricao as descricao578_8_,
	unidadefed10_.id_pais as id5_578_8_,
	unidadefed10_.sigla as sigla578_8_,
	municipio11_.id_municipio as id1_543_9_,
	municipio11_.ativo as ativo543_9_,
	municipio11_.codigo as codigo543_9_,
	municipio11_.codigo_acao as codigo4_543_9_,
	municipio11_.nome as nome543_9_,
	municipio11_.id_unidade_federativa as id6_543_9_,
	tamanhofar12_.id_tamanho as id1_665_10_,
	tamanhofar12_.ordem as ordem665_10_,
	tamanhofar12_.tamanho as tamanho665_10_,
	tamanhofar13_.id_tamanho as id1_665_11_,
	tamanhofar13_.ordem as ordem665_11_,
	tamanhofar13_.tamanho as tamanho665_11_,
	tamanhofar14_.id_tamanho as id1_665_12_,
	tamanhofar14_.ordem as ordem665_12_,
	tamanhofar14_.tamanho as tamanho665_12_,
	tipodocume15_.id_tipo_documento_militar as id1_942_13_,
	tipodocume15_.denominacao as denomina2_942_13_,
	tipomilita16_.id_tipo_militar as id1_944_14_,
	tipomilita16_.denominacao as denomina2_944_14_,
	tiporaca17_.id_tipo_raca as id1_554_15_,
	tiporaca17_.ativo as ativo554_15_,
	tiporaca17_.descricao as descricao554_15_,
	tipotamanh18_.id_tipo_tamanho as id1_664_16_,
	tipotamanh18_.descricao as descricao664_16_,
	tipotamanh18_.tamanhos_predefinidos as tamanhos3_664_16_,
	tipotamanh18_.tipo_selecione as tipo4_664_16_,
	tipotamanh18_.valido_para_camisa as valido5_664_16_,
	tipotamanh18_.valido_para_short_calca as valido6_664_16_,
	tipotamanh19_.id_tipo_tamanho as id1_664_17_,
	tipotamanh19_.descricao as descricao664_17_,
	tipotamanh19_.tamanhos_predefinidos as tamanhos3_664_17_,
	tipotamanh19_.tipo_selecione as tipo4_664_17_,
	tipotamanh19_.valido_para_camisa as valido5_664_17_,
	tipotamanh19_.valido_para_short_calca as valido6_664_17_,
	tipotamanh20_.id_tipo_tamanho as id1_664_18_,
	tipotamanh20_.descricao as descricao664_18_,
	tipotamanh20_.tamanhos_predefinidos as tamanhos3_664_18_,
	tipotamanh20_.tipo_selecione as tipo4_664_18_,
	tipotamanh20_.valido_para_camisa as valido5_664_18_,
	tipotamanh20_.valido_para_short_calca as valido6_664_18_,
	unidadefed21_.id_unidade_federativa as id1_578_19_,
	unidadefed21_.ativo as ativo578_19_,
	unidadefed21_.id_capital as id6_578_19_,
	unidadefed21_.descricao as descricao578_19_,
	unidadefed21_.id_pais as id5_578_19_,
	unidadefed21_.sigla as sigla578_19_,
	unidadefed22_.id_unidade_federativa as id1_578_20_,
	unidadefed22_.ativo as ativo578_20_,
	unidadefed22_.id_capital as id6_578_20_,
	unidadefed22_.descricao as descricao578_20_,
	unidadefed22_.id_pais as id5_578_20_,
	unidadefed22_.sigla as sigla578_20_,
	tipousuari23_.id as id525_21_,
	tipousuari23_.interno as interno525_21_,
	tipousuari23_.nome as nome525_21_,
	unidade24_.id_unidade as id1_579_22_,
	unidade24_.ativo as ativo579_22_,
	unidade24_.bairro as bairro579_22_,
	unidade24_.cep as cep579_22_,
	unidade24_.cnpj as cnpj579_22_,
	unidade24_.codigo_unidade as codigo6_579_22_,
	unidade24_.codigo_inep as codigo7_579_22_,
	unidade24_.codigo_rh as codigo8_579_22_,
	unidade24_.complemento as compleme9_579_22_,
	unidade24_.data_cadastro as data10_579_22_,
	unidade24_.distrito as distrito579_22_,
	unidade24_.email as email579_22_,
	unidade24_.endereco as endereco579_22_,
	unidade24_.fax as fax579_22_,
	unidade24_.hierarquia as hierarquia579_22_,
	unidade24_.id_municipio as id16_579_22_,
	unidade24_.instituicao_ensino_superior as institu17_579_22_,
	unidade24_.nome as nome579_22_,
	unidade24_.nome_ascii as nome19_579_22_,
	unidade24_.numero as numero579_22_,
	unidade24_.sigla as sigla579_22_,
	unidade24_.telefone as telefone579_22_,
	unidade24_.tipo as tipo579_22_,
	unidade24_.uf as uf579_22_,
	unidade24_.unidade_orcamentaria as unidade25_579_22_,
	unidade24_.id_responsavel as id26_579_22_
from
	comum.usuario this_
left outer join comum.pessoa pessoa2_ on
	this_.id_pessoa = pessoa2_.id_pessoa
left outer join escola.bairro_escola bairroesco3_ on
	pessoa2_.id_bairro_endereco = bairroesco3_.id_bairro_escola
left outer join comum.municipio municipio4_ on
	bairroesco3_.id_municipio = municipio4_.id_municipio
left outer join comum.unidade_federativa unidadefed5_ on
	municipio4_.id_unidade_federativa = unidadefed5_.id_unidade_federativa
left outer join comum.municipio municipio6_ on
	unidadefed5_.id_capital = municipio6_.id_municipio
left outer join comum.pais pais7_ on
	unidadefed5_.id_pais = pais7_.id_pais
left outer join pessoas.escolaridade escolarida8_ on
	pessoa2_.id_escolaridade = escolarida8_.id_escolaridade
left outer join comum.estado_civil estadocivi9_ on
	pessoa2_.id_estado_civil = estadocivi9_.id_estado_civil
left outer join comum.unidade_federativa unidadefed10_ on
	pessoa2_.id_unidade_federativa_identidade = unidadefed10_.id_unidade_federativa
left outer join comum.municipio municipio11_ on
	pessoa2_.id_municipio_contato = municipio11_.id_municipio
left outer join comum.tamanho_fardamento tamanhofar12_ on
	pessoa2_.id_tamanho_calca_letra = tamanhofar12_.id_tamanho
left outer join comum.tamanho_fardamento tamanhofar13_ on
	pessoa2_.id_tamanho_camisa_letra = tamanhofar13_.id_tamanho
left outer join comum.tamanho_fardamento tamanhofar14_ on
	pessoa2_.id_tamanho_short_calca_letra = tamanhofar14_.id_tamanho
left outer join matricula.tipo_documento_militar tipodocume15_ on
	pessoa2_.id_tipo_documento_militar = tipodocume15_.id_tipo_documento_militar
left outer join matricula.tipo_militar tipomilita16_ on
	pessoa2_.id_tipo_militar = tipomilita16_.id_tipo_militar
left outer join comum.tipo_raca tiporaca17_ on
	pessoa2_.id_raca = tiporaca17_.id_tipo_raca
left outer join comum.tipo_tamanho_fardamento tipotamanh18_ on
	pessoa2_.id_tipo_tamanho_calca = tipotamanh18_.id_tipo_tamanho
left outer join comum.tipo_tamanho_fardamento tipotamanh19_ on
	pessoa2_.id_tipo_tamanho_camisa = tipotamanh19_.id_tipo_tamanho
left outer join comum.tipo_tamanho_fardamento tipotamanh20_ on
	pessoa2_.id_tipo_tamanho_short_calca = tipotamanh20_.id_tipo_tamanho
left outer join comum.unidade_federativa unidadefed21_ on
	pessoa2_.id_uf_contato = unidadefed21_.id_unidade_federativa
left outer join comum.unidade_federativa unidadefed22_ on
	pessoa2_.id_uf_naturalidade = unidadefed22_.id_unidade_federativa
inner join comum.tipo_usuario tipousuari23_ on
	this_.tipo = tipousuari23_.id
left outer join comum.unidade unidade24_ on
	this_.id_unidade = unidade24_.id_unidade
where
	this_.login in ('123456', '93839847400');
