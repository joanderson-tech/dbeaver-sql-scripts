WITH dados_teste AS (
    -- 1. Definimos os parâmetros que seriam o "NEW" da trigger
    SELECT 
        :id_estudante AS id_estudante,
        :ano_calendario AS ano_calendario,
        :id_serie_escola AS id_serie_escola,
        :id_turno AS id_turno,
        :periodo AS periodo,
        :id_situacao AS id_situacao_matricula_serie -- Ex: 1 (Ativo)
),
verificacao_efetivacao AS (
    -- 2. Checa se é um caso de efetivação (estudante inscrito ou transferência)
    SELECT EXISTS (
        SELECT 1 FROM matricula.estudante_inscrito ei 
        JOIN matricula.calendario_matricula cm ON ei.id_calendario_matricula = cm.id_calendario_matricula
        JOIN dados_teste dt ON ei.id_estudante = dt.id_estudante AND cm.ano = dt.ano_calendario
        WHERE ei.id_status = 9
    ) OR EXISTS (
        SELECT 1 FROM matricula.solicitacao_transferencia st 
        JOIN basico.matricula_estudante_serie mes ON mes.id_matricula_discente_serie = st.id_matricula_discente_serie
        JOIN dados_teste dt ON mes.id_estudante = dt.id_estudante
        WHERE st.id_status IN (2, 4, 8) 
          AND st.ano_escolar = dt.ano_calendario 
          AND mes.periodo = dt.periodo 
          AND st.id_matricula_discente_serie_gerado IS NULL
    ) AS is_efetivacao
),
verificacao_nee AS (
    -- 3. Verifica se o aluno é NEE
    SELECT EXISTS (
        SELECT 1 FROM public.discente d 
        JOIN comum.pessoa_necessidade_especial pne ON pne.id_pessoa = d.id_pessoa
        JOIN dados_teste dt ON d.id_discente = dt.id_estudante
    ) AS is_nee
),
vaga_identificada AS (
    -- 4. Localiza o ID da vaga_serie
    SELECT MAX(vs.id_vaga_serie) AS id_vaga_serie
    FROM escola.escola_etapa_ensino_serie eees 
    JOIN matricula.vaga_serie vs ON eees.id_escola = vs.id_escola AND eees.id_serie = vs.id_serie
    JOIN dados_teste dt ON eees.id_escola_etapa_ensino_serie = dt.id_serie_escola
    WHERE vs.ano_letivo = dt.ano_calendario 
      AND vs.id_turno = dt.id_turno 
      AND vs.periodo = dt.periodo 
      AND eees.ativo
      AND NOT vs.removida
)
-- 5. Resultado Final
SELECT 
    dt.id_estudante,
    vi.id_vaga_serie,
    ve.is_efetivacao,
    vn.is_nee,
    CASE 
        WHEN vi.id_vaga_serie IS NULL THEN 'ERRO: Não há vaga_série ativa para estes parâmetros.'
        WHEN ve.is_efetivacao = TRUE THEN 'SUCESSO: Vaga garantida por efetivação.'
        WHEN matricula.verifica_vagas(vi.id_vaga_serie, vn.is_nee) = TRUE THEN 'SUCESSO: Vaga disponível.'
        ELSE 'ERRO: Não há mais vagas disponíveis para esta opção.'
    END AS status_vaga
FROM dados_teste dt
CROSS JOIN verificacao_efetivacao ve
CROSS JOIN verificacao_nee vn
LEFT JOIN vaga_identificada vi ON TRUE;

