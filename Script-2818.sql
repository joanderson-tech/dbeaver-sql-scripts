WITH calendario AS (
    SELECT ce.id_calendario_escolar, ce.regime_letivo, ce.inicio_bim_1, ce.fim_bim_1, ce.inicio_bim_2, ce.fim_bim_2, ce.inicio_bim_3, ce.fim_bim_3, ce.inicio_bim_4, ce.fim_bim_4, ce.inicio_tri_1, ce.fim_tri_1, ce.inicio_tri_2, ce.fim_tri_2, ce.inicio_tri_3, ce.fim_tri_3
    FROM basico.calendario_escolar ce WHERE ce.ano = 2026 LIMIT 1
), extensao_calendario AS (
    SELECT ext.id_escola, ext.regime_letivo, ext.inicio_bim_1, ext.fim_bim_1, ext.inicio_bim_2, ext.fim_bim_2, ext.inicio_bim_3, ext.fim_bim_3, ext.inicio_bim_4, ext.fim_bim_4, ext.inicio_tri_1, ext.fim_tri_1, ext.inicio_tri_2, ext.fim_tri_2, ext.inicio_tri_3, ext.fim_tri_3
    FROM diario.extensao_calendario_escolar ext JOIN calendario c ON c.id_calendario_escolar = ext.id_calendario_escolar WHERE ext.validado = TRUE AND ext.ativo = TRUE
), turmas_com_matricula AS (
    SELECT DISTINCT mes.id_turma_serie AS id_turma_serie_match FROM basico.matricula_estudante_serie mes WHERE mes.id_situacao_matricula_serie = 1
), docentes_turma AS (
    SELECT t.id_turma, t.codigo AS turma_codigo, t.id_turma_serie, cc.nome AS componente, ts.id_escola, ts.id_turno, p.nome AS professor_nome, dt.id_docente_turma, dt.data_cadastro AS professor_data_cadastro, dt.data_inicio AS professor_data_inicio, dt.data_fim AS professor_data_fim, COUNT(*) OVER (PARTITION BY t.id_turma) AS qtd_professores_turma
    FROM ensino.docente_turma dt JOIN ensino.turma t ON t.id_turma = dt.id_turma JOIN rh.servidor s ON s.id_servidor = dt.id_docente JOIN comum.pessoa p ON p.id_pessoa = s.id_pessoa JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie LEFT JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina JOIN turmas_com_matricula tcm ON tcm.id_turma_serie_match = t.id_turma_serie
    WHERE t.ano = 2026 AND t.id_situacao_turma = 1 AND dt.ativo AND (dt.data_fim IS NULL OR dt.data_fim::date >= CURRENT_DATE) AND ts.id_serie <> 58413194 AND t.id_disciplina <> 437 AND s.id_servidor = 712 AND ts.id_serie = 1005222
), escolas_turma AS (
    SELECT DISTINCT id_escola FROM docentes_turma
)
SELECT et.id_escola, c.regime_letivo, c.inicio_bim_2, c.fim_bim_2
FROM escolas_turma et
CROSS JOIN calendario c;


SELECT ht.*
FROM ensino.horario_turma ht
WHERE ht.id_turma IN (
    SELECT t.id_turma 
    FROM ensino.turma t 
    JOIN ensino.docente_turma dt ON dt.id_turma = t.id_turma 
    WHERE dt.id_docente = 712 AND t.ano = 2026
);


--2026-04-24
-- Auto-generated SQL script #202610071534
UPDATE ensino.horario_turma
    SET data_fim='2026-04-24' --'2026-12-31'
    WHERE id_horario_turma IN (1400875, 1400873, 1400874, 1400876, 1400872, 1400877, 1400878, 1400879, 1400880, 1400881, 1400885, 1400884, 1400883, 1400882, 1400886, 1400867, 1400868, 1400869, 1400870, 1400871);



SELECT * FROM basico.calendario_escolar 