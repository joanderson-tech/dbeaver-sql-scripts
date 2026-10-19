SELECT *
FROM basico.curriculo_basico
WHERE codigo = 'AF8';

SELECT *
FROM basico.curriculo_basico_componente
WHERE id_curriculo_basico = 35503513;

SELECT *
FROM basico.turma_serie
WHERE id_curriculo_medio = 35503513;

SELECT *
FROM ensino.historico_solicitacao_avanco_estudo_componente
WHERE id_componente_curricular = 230;


-- Auto-generated SQL script #202602251458
UPDATE ensino.historico_solicitacao_avanco_estudo
	SET id_status_solicitacao_avanco_estudo=5 --1
	WHERE id_historico_solicitacao_avanco_estudo=3;

