SELECT ta."data", hc.descricao, ta.* 
FROM ava.topico_aula ta
JOIN  ava.topico_aula_habilidade tah ON tah.id_topico_aula = ta.id_topico_aula 
JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = tah.id_habilidade_competencia 
JOIN ensino.turma t ON t.id_turma = ta.id_turma
WHERE t.id_turma_serie = 51899347
AND ta.ativo 
ORDER BY ta."data" ;

SELECT  ta.*
FROM ava.topico_aula ta
JOIN ensino.turma t ON
t.id_turma = ta.id_turma
WHERE t.id_turma_serie = 51899347
--AND ta.ativo 
ORDER BY ta."data" ;

683113
683113;

SELECT *
FROM ava.topico_aula_habilidade tah
WHERE tah.id_topico_aula = 52817980;

SELECT ta.*
FROM ava.topico_aula ta
WHERE ta.conteudo_ministrado ILIKE '%) Compreender a ideia de igualdade para escrever%';

-- Auto-generated SQL script #202609141440
UPDATE ava.topico_aula
SET
quantidade_aulas = 3, bimestre = 3
WHERE id_topico_aula = 53636811;
-- Auto-generated SQL script #202609141440
UPDATE ava.topico_aula
SET
quantidade_aulas = NULL, bimestre = NULL
WHERE id_topico_aula = 53636811;

INSERT INTO ava.topico_aula (id_topico_aula, id_turma, descricao, "data", fim, id_topico_pai, conteudo, id_usuario, data_cadastro, visivel, ativo, id_docente_turma, aula_cancelada, id_aula_extra, bimestre, programado, bimestral, necessita_correcao, replica_conteudo, conteudo_ministrado, quantidade_aulas, metodologia, observacoes, data_atualizacao, outros, id_configuracao_conteudo_ministrado)
VALUES(53636811, 683113, '', '2026-09-14', '2026-09-14', NULL, 'teste', 105497, '2026-09-14 10:45:29.683', TRUE, TRUE, NULL, FALSE, NULL, NULL, FALSE, FALSE, FALSE, FALSE, 'Revisão dos conteúdos por meio de atividades de sistematização propostas no livro didático. Elaboração, no caderno, de um quadro-resumo com exemplos e regras estudadas. Produção individual de um pequeno texto, seguida de revisão e correção coletiva.', NULL, 'teste', 'teste', NULL, NULL, NULL);

DELETE
FROM ava.topico_aula
WHERE id_topico_aula = 53636811;

SELECT p.nome, u.login
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
JOIN rh.servidor s ON
s.id_pessoa = p.id_pessoa
JOIN ensino.docente_turma dt ON
dt.id_docente = s.id_servidor
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
WHERE dt.ativo
AND t.id_turma_serie = 51899408;

SELECT ccm.id_configuracao_conteudo_ministrado, cccm.nome AS nomeCampo,(cccm.tipo_campo = 'TEXTO_DESCRITIVO') AS textoDescritivo,(cccm.tipo_campo = 'MULTISSELECAO') AS multisselecao, cccmtd.minimo_caracteres AS qtdMinimaCaracteres, cccmtd.maximo_caracteres AS qtdMaximaCaracteres, cccm.ordem, string_agg(DISTINCT concat(hc.id_habilidade_competencia, '@', hc.descricao), '#') AS habilidadesLista, cccm.destino_persistencia
FROM diario.campo_configuracao_conteudo_ministrado cccm
JOIN diario.configuracao_conteudo_ministrado ccm ON
ccm.id_configuracao_conteudo_ministrado = cccm.id_configuracao_conteudo_ministrado
LEFT JOIN diario.campo_configuracao_conteudo_ministrado_texto_descritivo cccmtd ON
cccmtd.id_campo_configuracao_conteudo_ministrado_texto_descritivo = cccm.id_campo_configuracao_conteudo_ministrado
LEFT JOIN diario.campo_configuracao_conteudo_ministrado_multisselecao cccmm ON
cccmm.id_campo_configuracao_conteudo_ministrado_multisselecao = cccm.id_campo_configuracao_conteudo_ministrado
LEFT JOIN diario.opcoes_campo_configuracao_conteudo_ministrado_multisselecao omm ON
omm.id_campo_configuracao_conteudo_ministrado_multisselecao = cccmm.id_campo_configuracao_conteudo_ministrado_multisselecao
LEFT JOIN ensino_infantil.habilidade_competencia hc ON
hc.id_habilidade_competencia = omm.id_habilidade_competencia
LEFT JOIN diario.configuracao_conteudo_ministrado_etapa_ensino ccmee ON
ccmee.id_configuracao_conteudo_ministrado = ccm.id_configuracao_conteudo_ministrado
LEFT JOIN diario.configuracao_conteudo_ministrado_serie ccms ON
ccms.id_configuracao_conteudo_ministrado = ccm.id_configuracao_conteudo_ministrado
LEFT JOIN diario.configuracao_conteudo_ministrado_componente_curricular ccmcc ON
ccmcc.id_configuracao_conteudo_ministrado = ccm.id_configuracao_conteudo_ministrado
WHERE ccm.ativo
AND ccm.data_fim IS NULL
AND ccmee.id_etapa_ensino = 3
AND ccms.id_serie = 1005222
AND ccmcc.id_componente_curricular = 220
GROUP BY ccm.id_configuracao_conteudo_ministrado, cccm.nome, cccm.tipo_campo, cccmtd.minimo_caracteres, cccmtd.maximo_caracteres, cccm.ordem, cccm.destino_persistencia
ORDER BY ccm.id_configuracao_conteudo_ministrado, cccm.ordem;



SELECT * 
FROM diario.campo_configuracao_conteudo_ministrado cccm;