-- Auto-generated SQL script #202605121534
--erro ao tentar lançar notas de qualquer componente da atividade polivalente.

--O erro ocoriria porque os componentes não estava com a turma agrupadora na turma serie principal por isso dava erro de Horario, porque ele pegava o id da turma sem ser a princial ai quando buscava no horaio aquela turma que não era principal não tem como pois naõ e.

UPDATE ensino.turma	SET id_turma_agrupadora=NULL WHERE id_turma IN (686713, 686714, 686715, 686716, 686717, 686718, 686719, 686720);

UPDATE ensino.turma	SET id_turma_agrupadora=686530	WHERE id_turma IN (686713, 686714, 686715, 686716, 686717, 686718, 686719, 686720);






SELECT DISTINCT ht.*
FROM ensino.turma t
JOIN ensino.horario_turma ht ON
t.id_turma = ht.id_turma
JOIN ensino.horario h ON
h.id_horario = ht.id_horario
WHERE t.id_turma_serie = 52285581
AND ht.ativo ;

SELECT *
FROM ensino.turma t
WHERE t.id_turma_serie IN (52285581, 52285582, 52285583, 52285584)
AND t.id_situacao_turma <> 4;

SELECT t.id_turma_serie,*
FROM ensino.turma t
WHERE t.id_turma IN (686530, 686720, 686540);

686540

SELECT *
FROM ensino.horario h
WHERE h.ativo
AND h.ano_entrada_vigor = 2026;

SELECT t.*
FROM ensino.turma t
INNER JOIN basico.turma_serie ts ON
t.id_turma_serie = ts.id_turma_serie
LEFT OUTER JOIN basico.curriculo_basico cb ON
ts.id_curriculo_medio = cb.id_curriculo_basico
LEFT OUTER JOIN basico.categoria_componente cc ON
t.id_categoria_componente = cc.id_categoria_componente
INNER JOIN ensino.componente_curricular ccc ON
t.id_disciplina = ccc.id_componente_curricular
INNER JOIN ensino.situacao_turma s ON
t.id_situacao_turma = s.id_situacao_turma
WHERE ts.id_turma_serie = 52285581
AND t.id_disciplina = 221
AND t.id_situacao_turma <> 4;

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie IN (52285581, 52285582, 52285583, 52285584);

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio = 52234512
AND ts.id_escola = 51870039;

SELECT turmacompo0_.id_turma AS col_0_0_, turmacompo0_.codigo AS col_1_0_, turmacompo0_.id_disciplina AS col_2_0_, turmacompo0_.ano AS col_3_0_, turmacompo0_.periodo AS col_4_0_, turmacompo0_.capacidade_aluno AS col_5_0_, turmacompo0_.tipo AS col_6_0_, turmacompo0_.agrupadora AS col_7_0_, turmacompo0_.id_turma_serie AS col_8_0_, turmaserie1_.tipo_diario AS col_9_0_, turmacompo0_.id_categoria_componente AS col_10_0_, curriculob3_.tipo_diario AS col_11_0_, curriculob3_.tipo_diario_diversificado AS col_12_0_,(SELECT count(*)
FROM ensino.matricula_componente matriculac13_
WHERE matriculac13_.id_turma = turmacompo0_.id_turma) AS col_13_0_, turmacompo0_.id_situacao_turma AS col_14_0_, componente5_.id_componente_curricular AS id1_606_0_, turmaserie1_.id_turma_serie AS id1_1097_1_, categoriac4_.id_categoria_componente AS id1_894_2_, situacaotu14_.id_situacao_turma AS id1_596_3_, componente5_.id_area_conhecimento AS id12_606_0_, componente5_.ativo AS ativo606_0_, componente5_.codigo AS codigo606_0_, componente5_.seq_censo AS seq4_606_0_, componente5_.codigo_rh AS codigo5_606_0_, componente5_.data_cadastro AS data6_606_0_, componente5_.matriculavel AS matricul7_606_0_, componente5_.nivel AS nivel606_0_, componente5_.nome AS nome606_0_, componente5_.sigla AS sigla606_0_, componente5_.id_tipo_componente AS id11_606_0_, turmaserie1_.id_ambiente_unidade_escolar AS id37_1097_1_, turmaserie1_.ano AS ano1097_1_, turmaserie1_.atividade_complementar AS atividade3_1097_1_, turmaserie1_.ativo AS ativo1097_1_, turmaserie1_.capacidade_aluno AS capacidade5_1097_1_, turmaserie1_.capacidade_sala_aula AS capacidade6_1097_1_, turmaserie1_.codigo_rh AS codigo7_1097_1_, turmaserie1_.id_curriculo_medio AS id34_1097_1_, turmaserie1_.data_atualizacao AS data8_1097_1_, turmaserie1_.data_cadastro AS data9_1097_1_, turmaserie1_.data_fim AS data10_1097_1_, turmaserie1_.data_inicio AS data11_1097_1_, turmaserie1_.descricao_horario AS descricao12_1097_1_, turmaserie1_.id_escola AS id31_1097_1_, turmaserie1_.id_proxima_turma AS id13_1097_1_, turmaserie1_.identificador AS identif14_1097_1_, turmaserie1_.justificativa_indeferimento AS justifi15_1097_1_, turmaserie1_.justificativa_qtd_alunos AS justifi16_1097_1_, turmaserie1_.justificativa_regra_nao AS justifi17_1097_1_, turmaserie1_.id_modulo_inicial AS id35_1097_1_, turmaserie1_.nome AS nome1097_1_, turmaserie1_.nome_auxiliar AS nome19_1097_1_, turmaserie1_.numero_estudantes AS numero20_1097_1_, turmaserie1_.periodo AS periodo1097_1_, turmaserie1_.permite_disciplina_contraturno AS permite22_1097_1_, turmaserie1_.progressao_parcial AS progressao23_1097_1_, turmaserie1_.id_registro_atualizacao AS id29_1097_1_, turmaserie1_.id_registro_entrada AS id38_1097_1_, turmaserie1_.regra_nao AS regra24_1097_1_, turmaserie1_.id_serie AS id33_1097_1_, turmaserie1_.tipo_diario AS tipo25_1097_1_, turmaserie1_.tipo_importacao AS tipo26_1097_1_, turmaserie1_.id_tipo_turma_serie AS id28_1097_1_, turmaserie1_.id_turma_serie_agrupadora AS id30_1097_1_, turmaserie1_.id_turno AS id32_1097_1_, turmaserie1_.id_unidade AS id36_1097_1_, turmaserie1_.versao_grade_horarios AS versao27_1097_1_, categoriac4_.altura_imagem AS altura2_894_2_, categoriac4_.ativo AS ativo894_2_, categoriac4_.descricao AS descricao894_2_, categoriac4_.id_arquivo_imagem AS id5_894_2_, categoriac4_.ordem AS ordem894_2_, situacaotu14_.codigo_rh AS codigo2_596_3_, situacaotu14_.descricao AS descricao596_3_
FROM ensino.turma turmacompo0_
INNER JOIN basico.turma_serie turmaserie1_ ON
turmacompo0_.id_turma_serie = turmaserie1_.id_turma_serie
LEFT OUTER JOIN basico.curriculo_basico curriculob3_ ON
turmaserie1_.id_curriculo_medio = curriculob3_.id_curriculo_basico
LEFT OUTER JOIN basico.categoria_componente categoriac4_ ON
turmacompo0_.id_categoria_componente = categoriac4_.id_categoria_componente
INNER JOIN ensino.componente_curricular componente5_ ON
turmacompo0_.id_disciplina = componente5_.id_componente_curricular
INNER JOIN ensino.situacao_turma situacaotu14_ ON
turmacompo0_.id_situacao_turma = situacaotu14_.id_situacao_turma
WHERE turmaserie1_.id_turma_serie = 52285581
AND turmacompo0_.agrupadora = TRUE
AND turmacompo0_.id_situacao_turma <> 4;

SELECT this_.id_horario_turma AS id1_616_12_, this_.ativo AS ativo616_12_, this_.data_alteracao AS data3_616_12_, this_.data_fim AS data4_616_12_, this_.data_inicio AS data5_616_12_, this_.dia AS dia616_12_, this_.hora_fim AS hora7_616_12_, this_.hora_inicio AS hora8_616_12_, this_.id_horario AS id10_616_12_, this_.id_registro_entrada AS id12_616_12_, this_.tipo AS tipo616_12_, this_.id_turma AS id11_616_12_, horario2_.id_horario AS id1_615_0_, horario2_.ano_entrada_vigor AS ano2_615_0_, horario2_.ativo AS ativo615_0_, horario2_.id_etapa_ensino AS id9_615_0_, horario2_.fim AS fim615_0_, horario2_.inicio AS inicio615_0_, horario2_.nivel AS nivel615_0_, horario2_.ordem AS ordem615_0_, horario2_.tipo AS tipo615_0_, horario2_.id_unidade AS id10_615_0_, etapaensin3_.id_etapa_ensino AS id1_895_1_, etapaensin3_.ativo AS ativo895_1_, etapaensin3_.bloquear_alteracao AS bloquear3_895_1_, etapaensin3_.capacidade_excesso AS capacidade4_895_1_, etapaensin3_.capacidade_maxima AS capacidade5_895_1_, etapaensin3_.capacidade_maxima_correcao_fluxo AS capacidade6_895_1_, etapaensin3_.capacidade_minima AS capacidade7_895_1_, etapaensin3_.capacidade_minima_correcao_fluxo AS capacidade8_895_1_, etapaensin3_.codigo_rh AS codigo9_895_1_, etapaensin3_.data_atualizacao AS data10_895_1_, etapaensin3_.denominacao AS denomin11_895_1_, etapaensin3_.duracao_conclusao AS duracao12_895_1_, etapaensin3_.id_forma_organizacao_Etapa AS id18_895_1_, etapaensin3_.id_local_oferta AS id19_895_1_, etapaensin3_.id_modalidade AS id16_895_1_, etapaensin3_.id_nivel_etapa AS id21_895_1_, etapaensin3_.periodicidade_etapa AS periodi13_895_1_, etapaensin3_.permite_disciplina_contraturno AS permite14_895_1_, etapaensin3_.id_registro_atualizacao AS id17_895_1_, etapaensin3_.sigla AS sigla895_1_, etapaensin3_.id_situacao AS id22_895_1_, etapaensin3_.id_unidade AS id20_895_1_, formaorgan4_.id_forma_organizacao_etapa AS id1_896_2_, formaorgan4_.data_atualizacao AS data2_896_2_, formaorgan4_.denominacao AS denomina3_896_2_, formaorgan4_.gerencia_turmas_individuais AS gerencia4_896_2_, formaorgan4_.id_registro_atualizacao AS id5_896_2_, formaorgan4_.id_unidade AS id6_896_2_, unidade5_.id_unidade AS id1_580_3_, unidade5_.ativo AS ativo580_3_, unidade5_.bairro AS bairro580_3_, unidade5_.cep AS cep580_3_, unidade5_.cnpj AS cnpj580_3_, unidade5_.codigo_unidade AS codigo6_580_3_, unidade5_.codigo_inep AS codigo7_580_3_, unidade5_.codigo_rh AS codigo8_580_3_, unidade5_.complemento AS compleme9_580_3_, unidade5_.data_cadastro AS data10_580_3_, unidade5_.distrito AS distrito580_3_, unidade5_.email AS email580_3_, unidade5_.endereco AS endereco580_3_, unidade5_.fax AS fax580_3_, unidade5_.hierarquia AS hierarquia580_3_, unidade5_.id_municipio AS id16_580_3_, unidade5_.instituicao_ensino_superior AS institu17_580_3_, unidade5_.nome AS nome580_3_, unidade5_.nome_ascii AS nome19_580_3_, unidade5_.numero AS numero580_3_, unidade5_.sigla AS sigla580_3_, unidade5_.telefone AS telefone580_3_, unidade5_.tipo AS tipo580_3_, unidade5_.uf AS uf580_3_, unidade5_.unidade_orcamentaria AS unidade25_580_3_, unidade5_.id_responsavel AS id26_580_3_, localofert6_.id_local_oferta AS id1_926_4_, localofert6_.ativo AS ativo926_4_, localofert6_.descricao AS descricao926_4_, modalidade7_.id_modalidade_ensino_basico AS id1_899_5_, modalidade7_.data_atualizacao AS data2_899_5_, modalidade7_.denominacao AS denomina3_899_5_, modalidade7_.id_registro_atualizacao AS id4_899_5_, modalidade7_.id_unidade AS id5_899_5_, unidade8_.id_unidade AS id1_580_6_, unidade8_.ativo AS ativo580_6_, unidade8_.bairro AS bairro580_6_, unidade8_.cep AS cep580_6_, unidade8_.cnpj AS cnpj580_6_, unidade8_.codigo_unidade AS codigo6_580_6_, unidade8_.codigo_inep AS codigo7_580_6_, unidade8_.codigo_rh AS codigo8_580_6_, unidade8_.complemento AS compleme9_580_6_, unidade8_.data_cadastro AS data10_580_6_, unidade8_.distrito AS distrito580_6_, unidade8_.email AS email580_6_, unidade8_.endereco AS endereco580_6_, unidade8_.fax AS fax580_6_, unidade8_.hierarquia AS hierarquia580_6_, unidade8_.id_municipio AS id16_580_6_, unidade8_.instituicao_ensino_superior AS institu17_580_6_, unidade8_.nome AS nome580_6_, unidade8_.nome_ascii AS nome19_580_6_, unidade8_.numero AS numero580_6_, unidade8_.sigla AS sigla580_6_, unidade8_.telefone AS telefone580_6_, unidade8_.tipo AS tipo580_6_, unidade8_.uf AS uf580_6_, unidade8_.unidade_orcamentaria AS unidade25_580_6_, unidade8_.id_responsavel AS id26_580_6_, niveletapa9_.id_nivel_etapa_ensino AS id1_900_7_, niveletapa9_.ativo AS ativo900_7_, niveletapa9_.data_atualizacao AS data3_900_7_, niveletapa9_.denominacao AS denomina4_900_7_, niveletapa9_.ensino_infantil AS ensino5_900_7_, niveletapa9_.id_registro_atualizacao AS id7_900_7_, niveletapa9_.sigla AS sigla900_7_, niveletapa9_.id_unidade AS id8_900_7_, unidade10_.id_unidade AS id1_580_8_, unidade10_.ativo AS ativo580_8_, unidade10_.bairro AS bairro580_8_, unidade10_.cep AS cep580_8_, unidade10_.cnpj AS cnpj580_8_, unidade10_.codigo_unidade AS codigo6_580_8_, unidade10_.codigo_inep AS codigo7_580_8_, unidade10_.codigo_rh AS codigo8_580_8_, unidade10_.complemento AS compleme9_580_8_, unidade10_.data_cadastro AS data10_580_8_, unidade10_.distrito AS distrito580_8_, unidade10_.email AS email580_8_, unidade10_.endereco AS endereco580_8_, unidade10_.fax AS fax580_8_, unidade10_.hierarquia AS hierarquia580_8_, unidade10_.id_municipio AS id16_580_8_, unidade10_.instituicao_ensino_superior AS institu17_580_8_, unidade10_.nome AS nome580_8_, unidade10_.nome_ascii AS nome19_580_8_, unidade10_.numero AS numero580_8_, unidade10_.sigla AS sigla580_8_, unidade10_.telefone AS telefone580_8_, unidade10_.tipo AS tipo580_8_, unidade10_.uf AS uf580_8_, unidade10_.unidade_orcamentaria AS unidade25_580_8_, unidade10_.id_responsavel AS id26_580_8_, situacaoet11_.id_situacao AS id1_619_9_, situacaoet11_.descricao AS descricao619_9_, unidade12_.id_unidade AS id1_580_10_, unidade12_.ativo AS ativo580_10_, unidade12_.bairro AS bairro580_10_, unidade12_.cep AS cep580_10_, unidade12_.cnpj AS cnpj580_10_, unidade12_.codigo_unidade AS codigo6_580_10_, unidade12_.codigo_inep AS codigo7_580_10_, unidade12_.codigo_rh AS codigo8_580_10_, unidade12_.complemento AS compleme9_580_10_, unidade12_.data_cadastro AS data10_580_10_, unidade12_.distrito AS distrito580_10_, unidade12_.email AS email580_10_, unidade12_.endereco AS endereco580_10_, unidade12_.fax AS fax580_10_, unidade12_.hierarquia AS hierarquia580_10_, unidade12_.id_municipio AS id16_580_10_, unidade12_.instituicao_ensino_superior AS institu17_580_10_, unidade12_.nome AS nome580_10_, unidade12_.nome_ascii AS nome19_580_10_, unidade12_.numero AS numero580_10_, unidade12_.sigla AS sigla580_10_, unidade12_.telefone AS telefone580_10_, unidade12_.tipo AS tipo580_10_, unidade12_.uf AS uf580_10_, unidade12_.unidade_orcamentaria AS unidade25_580_10_, unidade12_.id_responsavel AS id26_580_10_, unidade13_.id_unidade AS id1_580_11_, unidade13_.ativo AS ativo580_11_, unidade13_.bairro AS bairro580_11_, unidade13_.cep AS cep580_11_, unidade13_.cnpj AS cnpj580_11_, unidade13_.codigo_unidade AS codigo6_580_11_, unidade13_.codigo_inep AS codigo7_580_11_, unidade13_.codigo_rh AS codigo8_580_11_, unidade13_.complemento AS compleme9_580_11_, unidade13_.data_cadastro AS data10_580_11_, unidade13_.distrito AS distrito580_11_, unidade13_.email AS email580_11_, unidade13_.endereco AS endereco580_11_, unidade13_.fax AS fax580_11_, unidade13_.hierarquia AS hierarquia580_11_, unidade13_.id_municipio AS id16_580_11_, unidade13_.instituicao_ensino_superior AS institu17_580_11_, unidade13_.nome AS nome580_11_, unidade13_.nome_ascii AS nome19_580_11_, unidade13_.numero AS numero580_11_, unidade13_.sigla AS sigla580_11_, unidade13_.telefone AS telefone580_11_, unidade13_.tipo AS tipo580_11_, unidade13_.uf AS uf580_11_, unidade13_.unidade_orcamentaria AS unidade25_580_11_, unidade13_.id_responsavel AS id26_580_11_
FROM ensino.horario_turma this_
LEFT OUTER JOIN ensino.Horario horario2_ ON
this_.id_horario = horario2_.id_horario
LEFT OUTER JOIN basico.etapa_ensino etapaensin3_ ON
horario2_.id_etapa_ensino = etapaensin3_.id_etapa_ensino
LEFT OUTER JOIN basico.forma_organizacao_etapa formaorgan4_ ON
etapaensin3_.id_forma_organizacao_Etapa = formaorgan4_.id_forma_organizacao_etapa
LEFT OUTER JOIN comum.unidade unidade5_ ON
formaorgan4_.id_unidade = unidade5_.id_unidade
LEFT OUTER JOIN basico.local_oferta localofert6_ ON
etapaensin3_.id_local_oferta = localofert6_.id_local_oferta
LEFT OUTER JOIN basico.modalidade_ensino_basico modalidade7_ ON
etapaensin3_.id_modalidade = modalidade7_.id_modalidade_ensino_basico
LEFT OUTER JOIN comum.unidade unidade8_ ON
modalidade7_.id_unidade = unidade8_.id_unidade
LEFT OUTER JOIN basico.nivel_etapa_ensino niveletapa9_ ON
etapaensin3_.id_nivel_etapa = niveletapa9_.id_nivel_etapa_ensino
LEFT OUTER JOIN comum.unidade unidade10_ ON
niveletapa9_.id_unidade = unidade10_.id_unidade
LEFT OUTER JOIN basico.situacao_etapa_ensino situacaoet11_ ON
etapaensin3_.id_situacao = situacaoet11_.id_situacao
LEFT OUTER JOIN comum.unidade unidade12_ ON
etapaensin3_.id_unidade = unidade12_.id_unidade
LEFT OUTER JOIN comum.unidade unidade13_ ON
horario2_.id_unidade = unidade13_.id_unidade
WHERE this_.ativo 
AND this_.id_turma =