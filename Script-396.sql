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
select * from usuario u; select * from usuario_permissoes up;
	select nextval('atrativo_turistico_sequence')
2025-01-24T19:55:39.749-03:00 DEBUG 2900 --- [nio-8080-exec-5] org.hibernate.SQL                        : insert into atrativo_turistico (criado_por_usuario_id, data_de_criacao, descricao, link_google_maps, bairro, cep, complemento, latitude, logradouro, longitude, municipio_id, numero, ponto_de_referencia, nome, legenda, link, tipo_atrativo_turistico_id, ultima_atualizacao, usuario_que_validou_id, validado, atrativo_turistico_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
2025-01-24T19:55:39.840-03:00 DEBUG 2900 --- [nio-8080-exec-5] org.hibernate.SQL                        : insert into atrativo_turistico_fontes (atrativo_turistico_id, legenda, link) values (?, ?, ?)
2025-01-24T19:55:39.843-03:00 DEBUG 2900 --- [nio-8080-exec-5] org.hibernate.SQL                        : insert into atrativo_turistico_imagens (atrativo_turistico_id, cloud_object, data_de_upload, descricao_arquivo) values (?, ?, ?, ?)
2025-01-24T19:55:39.846-03:00 DEBUG 2900 --- [nio-8080-exec-5] org.hibernate.SQL                        : insert into atrativo_turistico_imagens (atrativo_turistico_id, cloud_object, data_de_upload, descricao_arquivo) values (?, ?, ?, ?)
2025-01-24T19:55:39.847-03:00 DEBUG 2900 --- [nio-8080-exec-5] org.hibernate.SQL                        : insert into atrativo_turistico_segmentacao_turistica (atrativo_turistico_id, segmentacao_turistica_id) values (?, ?)

DISCARD ALL;

admin@example.com

INSERT INTO public.usuario (usuario_id, primeiro_nome, ultimo_nome, email, senha_encripitada, data_de_criacao, ultima_atualizacao, perfil) VALUES(2, 'Admin', 'Admin', 'admin@example.com', '$2a$12$iqmgn60MOJihxmA5Z/7ybOF1FPNtHxYyvfjP6jU7Lla2gGaZjf7E2', '2025-02-20 21:13:35.482', '2025-02-20 21:13:35.482', 'ADMIN');


DROP TABLE flyway_schema_history;
SELECT 1;

SELECT municipio_id, data_de_criacao, nome, uf_sigla, ultima_atualizacao FROM public.municipio WHERE nome = 'lucenaa';

DELETE FROM public.municipio WHERE municipio_id=224;


INSERT INTO public.segmentacao_turistica (segmentacao_turistica_id, nome, data_de_criacao, ultima_atualizacao) VALUES
(2, 'Turismo de entretenimento e lazer', '2025-02-20 21:45:10.133', '2025-02-20 21:45:10.133'),
(3, 'Turismo de eventos e negócios (técnicos-científico e/ou profissional)', '2025-02-20 21:45:10.133', '2025-02-20 21:45:10.133'),
(4, 'Turismo macabro ou Dark Turism', '2025-02-20 21:45:10.133', '2025-02-20 21:45:10.133'),
(5, 'Turismo pedagógico ou educacional', '2025-02-20 21:45:10.133', '2025-02-20 21:45:10.133'),
(6, 'Turismo religioso ou peregrinação', '2025-02-20 21:45:10.133', '2025-02-20 21:45:10.133'),
(7, 'Turismo rural ou ecoturismo ou turismo de aventura', '2025-02-20 21:45:10.133', '2025-02-20 21:45:10.133'),
(8, 'Turismo de base comunitária', '2025-02-20 21:45:10.133', '2025-02-20 21:45:10.133'),
(9, 'Turismo de esportes ou turismo náutico', '2025-02-20 21:45:10.133', '2025-02-20 21:45:10.133'),
(10, 'Turismo gastronômico', '2025-02-20 21:45:10.133', '2025-02-20 21:45:10.133'),
(11, 'Turismo histórico-cultural (patrimônio histórico-cultural material e/ou imaterial)', '2025-02-20 21:45:10.133', '2025-02-20 21:45:10.133');


INSERT INTO public.tipo_atrativo_turistico (tipo_atrativo_turistico_id, nome, data_de_criacao, ultima_atualizacao) VALUES
(2, 'Biblioteca', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(3, 'Cachoeira', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(4, 'Cemitério', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(5, 'Centro de artesanato', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(6, 'Colégio/Escola', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(7, 'Empreendimento de esportes/lazer', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(8, 'Empreendimento de eventos (Teatro/Casa de Shows/Centro de Convenções)', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(9, 'Engenho', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(10, 'Estabelecimento Gastronômico', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(11, 'Floresta/Bosque', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(12, 'Formação rochosa', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(13, 'Fortaleza/Forte', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(14, 'Igreja/Paróquia/Convento', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(15, 'Lago/Lagoa/Barragem', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(16, 'Meio de hospedagem', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(17, 'Museu', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(18, 'Parque', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(19, 'Praia', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(20, 'Praça pública', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(21, 'Quilombo', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(22, 'Rio/Riacho', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(23, 'Sítios Arqueológicos', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617'),
(24, 'Unidade de Conservação/Preservação Ambiental', '2025-02-20 21:48:24.617', '2025-02-20 21:48:24.617');



