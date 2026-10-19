SELECT 
FROM basico.curriculo_basico cb
WHERE cb.codigo IN ('AI1', 'AI2', 'AI3', 'AI4', 'AI5', 'AI1Int', 'AI2Int', 'AI3Int', 'AI4Int', 'AI5Int')
---51883536

SELECT t.*
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
WHERE ts.id_curriculo_medio = 51883536
AND ts.ativo 
AND t.id_disciplina = 230;

SELECT *
FROM ensino.matricula_componente mc
WHERE mc.id_turma IN (684956, 684970, 684984);

SELECT *
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico = 51883536;
AND cbc.id_componente_curricular = 230;

DELETE
FROM basico.curriculo_basico_componente
WHERE id_curriculo_basico_componente = 51883540;

INSERT INTO basico.curriculo_basico_componente (id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)
VALUES(51883540, 51883536, 230, 40, NULL, 5622707, '2025-10-14', TRUE, NULL, 1, NULL, 9, FALSE, FALSE, FALSE, 1, TRUE, FALSE);
