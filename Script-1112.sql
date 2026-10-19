--51987139 --230

35500365
35501103

select * from basico.curriculo_basico cb where cb.id_curriculo_basico = 35500365;


select * from basico.curriculo_basico_componente cbc  where cbc.id_curriculo_basico = 51987139;


--
select * from basico.curriculo_basico cb where cb.id_curriculo_basico = 35500365 and cb.id_c


select * from basico.curriculo_basico_componente cbc  where cbc.id_curriculo_basico = 35500365 and cbc.id_componente_curricular = 230;




---solução

INSERT INTO basico.curriculo_basico_componente (id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, 
ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores) 
VALUES(nextval('hibernate_sequence'), 35500365, 230, 40, NULL, 5630020, current_date, true, NULL, 1, NULL, 8, true, NULL, false, NULL, false, false);



INSERT INTO basico.curriculo_basico_componente (id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, data_cadastro, obrigatoria, ch_semana, ordem, permite_alocacao_adjunto, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores) 
VALUES(nextval('hibernate_sequence'), 35500365, 230, 40, current_date, TRUE, 5, 1, FALSE, FALSE, 1, FALSE, FALSE);


