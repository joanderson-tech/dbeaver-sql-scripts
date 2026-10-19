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

