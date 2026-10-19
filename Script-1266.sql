SELECT *
FROM ensino.horario h
WHERE h.ativo ;

SELECT *
FROM basico.curriculo_basico_componente cb;

c
WHERE cbc.id_curriculo_basico

BEGIN;

INSERT INTO basico.curriculo_basico_componente
(id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)
VALUES(nextval('hibernate_sequence'), 51870315, 293, 800, NULL, NULL, now(), TRUE, NULL, 200, NULL, 5, FALSE, NULL, FALSE, 1, FALSE, FALSE);

ROLLBACK;

SELECT id_horario, inicio, fim, ano_entrada_vigor, h.tipo, h.ordem, h.ativo, u.id_unidade, u.nome, ee.id_etapa_ensino, ee.denominacao, t.descricao
FROM ensino.horario h
JOIN comum.unidade u ON
u.id_unidade = h.id_unidade
JOIN ensino.turno t ON
t.id_turno = h.tipo
LEFT JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = h.id_etapa_ensino
WHERE h.ativo
AND h.id_unidade = 5873
ORDER BY u.nome, h.ano_entrada_vigor DESC, ee.denominacao, t.descricao, h.ordem


select * FROM ensino_infantil.configuracao_relatorio_componente crc WHERE crc.maximo_caracteres_relatorio = 9999; AND crc.id_componente_curricular = 220;