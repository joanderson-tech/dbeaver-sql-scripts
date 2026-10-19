select * from atrativo_turistico at2 ;
select * from atrativo_turistico_disponibilidade_dias atdd;
select * from atrativo_turistico_fontes atf ;
select * from atrativo_turistico_imagens ati;
select * from atrativo_turistico_informacoes_adicionais atia;
select * from atrativo_turistico_segmentacao_turistica atst;
select * from flyway_schema_history fsh;
select * from municipio m ;
select * from permissao p ;
select * from segmentacao_turistica st ;
select * from TIPO_ATRATIVO_TURISTICO;
select * from usuario u; 
select * from usuario_permissoes up;
	select nextval('atrativo_turistico_sequence')
2025-01-24T19:55:39.749-03:00 DEBUG 2900 --- [nio-8080-exec-5] org.hibernate.SQL                        : insert into atrativo_turistico (criado_por_usuario_id, data_de_criacao, descricao, link_google_maps, bairro, cep, complemento, latitude, logradouro, longitude, municipio_id, numero, ponto_de_referencia, nome, legenda, link, tipo_atrativo_turistico_id, ultima_atualizacao, usuario_que_validou_id, validado, atrativo_turistico_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
2025-01-24T19:55:39.840-03:00 DEBUG 2900 --- [nio-8080-exec-5] org.hibernate.SQL                        : insert into atrativo_turistico_fontes (atrativo_turistico_id, legenda, link) values (?, ?, ?)
2025-01-24T19:55:39.843-03:00 DEBUG 2900 --- [nio-8080-exec-5] org.hibernate.SQL                        : insert into atrativo_turistico_imagens (atrativo_turistico_id, cloud_object, data_de_upload, descricao_arquivo) values (?, ?, ?, ?)
2025-01-24T19:55:39.846-03:00 DEBUG 2900 --- [nio-8080-exec-5] org.hibernate.SQL                        : insert into atrativo_turistico_imagens (atrativo_turistico_id, cloud_object, data_de_upload, descricao_arquivo) values (?, ?, ?, ?)
2025-01-24T19:55:39.847-03:00 DEBUG 2900 --- [nio-8080-exec-5] org.hibernate.SQL                        : insert into atrativo_turistico_segmentacao_turistica (atrativo_turistico_id, segmentacao_turistica_id) values (?, ?)


select * from TIPO_ATRATIVO_TURISTICO;


SELECT
	DISTINCT a1_0.atrativo_turistico_id,
	a1_0.criado_por_usuario_id,
	a1_0.data_de_criacao,
	a1_0.descricao,
	a1_0.link_google_maps,
	a1_0.bairro,
	a1_0.cep,
	a1_0.complemento,
	a1_0.latitude,
	a1_0.logradouro,
	a1_0.longitude,
	a1_0.municipio_id,
	a1_0.numero,
	a1_0.ponto_de_referencia,
	a1_0.nome,
	a1_0.legenda,
	a1_0.link,
	a1_0.tipo_atrativo_turistico_id,
	a1_0.ultima_atualizacao,
	a1_0.usuario_que_validou_id,
	a1_0.validado
FROM
	atrativo_turistico a1_0
LEFT JOIN tipo_atrativo_turistico t1_0 ON
	t1_0.tipo_atrativo_turistico_id = a1_0.tipo_atrativo_turistico_id
JOIN municipio m1_0 ON
	m1_0.municipio_id = a1_0.municipio_id
WHERE
	1 = 1
	AND (upper(a1_0.nome) LIKE ? ESCAPE ''
		OR upper(t1_0.nome) LIKE ? ESCAPE ''
			OR upper(m1_0.nome) LIKE ? ESCAPE '')
	AND 1 = 1
	AND 1 = 1
	AND EXISTS(
	SELECT
		1
	FROM
		atrativo_turistico_imagens i1_0
	WHERE
		a1_0.atrativo_turistico_id = i1_0.atrativo_turistico_id)
	AND a1_0.validado =?
ORDER BY
	a1_0.nome ASC offset ? ROWS FETCH FIRST ? ROWS ONLY

	

