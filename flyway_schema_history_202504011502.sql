INSERT INTO flyway_schema_history (installed_rank,"version",description,"type",script,checksum,installed_by,installed_on,execution_time,success) VALUES
	 (1,'20230218161853','create table segmentacao turistica','SQL','schema/V20230218161853__create_table_segmentacao_turistica.sql',-786970052,'postgres','2025-04-01 14:59:14.975951',18,true),
	 (2,'20230218162405','create table tipo atrativo turistico','SQL','schema/V20230218162405__create_table_tipo_atrativo_turistico.sql',-498252919,'postgres','2025-04-01 14:59:15.015553',12,true),
	 (3,'20230218162606','create table permissao','SQL','schema/V20230218162606__create_table_permissao.sql',2135150675,'postgres','2025-04-01 14:59:15.039273',17,true),
	 (4,'20230218163605','create table usuario','SQL','schema/V20230218163605__create_table_usuario.sql',-110086368,'postgres','2025-04-01 14:59:15.067363',18,true),
	 (5,'20230218164035','create table municipio','SQL','schema/V20230218164035__create_table_municipio.sql',-1763959070,'postgres','2025-04-01 14:59:15.09817',9,true),
	 (6,'20230218164535','create table usuario permissoes','SQL','schema/V20230218164535__create_table_usuario_permissoes.sql',178887887,'postgres','2025-04-01 14:59:15.114051',6,true),
	 (7,'20230218165118','create table atrativo turistico','SQL','schema/V20230218165118__create_table_atrativo_turistico.sql',-1102603094,'postgres','2025-04-01 14:59:15.138994',10,true),
	 (8,'20230218173059','create table atrativo turistico disponibilidade dias','SQL','schema/V20230218173059__create_table_atrativo_turistico_disponibilidade_dias.sql',1830082818,'postgres','2025-04-01 14:59:15.155061',10,true),
	 (9,'20230218173736','create table atrativo turistico fontes','SQL','schema/V20230218173736__create_table_atrativo_turistico_fontes.sql',1157086912,'postgres','2025-04-01 14:59:15.170155',7,true),
	 (10,'20230218174421','create table atrativo turistico imagens','SQL','schema/V20230218174421__create_table_atrativo_turistico_imagens.sql',2089604176,'postgres','2025-04-01 14:59:15.181921',5,true);
INSERT INTO flyway_schema_history (installed_rank,"version",description,"type",script,checksum,installed_by,installed_on,execution_time,success) VALUES
	 (11,'20230218175042','create table atrativo turistico informacoes adicionais','SQL','schema/V20230218175042__create_table_atrativo_turistico_informacoes_adicionais.sql',7366366,'postgres','2025-04-01 14:59:15.192145',7,true),
	 (12,'20230325215533','create table atrativo turistico segmentacao turistica','SQL','schema/V20230325215533__create_table_atrativo_turistico_segmentacao_turistica.sql',49205070,'postgres','2025-04-01 14:59:15.216002',3,true),
	 (13,'20230527162551','added ultima atualizacao and data de criacao','SQL','schema/V20230527162551__added_ultima_atualizacao_and_data_de_criacao.sql',-1730448043,'postgres','2025-04-01 14:59:15.224188',2,true),
	 (14,'20230531220153','alter table atrativo turistico tamanho descricao','SQL','schema/V20230531220153__alter_table_atrativo_turistico_tamanho_descricao.sql',579050862,'postgres','2025-04-01 14:59:15.230944',2,true),
	 (15,'20230725191454','added profile in usuario','SQL','schema/V20230725191454__added_profile_in_usuario.sql',-2128536730,'postgres','2025-04-01 14:59:15.23907',3,true),
	 (16,'20230730141216','added admin user','SQL','data/V20230730141216__added_admin_user.sql',-639390898,'postgres','2025-04-01 14:59:15.248655',5,true),
	 (17,'20230731220437','added link google maps','SQL','schema/V20230731220437__added_link_google_maps.sql',-1385612557,'postgres','2025-04-01 14:59:15.261865',1,true),
	 (18,'20230924154228','validate old atrativos turisticos to true','SQL','schema/V20230924154228__validate_old_atrativos_turisticos_to_true.sql',-703420450,'postgres','2025-04-01 14:59:15.268522',3,true),
	 (19,'20230924173909','added municipios paraiba','SQL','data/V20230924173909__added_municipios_paraiba.sql',1228974455,'postgres','2025-04-01 14:59:15.279022',51,true);
