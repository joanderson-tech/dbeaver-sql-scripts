SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico = 52142878;



UPDATE ensino_infantil.opcao_grupo_avaliacao_relatorio
	SET id_grupo_avaliacao_relatorio=6 
	WHERE id_opcao_grupo_avaliacao_relatorio IN (33, 34, 30);

UPDATE ensino_infantil.opcao_grupo_avaliacao_relatorio
	SET id_grupo_avaliacao_relatorio=NULL 
	WHERE id_opcao_grupo_avaliacao_relatorio IN (33, 34, 30);



SELECT gar.* FROM  ensino_infantil.configuracao_relatorio cr 
 JOIN ensino_infantil.grupo_avaliacao_relatorio gar ON gar.id_grupo_avaliacao_relatorio = cr.id_grupo_avaliacao_relatorio
LEFT JOIN ensino_infantil.opcao_grupo_avaliacao_relatorio ogar ON ogar.id_grupo_avaliacao_relatorio = gar.id_grupo_avaliacao_relatorio
WHERE cr.id_configuracao_relatorio  = 12;



SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie = 51892919;
SELECT * FROM ensino_infantil.tipo_avaliacao_componente_relatorio tacr;

SELECT * FROM ensino_infantil.opcao_grupo_avaliacao_relatorio ;
SELECT * FROM ensino_infantil.grupo_avaliacao_relatorio


SELECT *
FROM ensino_infantil.relatorio_avaliativo ra
WHERE ra.id_matricula_discente_serie IN (1319307, 1319336, 1319328, 1319338, 1319339, 1319408, 1319417, 1322385, 1322396, 1322399, 1322687, 1322692, 1324668, 1324222, 1319342, 1319343, 1319346, 1324443, 1322690, 1322691, 1322689);

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie IN (51892919);

SELECT mes.*
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie IN (51892919)
AND NOT EXISTS (
    SELECT 1
FROM ensino_infantil.relatorio_avaliativo ra
WHERE ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
);

SELECT *
FROM matricula.solicitacao_transferencia st
WHERE st.id_matricula_discente_serie IN (1319417, 1322687, 1324222)

1319336

SELECT ra.id_relatorio_avaliativo AS id_relatorio, ra.id_configuracao_relatorio AS id_configuracao,  cr.id_configuracao_relatorio, cr.possui_parecer_descritivo AS possui_parecer_descritivo, ra.id_matricula_discente_serie AS id_mes, mes.id_turma_serie, mes.id_turma_serie_multisseriado, ra.id_situacao_relatorio_avaliativo AS id_situacao_relatorio, ra.ativo AS ativo_relatorio, ra.id_parecer_descritivo_individual AS id_parecer, pdi.ativo AS ativo_parecer , ra.situacao AS relatorio_situacao, ra.justificativa_situacao AS relatorio_justificativa_situacao, cb.possui_parte_diversificada, cb.tipo_diario, cb.tipo_diario_diversificado, rac.id_configuracao_relatorio_componente AS id_configuracao_componente, crc.possui_parecer_final_fixo, crc.possui_parecer_final_descritivo, rac.id_relatorio_avaliativo_componente AS id_relatorio_componente, rac.parecer_final_fixo, rac.parecer_final_descritivo, mc.id_matricula_componente AS id_matricula_componente, rac.avaliacao_descritiva AS avaliacao_descritiva, rac.id_situacao_relatorio_avaliativo_componente AS situacao_componente, rac.avaliacao_descritiva_2 AS avaliacao_descritiva_2, rac.avaliacao_descritiva_3 AS avaliacao_descritiva_3, rac.avaliacao_descritiva_4 AS avaliacao_descritiva_4, rah.id_relatorio_avaliativo_habilidade AS id_relatorio_habilidade, rah.id_configuracao_relatorio_componente_habilidade AS id_configuracao_habilidade, crch.ativo AS configuracao_habilidade_ativo, rahr.id_relatorio_avaliativo_habilidade_resposta AS id_relatorio_resposta, rahr.id_opcao_grupo_avaliacao_relatorio AS id_opcao_resposta, rahr.periodo AS resposta_periodo, pdi.descricao AS parecer_descricao, pdi.descricao_medial AS parecer_descricao_medial, pdi.descricao_final AS parecer_descricao_final, p.nome AS pessoa_nome, p.nome_social AS nome_social, p.nome_mae AS nome_mae, p.nome_pai AS nome_pai, d.matricula AS matricula, sms.descricao AS situacao_descricao, pr.id_periodicidade_relatorio AS periodicidade_relatorio, pr.descricao AS periodicidade_descricao, pr.quantidade_repeticoes AS periodicidade_qtd_repeticoes, pr.unidade_descricao AS unidade_descricao, tacr.id_tipo_avaliacao_componente_relatorio AS id_tipo_avaliacao, ogar.id_opcao_grupo_avaliacao_relatorio AS opcao_id, ogar.sigla AS opcao_sigla, ogar.descricao AS opcao_descricao, cc.nome AS componente_nome, cc.id_componente_curricular AS id_componente_curricular, ac.descricao AS area_conhecimento_descricao, hc.id_habilidade_competencia AS id_habilidade_competencia, hc.descricao AS habilidade_descricao, crc.maximo_caracteres_relatorio, t.id_categoria_componente
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
JOIN ensino_infantil.relatorio_avaliativo ra ON
mes.id_matricula_discente_serie = ra.id_matricula_discente_serie
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
LEFT JOIN ensino_infantil.parecer_descritivo_individual pdi ON
pdi.id_parecer_descritivo_individual = ra.id_parecer_descritivo_individual
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON
rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
LEFT JOIN ensino_infantil.configuracao_relatorio cr ON cr.id_configuracao_relatorio = ra.id_configuracao_relatorio
LEFT JOIN ensino_infantil.grupo_avaliacao_relatorio gar ON
gar.id_grupo_avaliacao_relatorio = cr.id_grupo_avaliacao_relatorio
LEFT JOIN ensino_infantil.opcao_grupo_avaliacao_relatorio ogar ON
ogar.id_grupo_avaliacao_relatorio = gar.id_grupo_avaliacao_relatorio
LEFT JOIN ensino_infantil.periodicidade_relatorio pr ON
pr.id_periodicidade_relatorio = cr.id_periodicidade_relatorio
LEFT JOIN ensino_infantil.tipo_avaliacao_componente_relatorio tacr ON
tacr.id_tipo_avaliacao_componente_relatorio = crc.id_tipo_avaliacao_componente_relatorio
LEFT JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = crc.id_componente_curricular
LEFT JOIN ensino_infantil.area_conhecimento ac ON
ac.id_area_conhecimento = cc.id_area_conhecimento
LEFT JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON
crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
LEFT JOIN ensino_infantil.habilidade_competencia hc ON
hc.id_habilidade_competencia = crch.id_habilidade_competencia
LEFT JOIN ensino.turma t ON
t.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
AND t.id_disciplina = crc.id_componente_curricular
AND t.id_situacao_turma <> 4
LEFT JOIN ensino.matricula_componente mc ON
mc.id_discente = d.id_discente
AND mc.id_componente_curricular = crc.id_componente_curricular
AND mc.id_turma = t.id_turma
LEFT JOIN basico.curriculo_basico cb ON
cb.id_curriculo_basico = cr.id_curriculo_basico
WHERE ra.ativo
AND crc.ativo
AND ((cr.possui_parecer_descritivo
	AND pdi.ativo)
OR NOT cr.possui_parecer_descritivo)
AND d.status <> 2
AND ((ra.id_situacao_relatorio_avaliativo <> 4
	AND rac.id_situacao_relatorio_avaliativo_componente <> 4)
OR (mes.id_situacao_matricula_serie = 4
	AND ( SELECT count(*)
FROM basico.movimentacao_estudante me
WHERE me.id_discente = mc.id_discente
	AND me.ativo
	AND me.id_tipo_movimentacao_estudante = 3
	AND ano_escolar = mes.ano_calendario ) > 0) )
AND mes.id_matricula_discente_serie IN ( 1322385, 1324668, 1322396, 1322399, 1322690, 1319336, 1319307, 1319342, 1322691, 1319328, 1319338, 1319408, 1319339, 1319343, 1322689, 1319346 )
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8, 9, 4 )
AND crc.id_componente_curricular NOT IN (518);

SELECT cbc.id_componente_curricular
FROM basico.curriculo_basico cb
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = cb.id_curriculo_basico
JOIN basico.turma_serie ts ON
ts.id_turma_serie = 51892919
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
RIGHT JOIN ensino.docente_turma dt ON
dt.id_turma = t.id_turma
WHERE cbc.permite_alocacao_adjunto
AND cb.ativo
AND NOT dt.finalizada
AND dt.ativo
AND cbc.id_componente_curricular = t.id_disciplina
AND ts.id_curriculo_medio = cb.id_curriculo_basico;

SELECT ra.id_relatorio_avaliativo AS id_relatorio, ra.id_configuracao_relatorio AS id_configuracao, cr.possui_parecer_descritivo AS possui_parecer_descritivo, ra.id_matricula_discente_serie AS id_mes, mes.id_turma_serie, mes.id_turma_serie_multisseriado, ra.id_situacao_relatorio_avaliativo AS id_situacao_relatorio, ra.ativo AS ativo_relatorio, ra.id_parecer_descritivo_individual AS id_parecer, pdi.ativo AS ativo_parecer , ra.situacao AS relatorio_situacao, ra.justificativa_situacao AS relatorio_justificativa_situacao, cb.possui_parte_diversificada, cb.tipo_diario, cb.tipo_diario_diversificado, rac.id_configuracao_relatorio_componente AS id_configuracao_componente, crc.possui_parecer_final_fixo, crc.possui_parecer_final_descritivo, rac.id_relatorio_avaliativo_componente AS id_relatorio_componente, rac.parecer_final_fixo, rac.parecer_final_descritivo, mc.id_matricula_componente AS id_matricula_componente, rac.avaliacao_descritiva AS avaliacao_descritiva, rac.id_situacao_relatorio_avaliativo_componente AS situacao_componente, rac.avaliacao_descritiva_2 AS avaliacao_descritiva_2, rac.avaliacao_descritiva_3 AS avaliacao_descritiva_3, rac.avaliacao_descritiva_4 AS avaliacao_descritiva_4, rah.id_relatorio_avaliativo_habilidade AS id_relatorio_habilidade, rah.id_configuracao_relatorio_componente_habilidade AS id_configuracao_habilidade, crch.ativo AS configuracao_habilidade_ativo, rahr.id_relatorio_avaliativo_habilidade_resposta AS id_relatorio_resposta, rahr.id_opcao_grupo_avaliacao_relatorio AS id_opcao_resposta, rahr.periodo AS resposta_periodo, pdi.descricao AS parecer_descricao, pdi.descricao_medial AS parecer_descricao_medial, pdi.descricao_final AS parecer_descricao_final, p.nome AS pessoa_nome, p.nome_social AS nome_social, p.nome_mae AS nome_mae, p.nome_pai AS nome_pai, d.matricula AS matricula, sms.descricao AS situacao_descricao, pr.id_periodicidade_relatorio AS periodicidade_relatorio, pr.descricao AS periodicidade_descricao, pr.quantidade_repeticoes AS periodicidade_qtd_repeticoes, pr.unidade_descricao AS unidade_descricao, tacr.id_tipo_avaliacao_componente_relatorio AS id_tipo_avaliacao, ogar.id_opcao_grupo_avaliacao_relatorio AS opcao_id, ogar.sigla AS opcao_sigla, ogar.descricao AS opcao_descricao, cc.nome AS componente_nome, cc.id_componente_curricular AS id_componente_curricular, ac.descricao AS area_conhecimento_descricao, hc.id_habilidade_competencia AS id_habilidade_competencia, hc.descricao AS habilidade_descricao, crc.maximo_caracteres_relatorio, t.id_categoria_componente
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
JOIN ensino_infantil.relatorio_avaliativo ra ON
mes.id_matricula_discente_serie = ra.id_matricula_discente_serie
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
LEFT JOIN ensino_infantil.parecer_descritivo_individual pdi ON
pdi.id_parecer_descritivo_individual = ra.id_parecer_descritivo_individual
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON
rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
LEFT JOIN ensino_infantil.configuracao_relatorio cr ON
cr.id_configuracao_relatorio = ra.id_configuracao_relatorio
LEFT JOIN ensino_infantil.grupo_avaliacao_relatorio gar ON
gar.id_grupo_avaliacao_relatorio = cr.id_grupo_avaliacao_relatorio
LEFT JOIN ensino_infantil.opcao_grupo_avaliacao_relatorio ogar ON
ogar.id_grupo_avaliacao_relatorio = gar.id_grupo_avaliacao_relatorio
LEFT JOIN ensino_infantil.periodicidade_relatorio pr ON
pr.id_periodicidade_relatorio = cr.id_periodicidade_relatorio
LEFT JOIN ensino_infantil.tipo_avaliacao_componente_relatorio tacr ON
tacr.id_tipo_avaliacao_componente_relatorio = crc.id_tipo_avaliacao_componente_relatorio
LEFT JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = crc.id_componente_curricular
LEFT JOIN ensino_infantil.area_conhecimento ac ON
ac.id_area_conhecimento = cc.id_area_conhecimento
LEFT JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON
crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
LEFT JOIN ensino_infantil.habilidade_competencia hc ON
hc.id_habilidade_competencia = crch.id_habilidade_competencia
LEFT JOIN ensino.turma t ON
t.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
AND t.id_disciplina = crc.id_componente_curricular
AND t.id_situacao_turma <> 4
LEFT JOIN ensino.matricula_componente mc ON
mc.id_discente = d.id_discente
AND mc.id_componente_curricular = crc.id_componente_curricular
AND mc.id_turma = t.id_turma
LEFT JOIN basico.curriculo_basico cb ON
cb.id_curriculo_basico = cr.id_curriculo_basico
WHERE ra.ativo
AND crc.ativo
AND ((cr.possui_parecer_descritivo
	AND pdi.ativo)
OR NOT cr.possui_parecer_descritivo)
AND d.status <> 2
AND ((ra.id_situacao_relatorio_avaliativo <> 4
	AND rac.id_situacao_relatorio_avaliativo_componente <> 4)
OR (mes.id_situacao_matricula_serie = 4
	AND ( SELECT count(*)
FROM basico.movimentacao_estudante me
WHERE me.id_discente = mc.id_discente
	AND me.ativo
	AND me.id_tipo_movimentacao_estudante = 3
	AND ano_escolar = mes.ano_calendario ) > 0) )
AND mes.id_matricula_discente_serie IN ( 1322385, 1324668, 1322396, 1322399, 1322690, 1319336, 1319307, 1319342, 1322691, 1319328, 1319338, 1319408, 1319339, 1319343, 1322689, 1319346 )
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8, 9, 4 )
AND crc.id_componente_curricular NOT IN (518);

select estudante0_.id_estudante as id1_897_32_, estudante0_.codigo_inep as codigo2_897_32_, estudante0_.data_atualizacao as data3_897_32_, estudante0_.data_matricula as data4_897_32_, estudante0_.escola_anterior as escola5_897_32_, estudante0_.participa_bolsa_familia as participa6_897_32_, estudante0_.participa_escotismo as participa7_897_32_, estudante0_.participa_tributo_crianca as participa8_897_32_, estudante0_.id_registro_atualizacao as id11_897_32_, estudante0_.id_serie_ingresso as id12_897_32_, estudante0_.id_tipo_instituicao_origem as id10_897_32_, estudante0_.utiliza_transporte_escolar_publico as utiliza9_897_32_, discente1_.id_discente as id1_537_0_, discente1_.ano_ingresso as ano2_537_0_, discente1_.id_registro_entrada as id15_537_0_, discente1_.id_curso as id14_537_0_, discente1_.data_cadastro as data3_537_0_, discente1_.id_forma_ingresso as id16_537_0_, discente1_.id_gestora_academica as id17_537_0_, discente1_.id_foto as id4_537_0_, discente1_.id_historico_digital as id5_537_0_, discente1_.id_perfil as id6_537_0_, discente1_.matricula as matricula537_0_, discente1_.matricula_antiga as matricula8_537_0_, discente1_.nivel as nivel537_0_, discente1_.observacao as observacao537_0_, discente1_.id_pessoa as id13_537_0_, discente1_.status as status537_0_, discente1_.tipo as tipo537_0_, curso2_.id_curso as id1_582_1_, curso2_.ativo as ativo582_1_, curso2_.avaliacao_curso as avaliacao3_582_1_, curso2_.campo_atuacao as campo4_582_1_, curso2_.cod_programa_capes as cod5_582_1_, curso2_.codigo as codigo582_1_, curso2_.codigo_inep as codigo7_582_1_, curso2_.competencias_habilidades as competen8_582_1_, curso2_.data_atualizacao as data9_582_1_, curso2_.data_cadastro as data10_582_1_, curso2_.dataDecreto as dataDec11_582_1_, curso2_.dou as dou582_1_, curso2_.gestao_curso as gestao13_582_1_, curso2_.id_arquivo as id14_582_1_, curso2_.metodologia as metodol15_582_1_, curso2_.id_modalidade_educacao as id32_582_1_, curso2_.id_municipio as id29_582_1_, curso2_.nivel as nivel582_1_, curso2_.nome as nome582_1_, curso2_.nome_ascii as nome18_582_1_, curso2_.perfil_profissional as perfil19_582_1_, curso2_.permitealunosvariosvinculos as permite20_582_1_, curso2_.pode_matricular as pode21_582_1_, curso2_.reconhecimentoPortaria as reconhe22_582_1_, curso2_.rede as rede582_1_, curso2_.id_registro_atualizacao as id26_582_1_, curso2_.id_registro_cadastro as id28_582_1_, curso2_.titulacao as titulacao582_1_, curso2_.id_unidade as id31_582_1_, curso2_.id_unidade2 as id33_582_1_, curso2_.id_unidade_coordenacao as id27_582_1_, curso2_.id_unidade_referencia_mcn as id30_582_1_, curso2_.website as website582_1_, modalidade3_.id_modalidade_educacao as id1_586_2_, modalidade3_.descricao as descricao586_2_, municipio4_.id_municipio as id1_543_3_, municipio4_.ativo as ativo543_3_, municipio4_.codigo as codigo543_3_, municipio4_.codigo_acao as codigo4_543_3_, municipio4_.nome as nome543_3_, municipio4_.id_unidade_federativa as id6_543_3_, unidadefed5_.id_unidade_federativa as id1_579_4_, unidadefed5_.ativo as ativo579_4_, unidadefed5_.id_capital as id6_579_4_, unidadefed5_.descricao as descricao579_4_, unidadefed5_.id_pais as id5_579_4_, unidadefed5_.sigla as sigla579_4_, municipio6_.id_municipio as id1_543_5_, municipio6_.ativo as ativo543_5_, municipio6_.codigo as codigo543_5_, municipio6_.codigo_acao as codigo4_543_5_, municipio6_.nome as nome543_5_, municipio6_.id_unidade_federativa as id6_543_5_, pais7_.id_pais as id1_544_6_, pais7_.nacionalidade as nacional2_544_6_, pais7_.nome as nome544_6_, unidade8_.id_unidade as id1_580_7_, unidade8_.ativo as ativo580_7_, unidade8_.bairro as bairro580_7_, unidade8_.cep as cep580_7_, unidade8_.cnpj as cnpj580_7_, unidade8_.codigo_unidade as codigo6_580_7_, unidade8_.codigo_inep as codigo7_580_7_, unidade8_.codigo_rh as codigo8_580_7_, unidade8_.complemento as compleme9_580_7_, unidade8_.data_cadastro as data10_580_7_, unidade8_.distrito as distrito580_7_, unidade8_.email as email580_7_, unidade8_.endereco as endereco580_7_, unidade8_.fax as fax580_7_, unidade8_.hierarquia as hierarquia580_7_, unidade8_.id_municipio as id16_580_7_, unidade8_.instituicao_ensino_superior as institu17_580_7_, unidade8_.nome as nome580_7_, unidade8_.nome_ascii as nome19_580_7_, unidade8_.numero as numero580_7_, unidade8_.sigla as sigla580_7_, unidade8_.telefone as telefone580_7_, unidade8_.tipo as tipo580_7_, unidade8_.uf as uf580_7_, unidade8_.unidade_orcamentaria as unidade25_580_7_, unidade8_.id_responsavel as id26_580_7_, formaingre9_.id_forma_ingresso as id1_613_8_, formaingre9_.ativo as ativo613_8_, formaingre9_.descricao as descricao613_8_, formaingre9_.nivel as nivel613_8_, formaingre9_.permite_emprestimo_biblioteca as permite5_613_8_, formaingre9_.tipo_forma as tipo6_613_8_, unidade10_.id_unidade as id1_580_9_, unidade10_.ativo as ativo580_9_, unidade10_.bairro as bairro580_9_, unidade10_.cep as cep580_9_, unidade10_.cnpj as cnpj580_9_, unidade10_.codigo_unidade as codigo6_580_9_, unidade10_.codigo_inep as codigo7_580_9_, unidade10_.codigo_rh as codigo8_580_9_, unidade10_.complemento as compleme9_580_9_, unidade10_.data_cadastro as data10_580_9_, unidade10_.distrito as distrito580_9_, unidade10_.email as email580_9_, unidade10_.endereco as endereco580_9_, unidade10_.fax as fax580_9_, unidade10_.hierarquia as hierarquia580_9_, unidade10_.id_municipio as id16_580_9_, unidade10_.instituicao_ensino_superior as institu17_580_9_, unidade10_.nome as nome580_9_, unidade10_.nome_ascii as nome19_580_9_, unidade10_.numero as numero580_9_, unidade10_.sigla as sigla580_9_, unidade10_.telefone as telefone580_9_, unidade10_.tipo as tipo580_9_, unidade10_.uf as uf580_9_, unidade10_.unidade_orcamentaria as unidade25_580_9_, unidade10_.id_responsavel as id26_580_9_, pessoa11_.id_pessoa as id1_545_10_, pessoa11_.cep as cep545_10_, pessoa11_.abreviatura as abreviat3_545_10_, pessoa11_.bairro as bairro545_10_, pessoa11_.bairro_atual as bairro5_545_10_, pessoa11_.id_bairro_endereco as id121_545_10_, pessoa11_.telefone_celular as telefone6_545_10_, pessoa11_.telefone_celular2 as telefone7_545_10_, pessoa11_.telefone_celular3 as telefone8_545_10_, pessoa11_.cep_atual as cep9_545_10_, pessoa11_.certidao_civil_data as certidao10_545_10_, pessoa11_.certidao_civil_modelo as certidao11_545_10_, pessoa11_.certidao_civil_id_municipio_cartorio as certidao103_545_10_, pessoa11_.certidao_civil_cartorio as certidao12_545_10_, pessoa11_.certidao_civil_num_folha as certidao13_545_10_, pessoa11_.certidao_civil_num_livro as certidao14_545_10_, pessoa11_.certidao_civil_matricula_nova as certidao15_545_10_, pessoa11_.certidao_civil_num_termo as certidao16_545_10_, pessoa11_.certidao_civil_tipo as certidao17_545_10_, pessoa11_.categoria_certificado_militar as categoria18_545_10_, pessoa11_.data_expedicao_certificado_militar as data19_545_10_, pessoa11_.numero_certificado_militar as numero20_545_10_, pessoa11_.orgao_expedicao_certificado_militar as orgao21_545_10_, pessoa11_.serie_certificado_militar as serie22_545_10_, pessoa11_.cid as cid545_10_, pessoa11_.codigo_familia as codigo24_545_10_, pessoa11_.codigo_inep as codigo25_545_10_, pessoa11_.codigo_nis as codigo26_545_10_, pessoa11_.codigo_rh as codigo27_545_10_, pessoa11_.codigo_rh_old as codigo28_545_10_, pessoa11_.codigo_sus as codigo29_545_10_, pessoa11_.id_conta_bancaria as id111_545_10_, pessoa11_.contato_celular as contato30_545_10_, pessoa11_.contato_celular2 as contato31_545_10_, pessoa11_.contato_celular3 as contato32_545_10_, pessoa11_.cpf_filiacao_1 as cpf33_545_10_, pessoa11_.cpf_filiacao_2 as cpf34_545_10_, pessoa11_.cpf_cnpj as cpf35_545_10_, pessoa11_.id_dados_pessoa_censo as id95_545_10_, pessoa11_.data_cadastro as data36_545_10_, pessoa11_.data_nascimento as data37_545_10_, pessoa11_.data_nascimento_filiacao_1 as data38_545_10_, pessoa11_.data_nascimento_filiacao_2 as data39_545_10_, pessoa11_.data_nascimento_responsavel as data40_545_10_, pessoa11_.documento_militar as documento41_545_10_, pessoa11_.email as email545_10_, pessoa11_.email_alternativo as email43_545_10_, pessoa11_.endereco as endereco545_10_, pessoa11_.endereco_atual as endereco45_545_10_, pessoa11_.complemento as complem46_545_10_, pessoa11_.id_escolaridade as id108_545_10_, pessoa11_.id_estado_civil as id97_545_10_, pessoa11_.estrangeiro as estrang47_545_10_, pessoa11_.fax as fax545_10_, pessoa11_.grau_parentesco_responsavel_matricula as grau49_545_10_, pessoa11_.id_grau_parentesco_responsavel_matricula as id50_545_10_, pessoa11_.data_expedicao_identidade as data51_545_10_, pessoa11_.numero_identidade as numero52_545_10_, pessoa11_.orgao_expedicao_identidade as orgao53_545_10_, pessoa11_.id_unidade_federativa_identidade as id92_545_10_, pessoa11_.data_expedicao_identidade_mae as data54_545_10_, pessoa11_.numero_identidade_mae as numero55_545_10_, pessoa11_.orgao_expedicao_identidade_mae as orgao56_545_10_, pessoa11_.id_uf_identidade_mae as id94_545_10_, pessoa11_.data_expedicao_identidade_pai as data57_545_10_, pessoa11_.numero_identidade_pai as numero58_545_10_, pessoa11_.orgao_expedicao_identidade_pai as orgao59_545_10_, pessoa11_.id_uf_identidade_pai as id93_545_10_, pessoa11_.id_informacoes_medicas as id115_545_10_, pessoa11_.id_localizacao_zona as id107_545_10_, pessoa11_.id_municipio_naturalidade as id98_545_10_, pessoa11_.id_municipio_contato as id99_545_10_, pessoa11_.municipio_ext as municipio60_545_10_, pessoa11_.nome as nome545_10_, pessoa11_.nome_ascii as nome62_545_10_, pessoa11_.nome_mae as nome63_545_10_, pessoa11_.nome_pai as nome64_545_10_, pessoa11_.nome_responsavel_matricula as nome65_545_10_, pessoa11_.nome_social as nome66_545_10_, pessoa11_.numero as numero545_10_, pessoa11_.numero_documento_responsavel_matricula as numero68_545_10_, pessoa11_.id_pais_nacionalidade as id104_545_10_, pessoa11_.pais_nacionalidade as pais69_545_10_, pessoa11_.passaporte as passaporte545_10_, pessoa11_.pis_pasep as pis71_545_10_, pessoa11_.possui_laudo as possui72_545_10_, pessoa11_.id_povo_indigena as id112_545_10_, pessoa11_.profissaoMae as profiss73_545_10_, pessoa11_.profissaoPai as profiss74_545_10_, pessoa11_.quilombola as quilombola545_10_, pessoa11_.sexo as sexo545_10_, pessoa11_.id_tamanho_calca_letra as id116_545_10_, pessoa11_.tamanho_calca_livre as tamanho77_545_10_, pessoa11_.tamanho_calcado as tamanho78_545_10_, pessoa11_.id_tamanho_camisa_letra as id117_545_10_, pessoa11_.tamanho_camisa_livre as tamanho79_545_10_, pessoa11_.id_tamanho_camisa_predefinido as id110_545_10_, pessoa11_.id_tamanho_short_calca_letra as id120_545_10_, pessoa11_.tamanho_short_calca_livre as tamanho80_545_10_, pessoa11_.id_tamanho_short_calca_predefinido as id96_545_10_, pessoa11_.telefone_fixo as telefone81_545_10_, pessoa11_.tipo as tipo545_10_, pessoa11_.id_tipo_documento_militar as id118_545_10_, pessoa11_.tipo_documento_responsavel_matricula as tipo83_545_10_, pessoa11_.id_tipo_etnia as id105_545_10_, pessoa11_.id_tipo_militar as id119_545_10_, pessoa11_.id_raca as id101_545_10_, pessoa11_.tipo_sanguineo as tipo84_545_10_, pessoa11_.id_tipo_tamanho_calca as id102_545_10_, pessoa11_.id_tipo_tamanho_camisa as id106_545_10_, pessoa11_.id_tipo_tamanho_short_calca as id114_545_10_, pessoa11_.data_expedicao_titulo_eleitor as data85_545_10_, pessoa11_.numero_titulo_eleitor as numero86_545_10_, pessoa11_.secao_titulo_eleitor as secao87_545_10_, pessoa11_.id_unidade_federativa_titulo_eleitor as id100_545_10_, pessoa11_.zona_titulo_eleitor as zona88_545_10_, pessoa11_.id_uf_contato as id109_545_10_, pessoa11_.ultima_atualizacao as ultima89_545_10_, pessoa11_.id_uf_naturalidade as id113_545_10_, pessoa11_.uf_naturalidade_ext as uf90_545_10_, pessoa11_.valido as valido545_10_, bairroesco12_.id_bairro_escola as id1_994_11_, bairroesco12_.ativo as ativo994_11_, bairroesco12_.id_municipio as id4_994_11_, bairroesco12_.denominacao as denomina3_994_11_, municipio13_.id_municipio as id1_543_12_, municipio13_.ativo as ativo543_12_, municipio13_.codigo as codigo543_12_, municipio13_.codigo_acao as codigo4_543_12_, municipio13_.nome as nome543_12_, municipio13_.id_unidade_federativa as id6_543_12_, escolarida14_.id_escolaridade as id1_793_13_, escolarida14_.ativo as ativo793_13_, escolarida14_.descricao as descricao793_13_, estadocivi15_.id_estado_civil as id1_541_14_, estadocivi15_.ativo as ativo541_14_, estadocivi15_.descricao as descricao541_14_, unidadefed16_.id_unidade_federativa as id1_579_15_, unidadefed16_.ativo as ativo579_15_, unidadefed16_.id_capital as id6_579_15_, unidadefed16_.descricao as descricao579_15_, unidadefed16_.id_pais as id5_579_15_, unidadefed16_.sigla as sigla579_15_, municipio17_.id_municipio as id1_543_16_, municipio17_.ativo as ativo543_16_, municipio17_.codigo as codigo543_16_, municipio17_.codigo_acao as codigo4_543_16_, municipio17_.nome as nome543_16_, municipio17_.id_unidade_federativa as id6_543_16_, povoindige18_.id_povo_indigena as id1_1333_17_, povoindige18_.ativo as ativo1333_17_, povoindige18_.data_atualizacao as data3_1333_17_, povoindige18_.data_cadastro as data4_1333_17_, povoindige18_.id_registro_atualizacao as id6_1333_17_, povoindige18_.id_registro_cadastro as id7_1333_17_, povoindige18_.nome as nome1333_17_, tamanhofar19_.id_tamanho as id1_667_18_, tamanhofar19_.ordem as ordem667_18_, tamanhofar19_.tamanho as tamanho667_18_, tamanhofar20_.id_tamanho as id1_667_19_, tamanhofar20_.ordem as ordem667_19_, tamanhofar20_.tamanho as tamanho667_19_, tamanhofar21_.id_tamanho_fardamento_predefinido as id1_927_20_, tamanhofar21_.ativo as ativo927_20_, tamanhofar21_.descricao as descricao927_20_, tamanhofar21_.ordem as ordem927_20_, tamanhofar22_.id_tamanho as id1_667_21_, tamanhofar22_.ordem as ordem667_21_, tamanhofar22_.tamanho as tamanho667_21_, tamanhofar23_.id_tamanho_fardamento_predefinido as id1_927_22_, tamanhofar23_.ativo as ativo927_22_, tamanhofar23_.descricao as descricao927_22_, tamanhofar23_.ordem as ordem927_22_, tipodocume24_.id_tipo_documento_militar as id1_951_23_, tipodocume24_.denominacao as denomina2_951_23_, tipomilita25_.id_tipo_militar as id1_953_24_, tipomilita25_.denominacao as denomina2_953_24_, tiporaca26_.id_tipo_raca as id1_554_25_, tiporaca26_.ativo as ativo554_25_, tiporaca26_.descricao as descricao554_25_, tipotamanh27_.id_tipo_tamanho as id1_666_26_, tipotamanh27_.descricao as descricao666_26_, tipotamanh27_.tamanhos_predefinidos as tamanhos3_666_26_, tipotamanh27_.tipo_selecione as tipo4_666_26_, tipotamanh27_.valido_para_camisa as valido5_666_26_, tipotamanh27_.valido_para_short_calca as valido6_666_26_, tipotamanh28_.id_tipo_tamanho as id1_666_27_, tipotamanh28_.descricao as descricao666_27_, tipotamanh28_.tamanhos_predefinidos as tamanhos3_666_27_, tipotamanh28_.tipo_selecione as tipo4_666_27_, tipotamanh28_.valido_para_camisa as valido5_666_27_, tipotamanh28_.valido_para_short_calca as valido6_666_27_, tipotamanh29_.id_tipo_tamanho as id1_666_28_, tipotamanh29_.descricao as descricao666_28_, tipotamanh29_.tamanhos_predefinidos as tamanhos3_666_28_, tipotamanh29_.tipo_selecione as tipo4_666_28_, tipotamanh29_.valido_para_camisa as valido5_666_28_, tipotamanh29_.valido_para_short_calca as valido6_666_28_, unidadefed30_.id_unidade_federativa as id1_579_29_, unidadefed30_.ativo as ativo579_29_, unidadefed30_.id_capital as id6_579_29_, unidadefed30_.descricao as descricao579_29_, unidadefed30_.id_pais as id5_579_29_, unidadefed30_.sigla as sigla579_29_, unidadefed31_.id_unidade_federativa as id1_579_30_, unidadefed31_.ativo as ativo579_30_, unidadefed31_.id_capital as id6_579_30_, unidadefed31_.descricao as descricao579_30_, unidadefed31_.id_pais as id5_579_30_, unidadefed31_.sigla as sigla579_30_, tipoinstit32_.id_tipo_instituicao_origem as id1_952_31_, tipoinstit32_.denominacao as denomina2_952_31_ from basico.estudante estudante0_ left outer join discente discente1_ on estudante0_.id_estudante=discente1_.id_discente left outer join curso curso2_ on discente1_.id_curso=curso2_.id_curso left outer join comum.modalidade_educacao modalidade3_ on curso2_.id_modalidade_educacao=modalidade3_.id_modalidade_educacao left outer join comum.municipio municipio4_ on curso2_.id_municipio=municipio4_.id_municipio left outer join comum.unidade_federativa unidadefed5_ on municipio4_.id_unidade_federativa=unidadefed5_.id_unidade_federativa left outer join comum.municipio municipio6_ on unidadefed5_.id_capital=municipio6_.id_municipio left outer join comum.pais pais7_ on unidadefed5_.id_pais=pais7_.id_pais left outer join comum.unidade unidade8_ on curso2_.id_unidade=unidade8_.id_unidade left outer join ensino.forma_ingresso formaingre9_ on discente1_.id_forma_ingresso=formaingre9_.id_forma_ingresso left outer join comum.unidade unidade10_ on discente1_.id_gestora_academica=unidade10_.id_unidade left outer join comum.pessoa pessoa11_ on discente1_.id_pessoa=pessoa11_.id_pessoa left outer join escola.bairro_escola bairroesco12_ on pessoa11_.id_bairro_endereco=bairroesco12_.id_bairro_escola left outer join comum.municipio municipio13_ on bairroesco12_.id_municipio=municipio13_.id_municipio left outer join pessoas.escolaridade escolarida14_ on pessoa11_.id_escolaridade=escolarida14_.id_escolaridade left outer join comum.estado_civil estadocivi15_ on pessoa11_.id_estado_civil=estadocivi15_.id_estado_civil left outer join comum.unidade_federativa unidadefed16_ on pessoa11_.id_unidade_federativa_identidade=unidadefed16_.id_unidade_federativa left outer join comum.municipio municipio17_ on pessoa11_.id_municipio_contato=municipio17_.id_municipio left outer join comum.povo_indigena povoindige18_ on pessoa11_.id_povo_indigena=povoindige18_.id_povo_indigena left outer join comum.tamanho_fardamento tamanhofar19_ on pessoa11_.id_tamanho_calca_letra=tamanhofar19_.id_tamanho left outer join comum.tamanho_fardamento tamanhofar20_ on pessoa11_.id_tamanho_camisa_letra=tamanhofar20_.id_tamanho left outer join basico.tamanho_fardamento_predefinido tamanhofar21_ on pessoa11_.id_tamanho_camisa_predefinido=tamanhofar21_.id_tamanho_fardamento_predefinido left outer join comum.tamanho_fardamento tamanhofar22_ on pessoa11_.id_tamanho_short_calca_letra=tamanhofar22_.id_tamanho left outer join basico.tamanho_fardamento_predefinido tamanhofar23_ on pessoa11_.id_tamanho_short_calca_predefinido=tamanhofar23_.id_tamanho_fardamento_predefinido left outer join matricula.tipo_documento_militar tipodocume24_ on pessoa11_.id_tipo_documento_militar=tipodocume24_.id_tipo_documento_militar left outer join matricula.tipo_militar tipomilita25_ on pessoa11_.id_tipo_militar=tipomilita25_.id_tipo_militar left outer join comum.tipo_raca tiporaca26_ on pessoa11_.id_raca=tiporaca26_.id_tipo_raca left outer join comum.tipo_tamanho_fardamento tipotamanh27_ on pessoa11_.id_tipo_tamanho_calca=tipotamanh27_.id_tipo_tamanho left outer join comum.tipo_tamanho_fardamento tipotamanh28_ on pessoa11_.id_tipo_tamanho_camisa=tipotamanh28_.id_tipo_tamanho left outer join comum.tipo_tamanho_fardamento tipotamanh29_ on pessoa11_.id_tipo_tamanho_short_calca=tipotamanh29_.id_tipo_tamanho left outer join comum.unidade_federativa unidadefed30_ on pessoa11_.id_uf_contato=unidadefed30_.id_unidade_federativa left outer join comum.unidade_federativa unidadefed31_ on pessoa11_.id_uf_naturalidade=unidadefed31_.id_unidade_federativa left outer join matricula.tipo_instituicao_origem tipoinstit32_ on estudante0_.id_tipo_instituicao_origem=tipoinstit32_.id_tipo_instituicao_origem where estudante0_.id_estudante=?