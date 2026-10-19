select * from atrativo_turistico at2  where municipio_id in (18,24);
select * from atrativo_turistico_disponibilidade_dias atdd;
select * from atrativo_turistico_fontes atf ;
select * from atrativo_turistico_imagens ati;
select * from atrativo_turistico_informacoes_adicionais atia;
select * from atrativo_turistico_segmentacao_turistica atst;
select * from flyway_schema_history fsh;
select * from municipio m; ordeby nome;
select * from permissao p ;
select * from segmentacao_turistica st ;
select * from TIPO_ATRATIVO_TURISTICO;
select * from usuario u; 
select * from usuario_permissoes up;

select * from municipio WHERE nome ='Alagoa Grande';
select * from municipio WHERE nome ='João Pessoa';
select * from municipio WHERE nome ='Serra da Raiz';
select * from municipio WHERE nome ='Santana dos Garrotes';
select * from atrativo_turistico at2  where municipio_id in (2);

--Solução
DELETE FROM public.municipio WHERE municipio_id=227;
DELETE FROM public.municipio WHERE municipio_id=132;
DELETE FROM public.municipio WHERE municipio_id=24;
DELETE FROM public.municipio WHERE municipio_id=205;
UPDATE public.municipio SET nome='Mãe d`Água' WHERE municipio_id=117;
UPDATE public.municipio SET nome='Santana dos Garrotes' WHERE municipio_id=177;



--backup
INSERT INTO municipio (municipio_id, data_de_criacao, nome, uf_sigla, ultima_atualizacao)
VALUES (227, '2024-05-31 18:39:43.065381', 'sapé', 'PB', '2024-05-31 18:39:43.06543');

INSERT INTO municipio (municipio_id, data_de_criacao, nome, uf_sigla, ultima_atualizacao)
VALUES (132, '2023-09-24 22:07:29.520148', 'Monteiro', 'PB', '2023-09-24 22:07:29.520148');

INSERT INTO municipio (municipio_id, data_de_criacao, nome, uf_sigla, ultima_atualizacao)
VALUES (24, '2023-09-24 22:07:29.520148', 'Alagoa Grande', 'PB', '2023-09-24 22:07:29.520148');

INSERT INTO municipio (municipio_id, data_de_criacao, nome, uf_sigla, ultima_atualizacao)
VALUES (205, '2023-09-24 22:07:29.520148', 'Serra da Raiz', 'PB', '2023-09-24 22:07:29.520148');

UPDATE public.municipio SET nome='Mãed`Água' WHERE municipio_id=117;

UPDATE public.municipio SET nome='Sa Santana do arrotes' WHERE municipio_id=177;

