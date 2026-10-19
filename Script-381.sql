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

INSERT INTO public.usuario (usuario_id, primeiro_nome, ultimo_nome, email, senha_encripitada, data_de_criacao, ultima_atualizacao, perfil) VALUES(2, 'Admin', 'Admin', 'admin@example.com', '$2a$12$D2DCL3YfJcryD8DcWXQZxOXFe.zgnVQh5.EM.EtjwB1ZJ84ESX0aG', '2024-11-26 11:18:08.372', '2024-11-26 11:18:08.372', 'ADMIN');

DELETE FROM public.tipo_atrativo_turistico WHERE tipo_atrativo_turistico_id=1;






