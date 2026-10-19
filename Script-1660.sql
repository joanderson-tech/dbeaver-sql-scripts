BEGIN;

ROLLBACK;

WITH dados_teste AS (
-- 1. Definimos os parâmetros que seriam o "NEW" da trigger
    SELECT 975982 AS id_estudante,:ano_calendario AS ano_calendario,:id_serie_escola AS id_serie_escola,:id_turno AS id_turno,:periodo AS periodo,:id_situacao AS id_situacao_matricula_serie
-- Ex: 1 (Ativo)
), verificacao_efetivacao AS (
-- 2. Checa se é um caso de efetivação (estudante inscrito ou transferência)
    SELECT EXISTS (
        SELECT 1
FROM matricula.estudante_inscrito ei
JOIN matricula.calendario_matricula cm ON
ei.id_calendario_matricula = cm.id_calendario_matricula
JOIN dados_teste dt ON
ei.id_estudante = dt.id_estudante
AND cm.ano = dt.ano_calendario
WHERE ei.id_status = 9
    )
OR EXISTS (
SELECT 1
FROM matricula.solicitacao_transferencia st
JOIN basico.matricula_estudante_serie mes ON
mes.id_matricula_discente_serie = st.id_matricula_discente_serie
JOIN dados_teste dt ON
mes.id_estudante = dt.id_estudante
WHERE st.id_status IN (2, 4, 8)
	AND st.ano_escolar = dt.ano_calendario
	AND mes.periodo = dt.periodo
	AND st.id_matricula_discente_serie_gerado IS NULL
    ) AS is_efetivacao
)
, verificacao_nee AS (
-- 3. Verifica se o aluno é NEE
    SELECT EXISTS (
        SELECT 1
FROM public.discente d
JOIN comum.pessoa_necessidade_especial pne ON
pne.id_pessoa = d.id_pessoa
JOIN dados_teste dt ON
d.id_discente = dt.id_estudante
    ) AS is_nee
)
, vaga_identificada AS (
-- 4. Localiza o ID da vaga_serie
    SELECT MAX(vs.id_vaga_serie) AS id_vaga_serie
FROM escola.escola_etapa_ensino_serie eees
JOIN matricula.vaga_serie vs ON
eees.id_escola = vs.id_escola
AND eees.id_serie = vs.id_serie
JOIN dados_teste dt ON
eees.id_escola_etapa_ensino_serie = dt.id_serie_escola
WHERE vs.ano_letivo = dt.ano_calendario
AND vs.id_turno = dt.id_turno
AND vs.periodo = dt.periodo
AND NOT vs.removida
)
SELECT *
FROM escola.escola_etapa_ensino_serie eees
JOIN matricula.vaga_serie vs ON
eees.id_escola = vs.id_escola
AND eees.id_serie = vs.id_serie
--and eees.id_escola_etapa_ensino_serie = 51880907
WHERE vs.ano_letivo = 2026
AND eees.id_serie = 51880907
AND vs.id_turno = 2
AND vs.periodo = 1
AND eees.ativo
AND NOT vs.removida;
-- 5. Resultado Final
SELECT dt.id_estudante, vi.id_vaga_serie, ve.is_efetivacao, vn.is_nee, CASE 
        WHEN vi.id_vaga_serie IS NULL THEN 'ERRO: Não há vaga_série ativa para estes parâmetros.'
WHEN ve.is_efetivacao = TRUE THEN 'SUCESSO: Vaga garantida por efetivação.'
WHEN matricula.verifica_vagas(vi.id_vaga_serie, vn.is_nee) = TRUE THEN 'SUCESSO: Vaga disponível.'
ELSE 'ERRO: Não há mais vagas disponíveis para esta opção.'
    END AS status_vaga
FROM dados_teste dt
CROSS JOIN verificacao_efetivacao ve
CROSS JOIN verificacao_nee vn
LEFT JOIN vaga_identificada vi ON
TRUE;

CREATE OR REPLACE FUNCTION matricula.verifica_vaga_by_matricula_estudante_serie()
 RETURNS TRIGGER
 LANGUAGE plpgsql
AS $function$ DECLARE is_nee boolean;

id_vaga_serie int4;

is_efetivacao boolean;

BEGIN is_efetivacao = FALSE;

IF EXISTS ( SELECT 1
FROM matricula.estudante_inscrito ei
JOIN matricula.calendario_matricula cm ON
ei.id_calendario_matricula = cm.id_calendario_matricula
WHERE ei.id_estudante = NEW.id_estudante
AND ei.id_status = 9
AND cm.ano = NEW.ano_calendario )
AND TG_OP = 'INSERT' THEN is_efetivacao = TRUE;

END IF;

IF EXISTS ( SELECT 1
FROM matricula.solicitacao_transferencia st
JOIN basico.matricula_estudante_serie mes ON
mes.id_matricula_discente_serie = st.id_matricula_discente_serie
WHERE mes.id_estudante = NEW.id_estudante
AND st.id_status IN (2, 4, 8)
	AND st.ano_escolar = NEW.ano_calendario
	AND mes.periodo = NEW.periodo
	AND st.id_matricula_discente_serie_gerado IS NULL )
AND TG_OP = 'INSERT' THEN is_efetivacao = TRUE;

END IF;

IF (NEW.id_situacao_matricula_serie NOT IN (5, 9, 6, 4)
	AND ( TG_OP = 'INSERT'
		OR ( TG_OP = 'UPDATE'
			AND ( OLD.id_situacao_matricula_serie IN (5, 9, 6, 4)
				OR OLD.id_vaga_serie <> NEW.id_vaga_serie
				OR NEW.id_serie_escola <> OLD.id_serie_escola
				OR NEW.id_turno <> OLD.id_turno
				OR NEW.periodo <> OLD.periodo ) ) ) ) THEN is_nee = FALSE;

IF (SELECT count(pne.id_pessoa_necessidade_especial)
FROM public.discente d
JOIN comum.pessoa_necessidade_especial pne ON
pne.id_pessoa = d.id_pessoa
WHERE d.id_discente = new.id_estudante ) > 0 THEN is_nee = TRUE;

END IF;

id_vaga_serie = ( SELECT max(vs.id_vaga_serie)
FROM escola.escola_etapa_ensino_serie eees
JOIN matricula.vaga_serie vs ON
eees.id_escola = vs.id_escola
AND eees.id_serie = vs.id_serie
WHERE eees.id_escola_etapa_ensino_serie = NEW.id_serie_escola
AND vs.ano_letivo = NEW.ano_calendario
AND vs.id_turno = NEW.id_turno
AND vs.periodo = NEW.periodo
AND NOT vs.removida );

IF id_vaga_serie IS NULL THEN RAISE EXCEPTION 'Trigger: matricula.verifica_vaga_by_matricula_estudante_serie(): Não há vaga_série ATIVA para esta escola/série/período/turno.';

END IF;

IF ( SELECT matricula.verifica_vagas(id_vaga_serie, is_nee)) = FALSE
AND is_efetivacao = FALSE THEN RAISE EXCEPTION 'Trigger: matricula.verifica_vaga_by_matricula_estudante_serie(): Não há mais vagas para a opção selecionada. ';

END IF;

END IF;

RETURN NEW;

END;

$function$
;

51880907


SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_serie = 51880907
AND vs.id_escola = 728
AND vs.ano_letivo = 2026;

SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_vaga_serie IN(52769145,52769161) ;

SELECT * 
FROM matricula.vaga_serie_ocupacao vso 
WHERE vso.id_vaga_serie  IN(52769145,52769161) ;

SELECT * FROM ensino.turno t; WHERE t.id_turno 

SELECT *
FROM escola.escola_etapa_ensino_serie eees
--JOIN matricula.vaga_serie vs ON eees.id_escola = vs.id_escola
WHERE eees.id_escola = 728
--AND eees.ativo = TRUE
AND eees.id_serie = 51880907;

51880969

-- Auto-generated SQL script #202601161558
UPDATE matricula.vaga_serie SET removida=TRUE WHERE id_vaga_serie=52769161;


