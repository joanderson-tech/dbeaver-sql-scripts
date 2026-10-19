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
	
begin;

DELETE FROM public.municipio WHERE municipio_id=1;


DELETE FROM municipio
WHERE data_de_criacao::date = '2025-04-01 ' OR ultima_atualizacao::date = '2025-04-01';

commit;
rollback;

DROP TABLE flyway_schema_history;
SELECT 1;


DELETE FROM flyway_schema_history WHERE version = '20230730141216';
DELETE FROM flyway_schema_history WHERE version = '20230924173909';
INSERT INTO public.flyway_schema_history (installed_rank, "version", description, "type", script, checksum, installed_by, installed_on, execution_time, success) VALUES(19, '20230924173909', 'added municipios paraiba', 'SQL', 'data/V20230924173909__added_municipios_paraiba.sql', 1228974455, 'postgres', '2025-03-21 20:16:52.740', 65, true);


INSERT INTO public.municipio (municipio_id, data_de_criacao, nome, uf_sigla, ultima_atualizacao) VALUES(224, '2025-02-20 21:13:35.523', 'aaaaaaaaaaaaaaaaaaa', 'PB', '2025-02-20 21:13:35.523');



