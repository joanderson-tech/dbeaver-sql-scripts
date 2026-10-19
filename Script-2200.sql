BEGIN;

ROLLBACK;

-- EXECUÇÃO:
-- CURRICULO BASICO
INSERT INTO basico.curriculo_basico
(id_curriculo_basico, id_serie, situacao, ativo, ano_entrada_vigor, id_registro_entrada, data_cadastro, id_registro_atualizacao, data_alteracao, codigo, carga_horaria, codigo_rh, ordem, id_turno, tipo_diario, id_unidade, id_escola, permite_parecer_descritivo, multisseriado, tipo_diario_diversificado, possui_parte_diversificada, diario_diversificado_reprova_por_falta, permite_multiplos_professores_polivalente, habilita_relatorio_final_polivalente)
VALUES(nextval('hibernate_sequence'), 1005222, NULL, true, 2026, NULL, NULL, NULL, NULL, 'INT2 - 5 A', 1600, NULL, NULL, 519595290, 2, 605, NULL, false, false, 31, true, false, false, false);

INSERT INTO basico.curriculo_basico_componente
(id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)
VALUES(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 512, 160, NULL, NULL, NULL, true, NULL, 4, NULL, 9, true, NULL, false, 2, false, false),
(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 513, 160, NULL, NULL, NULL, true, NULL, 4, NULL, 10, true, NULL, false, 2, false, false),
(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 229, 80, NULL, NULL, NULL, true, NULL, 2, NULL, 2, true, false, false, 1, false, false),
(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 223, 160, NULL, NULL, NULL, true, NULL, 4, NULL, 5, false, false, false, 1, false, false),
(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 238, 80, NULL, NULL, NULL, true, NULL, 2, NULL, 3, true, false, false, 1, false, false),
(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 230, 40, NULL, NULL, NULL, true, NULL, 1, NULL, 8, true, false, false, 1, false, false),
(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 225, 120, NULL, NULL, NULL, true, NULL, 3, NULL, 7, false, false, false, 1, false, false),
(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 224, 120, NULL, NULL, NULL, true, NULL, 3, NULL, 6, false, false, false, 1, false, false),
(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 515, 120, NULL, NULL, NULL, true, NULL, 3, NULL, 12, true, NULL, false, 2, false, false),
(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 221, 200, NULL, NULL, NULL, true, NULL, 5, NULL, 1, false, false, false, 1, false, false),
(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 222, 200, NULL, NULL, NULL, true, NULL, 5, NULL, 4, false, false, false, 1, false, false),
(nextval('hibernate_sequence'), (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026), 514, 160, NULL, NULL, NULL, true, NULL, 4, NULL, 11, true, NULL, false, 2, false, false);

-- TURMA 5°ANO:
-- TURMA SERIE
update basico.turma_serie ts
	set id_turno = 519595290,
		nome = 'EFAIIN25A',
		id_curriculo_medio = (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026)
	where ts.id_turma_serie = 52007425;
-- VAGA SERIE
update matricula.vaga_serie vs 
	set id_turno = 519595290
	where vs.id_vaga_serie = 52007371;
-- MES
update basico.matricula_estudante_serie mes 
	set id_turno = 519595290,
		id_curriculo_medio = (select id_curriculo_basico from basico.curriculo_basico where id_serie = 1005222 and ano_entrada_vigor = 2026)
	where mes.id_turma_serie = 52007425;
--TURMA COMPONENTE
update ensino.turma t
	set codigo = 'EFAIIN25A'
	where t.id_turma_serie = 52007425;
-- HORÁRIOS
update ensino.horario_turma set id_horario = 52009110 where id_horario_turma in (1402764, 1402765, 1402766, 1402767, 1402768);
update ensino.horario_turma set id_horario = 52009111 where id_horario_turma in (1402769, 1402770, 1402771, 1402772, 1402773);
update ensino.horario_turma set id_horario = 52009112 where id_horario_turma in (1402774, 1402775, 1402776, 1402777, 1402778);
update ensino.horario_turma set id_horario = 52009113 where id_horario_turma in (1402779, 1402780, 1402781, 1402782, 1402783);
update ensino.horario_turma set id_horario = 52009114 where id_horario_turma in (1402784, 1402785, 1402786, 1402787, 1402788);
--ANOS FINAIS
update ensino.horario_turma set id_horario = 52009123 where id_horario_turma in (1402238, 1402234, 1402235, 1402237, 1402236, 1402284, 1402288, 1402286, 1402285, 1402287, 1402263, 1402260, 1402259, 1402261, 1402262);
update ensino.horario_turma set id_horario = 52009124 where id_horario_turma in (1402243, 1402241, 1402242, 1402239, 1402240, 1402291, 1402292, 1402293, 1402290, 1402289, 1402268, 1402264, 1402265, 1402267, 1402266);
update ensino.horario_turma set id_horario = 52009125 where id_horario_turma in (1402359, 1402360, 1402363, 1402362, 1402361, 1402374, 1402375, 1402376, 1402377, 1402378, 1402348, 1402344, 1402347, 1402346, 1402345);
update ensino.horario_turma set id_horario = 52009126 where id_horario_turma in (1402367, 1402368, 1402365, 1402366, 1402364, 1402379, 1402381, 1402383, 1402382, 1402380, 1402349, 1402350, 1402351, 1402353, 1402352);
update ensino.horario_turma set id_horario = 52009127 where id_horario_turma in (1402371, 1402369, 1402373, 1402370, 1402372, 1402385, 1402386, 1402387, 1402384, 1402388, 1402357, 1402355, 1402356, 1402358, 1402354);


COMMIT;