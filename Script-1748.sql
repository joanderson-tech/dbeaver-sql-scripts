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

52346689


SELECT max(vs.id_vaga_serie) as id_vaga_calculado
FROM escola.escola_etapa_ensino_serie eees
JOIN matricula.vaga_serie vs ON eees.id_escola = vs.id_escola AND eees.id_serie = vs.id_serie
WHERE eees.id_escola= 3124
AND eees.id_serie = 1005339
--eees.id_escola_etapa_ensino_serie = 1005339
AND vs.ano_letivo = 2026 -- ou o ano correspondente
AND vs.id_turno = 2 -- Verifique o turno do aluno
AND vs.periodo = 1 -- Verifique o período
AND NOT vs.removida;



SELECT 
    vs.id_vaga_serie,
    vs.id_serie,
    vs.id_turno
    --vs.vagas_oferecidas AS total_vagas,
    --vs.vagas_ocupadas,
    --vs.vagas_oferecidas_pne AS vagas_especiais,
    --vs.vagas_ocupadas_pne AS ocupadas_especiais,
    --(vs.vagas_oferecidas - vs.vagas_ocupadas) AS saldo_vagas_comuns
FROM matricula.vaga_serie vs
WHERE vs.id_escola = 3124
  AND vs.id_serie = 1005339
  AND vs.ano_letivo = 2026
  AND vs.id_turno = 2
  AND NOT vs.removida;