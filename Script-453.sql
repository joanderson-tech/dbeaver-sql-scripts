 select s  from Serie s   where s.etapaEnsino.id = 37 order by s.descricao
 
 
 select * from basico.serie s where s.id_etapa_ensino = 37 order by s.descricao;

select * from basico.serie_multisseriada sm where id_serie = 5162362; 
select * from basico.serie s where id_serie = 1005222;


5162362
5162362

begin;

commit;
rollback;

DELETE FROM basico.serie_multisseriada WHERE id_serie_multisseriada in (30, 31, 7);

DELETE FROM basico.serie WHERE id_serie=5162362;



INSERT INTO basico.serie (id_serie, descricao, numero, id_etapa_ensino, id_registro_entrada, data_cadastro, ativo, codigo_rh, cod_censo, tipo_diario, bloquear_oferta_vagas, sigla, final_etapa, nao_contabiliza_turma, permite_gerenciar_turma_sem_horario, capacidade_maxima, capacidade_minima, capacidade_excesso, permite_participar_atv_esportiva, id_proxima_serie, emite_certificado, id_unidade, data_atualizacao, id_registro_atualizacao, multisseriada, permite_aproveitamento_estudo, verifica_frequencia_anos_anteriores, serie_eja_padrao, permite_avanco_estudo, correcao_fluxo, permite_participar_sol_cadastro_reserva, cod_tecnico_censo, exige_carga_horaria_por_componente) VALUES(5162362, 'MULTIANUAL (2º, 3° E 4° ANO)', 5162362, 37, 2, '2013-04-25', true, '35_155', NULL, 11, false, 'M2A4', false, false, false, NULL, 0, NULL, false, NULL, false, NULL, '2025-04-25 19:20:17.413', 5622583, true, false, false, false, false, false, false, NULL, false);

INSERT INTO basico.serie_multisseriada (id_serie_multisseriada, id_serie, id_serie_associada, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao) VALUES(30, 5162362, 1005221, true, 2, 5622514, '2019-07-08 16:37:15.561', '2021-02-10 17:10:01.896');
INSERT INTO basico.serie_multisseriada (id_serie_multisseriada, id_serie, id_serie_associada, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao) VALUES(31, 5162362, 1005222, true, 2, 5622514, '2019-07-08 16:37:15.561', '2021-02-10 17:10:01.935');
INSERT INTO basico.serie_multisseriada (id_serie_multisseriada, id_serie, id_serie_associada, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao) VALUES(7, 5162362, 1005220, false, 5622500, 5622514, '2021-02-05 08:42:30.217', '2021-02-10 17:10:01.966');
