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


DELETE FROM public.municipio WHERE municipio_id=224;



INSERT INTO public.municipio (municipio_id, data_de_criacao, nome, uf_sigla, ultima_atualizacao) 
VALUES(225, NOW(), 'sapée', 'PB', NOW());

begin;

rollback;

--Solução 
--Para deletar os municípios duplicados, é necessário verificar se há relação com a tabela "atrativo_turistico". Caso haja essa relação, os atrativos turísticos devem ser atualizados para o município correto. Se não houver relação ou se o município estiver duplicado, basta deletá-lo. Se for necessário corrigir o nome do município, basta fazer a atualização na tabela "municipio". Lembre-se sempre de realizar um backup antes de qualquer alteração.
UPDATE public.atrativo_turistico SET municipio_id=40 WHERE atrativo_turistico_id=19;

DELETE FROM public.municipio WHERE data_de_criacao ='2025-04-08';

DELETE FROM public.municipio WHERE data_de_criacao::date = '2025-04-08';


--Backup: Antes de realizar qualquer alteração permanente no banco de dados, é sempre recomendado criar um backup.
UPDATE public.atrativo_turistico SET municipio_id=40 WHERE atrativo_turistico_id=147;

INSERT INTO public.municipio (municipio_id, data_de_criacao, nome, uf_sigla, ultima_atualizacao) VALUES(147, '2025-02-20 21:13:35.523', 'Pitimbu', 'PB', '2025-02-20 21:13:35.523');



begin;

rollback;

select * from municipio m  where  nome = 'João Pessoa';

DELETE FROM public.municipio WHERE where municipio_id = 147;

select * from atrativo_turistico at2 ;

select * from atrativo_turistico at2 where municipio_id in (147);


select * from municipio m where municipio_id in (147);


-- Atualiza o município relacionado a um atrativo turístico específico, atribuindo o município correto.
UPDATE public.atrativo_turistico 
SET municipio_id = 40 
WHERE atrativo_turistico_id = 19;

-- Deleta o município duplicado da tabela "municipio".
DELETE FROM public.municipio 
WHERE municipio_id = 147;

-- Backup: Antes de realizar qualquer alteração permanente no banco de dados, é recomendado criar um backup.
-- Atualiza o município relacionado ao atrativo turístico específico após a exclusão.
UPDATE public.atrativo_turistico 
SET municipio_id = 40 
WHERE atrativo_turistico_id = 147;

-- Insere o município correto com os dados atualizados.
INSERT INTO public.municipio (municipio_id, data_de_criacao, nome, uf_sigla, ultima_atualizacao) 
VALUES(147, '2025-02-20 21:13:35.523', 'Pitimbu', 'PB', '2025-02-20 21:13:35.523');



DELETE FROM public.flyway_schema_history WHERE installed_rank=19;

