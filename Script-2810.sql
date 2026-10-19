SELECT ts.nome AS nome_etapa, s.id_serie, s.descricao AS serie, ee.id_etapa_ensino, ee.denominacao, p.nome, p.nome_social, p.data_nascimento, d.matricula, tr.descricao AS turno, mes.id_situacao_matricula_serie, sms.descricao, tr.id_turno, serie_mult.id_serie AS serie_mult, serie_mult.descricao AS descricao_serie_mult, p.bairro , COALESCE (p.telefone_celular, '') AS celular , COALESCE (p.telefone_fixo, '') AS fixo
FROM discente d
INNER JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
INNER JOIN escola.escola_etapa_ensino_serie ees ON
ees.id_escola_etapa_ensino_serie = mes.id_serie_escola
INNER JOIN basico.turma_serie ts ON
ts.id_escola = ees.id_escola
INNER JOIN basico.serie s ON
s.id_serie = ts.id_serie
INNER JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
INNER JOIN basico.nivel_etapa_ensino nee ON
nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
INNER JOIN ensino.turno tr ON
tr.id_turno = ts.id_turno
INNER JOIN basico.situacao_matricula_serie sms ON
(sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie)
LEFT JOIN basico.serie serie_mult ON
(serie_mult.id_serie = mes.id_serie_multisseriado)
WHERE ts.ano = 2026
AND ts.ativo = TRUE
AND ts.id_tipo_turma_serie IN ( 1, 3, 5, 4 )
AND ees.id_escola = 51877805
--AND mes.id_turma_serie = ts.id_turma_serie
--AND mes.id_situacao_matricula_serie NOT IN ( 5, 12 )
AND s.id_serie = 52338612;

SELECT EXISTS ( SELECT 1
FROM basico.turma_serie ts
INNER JOIN basico.serie s ON
ts.id_serie = s.id_serie
WHERE ts.id_turma_serie = 52370519);

AND s.id_etapa_ensino = br.com.sigsoftware.sigeduc.basico.dominio.EtapaEnsino@363);

SELECT ts.*
FROM basico.turma_serie ts
JOIN basico.serie s ON
s.id_serie = ts.id_serie
JOIN basico.matricula_estudante_serie mes ON
mes.id_turma_serie = ts.id_turma_serie
--JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
WHERE ts.id_turma_serie IN (52370519, 52346560, 52369316, 52369300, 52369302, 52347976);

SELECT mc.*
FROM ensino.matricula_componente mc
INNER JOIN ensino.turma t ON
mc.id_turma = t.id_turma
AND t.id_turma_serie = 52370519
WHERE mc.id_situacao_matricula IN (2, 5, 6, 8);

SELECT serie0_.id_serie AS id1_924_11_, serie0_.ativo AS ativo924_11_, serie0_.bloquear_edicao AS bloquear3_924_11_, serie0_.bloquear_oferta_vagas AS bloquear4_924_11_, serie0_.capacidade_excesso AS capacidade5_924_11_, serie0_.capacidade_maxima AS capacidade6_924_11_, serie0_.capacidade_minima AS capacidade7_924_11_, serie0_.cod_censo AS cod8_924_11_, serie0_.codigo_rh AS codigo9_924_11_, serie0_.correcao_fluxo AS correcao10_924_11_, serie0_.data_atualizacao AS data11_924_11_, serie0_.data_cadastro AS data12_924_11_, serie0_.descricao AS descricao924_11_, serie0_.emite_certificado AS emite14_924_11_, serie0_.id_etapa_ensino AS id32_924_11_, serie0_.exige_carga_horaria_por_componente AS exige15_924_11_, serie0_.final_etapa AS final16_924_11_, serie0_.multisseriada AS multiss17_924_11_, serie0_. nao_contabiliza_turma AS column18_924_11_, serie0_.numero AS numero924_11_, serie0_.permite_avanco_estudo AS permite20_924_11_, serie0_.permite_gerenciar_turma_sem_horario AS permite21_924_11_, serie0_.permite_participar_atv_esportiva AS permite22_924_11_, serie0_.permite_participar_sol_cadastro_reserva AS permite23_924_11_, serie0_.id_proxima_serie AS id30_924_11_, serie0_.qtd_assistente_educacional AS qtd24_924_11_, serie0_.id_registro_atualizacao AS id28_924_11_, serie0_.id_registro_entrada AS id29_924_11_, serie0_.sigla AS sigla924_11_, serie0_.tipo_diario AS tipo26_924_11_, serie0_.id_unidade AS id31_924_11_, serie0_. verifica_frequencia_anos_anteriores AS column27_924_11_, etapaensin1_.id_etapa_ensino AS id1_916_0_, etapaensin1_.ativo AS ativo916_0_, etapaensin1_.bloquear_alteracao AS bloquear3_916_0_, etapaensin1_.capacidade_excesso AS capacidade4_916_0_, etapaensin1_.capacidade_maxima AS capacidade5_916_0_, etapaensin1_.capacidade_maxima_correcao_fluxo AS capacidade6_916_0_, etapaensin1_.capacidade_minima AS capacidade7_916_0_, etapaensin1_.capacidade_minima_correcao_fluxo AS capacidade8_916_0_, etapaensin1_.codigo_rh AS codigo9_916_0_, etapaensin1_.data_atualizacao AS data10_916_0_, etapaensin1_.denominacao AS denomin11_916_0_, etapaensin1_.duracao_conclusao AS duracao12_916_0_, etapaensin1_.id_forma_organizacao_Etapa AS id18_916_0_, etapaensin1_.id_local_oferta AS id20_916_0_, etapaensin1_.id_modalidade AS id16_916_0_, etapaensin1_.id_nivel_etapa AS id21_916_0_, etapaensin1_.periodicidade_etapa AS periodi13_916_0_, etapaensin1_.permite_disciplina_contraturno AS permite14_916_0_, etapaensin1_.id_registro_atualizacao AS id22_916_0_, etapaensin1_.sigla AS sigla916_0_, etapaensin1_.id_situacao AS id17_916_0_, etapaensin1_.id_unidade AS id19_916_0_, formaorgan2_.id_forma_organizacao_etapa AS id1_917_1_, formaorgan2_.data_atualizacao AS data2_917_1_, formaorgan2_.denominacao AS denomina3_917_1_, formaorgan2_.gerencia_turmas_individuais AS gerencia4_917_1_, formaorgan2_.id_registro_atualizacao AS id6_917_1_, formaorgan2_.id_unidade AS id5_917_1_, unidade3_.id_unidade AS id1_594_2_, unidade3_.ativo AS ativo594_2_, unidade3_.bairro AS bairro594_2_, unidade3_.cep AS cep594_2_, unidade3_.cnpj AS cnpj594_2_, unidade3_.codigo_unidade AS codigo6_594_2_, unidade3_.codigo_inep AS codigo7_594_2_, unidade3_.codigo_rh AS codigo8_594_2_, unidade3_.complemento AS compleme9_594_2_, unidade3_.data_cadastro AS data10_594_2_, unidade3_.distrito AS distrito594_2_, unidade3_.email AS email594_2_, unidade3_.endereco AS endereco594_2_, unidade3_.fax AS fax594_2_, unidade3_.hierarquia AS hierarquia594_2_, unidade3_.id_municipio AS id16_594_2_, unidade3_.instituicao_ensino_superior AS institu17_594_2_, unidade3_.nome AS nome594_2_, unidade3_.nome_ascii AS nome19_594_2_, unidade3_.numero AS numero594_2_, unidade3_.sigla AS sigla594_2_, unidade3_.telefone AS telefone594_2_, unidade3_.tipo AS tipo594_2_, unidade3_.uf AS uf594_2_, unidade3_.unidade_orcamentaria AS unidade25_594_2_, unidade3_.id_responsavel AS id26_594_2_, localofert4_.id_local_oferta AS id1_948_3_, localofert4_.ativo AS ativo948_3_, localofert4_.descricao AS descricao948_3_, modalidade5_.id_modalidade_ensino_basico AS id1_920_4_, modalidade5_.data_atualizacao AS data2_920_4_, modalidade5_.denominacao AS denomina3_920_4_, modalidade5_.id_registro_atualizacao AS id4_920_4_, modalidade5_.id_unidade AS id5_920_4_, unidade6_.id_unidade AS id1_594_5_, unidade6_.ativo AS ativo594_5_, unidade6_.bairro AS bairro594_5_, unidade6_.cep AS cep594_5_, unidade6_.cnpj AS cnpj594_5_, unidade6_.codigo_unidade AS codigo6_594_5_, unidade6_.codigo_inep AS codigo7_594_5_, unidade6_.codigo_rh AS codigo8_594_5_, unidade6_.complemento AS compleme9_594_5_, unidade6_.data_cadastro AS data10_594_5_, unidade6_.distrito AS distrito594_5_, unidade6_.email AS email594_5_, unidade6_.endereco AS endereco594_5_, unidade6_.fax AS fax594_5_, unidade6_.hierarquia AS hierarquia594_5_, unidade6_.id_municipio AS id16_594_5_, unidade6_.instituicao_ensino_superior AS institu17_594_5_, unidade6_.nome AS nome594_5_, unidade6_.nome_ascii AS nome19_594_5_, unidade6_.numero AS numero594_5_, unidade6_.sigla AS sigla594_5_, unidade6_.telefone AS telefone594_5_, unidade6_.tipo AS tipo594_5_, unidade6_.uf AS uf594_5_, unidade6_.unidade_orcamentaria AS unidade25_594_5_, unidade6_.id_responsavel AS id26_594_5_, niveletapa7_.id_nivel_etapa_ensino AS id1_921_6_, niveletapa7_.ativo AS ativo921_6_, niveletapa7_.data_atualizacao AS data3_921_6_, niveletapa7_.denominacao AS denomina4_921_6_, niveletapa7_.ensino_infantil AS ensino5_921_6_, niveletapa7_.id_registro_atualizacao AS id7_921_6_, niveletapa7_.sigla AS sigla921_6_, niveletapa7_.id_unidade AS id8_921_6_, unidade8_.id_unidade AS id1_594_7_, unidade8_.ativo AS ativo594_7_, unidade8_.bairro AS bairro594_7_, unidade8_.cep AS cep594_7_, unidade8_.cnpj AS cnpj594_7_, unidade8_.codigo_unidade AS codigo6_594_7_, unidade8_.codigo_inep AS codigo7_594_7_, unidade8_.codigo_rh AS codigo8_594_7_, unidade8_.complemento AS compleme9_594_7_, unidade8_.data_cadastro AS data10_594_7_, unidade8_.distrito AS distrito594_7_, unidade8_.email AS email594_7_, unidade8_.endereco AS endereco594_7_, unidade8_.fax AS fax594_7_, unidade8_.hierarquia AS hierarquia594_7_, unidade8_.id_municipio AS id16_594_7_, unidade8_.instituicao_ensino_superior AS institu17_594_7_, unidade8_.nome AS nome594_7_, unidade8_.nome_ascii AS nome19_594_7_, unidade8_.numero AS numero594_7_, unidade8_.sigla AS sigla594_7_, unidade8_.telefone AS telefone594_7_, unidade8_.tipo AS tipo594_7_, unidade8_.uf AS uf594_7_, unidade8_.unidade_orcamentaria AS unidade25_594_7_, unidade8_.id_responsavel AS id26_594_7_, situacaoet9_.id_situacao AS id1_635_8_, situacaoet9_.descricao AS descricao635_8_, unidade10_.id_unidade AS id1_594_9_, unidade10_.ativo AS ativo594_9_, unidade10_.bairro AS bairro594_9_, unidade10_.cep AS cep594_9_, unidade10_.cnpj AS cnpj594_9_, unidade10_.codigo_unidade AS codigo6_594_9_, unidade10_.codigo_inep AS codigo7_594_9_, unidade10_.codigo_rh AS codigo8_594_9_, unidade10_.complemento AS compleme9_594_9_, unidade10_.data_cadastro AS data10_594_9_, unidade10_.distrito AS distrito594_9_, unidade10_.email AS email594_9_, unidade10_.endereco AS endereco594_9_, unidade10_.fax AS fax594_9_, unidade10_.hierarquia AS hierarquia594_9_, unidade10_.id_municipio AS id16_594_9_, unidade10_.instituicao_ensino_superior AS institu17_594_9_, unidade10_.nome AS nome594_9_, unidade10_.nome_ascii AS nome19_594_9_, unidade10_.numero AS numero594_9_, unidade10_.sigla AS sigla594_9_, unidade10_.telefone AS telefone594_9_, unidade10_.tipo AS tipo594_9_, unidade10_.uf AS uf594_9_, unidade10_.unidade_orcamentaria AS unidade25_594_9_, unidade10_.id_responsavel AS id26_594_9_, unidade11_.id_unidade AS id1_594_10_, unidade11_.ativo AS ativo594_10_, unidade11_.bairro AS bairro594_10_, unidade11_.cep AS cep594_10_, unidade11_.cnpj AS cnpj594_10_, unidade11_.codigo_unidade AS codigo6_594_10_, unidade11_.codigo_inep AS codigo7_594_10_, unidade11_.codigo_rh AS codigo8_594_10_, unidade11_.complemento AS compleme9_594_10_, unidade11_.data_cadastro AS data10_594_10_, unidade11_.distrito AS distrito594_10_, unidade11_.email AS email594_10_, unidade11_.endereco AS endereco594_10_, unidade11_.fax AS fax594_10_, unidade11_.hierarquia AS hierarquia594_10_, unidade11_.id_municipio AS id16_594_10_, unidade11_.instituicao_ensino_superior AS institu17_594_10_, unidade11_.nome AS nome594_10_, unidade11_.nome_ascii AS nome19_594_10_, unidade11_.numero AS numero594_10_, unidade11_.sigla AS sigla594_10_, unidade11_.telefone AS telefone594_10_, unidade11_.tipo AS tipo594_10_, unidade11_.uf AS uf594_10_, unidade11_.unidade_orcamentaria AS unidade25_594_10_, unidade11_.id_responsavel AS id26_594_10_
FROM basico.serie serie0_
LEFT OUTER JOIN basico.etapa_ensino etapaensin1_ ON
serie0_.id_etapa_ensino = etapaensin1_.id_etapa_ensino
LEFT OUTER JOIN basico.forma_organizacao_etapa formaorgan2_ ON
etapaensin1_.id_forma_organizacao_Etapa = formaorgan2_.id_forma_organizacao_etapa
LEFT OUTER JOIN comum.unidade unidade3_ ON
formaorgan2_.id_unidade = unidade3_.id_unidade
LEFT OUTER JOIN basico.local_oferta localofert4_ ON
etapaensin1_.id_local_oferta = localofert4_.id_local_oferta
LEFT OUTER JOIN basico.modalidade_ensino_basico modalidade5_ ON
etapaensin1_.id_modalidade = modalidade5_.id_modalidade_ensino_basico
LEFT OUTER JOIN comum.unidade unidade6_ ON
modalidade5_.id_unidade = unidade6_.id_unidade
LEFT OUTER JOIN basico.nivel_etapa_ensino niveletapa7_ ON
etapaensin1_.id_nivel_etapa = niveletapa7_.id_nivel_etapa_ensino
LEFT OUTER JOIN comum.unidade unidade8_ ON
niveletapa7_.id_unidade = unidade8_.id_unidade
LEFT OUTER JOIN basico.situacao_etapa_ensino situacaoet9_ ON
etapaensin1_.id_situacao = situacaoet9_.id_situacao
LEFT OUTER JOIN comum.unidade unidade10_ ON
etapaensin1_.id_unidade = unidade10_.id_unidade
LEFT OUTER JOIN comum.unidade unidade11_ ON
serie0_.id_unidade = unidade11_.id_unidade
WHERE serie0_.id_serie =?;

SELECT t.*
FROM ensino.matricula_componente mc
INNER JOIN ensino.turma t ON
mc.id_turma = t.id_turma
AND t.id_turma_serie = 52370519
JOIN basico.turma_serie ts2 ON
ts2.id_turma_serie = t.id_turma_serie
WHERE mc.id_situacao_matricula IN (2, 5, 6, 8)
AND ts2.id_escola = 51877805;

SELECT e.nome, ts.nome, ts.id_curriculo_medio, ts.id_turma_serie, ts.atividade_complementar
FROM basico.turma_serie ts
JOIN escola.escola e ON
e.id_escola = ts.id_escola
WHERE ts.id_turma_serie IN (52370519);

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante IN (976144, 976290, 976145, 975912)
AND mes.ano_calendario = 2026;

SELECT p.nome
FROM comum.pessoa p
JOIN discente d ON
d.id_pessoa = p.id_pessoa
WHERE d.id_discente IN (975912, 976144, 976145, 976290);
